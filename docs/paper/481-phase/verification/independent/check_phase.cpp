// Independent replay of selected entire phases. No original checker header used.
// A dilated field is explicitly assembled from rectangles; sorting is std::sort,
// division is ordinary integer division, intermediates use signed __int128.
// All four direction families are transformed explicitly: no symmetry assumed.
#include <algorithm>
#include <array>
#include <cassert>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <limits>
#include <numeric>
#include <stdexcept>
#include <string>
#include <vector>
#include <omp.h>
using Z=__int128_t;
using I=int64_t;
constexpr int G=256;
constexpr I Q=1000000;
struct Vertex{I x,y,k;};
struct Root{int type,x,y;};
std::string str(Z z){if(!z)return "0";bool neg=z<0;if(neg)z=-z;std::string s;while(z){s.push_back('0'+z%10);z/=10;}if(neg)s.push_back('-');std::reverse(s.begin(),s.end());return s;}
Z up(Z a,Z b){if(a<0||b<=0)throw std::runtime_error("invalid nonnegative division");return (a+b-1)/b;}
std::pair<int,int> trans(int x,int y,int f){
 if(f==0)return{x,y};if(f==1)return{x,G-1-y};if(f==2)return{y,x};return{y,G-1-x};
}
struct MaxTree{
 size_t off;std::vector<Z>a;
 explicit MaxTree(const std::vector<Z>&v){off=1;while(off<v.size())off*=2;a.assign(2*off,0);std::copy(v.begin(),v.end(),a.begin()+off);for(size_t j=off-1;j;j--)a[j]=std::max(a[2*j],a[2*j+1]);}
 Z get(size_t l,size_t r)const{Z v=0;for(l+=off,r+=off;l<r;l/=2,r/=2){if(l&1)v=std::max(v,a[l++]);if(r&1)v=std::max(v,a[--r]);}return v;}
};
std::vector<Vertex> rectangles(const std::vector<I>&f,I H){
 const int NY=2*(G+1);I unit=H/G;
 std::vector<I>c((G+1)*NY,0);
 auto rect=[&](int i,int lo,int hi,I value){
  c[i*NY+lo]-=value;c[(i+1)*NY+lo]+=value;
  c[i*NY+hi]+=value;c[(i+1)*NY+hi]-=value;
 };
 for(int i=0;i<G;i++){
  for(int j=0;j<G;j++)rect(i,2*j+1,2*j+2,f[i*G+j]);
  for(int j=0;j<=G;j++)rect(i,2*j,2*j+1,std::max(j?f[i*G+j-1]:I(0),j<G?f[i*G+j]:I(0)));
 }
 std::vector<Vertex>out;
 for(int i=0;i<=G;i++)for(int j=0;j<NY;j++)if(c[i*NY+j])out.push_back({i*unit,(j/2)*unit+((j%2)?1:-1),c[i*NY+j]});
 return out;
}
std::vector<Z> integrate(const std::vector<Vertex>&vs,const std::vector<Root>&targets,int family,int N,bool global){
 I H=I(2)*N,unit=H/G;
 std::vector<Z>sum(global?1:targets.size(),0);
 if(vs.empty())return sum;
 #pragma omp parallel
 {
  std::vector<Z>part(sum.size(),0);
  std::vector<std::pair<I,I>> projected(vs.size());
  std::vector<I>ts;std::vector<Z>vals,slopes;
  #pragma omp for schedule(dynamic,8)
  for(int angle=0;angle<N;angle++){
   I p=2*angle+1;
   for(size_t k=0;k<vs.size();k++)projected[k]={H*vs[k].y-p*vs[k].x,vs[k].k};
   std::sort(projected.begin(),projected.end());
   ts.clear();vals.clear();slopes.clear();
   Z derivative=0,value=0;I last=projected.front().first;
   for(size_t a=0;a<projected.size();){
    I t=projected[a].first;value+=Z(t-last)*derivative;
    Z jump=0;do{jump+=projected[a].second;++a;}while(a<projected.size()&&projected[a].first==t);
    if(value<0)throw std::runtime_error("negative chord numerator");
    ts.push_back(t);vals.push_back(value);derivative+=jump;slopes.push_back(derivative);last=t;
   }
   if(value!=0||derivative!=0)throw std::runtime_error("nonzero outside-support value");
   Z denominator=Z(p)*H*25000;
   auto price=[&](Z num){Z chord=up(num*249,denominator);return up(chord*chord,N);};
   if(global){part[0]+=price(*std::max_element(vals.begin(),vals.end()));continue;}
   MaxTree tree(vals);
   auto value_at=[&](I t)->Z{auto it=std::upper_bound(ts.begin(),ts.end(),t);if(it==ts.begin())return 0;size_t a=it-ts.begin()-1;return vals[a]+Z(t-ts[a])*slopes[a];};
   for(size_t k=0;k<targets.size();k++){
    auto [x,y]=trans(targets[k].x,targets[k].y,family);
    I lo=unit*(H*y-p*(x+1)),hi=unit*(H*(y+1)-p*x);
    size_t a=std::lower_bound(ts.begin(),ts.end(),lo)-ts.begin();
    size_t b=std::upper_bound(ts.begin(),ts.end(),hi)-ts.begin();
    Z mx=std::max({value_at(lo),value_at(hi),tree.get(a,b)});
    part[k]+=price(mx);
   }
  }
  #pragma omp critical
  for(size_t j=0;j<sum.size();j++)sum[j]+=part[j];
 }
 return sum;
}
#include "farey_independent.inc"
int main(int argc,char**argv){try{
 if(argc<5){std::cerr<<"usage: checker DATA_DIR PHASE N_BINS OUTPUT [global]\n";return 2;}
 std::string dir=argv[1];int phase=std::stoi(argv[2]),N=std::stoi(argv[3]);bool global=argc>=6&&std::string(argv[5])=="global";bool farey=argc>=6&&std::string(argv[5])=="farey";
 if(phase<0||phase>=481||N<G||N>65536||(2*N)%G)throw std::runtime_error("invalid phase or angular partition");
 std::vector<I>u(1024);{std::ifstream in(dir+"/field_units.txt");for(auto&v:u)if(!(in>>v)||v<0)throw std::runtime_error("invalid field");std::string extra;if(in>>extra)throw std::runtime_error("extra field data");}
 std::vector<int32_t>ranks(4*G*G);{std::ifstream in(dir+"/full_rank.bin",std::ios::binary);for(auto&v:ranks){unsigned char b[4];if(!in.read((char*)b,4))throw std::runtime_error("short ranks");uint32_t x=uint32_t(b[0])|(uint32_t(b[1])<<8)|(uint32_t(b[2])<<16)|(uint32_t(b[3])<<24);v=x==UINT32_MAX?-1:int32_t(x);}if(in.peek()!=EOF)throw std::runtime_error("extra ranks");}
 std::vector<I>w(4*G*G);std::vector<Root>targets;
 for(int r=0;r<4;r++)for(int i=0;i<G;i++)for(int j=0;j<G;j++){
  int k=r*G*G+i*G+j;I v=u[r*256+(i/16)*16+j/16];
  if((v>0)!=(ranks[k]>=0)||ranks[k]<-1||ranks[k]>=481)throw std::runtime_error("bad rank assignment");
  w[k]=ranks[k]>=phase?v:0;if(ranks[k]==phase)targets.push_back({r,i,j});
 }
 if(targets.empty())throw std::runtime_error("empty requested phase");
 std::vector<Z>risk(targets.size(),0);std::array<Z,4>globalRisk{};
 std::cerr<<"phase="<<phase<<" target_cells="<<targets.size()<<" bins="<<N<<" global="<<global<<"\n";
 for(int family=0;family<4;family++)for(int r=0;r<4;r++)for(int s=r+1;s<4;s++){
  std::vector<I>f(G*G);
  for(int i=0;i<G;i++)for(int j=0;j<G;j++){auto [a,b]=trans(i,j,family);f[a*G+b]=w[r*G*G+i*G+j]+w[s*G*G+i*G+j];}
  std::vector<Root>sub;std::vector<size_t>ids;
  if(!global)for(size_t a=0;a<targets.size();a++)if(targets[a].type==r||targets[a].type==s){sub.push_back(targets[a]);ids.push_back(a);}
  if(!global&&sub.empty())continue;
  auto vs=farey?ordinary_rectangles(f):rectangles(f,2*N);auto bound=farey?integrate_farey(vs,sub,family,global):integrate(vs,sub,family,N,global);
  if(global){globalRisk[r]+=bound[0];globalRisk[s]+=bound[0];}
  else for(size_t a=0;a<ids.size();a++)risk[ids[a]]+=bound[a];
  std::cerr<<"done family="<<family<<" pair="<<r<<s<<" corners="<<vs.size()<<"\n";
 }
 if(global)for(size_t a=0;a<targets.size();a++)risk[a]=globalRisk[targets[a].type];
 Z mx=0;size_t failures=0,maxid=0;Z limit=Z(9999)*750*Q*Q/190000;
 std::ofstream out(argv[4]);out<<"type,x,y,risk_integer_units,passes_9999_10000\n";
 for(size_t a=0;a<targets.size();a++){if(risk[a]>mx){mx=risk[a];maxid=a;}bool pass=risk[a]<=limit;failures+=!pass;auto t=targets[a];out<<t.type<<','<<t.x<<','<<t.y<<','<<str(risk[a])<<','<<pass<<'\n';}
 auto t=targets[maxid];std::cout<<"{\"phase\":"<<phase<<",\"method\":\""<<(farey?"farey":"tube")<<"\",\"bins\":"<<N<<",\"global\":"<<(global?"true":"false")<<",\"cells\":"<<targets.size()<<",\"failures\":"<<failures<<",\"max_units\":\""<<str(mx)<<"\",\"max_cell\":["<<t.type<<','<<t.x<<','<<t.y<<"],\"risk_numerator\":\""<<str(19*mx)<<"\",\"risk_denominator\":\"750000000000000\"}\n";
 return failures?1:0;
 }catch(const std::exception&e){std::cerr<<e.what()<<'\n';return 3;}}

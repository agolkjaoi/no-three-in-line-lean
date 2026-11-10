struct Fraction{int p,q;};
std::vector<Vertex> ordinary_rectangles(const std::vector<I>&f){
 std::vector<I>c((G+1)*(G+1),0);
 for(int i=0;i<G;i++)for(int j=0;j<G;j++){
  I v=f[i*G+j];c[i*(G+1)+j]-=v;c[(i+1)*(G+1)+j]+=v;
  c[i*(G+1)+j+1]+=v;c[(i+1)*(G+1)+j+1]-=v;
 }
 std::vector<Vertex>out;
 for(int i=0;i<=G;i++)for(int j=0;j<=G;j++)if(c[i*(G+1)+j])out.push_back({i,j,c[i*(G+1)+j]});
 return out;
}
std::vector<Z> integrate_farey(const std::vector<Vertex>&vs,const std::vector<Root>&targets,int family,bool global){
 std::vector<Fraction>cuts;
 for(int b=1;b<=G;b++)for(int a=1;a<=b;a++)if(std::gcd(a,b)==1)cuts.push_back({a,b});
 std::sort(cuts.begin(),cuts.end(),[](Fraction a,Fraction b){return I(a.p)*b.q<I(b.p)*a.q;});
 size_t M=global?1:targets.size();
 std::vector<Z>sum(M,0);
 if(vs.empty()||!M)return sum;
 std::vector<I>values(cuts.size()*M,0);
 #pragma omp parallel
 {
  std::vector<std::pair<I,I>> projected(vs.size());std::vector<I>ts;std::vector<Z>vals,slopes;
  #pragma omp for schedule(dynamic,8)
  for(size_t angle=0;angle<cuts.size();angle++){
   I p=cuts[angle].p,q=cuts[angle].q;
   for(size_t k=0;k<vs.size();k++)projected[k]={q*vs[k].y-p*vs[k].x,vs[k].k};
   std::sort(projected.begin(),projected.end());ts.clear();vals.clear();slopes.clear();
   Z derivative=0,value=0;I last=projected.front().first;
   for(size_t a=0;a<projected.size();){
    I t=projected[a].first;value+=Z(t-last)*derivative;Z jump=0;
    do{jump+=projected[a].second;++a;}while(a<projected.size()&&projected[a].first==t);
    if(value<0)throw std::runtime_error("negative Farey chord numerator");
    ts.push_back(t);vals.push_back(value);derivative+=jump;slopes.push_back(derivative);last=t;
   }
   if(value!=0||derivative!=0)throw std::runtime_error("Farey support check");
   auto round_chord=[&](Z num)->I{Z c=up(num*249,Z(p)*G*25000);if(c>13000000)throw std::runtime_error("unexpected chord bound");return I(c);};
   if(global){values[angle*M]=round_chord(*std::max_element(vals.begin(),vals.end()));continue;}
   MaxTree tree(vals);
   auto value_at=[&](I t)->Z{auto it=std::upper_bound(ts.begin(),ts.end(),t);if(it==ts.begin())return 0;size_t a=it-ts.begin()-1;return vals[a]+Z(t-ts[a])*slopes[a];};
   for(size_t k=0;k<targets.size();k++){
    auto [x,y]=trans(targets[k].x,targets[k].y,family);
    I lo=q*y-p*(x+1),hi=q*(y+1)-p*x;
    size_t a=std::lower_bound(ts.begin(),ts.end(),lo)-ts.begin(),b=std::upper_bound(ts.begin(),ts.end(),hi)-ts.begin();
    values[angle*M+k]=round_chord(std::max({value_at(lo),value_at(hi),tree.get(a,b)}));
   }
  }
 }
 #pragma omp parallel for schedule(static)
 for(size_t k=0;k<M;k++){
  Fraction prev{0,1};Z A=0,S=0;
  for(size_t a=0;a<cuts.size();a++){
   Fraction next=cuts[a];Z B=values[a*M+k];Z bc=Z(prev.q)*next.p,ad=Z(prev.p)*next.q,det=bc-ad;
   if(det!=1)throw std::runtime_error("nonadjacent Farey fractions");
   Z den=Z(prev.q)*next.q;
   if(!prev.p)S+=up(B*B,den);
   else{
    Z bound=up(std::max(A*A,B*B),den);
    if(B<=A)bound=std::min(bound,up(A*A+A*B+B*B,3*den));
    else{
     // Exact rational midpoint tangent. Unlike the earlier implementation,
     // its endpoint values are not separately rounded upward.
     Z D=(ad+bc)*(ad+bc);
     Z AL=A*D+(B-A)*bc*det,BL=B*D+(B-A)*ad*det;
     Z tangent=up(AL*AL+AL*BL+BL*BL,3*den*D*D);
     bound=std::min(bound,tangent);
    }
    S+=bound;
   }
   prev=next;A=B;
  }
  sum[k]=S;
 }
 return sum;
}

import NoThreeLine.GridCutTree
import NoThreeLine.DyadicPhaseInput
import NoThreeLine.PhaseUnionMass
import NoThreeLine.FiniteInputTreeCheck
import NoThreeLine.FiniteIndexBlocks

/-! Actual accepted unions for the explicitly listed bounded phase range.
The balanced literal representation changes no geometry or schedule weight.
Missing phases, inheritance, and the reference-prefix bridge remain separate. -/
set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch15301

-- Frozen phase 15301, atom 12591, type 3, source (0,111).
def leavesData0 : FiniteInputTree DyadicLeaf 80 := (.node (.node (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨2,0,2⟩) (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩))))) (.node (.node (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,6,2⟩) (.node (.single ⟨3,6,3⟩) (.single ⟨3,4,0⟩)))) (.node (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)) (.node (.single ⟨3,5,1⟩) (.node (.single ⟨3,6,4⟩) (.single ⟨3,6,5⟩)))))) (.node (.node (.node (.node (.single ⟨3,7,4⟩) (.single ⟨3,7,5⟩)) (.node (.single ⟨3,4,2⟩) (.node (.single ⟨3,4,3⟩) (.single ⟨3,5,2⟩)))) (.node (.node (.single ⟨3,5,3⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,14,2⟩) (.node (.single ⟨4,14,3⟩) (.single ⟨4,14,4⟩))))) (.node (.node (.node (.single ⟨4,14,5⟩) (.single ⟨4,15,4⟩)) (.node (.single ⟨4,15,5⟩) (.node (.single ⟨4,12,0⟩) (.single ⟨4,12,1⟩)))) (.node (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩)) (.node (.single ⟨4,14,6⟩) (.node (.single ⟨4,14,7⟩) (.single ⟨4,15,6⟩))))))) (.node (.node (.node (.node (.node (.single ⟨4,15,7⟩) (.single ⟨5,30,1⟩)) (.node (.single ⟨5,30,2⟩) (.node (.single ⟨5,30,3⟩) (.single ⟨5,30,4⟩)))) (.node (.node (.single ⟨5,30,5⟩) (.single ⟨5,31,5⟩)) (.node (.single ⟨5,28,0⟩) (.node (.single ⟨5,28,1⟩) (.single ⟨5,29,0⟩))))) (.node (.node (.node (.single ⟨5,29,1⟩) (.single ⟨5,30,6⟩)) (.node (.single ⟨5,30,7⟩) (.node (.single ⟨5,31,6⟩) (.single ⟨5,31,7⟩)))) (.node (.node (.single ⟨6,60,0⟩) (.single ⟨6,60,1⟩)) (.node (.single ⟨6,61,0⟩) (.node (.single ⟨6,61,1⟩) (.single ⟨6,62,4⟩)))))) (.node (.node (.node (.node (.single ⟨6,62,5⟩) (.single ⟨6,62,6⟩)) (.node (.single ⟨6,62,7⟩) (.node (.single ⟨6,63,6⟩) (.single ⟨6,63,7⟩)))) (.node (.node (.single ⟨6,62,8⟩) (.single ⟨6,62,9⟩)) (.node (.single ⟨6,63,8⟩) (.node (.single ⟨6,63,9⟩) (.single ⟨7,126,8⟩))))) (.node (.node (.node (.single ⟨7,126,9⟩) (.single ⟨7,127,9⟩)) (.node (.single ⟨7,126,10⟩) (.node (.single ⟨7,126,11⟩) (.single ⟨7,127,10⟩)))) (.node (.node (.single ⟨7,127,11⟩) (.single ⟨8,254,16⟩)) (.node (.single ⟨8,254,17⟩) (.node (.single ⟨8,255,16⟩) (.single ⟨8,255,17⟩))))))))
def leaves0 : Fin 80 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 320) : GridBox := phaseImageBoxes 32768 8 0 111 leaves0 i
def outputData0 : FiniteInputTree GridBox 320 := (.node (.node (.node (.node (.node (.node (.node (.node (.single ⟨0,64,28416,28480⟩) (.single ⟨0,64,28480,28544⟩)) (.node (.single ⟨64,128,28416,28480⟩) (.node (.single ⟨64,128,28480,28544⟩) (.single ⟨0,64,28544,28608⟩)))) (.node (.node (.single ⟨0,64,28608,28672⟩) (.single ⟨64,128,28544,28608⟩)) (.node (.single ⟨64,128,28608,28672⟩) (.node (.single ⟨128,160,28416,28448⟩) (.single ⟨128,160,28448,28480⟩))))) (.node (.node (.node (.single ⟨160,192,28416,28448⟩) (.single ⟨160,192,28448,28480⟩)) (.node (.single ⟨128,160,28480,28512⟩) (.node (.single ⟨128,160,28512,28544⟩) (.single ⟨160,192,28480,28512⟩)))) (.node (.node (.single ⟨160,192,28512,28544⟩) (.single ⟨192,208,28416,28432⟩)) (.node (.single ⟨192,208,28432,28448⟩) (.node (.single ⟨208,224,28416,28432⟩) (.single ⟨208,224,28432,28448⟩)))))) (.node (.node (.node (.node (.single ⟨192,224,28448,28480⟩) (.single ⟨224,232,28416,28424⟩)) (.node (.single ⟨224,232,28424,28432⟩) (.node (.single ⟨232,240,28416,28424⟩) (.single ⟨232,240,28424,28432⟩)))) (.node (.node (.single ⟨224,240,28432,28448⟩) (.single ⟨240,244,28416,28420⟩)) (.node (.single ⟨240,244,28420,28424⟩) (.node (.single ⟨244,248,28416,28420⟩) (.single ⟨244,248,28420,28424⟩))))) (.node (.node (.node (.single ⟨240,248,28424,28432⟩) (.single ⟨240,248,28432,28440⟩)) (.node (.single ⟨240,248,28440,28448⟩) (.node (.single ⟨248,252,28432,28436⟩) (.single ⟨248,252,28436,28440⟩)))) (.node (.node (.single ⟨252,254,28432,28434⟩) (.single ⟨252,254,28434,28436⟩)) (.node (.single ⟨254,255,28432,28433⟩) (.node (.single ⟨254,255,28433,28434⟩) (.single ⟨255,256,28432,28433⟩))))))) (.node (.node (.node (.node (.node (.single ⟨255,256,28433,28434⟩) (.single ⟨254,256,28434,28436⟩)) (.node (.single ⟨252,254,28436,28438⟩) (.node (.single ⟨252,254,28438,28440⟩) (.single ⟨254,256,28436,28438⟩)))) (.node (.node (.single ⟨254,256,28438,28440⟩) (.single ⟨248,252,28440,28444⟩)) (.node (.single ⟨248,252,28444,28448⟩) (.node (.single ⟨252,256,28440,28444⟩) (.single ⟨252,256,28444,28448⟩))))) (.node (.node (.node (.single ⟨224,240,28448,28464⟩) (.single ⟨224,240,28464,28480⟩)) (.node (.single ⟨240,248,28448,28456⟩) (.node (.single ⟨240,248,28456,28464⟩) (.single ⟨248,252,28448,28452⟩)))) (.node (.node (.single ⟨248,252,28452,28456⟩) (.single ⟨252,256,28448,28452⟩)) (.node (.single ⟨252,256,28452,28456⟩) (.node (.single ⟨248,256,28456,28464⟩) (.single ⟨240,248,28464,28472⟩)))))) (.node (.node (.node (.node (.single ⟨240,248,28472,28480⟩) (.single ⟨248,256,28464,28472⟩)) (.node (.single ⟨248,256,28472,28480⟩) (.node (.single ⟨192,224,28480,28512⟩) (.single ⟨192,224,28512,28544⟩)))) (.node (.node (.single ⟨224,240,28480,28496⟩) (.single ⟨224,240,28496,28512⟩)) (.node (.single ⟨240,256,28480,28496⟩) (.node (.single ⟨240,256,28496,28512⟩) (.single ⟨224,240,28512,28528⟩))))) (.node (.node (.node (.single ⟨224,240,28528,28544⟩) (.single ⟨240,256,28512,28528⟩)) (.node (.single ⟨240,256,28528,28544⟩) (.node (.single ⟨128,192,28544,28608⟩) (.single ⟨128,192,28608,28672⟩)))) (.node (.node (.single ⟨192,224,28544,28576⟩) (.single ⟨192,224,28576,28608⟩)) (.node (.single ⟨224,256,28544,28576⟩) (.node (.single ⟨224,256,28576,28608⟩) (.single ⟨192,256,28608,28672⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨4096,4160,32512,32576⟩) (.single ⟨4096,4160,32576,32640⟩)) (.node (.single ⟨4160,4192,32512,32544⟩) (.node (.single ⟨4160,4192,32544,32576⟩) (.single ⟨4192,4224,32512,32544⟩)))) (.node (.node (.single ⟨4192,4224,32544,32576⟩) (.single ⟨4160,4224,32576,32640⟩)) (.node (.single ⟨4096,4160,32640,32704⟩) (.node (.single ⟨4096,4160,32704,32768⟩) (.single ⟨4160,4224,32640,32704⟩))))) (.node (.node (.node (.single ⟨4160,4224,32704,32768⟩) (.single ⟨4224,4240,32512,32528⟩)) (.node (.single ⟨4224,4240,32528,32544⟩) (.node (.single ⟨4240,4256,32512,32528⟩) (.single ⟨4240,4256,32528,32544⟩)))) (.node (.node (.single ⟨4224,4256,32544,32576⟩) (.single ⟨4256,4272,32512,32528⟩)) (.node (.single ⟨4256,4272,32528,32544⟩) (.node (.single ⟨4272,4288,32512,32528⟩) (.single ⟨4272,4288,32528,32544⟩)))))) (.node (.node (.node (.node (.single ⟨4256,4288,32544,32576⟩) (.single ⟨4224,4256,32576,32608⟩)) (.node (.single ⟨4224,4256,32608,32640⟩) (.node (.single ⟨4256,4288,32576,32608⟩) (.single ⟨4256,4288,32608,32640⟩)))) (.node (.node (.single ⟨4288,4296,32512,32520⟩) (.single ⟨4288,4296,32520,32528⟩)) (.node (.single ⟨4296,4304,32512,32520⟩) (.node (.single ⟨4296,4304,32520,32528⟩) (.single ⟨4288,4304,32528,32544⟩))))) (.node (.node (.node (.single ⟨4304,4312,32512,32520⟩) (.single ⟨4304,4312,32520,32528⟩)) (.node (.single ⟨4312,4316,32512,32516⟩) (.node (.single ⟨4312,4316,32516,32520⟩) (.single ⟨4316,4320,32512,32516⟩)))) (.node (.node (.single ⟨4316,4320,32516,32520⟩) (.single ⟨4312,4320,32520,32528⟩)) (.node (.single ⟨4304,4320,32528,32544⟩) (.node (.single ⟨4288,4320,32544,32576⟩) (.single ⟨4320,4324,32512,32516⟩))))))) (.node (.node (.node (.node (.node (.single ⟨4320,4324,32516,32520⟩) (.single ⟨4324,4328,32512,32516⟩)) (.node (.single ⟨4324,4328,32516,32520⟩) (.node (.single ⟨4320,4328,32520,32528⟩) (.single ⟨4328,4330,32512,32514⟩)))) (.node (.node (.single ⟨4328,4330,32514,32516⟩) (.single ⟨4330,4332,32512,32514⟩)) (.node (.single ⟨4330,4332,32514,32516⟩) (.node (.single ⟨4328,4332,32516,32520⟩) (.single ⟨4332,4334,32512,32514⟩))))) (.node (.node (.node (.single ⟨4332,4334,32514,32516⟩) (.single ⟨4334,4335,32512,32513⟩)) (.node (.single ⟨4334,4335,32513,32514⟩) (.node (.single ⟨4335,4336,32512,32513⟩) (.single ⟨4335,4336,32513,32514⟩)))) (.node (.node (.single ⟨4334,4336,32514,32516⟩) (.single ⟨4332,4336,32516,32520⟩)) (.node (.single ⟨4328,4336,32520,32528⟩) (.node (.single ⟨4320,4336,32528,32544⟩) (.single ⟨4336,4344,32520,32528⟩)))))) (.node (.node (.node (.node (.single ⟨4344,4348,32520,32524⟩) (.single ⟨4344,4348,32524,32528⟩)) (.node (.single ⟨4348,4352,32520,32524⟩) (.node (.single ⟨4348,4352,32524,32528⟩) (.single ⟨4336,4344,32528,32536⟩)))) (.node (.node (.single ⟨4336,4344,32536,32544⟩) (.single ⟨4344,4352,32528,32536⟩)) (.node (.single ⟨4344,4352,32536,32544⟩) (.node (.single ⟨4320,4336,32544,32560⟩) (.single ⟨4320,4336,32560,32576⟩))))) (.node (.node (.node (.single ⟨4336,4352,32544,32560⟩) (.single ⟨4336,4352,32560,32576⟩)) (.node (.single ⟨4288,4320,32576,32608⟩) (.node (.single ⟨4288,4320,32608,32640⟩) (.single ⟨4320,4352,32576,32608⟩)))) (.node (.node (.single ⟨4320,4352,32608,32640⟩) (.single ⟨4224,4288,32640,32704⟩)) (.node (.single ⟨4224,4288,32704,32768⟩) (.node (.single ⟨4288,4352,32640,32704⟩) (.single ⟨4288,4352,32704,32768⟩))))))))) (.node (.node (.node (.node (.node (.node (.node (.single ⟨28416,28480,0,64⟩) (.single ⟨28416,28480,64,128⟩)) (.node (.single ⟨28480,28544,0,64⟩) (.node (.single ⟨28480,28544,64,128⟩) (.single ⟨28416,28448,128,160⟩)))) (.node (.node (.single ⟨28416,28448,160,192⟩) (.single ⟨28448,28480,128,160⟩)) (.node (.single ⟨28448,28480,160,192⟩) (.node (.single ⟨28416,28432,192,208⟩) (.single ⟨28416,28432,208,224⟩))))) (.node (.node (.node (.single ⟨28432,28448,192,208⟩) (.single ⟨28432,28448,208,224⟩)) (.node (.single ⟨28416,28424,224,232⟩) (.node (.single ⟨28416,28424,232,240⟩) (.single ⟨28424,28432,224,232⟩)))) (.node (.node (.single ⟨28424,28432,232,240⟩) (.single ⟨28416,28420,240,244⟩)) (.node (.single ⟨28416,28420,244,248⟩) (.node (.single ⟨28420,28424,240,244⟩) (.single ⟨28420,28424,244,248⟩)))))) (.node (.node (.node (.node (.single ⟨28424,28432,240,248⟩) (.single ⟨28432,28448,224,240⟩)) (.node (.single ⟨28432,28440,240,248⟩) (.node (.single ⟨28432,28436,248,252⟩) (.single ⟨28432,28434,252,254⟩)))) (.node (.node (.single ⟨28432,28433,254,255⟩) (.single ⟨28432,28433,255,256⟩)) (.node (.single ⟨28433,28434,254,255⟩) (.node (.single ⟨28433,28434,255,256⟩) (.single ⟨28434,28436,252,254⟩))))) (.node (.node (.node (.single ⟨28434,28436,254,256⟩) (.single ⟨28436,28440,248,252⟩)) (.node (.single ⟨28436,28438,252,254⟩) (.node (.single ⟨28436,28438,254,256⟩) (.single ⟨28438,28440,252,254⟩)))) (.node (.node (.single ⟨28438,28440,254,256⟩) (.single ⟨28440,28448,240,248⟩)) (.node (.single ⟨28440,28444,248,252⟩) (.node (.single ⟨28440,28444,252,256⟩) (.single ⟨28444,28448,248,252⟩))))))) (.node (.node (.node (.node (.node (.single ⟨28444,28448,252,256⟩) (.single ⟨28448,28480,192,224⟩)) (.node (.single ⟨28448,28464,224,240⟩) (.node (.single ⟨28448,28456,240,248⟩) (.single ⟨28448,28452,248,252⟩)))) (.node (.node (.single ⟨28448,28452,252,256⟩) (.single ⟨28452,28456,248,252⟩)) (.node (.single ⟨28452,28456,252,256⟩) (.node (.single ⟨28456,28464,240,248⟩) (.single ⟨28456,28464,248,256⟩))))) (.node (.node (.node (.single ⟨28464,28480,224,240⟩) (.single ⟨28464,28472,240,248⟩)) (.node (.single ⟨28464,28472,248,256⟩) (.node (.single ⟨28472,28480,240,248⟩) (.single ⟨28472,28480,248,256⟩)))) (.node (.node (.single ⟨28480,28512,128,160⟩) (.single ⟨28480,28512,160,192⟩)) (.node (.single ⟨28512,28544,128,160⟩) (.node (.single ⟨28512,28544,160,192⟩) (.single ⟨28480,28512,192,224⟩)))))) (.node (.node (.node (.node (.single ⟨28480,28496,224,240⟩) (.single ⟨28480,28496,240,256⟩)) (.node (.single ⟨28496,28512,224,240⟩) (.node (.single ⟨28496,28512,240,256⟩) (.single ⟨28512,28544,192,224⟩)))) (.node (.node (.single ⟨28512,28528,224,240⟩) (.single ⟨28512,28528,240,256⟩)) (.node (.single ⟨28528,28544,224,240⟩) (.node (.single ⟨28528,28544,240,256⟩) (.single ⟨28544,28608,0,64⟩))))) (.node (.node (.node (.single ⟨28544,28608,64,128⟩) (.single ⟨28608,28672,0,64⟩)) (.node (.single ⟨28608,28672,64,128⟩) (.node (.single ⟨28544,28608,128,192⟩) (.single ⟨28544,28576,192,224⟩)))) (.node (.node (.single ⟨28544,28576,224,256⟩) (.single ⟨28576,28608,192,224⟩)) (.node (.single ⟨28576,28608,224,256⟩) (.node (.single ⟨28608,28672,128,192⟩) (.single ⟨28608,28672,192,256⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨32512,32576,4096,4160⟩) (.single ⟨32512,32544,4160,4192⟩)) (.node (.single ⟨32512,32544,4192,4224⟩) (.node (.single ⟨32544,32576,4160,4192⟩) (.single ⟨32544,32576,4192,4224⟩)))) (.node (.node (.single ⟨32576,32640,4096,4160⟩) (.single ⟨32576,32640,4160,4224⟩)) (.node (.single ⟨32512,32528,4224,4240⟩) (.node (.single ⟨32512,32528,4240,4256⟩) (.single ⟨32528,32544,4224,4240⟩))))) (.node (.node (.node (.single ⟨32528,32544,4240,4256⟩) (.single ⟨32512,32528,4256,4272⟩)) (.node (.single ⟨32512,32528,4272,4288⟩) (.node (.single ⟨32528,32544,4256,4272⟩) (.single ⟨32528,32544,4272,4288⟩)))) (.node (.node (.single ⟨32544,32576,4224,4256⟩) (.single ⟨32544,32576,4256,4288⟩)) (.node (.single ⟨32512,32520,4288,4296⟩) (.node (.single ⟨32512,32520,4296,4304⟩) (.single ⟨32520,32528,4288,4296⟩)))))) (.node (.node (.node (.node (.single ⟨32520,32528,4296,4304⟩) (.single ⟨32512,32520,4304,4312⟩)) (.node (.single ⟨32512,32516,4312,4316⟩) (.node (.single ⟨32512,32516,4316,4320⟩) (.single ⟨32516,32520,4312,4316⟩)))) (.node (.node (.single ⟨32516,32520,4316,4320⟩) (.single ⟨32520,32528,4304,4312⟩)) (.node (.single ⟨32520,32528,4312,4320⟩) (.node (.single ⟨32528,32544,4288,4304⟩) (.single ⟨32528,32544,4304,4320⟩))))) (.node (.node (.node (.single ⟨32512,32516,4320,4324⟩) (.single ⟨32512,32516,4324,4328⟩)) (.node (.single ⟨32516,32520,4320,4324⟩) (.node (.single ⟨32516,32520,4324,4328⟩) (.single ⟨32512,32514,4328,4330⟩)))) (.node (.node (.single ⟨32512,32514,4330,4332⟩) (.single ⟨32514,32516,4328,4330⟩)) (.node (.single ⟨32514,32516,4330,4332⟩) (.node (.single ⟨32512,32514,4332,4334⟩) (.single ⟨32512,32513,4334,4335⟩))))))) (.node (.node (.node (.node (.node (.single ⟨32512,32513,4335,4336⟩) (.single ⟨32513,32514,4334,4335⟩)) (.node (.single ⟨32513,32514,4335,4336⟩) (.node (.single ⟨32514,32516,4332,4334⟩) (.single ⟨32514,32516,4334,4336⟩)))) (.node (.node (.single ⟨32516,32520,4328,4332⟩) (.single ⟨32516,32520,4332,4336⟩)) (.node (.single ⟨32520,32528,4320,4328⟩) (.node (.single ⟨32520,32528,4328,4336⟩) (.single ⟨32520,32528,4336,4344⟩))))) (.node (.node (.node (.single ⟨32520,32524,4344,4348⟩) (.single ⟨32520,32524,4348,4352⟩)) (.node (.single ⟨32524,32528,4344,4348⟩) (.node (.single ⟨32524,32528,4348,4352⟩) (.single ⟨32528,32544,4320,4336⟩)))) (.node (.node (.single ⟨32528,32536,4336,4344⟩) (.single ⟨32528,32536,4344,4352⟩)) (.node (.single ⟨32536,32544,4336,4344⟩) (.node (.single ⟨32536,32544,4344,4352⟩) (.single ⟨32544,32576,4288,4320⟩)))))) (.node (.node (.node (.node (.single ⟨32544,32560,4320,4336⟩) (.single ⟨32544,32560,4336,4352⟩)) (.node (.single ⟨32560,32576,4320,4336⟩) (.node (.single ⟨32560,32576,4336,4352⟩) (.single ⟨32576,32608,4224,4256⟩)))) (.node (.node (.single ⟨32576,32608,4256,4288⟩) (.single ⟨32608,32640,4224,4256⟩)) (.node (.single ⟨32608,32640,4256,4288⟩) (.node (.single ⟨32576,32608,4288,4320⟩) (.single ⟨32576,32608,4320,4352⟩))))) (.node (.node (.node (.single ⟨32608,32640,4288,4320⟩) (.single ⟨32608,32640,4320,4352⟩)) (.node (.single ⟨32640,32704,4096,4160⟩) (.node (.single ⟨32640,32704,4160,4224⟩) (.single ⟨32704,32768,4096,4160⟩)))) (.node (.node (.single ⟨32704,32768,4160,4224⟩) (.single ⟨32640,32704,4224,4288⟩)) (.node (.single ⟨32640,32704,4288,4352⟩) (.node (.single ⟨32704,32768,4224,4288⟩) (.single ⟨32704,32768,4288,4352⟩))))))))))
def output0 : Fin 320 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 320 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 0) (.single 160)) (.node (.single 319) (.node (.single 159) (.single 1)))) (.node (.node (.single 162) (.single 318)) (.node (.single 157) (.node (.single 2) (.single 161))))) (.node (.node (.node (.single 317) (.single 158)) (.node (.single 3) (.node (.single 163) (.single 316)))) (.node (.node (.single 156) (.single 73)) (.node (.single 233) (.node (.single 246) (.single 86)))))) (.node (.node (.node (.node (.single 74) (.single 238)) (.node (.single 245) (.node (.single 81) (.single 79)))) (.node (.node (.single 239) (.single 240)) (.node (.single 80) (.node (.single 4) (.single 229))))) (.node (.node (.node (.single 315) (.single 90)) (.node (.single 5) (.node (.single 231) (.single 314)))) (.node (.node (.single 88) (.single 6)) (.node (.single 230) (.node (.single 313) (.single 89))))))) (.node (.node (.node (.node (.node (.single 7) (.single 232)) (.node (.single 312) (.node (.single 87) (.single 20)))) (.node (.node (.single 201) (.single 299)) (.node (.single 118) (.node (.single 63) (.single 219))))) (.node (.node (.node (.single 256) (.single 100)) (.node (.single 64) (.node (.single 224) (.single 255)))) (.node (.node (.single 95) (.single 8)) (.node (.single 164) (.node (.single 311) (.single 155)))))) (.node (.node (.node (.node (.single 9) (.single 166)) (.node (.single 310) (.node (.single 153) (.single 10)))) (.node (.node (.single 165) (.single 309)) (.node (.single 154) (.node (.single 11) (.single 167))))) (.node (.node (.node (.single 308) (.single 152)) (.node (.single 75) (.node (.single 234) (.single 244)))) (.node (.node (.single 85) (.single 76)) (.node (.single 236) (.node (.single 243) (.single 83)))))))) (.node (.node (.node (.node (.node (.node (.single 77) (.single 235)) (.node (.single 242) (.node (.single 84) (.single 78)))) (.node (.node (.single 237) (.single 241)) (.node (.single 82) (.node (.single 12) (.single 215))))) (.node (.node (.node (.single 307) (.single 104)) (.node (.single 13) (.node (.single 217) (.single 306)))) (.node (.node (.single 102) (.single 14)) (.node (.single 216) (.node (.single 305) (.single 103)))))) (.node (.node (.node (.node (.single 15) (.single 218)) (.node (.single 304) (.node (.single 101) (.single 25)))) (.node (.node (.single 181) (.single 294)) (.node (.single 138) (.node (.single 50) (.single 202))))) (.node (.node (.node (.single 269) (.single 117)) (.node (.single 51) (.node (.single 210) (.single 268)))) (.node (.node (.single 109) (.single 65)) (.node (.single 220) (.node (.single 254) (.single 99))))))) (.node (.node (.node (.node (.node (.single 66) (.single 222)) (.node (.single 253) (.node (.single 97) (.single 67)))) (.node (.node (.single 221) (.single 252)) (.node (.single 98) (.node (.single 68) (.single 223))))) (.node (.node (.node (.single 251) (.single 96)) (.node (.single 16) (.node (.single 168) (.single 303)))) (.node (.node (.single 151) (.single 17)) (.node (.single 170) (.node (.single 302) (.single 149)))))) (.node (.node (.node (.node (.single 18) (.single 169)) (.node (.single 301) (.node (.single 150) (.single 19)))) (.node (.node (.single 171) (.single 300)) (.node (.single 148) (.node (.single 69) (.single 225))))) (.node (.node (.node (.single 250) (.single 94)) (.node (.single 70) (.node (.single 227) (.single 249)))) (.node (.node (.single 92) (.single 71)) (.node (.single 226) (.node (.single 248) (.single 93))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 72) (.single 228)) (.node (.single 247) (.node (.single 91) (.single 30)))) (.node (.node (.single 180) (.single 289)) (.node (.single 139) (.node (.single 31) (.single 182))))) (.node (.node (.node (.single 288) (.single 137)) (.node (.single 32) (.node (.single 196) (.single 287)))) (.node (.node (.single 123) (.single 52)) (.node (.single 203) (.node (.single 267) (.single 116)))))) (.node (.node (.node (.node (.single 53) (.single 208)) (.node (.single 266) (.node (.single 111) (.single 58)))) (.node (.node (.single 209) (.single 261)) (.node (.single 110) (.node (.single 21) (.single 172))))) (.node (.node (.node (.single 298) (.single 147)) (.node (.single 22) (.node (.single 174) (.single 297)))) (.node (.node (.single 145) (.single 23)) (.node (.single 173) (.node (.single 296) (.single 146))))))) (.node (.node (.node (.node (.node (.single 24) (.single 175)) (.node (.single 295) (.node (.single 144) (.single 59)))) (.node (.node (.single 211) (.single 260)) (.node (.single 108) (.node (.single 60) (.single 213))))) (.node (.node (.node (.single 259) (.single 106)) (.node (.single 61) (.node (.single 212) (.single 258)))) (.node (.node (.single 107) (.single 62)) (.node (.single 214) (.node (.single 257) (.single 105)))))) (.node (.node (.node (.node (.single 26) (.single 176)) (.node (.single 293) (.node (.single 143) (.single 27)))) (.node (.node (.single 178) (.single 292)) (.node (.single 141) (.node (.single 28) (.single 177))))) (.node (.node (.node (.single 291) (.single 142)) (.node (.single 29) (.node (.single 179) (.single 290)))) (.node (.node (.single 140) (.single 33)) (.node (.single 183) (.node (.single 286) (.single 136)))))))) (.node (.node (.node (.node (.node (.node (.single 34) (.single 191)) (.node (.single 285) (.node (.single 128) (.single 46)))) (.node (.node (.single 197) (.single 273)) (.node (.single 122) (.node (.single 47) (.single 199))))) (.node (.node (.node (.single 272) (.single 120)) (.node (.single 48) (.node (.single 198) (.single 271)))) (.node (.node (.single 121) (.single 49)) (.node (.single 200) (.node (.single 270) (.single 119)))))) (.node (.node (.node (.node (.single 54) (.single 204)) (.node (.single 265) (.node (.single 115) (.single 55)))) (.node (.node (.single 206) (.single 264)) (.node (.single 113) (.node (.single 56) (.single 205))))) (.node (.node (.node (.single 263) (.single 114)) (.node (.single 57) (.node (.single 207) (.single 262)))) (.node (.node (.single 112) (.single 35)) (.node (.single 184) (.node (.single 284) (.single 135))))))) (.node (.node (.node (.node (.node (.single 36) (.single 189)) (.node (.single 283) (.node (.single 130) (.single 41)))) (.node (.node (.single 190) (.single 278)) (.node (.single 129) (.node (.single 42) (.single 192))))) (.node (.node (.node (.single 277) (.single 127)) (.node (.single 43) (.node (.single 194) (.single 276)))) (.node (.node (.single 125) (.single 44)) (.node (.single 193) (.node (.single 275) (.single 126)))))) (.node (.node (.node (.node (.single 45) (.single 195)) (.node (.single 274) (.node (.single 124) (.single 37)))) (.node (.node (.single 185) (.single 282)) (.node (.single 134) (.node (.single 38) (.single 187))))) (.node (.node (.node (.single 281) (.single 132)) (.node (.single 39) (.node (.single 186) (.single 280)))) (.node (.node (.single 133) (.single 40)) (.node (.single 188) (.node (.single 279) (.single 131))))))))))
def sourceData0 : FiniteInputTree ℕ 320 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 28)))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.node (.single 56) (.single 60))))) (.node (.node (.node (.single 64) (.single 68)) (.node (.single 88) (.node (.single 92) (.single 96)))) (.node (.node (.single 100) (.single 132)) (.node (.single 136) (.node (.single 140) (.single 144)))))) (.node (.node (.node (.node (.single 44) (.single 188)) (.node (.single 192) (.node (.single 196) (.single 200)))) (.node (.node (.single 104) (.single 220)) (.node (.single 224) (.node (.single 228) (.single 232))))) (.node (.node (.node (.single 164) (.single 168)) (.node (.single 172) (.node (.single 236) (.single 240)))) (.node (.node (.single 276) (.single 280)) (.node (.single 304) (.node (.single 308) (.single 312))))))) (.node (.node (.node (.node (.node (.single 316) (.single 284)) (.node (.single 288) (.node (.single 292) (.single 296)))) (.node (.node (.single 300) (.single 244)) (.node (.single 248) (.node (.single 252) (.single 256))))) (.node (.node (.node (.single 108) (.single 112)) (.node (.single 176) (.node (.single 180) (.single 260)))) (.node (.node (.single 264) (.single 268)) (.node (.single 272) (.node (.single 184) (.single 204)))))) (.node (.node (.node (.node (.single 208) (.single 212)) (.node (.single 216) (.node (.single 48) (.single 52)))) (.node (.node (.single 116) (.single 120)) (.node (.single 124) (.node (.single 128) (.single 148))))) (.node (.node (.node (.single 152) (.single 156)) (.node (.single 160) (.node (.single 16) (.single 20)))) (.node (.node (.single 72) (.single 76)) (.node (.single 80) (.node (.single 84) (.single 24)))))))) (.node (.node (.node (.node (.node (.node (.single 27) (.single 23)) (.node (.single 87) (.node (.single 79) (.single 83)))) (.node (.node (.single 75) (.single 19)) (.node (.single 43) (.node (.single 35) (.single 39))))) (.node (.node (.node (.single 31) (.single 163)) (.node (.single 155) (.node (.single 159) (.single 151)))) (.node (.node (.single 55) (.single 131)) (.node (.single 123) (.node (.single 127) (.single 119)))))) (.node (.node (.node (.node (.single 51) (.single 103)) (.node (.single 95) (.node (.single 99) (.single 91)))) (.node (.node (.single 219) (.single 211)) (.node (.single 215) (.node (.single 207) (.single 115))))) (.node (.node (.node (.single 187) (.single 183)) (.node (.single 275) (.node (.single 267) (.single 271)))) (.node (.node (.single 263) (.single 179)) (.node (.single 111) (.node (.single 47) (.single 259))))))) (.node (.node (.node (.node (.node (.single 251) (.single 255)) (.node (.single 247) (.node (.single 175) (.single 303)))) (.node (.node (.single 295) (.single 299)) (.node (.single 291) (.node (.single 243) (.single 287))))) (.node (.node (.node (.single 283) (.single 319)) (.node (.single 311) (.node (.single 315) (.single 307)))) (.node (.node (.single 279) (.single 239)) (.node (.single 171) (.node (.single 107) (.single 167)))))) (.node (.node (.node (.node (.single 235) (.single 227)) (.node (.single 231) (.node (.single 223) (.single 203)))) (.node (.node (.single 195) (.single 199)) (.node (.single 191) (.node (.single 147) (.single 139))))) (.node (.node (.node (.single 143) (.single 135)) (.node (.single 71) (.node (.single 63) (.single 67)))) (.node (.node (.single 59) (.single 15)) (.node (.single 7) (.node (.single 11) (.single 3))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.node (.single 13) (.single 57)))) (.node (.node (.single 65) (.single 61)) (.node (.single 69) (.node (.single 133) (.single 141))))) (.node (.node (.node (.single 137) (.single 145)) (.node (.single 189) (.node (.single 197) (.single 193)))) (.node (.node (.single 201) (.single 221)) (.node (.single 229) (.node (.single 225) (.single 233)))))) (.node (.node (.node (.node (.single 165) (.single 105)) (.node (.single 169) (.node (.single 237) (.single 277)))) (.node (.node (.single 305) (.single 313)) (.node (.single 309) (.node (.single 317) (.single 281))))) (.node (.node (.node (.single 285) (.single 241)) (.node (.single 289) (.node (.single 297) (.single 293)))) (.node (.node (.single 301) (.single 173)) (.node (.single 245) (.node (.single 253) (.single 249))))))) (.node (.node (.node (.node (.node (.single 257) (.single 45)) (.node (.single 109) (.node (.single 177) (.single 261)))) (.node (.node (.single 269) (.single 265)) (.node (.single 273) (.node (.single 181) (.single 185))))) (.node (.node (.node (.single 113) (.single 205)) (.node (.single 213) (.node (.single 209) (.single 217)))) (.node (.node (.single 89) (.single 97)) (.node (.single 93) (.node (.single 101) (.single 49)))))) (.node (.node (.node (.node (.single 117) (.single 125)) (.node (.single 121) (.node (.single 129) (.single 53)))) (.node (.node (.single 149) (.single 157)) (.node (.single 153) (.node (.single 161) (.single 29))))) (.node (.node (.node (.single 37) (.single 33)) (.node (.single 41) (.node (.single 17) (.single 73)))) (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 21) (.single 25)))))))) (.node (.node (.node (.node (.node (.node (.single 26) (.single 86)) (.node (.single 82) (.node (.single 78) (.single 74)))) (.node (.node (.single 22) (.single 18)) (.node (.single 162) (.node (.single 158) (.single 154))))) (.node (.node (.node (.single 150) (.single 130)) (.node (.single 126) (.node (.single 122) (.single 118)))) (.node (.node (.single 54) (.single 50)) (.node (.single 218) (.node (.single 214) (.single 210)))))) (.node (.node (.node (.node (.single 206) (.single 186)) (.node (.single 274) (.node (.single 270) (.single 266)))) (.node (.node (.single 262) (.single 182)) (.node (.single 178) (.node (.single 114) (.single 110))))) (.node (.node (.node (.single 258) (.single 254)) (.node (.single 250) (.node (.single 246) (.single 302)))) (.node (.node (.single 298) (.single 294)) (.node (.single 290) (.node (.single 286) (.single 318))))))) (.node (.node (.node (.node (.node (.single 314) (.single 310)) (.node (.single 306) (.node (.single 282) (.single 278)))) (.node (.node (.single 242) (.single 238)) (.node (.single 174) (.node (.single 170) (.single 166))))) (.node (.node (.node (.single 234) (.single 230)) (.node (.single 226) (.node (.single 222) (.single 106)))) (.node (.node (.single 202) (.single 198)) (.node (.single 194) (.node (.single 190) (.single 46)))))) (.node (.node (.node (.node (.single 146) (.single 142)) (.node (.single 138) (.node (.single 134) (.single 102)))) (.node (.node (.single 98) (.single 94)) (.node (.single 90) (.node (.single 70) (.single 66))))) (.node (.node (.node (.single 62) (.single 58)) (.node (.single 42) (.node (.single 38) (.single 34)))) (.node (.node (.single 30) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2))))))))))
def cover0 (i : Fin 320) : Fin 320 := ⟨coverData0.get i % 320, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 320) : Fin 320 := ⟨sourceData0.get i % 320, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 (.cutX 2048 (.cutY 26624 .empty (.cutX 1024 (.cutY 27648 .empty (.cutX 512 (.cutY 28160 .empty (.cutX 256 (.cutY 28416 .empty (.cutX 128 (.cutY 28544 (.cutX 64 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) (.cutX 64 (.cutY 28608 .full .full) (.cutY 28608 .full .full))) (.cutY 28544 (.cutX 192 (.cutY 28480 (.cutX 160 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) (.cutX 160 (.cutY 28512 .full .full) (.cutY 28512 .full .full))) (.cutY 28480 (.cutX 224 (.cutY 28448 (.cutX 208 (.cutY 28432 .full .full) (.cutY 28432 .full .full)) .full) (.cutY 28448 (.cutX 240 (.cutY 28432 (.cutX 232 (.cutY 28424 .full .full) (.cutY 28424 .full .full)) .full) (.cutY 28432 (.cutX 248 (.cutY 28424 (.cutX 244 (.cutY 28420 .full .full) (.cutY 28420 .full .full)) .full) .empty) (.cutX 248 (.cutY 28440 .full .full) (.cutY 28440 (.cutX 252 (.cutY 28436 .full .full) (.cutY 28436 (.cutX 254 (.cutY 28434 .full .full) (.cutY 28434 (.cutX 255 (.cutY 28433 .full .full) (.cutY 28433 .full .full)) .full)) (.cutX 254 (.cutY 28438 .full .full) (.cutY 28438 .full .full)))) (.cutX 252 (.cutY 28444 .full .full) (.cutY 28444 .full .full)))))) (.cutX 240 (.cutY 28464 .full .full) (.cutY 28464 (.cutX 248 (.cutY 28456 .full .full) (.cutY 28456 (.cutX 252 (.cutY 28452 .full .full) (.cutY 28452 .full .full)) .full)) (.cutX 248 (.cutY 28472 .full .full) (.cutY 28472 .full .full)))))) (.cutX 224 (.cutY 28512 .full .full) (.cutY 28512 (.cutX 240 (.cutY 28496 .full .full) (.cutY 28496 .full .full)) (.cutX 240 (.cutY 28528 .full .full) (.cutY 28528 .full .full)))))) (.cutX 192 (.cutY 28608 .full .full) (.cutY 28608 (.cutX 224 (.cutY 28576 .full .full) (.cutY 28576 .full .full)) .full))))) .empty)) .empty)) .empty)) .empty) .empty) (.cutY 28672 .empty (.cutX 6144 (.cutY 30720 .empty (.cutX 5120 (.cutY 31744 .empty (.cutX 4608 (.cutY 32256 .empty (.cutX 4352 (.cutY 32512 .empty (.cutX 4224 (.cutY 32640 (.cutX 4160 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 4192 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 4160 (.cutY 32704 .full .full) (.cutY 32704 .full .full))) (.cutY 32640 (.cutX 4288 (.cutY 32576 (.cutX 4256 (.cutY 32544 (.cutX 4240 (.cutY 32528 .full .full) (.cutY 32528 .full .full)) .full) (.cutY 32544 (.cutX 4272 (.cutY 32528 .full .full) (.cutY 32528 .full .full)) .full)) (.cutX 4256 (.cutY 32608 .full .full) (.cutY 32608 .full .full))) (.cutY 32576 (.cutX 4320 (.cutY 32544 (.cutX 4304 (.cutY 32528 (.cutX 4296 (.cutY 32520 .full .full) (.cutY 32520 .full .full)) .full) (.cutY 32528 (.cutX 4312 (.cutY 32520 .full .full) (.cutY 32520 (.cutX 4316 (.cutY 32516 .full .full) (.cutY 32516 .full .full)) .full)) .full)) .full) (.cutY 32544 (.cutX 4336 (.cutY 32528 (.cutX 4328 (.cutY 32520 (.cutX 4324 (.cutY 32516 .full .full) (.cutY 32516 .full .full)) .full) (.cutY 32520 (.cutX 4332 (.cutY 32516 (.cutX 4330 (.cutY 32514 .full .full) (.cutY 32514 .full .full)) .full) (.cutY 32516 (.cutX 4334 (.cutY 32514 .full .full) (.cutY 32514 (.cutX 4335 (.cutY 32513 .full .full) (.cutY 32513 .full .full)) .full)) .full)) .full)) .full) (.cutY 32528 (.cutX 4344 (.cutY 32520 .empty .full) (.cutY 32520 .empty (.cutX 4348 (.cutY 32524 .full .full) (.cutY 32524 .full .full)))) (.cutX 4344 (.cutY 32536 .full .full) (.cutY 32536 .full .full)))) (.cutX 4336 (.cutY 32560 .full .full) (.cutY 32560 .full .full)))) (.cutX 4320 (.cutY 32608 .full .full) (.cutY 32608 .full .full)))) (.cutX 4288 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)) .empty)) .empty)) .empty)))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 (.cutX 26624 .empty (.cutY 2048 (.cutX 27648 .empty (.cutY 1024 (.cutX 28160 .empty (.cutY 512 (.cutX 28416 .empty (.cutY 256 (.cutX 28544 (.cutY 128 (.cutX 28480 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 28480 (.cutY 192 (.cutX 28448 (.cutY 160 .full .full) (.cutY 160 .full .full)) (.cutX 28448 (.cutY 224 (.cutX 28432 (.cutY 208 .full .full) (.cutY 208 .full .full)) (.cutX 28432 (.cutY 240 (.cutX 28424 (.cutY 232 .full .full) (.cutY 232 .full .full)) (.cutX 28424 (.cutY 248 (.cutX 28420 (.cutY 244 .full .full) (.cutY 244 .full .full)) .empty) (.cutY 248 .full .empty))) (.cutY 240 .full (.cutX 28440 (.cutY 248 .full (.cutX 28436 (.cutY 252 .full (.cutX 28434 (.cutY 254 .full (.cutX 28433 (.cutY 255 .full .full) (.cutY 255 .full .full))) (.cutY 254 .full .full))) (.cutY 252 .full (.cutX 28438 (.cutY 254 .full .full) (.cutY 254 .full .full))))) (.cutY 248 .full (.cutX 28444 (.cutY 252 .full .full) (.cutY 252 .full .full))))))) (.cutY 224 .full (.cutX 28464 (.cutY 240 .full (.cutX 28456 (.cutY 248 .full (.cutX 28452 (.cutY 252 .full .full) (.cutY 252 .full .full))) (.cutY 248 .full .full))) (.cutY 240 .full (.cutX 28472 (.cutY 248 .full .full) (.cutY 248 .full .full))))))) (.cutY 192 (.cutX 28512 (.cutY 160 .full .full) (.cutY 160 .full .full)) (.cutX 28512 (.cutY 224 .full (.cutX 28496 (.cutY 240 .full .full) (.cutY 240 .full .full))) (.cutY 224 .full (.cutX 28528 (.cutY 240 .full .full) (.cutY 240 .full .full))))))) (.cutY 128 (.cutX 28608 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 28608 (.cutY 192 .full (.cutX 28576 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full)))) .empty)) .empty)) .empty)) .empty)) .empty) (.cutY 4096 .empty (.cutX 30720 .empty (.cutY 6144 (.cutX 31744 .empty (.cutY 5120 (.cutX 32256 .empty (.cutY 4608 (.cutX 32512 .empty (.cutY 4352 (.cutX 32640 (.cutY 4224 (.cutX 32576 (.cutY 4160 .full (.cutX 32544 (.cutY 4192 .full .full) (.cutY 4192 .full .full))) (.cutY 4160 .full .full)) (.cutX 32576 (.cutY 4288 (.cutX 32544 (.cutY 4256 (.cutX 32528 (.cutY 4240 .full .full) (.cutY 4240 .full .full)) (.cutX 32528 (.cutY 4272 .full .full) (.cutY 4272 .full .full))) (.cutY 4256 .full .full)) (.cutX 32544 (.cutY 4320 (.cutX 32528 (.cutY 4304 (.cutX 32520 (.cutY 4296 .full .full) (.cutY 4296 .full .full)) (.cutX 32520 (.cutY 4312 .full (.cutX 32516 (.cutY 4316 .full .full) (.cutY 4316 .full .full))) (.cutY 4312 .full .full))) (.cutY 4304 .full .full)) (.cutX 32528 (.cutY 4336 (.cutX 32520 (.cutY 4328 (.cutX 32516 (.cutY 4324 .full .full) (.cutY 4324 .full .full)) (.cutX 32516 (.cutY 4332 (.cutX 32514 (.cutY 4330 .full .full) (.cutY 4330 .full .full)) (.cutX 32514 (.cutY 4334 .full (.cutX 32513 (.cutY 4335 .full .full) (.cutY 4335 .full .full))) (.cutY 4334 .full .full))) (.cutY 4332 .full .full))) (.cutY 4328 .full .full)) (.cutX 32520 .empty (.cutY 4344 .full (.cutX 32524 (.cutY 4348 .full .full) (.cutY 4348 .full .full))))) (.cutY 4336 .full (.cutX 32536 (.cutY 4344 .full .full) (.cutY 4344 .full .full))))) (.cutY 4320 .full (.cutX 32560 (.cutY 4336 .full .full) (.cutY 4336 .full .full))))) (.cutY 4288 (.cutX 32608 (.cutY 4256 .full .full) (.cutY 4256 .full .full)) (.cutX 32608 (.cutY 4320 .full .full) (.cutY 4320 .full .full))))) (.cutY 4224 (.cutX 32704 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 32704 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty)) .empty)) .empty)))) .empty)) .empty))

theorem metadata0 : 0<194624179 ∧ 0<128 ∧ 111<128 ∧ 3<4 ∧
    12591/4160=3 ∧ 12591%4160=111 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 320 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked0_64 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 320 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked0_128 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 320 128 64 (by decide) i) := by decide +kernel

theorem sourceChecked0_192 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 320 192 64 (by decide) i) := by decide +kernel

theorem sourceChecked0_256 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 320 256 64 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 320, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) (forallFinOffset_add (fun i => output0 i = raw0 (source0 i)) 0 64 256 (by decide) sourceChecked0_0
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i)) 64 64 192 (by decide) sourceChecked0_64
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i)) 128 64 128 (by decide) sourceChecked0_128
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i)) 192 64 64 (by decide) sourceChecked0_192
    sourceChecked0_256))))

theorem coverChecked0_0 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 320 0 64 (by decide) i) := by decide +kernel

theorem coverChecked0_64 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 320 64 64 (by decide) i) := by decide +kernel

theorem coverChecked0_128 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 320 128 64 (by decide) i) := by decide +kernel

theorem coverChecked0_192 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 320 192 64 (by decide) i) := by decide +kernel

theorem coverChecked0_256 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 320 256 64 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 320, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
  forallFin_of_zero_offset (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (forallFinOffset_add (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) 0 64 256 (by decide) coverChecked0_0
    (forallFinOffset_add (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) 64 64 192 (by decide) coverChecked0_64
    (forallFinOffset_add (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) 128 64 128 (by decide) coverChecked0_128
    (forallFinOffset_add (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) 192 64 64 (by decide) coverChecked0_192
    coverChecked0_256))))

theorem treeChecked0 : tree0.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves0 : List.ofFn output0 = tree0.leaves ⟨0,32768,0,32768⟩ := by
  unfold output0
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked0 : gridTreeUnionCheck 32768 raw0 output0 cover0 source0 tree0 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked0, coverChecked0, treeChecked0, treeLeaves0⟩

theorem areaUnits0 : gridUnionAreaUnits output0 = 261632 := by decide +kernel

noncomputable def phaseMass0 : ℝ := singlePhaseMass (194624179/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (99452955469/838860800000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 15302, atom 13559, type 3, source (8,119).
def leavesData1 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩)))) (.node (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves1 : Fin 16 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 8 119 leaves1 i
def outputData1 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,30464,30528⟩) (.single ⟨2048,2112,30528,30592⟩)) (.node (.single ⟨2112,2176,30464,30528⟩) (.single ⟨2112,2176,30528,30592⟩))) (.node (.node (.single ⟨2048,2112,30592,30656⟩) (.single ⟨2048,2112,30656,30720⟩)) (.node (.single ⟨2112,2176,30592,30656⟩) (.single ⟨2112,2176,30656,30720⟩)))) (.node (.node (.node (.single ⟨2176,2240,30464,30528⟩) (.single ⟨2176,2240,30528,30592⟩)) (.node (.single ⟨2240,2304,30464,30528⟩) (.single ⟨2240,2304,30528,30592⟩))) (.node (.node (.single ⟨2176,2240,30592,30656⟩) (.single ⟨2176,2240,30656,30720⟩)) (.node (.single ⟨2240,2304,30592,30656⟩) (.single ⟨2240,2304,30656,30720⟩))))) (.node (.node (.node (.node (.single ⟨30464,30528,2048,2112⟩) (.single ⟨30464,30528,2112,2176⟩)) (.node (.single ⟨30528,30592,2048,2112⟩) (.single ⟨30528,30592,2112,2176⟩))) (.node (.node (.single ⟨30464,30528,2176,2240⟩) (.single ⟨30464,30528,2240,2304⟩)) (.node (.single ⟨30528,30592,2176,2240⟩) (.single ⟨30528,30592,2240,2304⟩)))) (.node (.node (.node (.single ⟨30592,30656,2048,2112⟩) (.single ⟨30592,30656,2112,2176⟩)) (.node (.single ⟨30656,30720,2048,2112⟩) (.single ⟨30656,30720,2112,2176⟩))) (.node (.node (.single ⟨30592,30656,2176,2240⟩) (.single ⟨30592,30656,2240,2304⟩)) (.node (.single ⟨30656,30720,2176,2240⟩) (.single ⟨30656,30720,2240,2304⟩))))))
def output1 : Fin 32 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15))) (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13)))) (.node (.node (.node (.single 4) (.single 24)) (.node (.single 27) (.single 7))) (.node (.node (.single 5) (.single 26)) (.node (.single 26) (.single 5))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))) (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 7) (.single 27)) (.node (.single 24) (.single 4)))))) (.node (.node (.node (.node (.node (.single 8) (.single 20)) (.node (.single 23) (.single 11))) (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9)))) (.node (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3))) (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1))))) (.node (.node (.node (.node (.single 10) (.single 21)) (.node (.single 21) (.single 10))) (.node (.node (.single 11) (.single 23)) (.node (.single 20) (.single 8)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0)))))))
def sourceData1 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 16) (.single 20))) (.node (.node (.single 8) (.single 12)) (.node (.single 24) (.single 11)))) (.node (.node (.node (.single 32) (.single 36)) (.node (.single 48) (.single 35))) (.node (.node (.single 23) (.single 7)) (.node (.single 19) (.single 3))))) (.node (.node (.node (.node (.single 1) (.single 17)) (.node (.single 5) (.single 21))) (.node (.node (.single 33) (.single 49)) (.node (.single 37) (.single 34)))) (.node (.node (.node (.single 9) (.single 25)) (.node (.single 13) (.single 10))) (.node (.node (.single 22) (.single 18)) (.node (.single 6) (.single 2))))))
def cover1 (i : Fin 64) : Fin 32 := ⟨coverData1.get i % 32, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 32) : Fin 64 := ⟨sourceData1.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 .empty (.cutY 30720 (.cutX 3072 (.cutY 29696 .empty (.cutX 2560 (.cutY 30208 .empty (.cutX 2304 (.cutY 30464 .empty (.cutX 2176 (.cutY 30592 (.cutX 2112 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 2112 (.cutY 30656 .full .full) (.cutY 30656 .full .full))) (.cutY 30592 (.cutX 2240 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 2240 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)) .empty)) .empty) .empty))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 .empty (.cutX 29696 .empty (.cutY 3072 (.cutX 30208 .empty (.cutY 2560 (.cutX 30464 .empty (.cutY 2304 (.cutX 30592 (.cutY 2176 (.cutX 30528 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 30528 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 (.cutX 30656 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 30656 (.cutY 2240 .full .full) (.cutY 2240 .full .full)))) .empty)) .empty)) .empty))) .empty) .empty)) .empty)) .empty))

theorem metadata1 : 0<84844963 ∧ 8<128 ∧ 119<128 ∧ 3<4 ∧
    13559/4160=3 ∧ 13559%4160=1079 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 32,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 32, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) sourceChecked1_0

theorem coverChecked1_0 : ∀ i : Fin 64,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 64, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
  forallFin_of_zero_offset (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) coverChecked1_0

theorem treeChecked1 : tree1.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves1 : List.ofFn output1 = tree1.leaves ⟨0,32768,0,32768⟩ := by
  unfold output1
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked1 : gridTreeUnionCheck 32768 raw1 output1 cover1 source1 tree1 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked1, coverChecked1, treeChecked1, treeLeaves1⟩

theorem areaUnits1 : gridUnionAreaUnits output1 = 131072 := by decide +kernel

noncomputable def phaseMass1 : ℝ := singlePhaseMass (84844963/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (84844963/3276800000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 15303, atom 13446, type 3, source (7,119).
def leavesData2 : FiniteInputTree DyadicLeaf 67 := (.node (.node (.node (.node (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,3⟩) (.single ⟨3,0,1⟩)))) (.node (.node (.node (.single ⟨3,1,1⟩) (.single ⟨3,2,1⟩)) (.node (.single ⟨3,3,1⟩) (.single ⟨3,4,1⟩))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,6,2⟩) (.single ⟨3,6,3⟩))))) (.node (.node (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,7,2⟩)) (.node (.single ⟨3,7,3⟩) (.single ⟨3,0,2⟩))) (.node (.node (.single ⟨3,0,3⟩) (.single ⟨3,1,2⟩)) (.node (.single ⟨3,1,3⟩) (.single ⟨3,2,2⟩)))) (.node (.node (.node (.single ⟨3,2,3⟩) (.single ⟨3,3,2⟩)) (.node (.single ⟨3,3,3⟩) (.single ⟨3,4,2⟩))) (.node (.node (.single ⟨3,4,3⟩) (.single ⟨3,5,2⟩)) (.node (.single ⟨3,5,3⟩) (.node (.single ⟨3,6,4⟩) (.single ⟨3,6,5⟩))))))) (.node (.node (.node (.node (.node (.single ⟨3,7,4⟩) (.single ⟨3,7,5⟩)) (.node (.single ⟨4,0,0⟩) (.single ⟨4,0,1⟩))) (.node (.node (.single ⟨4,1,0⟩) (.single ⟨4,1,1⟩)) (.node (.single ⟨4,2,0⟩) (.single ⟨4,2,1⟩)))) (.node (.node (.node (.single ⟨4,3,0⟩) (.single ⟨4,3,1⟩)) (.node (.single ⟨4,4,0⟩) (.single ⟨4,4,1⟩))) (.node (.node (.single ⟨4,5,0⟩) (.single ⟨4,5,1⟩)) (.node (.single ⟨4,6,0⟩) (.node (.single ⟨4,6,1⟩) (.single ⟨4,7,0⟩)))))) (.node (.node (.node (.node (.single ⟨4,7,1⟩) (.single ⟨4,8,0⟩)) (.node (.single ⟨4,8,1⟩) (.single ⟨4,9,0⟩))) (.node (.node (.single ⟨4,9,1⟩) (.single ⟨4,10,0⟩)) (.node (.single ⟨4,10,1⟩) (.single ⟨4,11,0⟩)))) (.node (.node (.node (.single ⟨4,11,1⟩) (.single ⟨4,12,0⟩)) (.node (.single ⟨4,12,1⟩) (.single ⟨4,13,0⟩))) (.node (.node (.single ⟨4,13,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))))
def leaves2 : Fin 67 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 268) : GridBox := phaseImageBoxes 32768 8 7 119 leaves2 i
def outputData2 : FiniteInputTree GridBox 268 := (.node (.node (.node (.node (.node (.node (.node (.node (.single ⟨1792,1808,30464,30480⟩) (.single ⟨1792,1808,30480,30496⟩)) (.node (.single ⟨1808,1824,30464,30480⟩) (.single ⟨1808,1824,30480,30496⟩))) (.node (.node (.single ⟨1792,1824,30496,30528⟩) (.single ⟨1824,1840,30464,30480⟩)) (.node (.single ⟨1824,1840,30480,30496⟩) (.single ⟨1840,1856,30464,30480⟩)))) (.node (.node (.node (.single ⟨1840,1856,30480,30496⟩) (.single ⟨1824,1856,30496,30528⟩)) (.node (.single ⟨1792,1824,30528,30560⟩) (.single ⟨1792,1824,30560,30592⟩))) (.node (.node (.single ⟨1824,1856,30528,30560⟩) (.single ⟨1824,1856,30560,30592⟩)) (.node (.single ⟨1856,1872,30464,30480⟩) (.single ⟨1856,1872,30480,30496⟩))))) (.node (.node (.node (.node (.single ⟨1872,1888,30464,30480⟩) (.single ⟨1872,1888,30480,30496⟩)) (.node (.single ⟨1856,1888,30496,30528⟩) (.single ⟨1888,1904,30464,30480⟩))) (.node (.node (.single ⟨1888,1904,30480,30496⟩) (.single ⟨1904,1920,30464,30480⟩)) (.node (.single ⟨1904,1920,30480,30496⟩) (.single ⟨1888,1920,30496,30528⟩)))) (.node (.node (.node (.single ⟨1856,1888,30528,30560⟩) (.single ⟨1856,1888,30560,30592⟩)) (.node (.single ⟨1888,1920,30528,30560⟩) (.single ⟨1888,1920,30560,30592⟩))) (.node (.node (.single ⟨1792,1856,30592,30656⟩) (.single ⟨1792,1856,30656,30720⟩)) (.node (.single ⟨1856,1920,30592,30656⟩) (.node (.single ⟨1856,1920,30656,30720⟩) (.single ⟨1920,1936,30464,30480⟩))))))) (.node (.node (.node (.node (.node (.single ⟨1920,1936,30480,30496⟩) (.single ⟨1936,1952,30464,30480⟩)) (.node (.single ⟨1936,1952,30480,30496⟩) (.single ⟨1920,1952,30496,30528⟩))) (.node (.node (.single ⟨1952,1968,30464,30480⟩) (.single ⟨1952,1968,30480,30496⟩)) (.node (.single ⟨1968,1984,30464,30480⟩) (.single ⟨1968,1984,30480,30496⟩)))) (.node (.node (.node (.single ⟨1952,1984,30496,30528⟩) (.single ⟨1920,1952,30528,30560⟩)) (.node (.single ⟨1920,1952,30560,30592⟩) (.single ⟨1952,1984,30528,30560⟩))) (.node (.node (.single ⟨1952,1984,30560,30592⟩) (.single ⟨1984,2000,30464,30480⟩)) (.node (.single ⟨1984,2000,30480,30496⟩) (.node (.single ⟨2000,2016,30464,30480⟩) (.single ⟨2000,2016,30480,30496⟩)))))) (.node (.node (.node (.node (.single ⟨1984,2016,30496,30528⟩) (.single ⟨2016,2032,30464,30480⟩)) (.node (.single ⟨2016,2032,30480,30496⟩) (.single ⟨2032,2048,30464,30480⟩))) (.node (.node (.single ⟨2032,2048,30480,30496⟩) (.single ⟨2016,2048,30496,30528⟩)) (.node (.single ⟨1984,2016,30528,30560⟩) (.single ⟨1984,2016,30560,30592⟩)))) (.node (.node (.node (.single ⟨2016,2048,30528,30560⟩) (.single ⟨2016,2048,30560,30592⟩)) (.node (.single ⟨1920,1984,30592,30656⟩) (.single ⟨1920,1984,30656,30720⟩))) (.node (.node (.single ⟨1984,2016,30592,30624⟩) (.single ⟨1984,2016,30624,30656⟩)) (.node (.single ⟨2016,2048,30592,30624⟩) (.node (.single ⟨2016,2048,30624,30656⟩) (.single ⟨1984,2048,30656,30720⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨2048,2112,30720,30784⟩) (.single ⟨2048,2112,30784,30848⟩)) (.node (.single ⟨2112,2144,30720,30752⟩) (.single ⟨2112,2144,30752,30784⟩))) (.node (.node (.single ⟨2144,2176,30720,30752⟩) (.single ⟨2144,2176,30752,30784⟩)) (.node (.single ⟨2112,2176,30784,30848⟩) (.single ⟨2048,2112,30848,30912⟩)))) (.node (.node (.node (.single ⟨2048,2112,30912,30976⟩) (.single ⟨2112,2176,30848,30912⟩)) (.node (.single ⟨2112,2176,30912,30976⟩) (.single ⟨2176,2208,30720,30752⟩))) (.node (.node (.single ⟨2176,2208,30752,30784⟩) (.single ⟨2208,2240,30720,30752⟩)) (.node (.single ⟨2208,2240,30752,30784⟩) (.single ⟨2176,2208,30784,30816⟩))))) (.node (.node (.node (.node (.single ⟨2176,2208,30816,30848⟩) (.single ⟨2208,2240,30784,30816⟩)) (.node (.single ⟨2208,2240,30816,30848⟩) (.single ⟨2240,2272,30720,30752⟩))) (.node (.node (.single ⟨2240,2272,30752,30784⟩) (.single ⟨2272,2288,30720,30736⟩)) (.node (.single ⟨2272,2288,30736,30752⟩) (.single ⟨2288,2304,30720,30736⟩)))) (.node (.node (.node (.single ⟨2288,2304,30736,30752⟩) (.single ⟨2272,2288,30752,30768⟩)) (.node (.single ⟨2272,2288,30768,30784⟩) (.single ⟨2288,2304,30752,30768⟩))) (.node (.node (.single ⟨2288,2304,30768,30784⟩) (.single ⟨2240,2272,30784,30816⟩)) (.node (.single ⟨2240,2272,30816,30848⟩) (.node (.single ⟨2272,2288,30784,30800⟩) (.single ⟨2272,2288,30800,30816⟩))))))) (.node (.node (.node (.node (.node (.single ⟨2288,2304,30784,30800⟩) (.single ⟨2288,2304,30800,30816⟩)) (.node (.single ⟨2272,2288,30816,30832⟩) (.single ⟨2272,2288,30832,30848⟩))) (.node (.node (.single ⟨2288,2304,30816,30832⟩) (.single ⟨2288,2304,30832,30848⟩)) (.node (.single ⟨2176,2208,30848,30880⟩) (.single ⟨2176,2208,30880,30912⟩)))) (.node (.node (.node (.single ⟨2208,2240,30848,30880⟩) (.single ⟨2208,2240,30880,30912⟩)) (.node (.single ⟨2176,2208,30912,30944⟩) (.single ⟨2176,2208,30944,30976⟩))) (.node (.node (.single ⟨2208,2240,30912,30944⟩) (.single ⟨2208,2240,30944,30976⟩)) (.node (.single ⟨2240,2272,30848,30880⟩) (.node (.single ⟨2240,2272,30880,30912⟩) (.single ⟨2272,2288,30848,30864⟩)))))) (.node (.node (.node (.node (.single ⟨2272,2288,30864,30880⟩) (.single ⟨2288,2304,30848,30864⟩)) (.node (.single ⟨2288,2304,30864,30880⟩) (.single ⟨2272,2288,30880,30896⟩))) (.node (.node (.single ⟨2272,2288,30896,30912⟩) (.single ⟨2288,2304,30880,30896⟩)) (.node (.single ⟨2288,2304,30896,30912⟩) (.single ⟨2240,2272,30912,30944⟩)))) (.node (.node (.node (.single ⟨2240,2272,30944,30976⟩) (.single ⟨2272,2288,30912,30928⟩)) (.node (.single ⟨2272,2288,30928,30944⟩) (.single ⟨2288,2304,30912,30928⟩))) (.node (.node (.single ⟨2288,2304,30928,30944⟩) (.single ⟨2272,2288,30944,30960⟩)) (.node (.single ⟨2272,2288,30960,30976⟩) (.node (.single ⟨2288,2304,30944,30960⟩) (.single ⟨2288,2304,30960,30976⟩))))))))) (.node (.node (.node (.node (.node (.node (.node (.single ⟨30464,30480,1792,1808⟩) (.single ⟨30464,30480,1808,1824⟩)) (.node (.single ⟨30480,30496,1792,1808⟩) (.single ⟨30480,30496,1808,1824⟩))) (.node (.node (.single ⟨30464,30480,1824,1840⟩) (.single ⟨30464,30480,1840,1856⟩)) (.node (.single ⟨30480,30496,1824,1840⟩) (.single ⟨30480,30496,1840,1856⟩)))) (.node (.node (.node (.single ⟨30496,30528,1792,1824⟩) (.single ⟨30496,30528,1824,1856⟩)) (.node (.single ⟨30464,30480,1856,1872⟩) (.single ⟨30464,30480,1872,1888⟩))) (.node (.node (.single ⟨30480,30496,1856,1872⟩) (.single ⟨30480,30496,1872,1888⟩)) (.node (.single ⟨30464,30480,1888,1904⟩) (.single ⟨30464,30480,1904,1920⟩))))) (.node (.node (.node (.node (.single ⟨30480,30496,1888,1904⟩) (.single ⟨30480,30496,1904,1920⟩)) (.node (.single ⟨30496,30528,1856,1888⟩) (.single ⟨30496,30528,1888,1920⟩))) (.node (.node (.single ⟨30528,30560,1792,1824⟩) (.single ⟨30528,30560,1824,1856⟩)) (.node (.single ⟨30560,30592,1792,1824⟩) (.single ⟨30560,30592,1824,1856⟩)))) (.node (.node (.node (.single ⟨30528,30560,1856,1888⟩) (.single ⟨30528,30560,1888,1920⟩)) (.node (.single ⟨30560,30592,1856,1888⟩) (.single ⟨30560,30592,1888,1920⟩))) (.node (.node (.single ⟨30464,30480,1920,1936⟩) (.single ⟨30464,30480,1936,1952⟩)) (.node (.single ⟨30480,30496,1920,1936⟩) (.node (.single ⟨30480,30496,1936,1952⟩) (.single ⟨30464,30480,1952,1968⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30464,30480,1968,1984⟩) (.single ⟨30480,30496,1952,1968⟩)) (.node (.single ⟨30480,30496,1968,1984⟩) (.single ⟨30496,30528,1920,1952⟩))) (.node (.node (.single ⟨30496,30528,1952,1984⟩) (.single ⟨30464,30480,1984,2000⟩)) (.node (.single ⟨30464,30480,2000,2016⟩) (.single ⟨30480,30496,1984,2000⟩)))) (.node (.node (.node (.single ⟨30480,30496,2000,2016⟩) (.single ⟨30464,30480,2016,2032⟩)) (.node (.single ⟨30464,30480,2032,2048⟩) (.single ⟨30480,30496,2016,2032⟩))) (.node (.node (.single ⟨30480,30496,2032,2048⟩) (.single ⟨30496,30528,1984,2016⟩)) (.node (.single ⟨30496,30528,2016,2048⟩) (.node (.single ⟨30528,30560,1920,1952⟩) (.single ⟨30528,30560,1952,1984⟩)))))) (.node (.node (.node (.node (.single ⟨30560,30592,1920,1952⟩) (.single ⟨30560,30592,1952,1984⟩)) (.node (.single ⟨30528,30560,1984,2016⟩) (.single ⟨30528,30560,2016,2048⟩))) (.node (.node (.single ⟨30560,30592,1984,2016⟩) (.single ⟨30560,30592,2016,2048⟩)) (.node (.single ⟨30592,30656,1792,1856⟩) (.single ⟨30592,30656,1856,1920⟩)))) (.node (.node (.node (.single ⟨30656,30720,1792,1856⟩) (.single ⟨30656,30720,1856,1920⟩)) (.node (.single ⟨30592,30656,1920,1984⟩) (.single ⟨30592,30624,1984,2016⟩))) (.node (.node (.single ⟨30592,30624,2016,2048⟩) (.single ⟨30624,30656,1984,2016⟩)) (.node (.single ⟨30624,30656,2016,2048⟩) (.node (.single ⟨30656,30720,1920,1984⟩) (.single ⟨30656,30720,1984,2048⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨30720,30784,2048,2112⟩) (.single ⟨30720,30752,2112,2144⟩)) (.node (.single ⟨30720,30752,2144,2176⟩) (.single ⟨30752,30784,2112,2144⟩))) (.node (.node (.single ⟨30752,30784,2144,2176⟩) (.single ⟨30784,30848,2048,2112⟩)) (.node (.single ⟨30784,30848,2112,2176⟩) (.single ⟨30720,30752,2176,2208⟩)))) (.node (.node (.node (.single ⟨30720,30752,2208,2240⟩) (.single ⟨30752,30784,2176,2208⟩)) (.node (.single ⟨30752,30784,2208,2240⟩) (.single ⟨30720,30752,2240,2272⟩))) (.node (.node (.single ⟨30720,30736,2272,2288⟩) (.single ⟨30720,30736,2288,2304⟩)) (.node (.single ⟨30736,30752,2272,2288⟩) (.single ⟨30736,30752,2288,2304⟩))))) (.node (.node (.node (.node (.single ⟨30752,30784,2240,2272⟩) (.single ⟨30752,30768,2272,2288⟩)) (.node (.single ⟨30752,30768,2288,2304⟩) (.single ⟨30768,30784,2272,2288⟩))) (.node (.node (.single ⟨30768,30784,2288,2304⟩) (.single ⟨30784,30816,2176,2208⟩)) (.node (.single ⟨30784,30816,2208,2240⟩) (.single ⟨30816,30848,2176,2208⟩)))) (.node (.node (.node (.single ⟨30816,30848,2208,2240⟩) (.single ⟨30784,30816,2240,2272⟩)) (.node (.single ⟨30784,30800,2272,2288⟩) (.single ⟨30784,30800,2288,2304⟩))) (.node (.node (.single ⟨30800,30816,2272,2288⟩) (.single ⟨30800,30816,2288,2304⟩)) (.node (.single ⟨30816,30848,2240,2272⟩) (.node (.single ⟨30816,30832,2272,2288⟩) (.single ⟨30816,30832,2288,2304⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30832,30848,2272,2288⟩) (.single ⟨30832,30848,2288,2304⟩)) (.node (.single ⟨30848,30912,2048,2112⟩) (.single ⟨30848,30912,2112,2176⟩))) (.node (.node (.single ⟨30912,30976,2048,2112⟩) (.single ⟨30912,30976,2112,2176⟩)) (.node (.single ⟨30848,30880,2176,2208⟩) (.single ⟨30848,30880,2208,2240⟩)))) (.node (.node (.node (.single ⟨30880,30912,2176,2208⟩) (.single ⟨30880,30912,2208,2240⟩)) (.node (.single ⟨30848,30880,2240,2272⟩) (.single ⟨30848,30864,2272,2288⟩))) (.node (.node (.single ⟨30848,30864,2288,2304⟩) (.single ⟨30864,30880,2272,2288⟩)) (.node (.single ⟨30864,30880,2288,2304⟩) (.node (.single ⟨30880,30912,2240,2272⟩) (.single ⟨30880,30896,2272,2288⟩)))))) (.node (.node (.node (.node (.single ⟨30880,30896,2288,2304⟩) (.single ⟨30896,30912,2272,2288⟩)) (.node (.single ⟨30896,30912,2288,2304⟩) (.single ⟨30912,30944,2176,2208⟩))) (.node (.node (.single ⟨30912,30944,2208,2240⟩) (.single ⟨30944,30976,2176,2208⟩)) (.node (.single ⟨30944,30976,2208,2240⟩) (.single ⟨30912,30944,2240,2272⟩)))) (.node (.node (.node (.single ⟨30912,30928,2272,2288⟩) (.single ⟨30912,30928,2288,2304⟩)) (.node (.single ⟨30928,30944,2272,2288⟩) (.single ⟨30928,30944,2288,2304⟩))) (.node (.node (.single ⟨30944,30976,2240,2272⟩) (.single ⟨30944,30960,2272,2288⟩)) (.node (.single ⟨30944,30960,2288,2304⟩) (.node (.single ⟨30960,30976,2272,2288⟩) (.single ⟨30960,30976,2288,2304⟩))))))))))
def output2 : Fin 268 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 268 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 28) (.single 190)) (.node (.single 239) (.single 77))) (.node (.node (.single 29) (.single 192)) (.node (.single 238) (.single 75)))) (.node (.node (.node (.single 30) (.single 191)) (.node (.single 237) (.single 76))) (.node (.node (.single 31) (.single 193)) (.node (.single 236) (.single 74))))) (.node (.node (.node (.node (.single 60) (.single 194)) (.node (.single 207) (.single 73))) (.node (.node (.single 61) (.single 199)) (.node (.single 206) (.single 68)))) (.node (.node (.node (.single 66) (.single 200)) (.node (.single 201) (.single 67))) (.node (.node (.single 4) (.single 142)) (.node (.single 263) (.node (.single 125) (.single 9))))))) (.node (.node (.node (.node (.node (.single 143) (.single 258)) (.node (.single 124) (.single 18))) (.node (.node (.single 152) (.single 249)) (.node (.single 115) (.single 23)))) (.node (.node (.node (.single 153) (.single 244)) (.node (.single 114) (.single 36))) (.node (.node (.single 170) (.single 231)) (.node (.single 97) (.node (.single 41) (.single 171)))))) (.node (.node (.node (.node (.single 226) (.single 96)) (.node (.single 50) (.single 180))) (.node (.node (.single 217) (.single 87)) (.node (.single 56) (.single 186)))) (.node (.node (.node (.single 211) (.single 81)) (.node (.single 57) (.single 188))) (.node (.node (.single 210) (.single 79)) (.node (.single 55) (.node (.single 181) (.single 212)))))))) (.node (.node (.node (.node (.node (.node (.single 86) (.single 58)) (.node (.single 187) (.single 209))) (.node (.node (.single 80) (.single 59)) (.node (.single 189) (.single 208)))) (.node (.node (.node (.single 78) (.single 10)) (.node (.single 154) (.single 257))) (.node (.node (.single 113) (.single 11)) (.node (.single 156) (.single 256))))) (.node (.node (.node (.node (.single 111) (.single 12)) (.node (.single 155) (.single 255))) (.node (.node (.single 112) (.single 13)) (.node (.single 157) (.single 254)))) (.node (.node (.node (.single 110) (.single 24)) (.node (.single 158) (.single 243))) (.node (.node (.single 109) (.single 25)) (.node (.single 160) (.node (.single 242) (.single 107))))))) (.node (.node (.node (.node (.node (.single 26) (.single 159)) (.node (.single 241) (.single 108))) (.node (.node (.single 27) (.single 161)) (.node (.single 240) (.single 106)))) (.node (.node (.node (.single 42) (.single 182)) (.node (.single 225) (.single 85))) (.node (.node (.single 43) (.single 184)) (.node (.single 224) (.node (.single 83) (.single 44)))))) (.node (.node (.node (.node (.single 183) (.single 223)) (.node (.single 84) (.single 45))) (.node (.node (.single 185) (.single 222)) (.node (.single 82) (.single 62)))) (.node (.node (.node (.single 195) (.single 205)) (.node (.single 72) (.single 63))) (.node (.node (.single 197) (.single 204)) (.node (.single 70) (.node (.single 64) (.single 196))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 203) (.single 71)) (.node (.single 65) (.single 198))) (.node (.node (.single 202) (.single 69)) (.node (.single 0) (.single 134)))) (.node (.node (.node (.single 267) (.single 133)) (.node (.single 1) (.single 136))) (.node (.node (.single 266) (.single 131)) (.node (.single 2) (.single 135))))) (.node (.node (.node (.node (.single 265) (.single 132)) (.node (.single 3) (.single 137))) (.node (.node (.single 264) (.single 130)) (.node (.single 5) (.single 138)))) (.node (.node (.node (.single 262) (.single 129)) (.node (.single 6) (.single 140))) (.node (.node (.single 261) (.single 127)) (.node (.single 7) (.node (.single 139) (.single 260))))))) (.node (.node (.node (.node (.node (.single 128) (.single 8)) (.node (.single 141) (.single 259))) (.node (.node (.single 126) (.single 14)) (.node (.single 144) (.single 253)))) (.node (.node (.node (.single 123) (.single 15)) (.node (.single 146) (.single 252))) (.node (.node (.single 121) (.single 16)) (.node (.single 145) (.node (.single 251) (.single 122)))))) (.node (.node (.node (.node (.single 17) (.single 147)) (.node (.single 250) (.single 120))) (.node (.node (.single 19) (.single 148)) (.node (.single 248) (.single 119)))) (.node (.node (.node (.single 20) (.single 150)) (.node (.single 247) (.single 117))) (.node (.node (.single 21) (.single 149)) (.node (.single 246) (.node (.single 118) (.single 22)))))))) (.node (.node (.node (.node (.node (.node (.single 151) (.single 245)) (.node (.single 116) (.single 32))) (.node (.node (.single 162) (.single 235)) (.node (.single 105) (.single 33)))) (.node (.node (.node (.single 164) (.single 234)) (.node (.single 103) (.single 34))) (.node (.node (.single 163) (.single 233)) (.node (.single 104) (.single 35))))) (.node (.node (.node (.node (.single 165) (.single 232)) (.node (.single 102) (.single 37))) (.node (.node (.single 166) (.single 230)) (.node (.single 101) (.single 38)))) (.node (.node (.node (.single 168) (.single 229)) (.node (.single 99) (.single 39))) (.node (.node (.single 167) (.single 228)) (.node (.single 100) (.node (.single 40) (.single 169))))))) (.node (.node (.node (.node (.node (.single 227) (.single 98)) (.node (.single 46) (.single 172))) (.node (.node (.single 221) (.single 95)) (.node (.single 47) (.single 174)))) (.node (.node (.node (.single 220) (.single 93)) (.node (.single 48) (.single 173))) (.node (.node (.single 219) (.single 94)) (.node (.single 49) (.node (.single 175) (.single 218)))))) (.node (.node (.node (.node (.single 92) (.single 51)) (.node (.single 176) (.single 216))) (.node (.node (.single 91) (.single 52)) (.node (.single 178) (.single 215)))) (.node (.node (.node (.single 89) (.single 53)) (.node (.single 177) (.single 214))) (.node (.node (.single 90) (.single 54)) (.node (.single 179) (.node (.single 213) (.single 88))))))))))
def sourceData2 : FiniteInputTree ℕ 268 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 140) (.single 144)) (.node (.single 148) (.single 152))) (.node (.node (.single 28) (.single 156)) (.node (.single 160) (.single 164)))) (.node (.node (.node (.single 168) (.single 32)) (.node (.single 76) (.single 80))) (.node (.node (.single 84) (.single 88)) (.node (.single 172) (.single 176))))) (.node (.node (.node (.node (.single 180) (.single 184)) (.node (.single 36) (.single 188))) (.node (.node (.single 192) (.single 196)) (.node (.single 200) (.single 40)))) (.node (.node (.node (.single 92) (.single 96)) (.node (.single 100) (.single 104))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 204))))))) (.node (.node (.node (.node (.node (.single 208) (.single 212)) (.node (.single 216) (.single 44))) (.node (.node (.single 220) (.single 224)) (.node (.single 228) (.single 232)))) (.node (.node (.node (.single 48) (.single 108)) (.node (.single 112) (.single 116))) (.node (.node (.single 120) (.single 236)) (.node (.single 240) (.node (.single 244) (.single 248)))))) (.node (.node (.node (.node (.single 52) (.single 252)) (.node (.single 256) (.single 260))) (.node (.node (.single 264) (.single 64)) (.node (.single 56) (.single 60)))) (.node (.node (.node (.single 68) (.single 72)) (.node (.single 16) (.single 20))) (.node (.node (.single 124) (.single 128)) (.node (.single 132) (.node (.single 136) (.single 24)))))))) (.node (.node (.node (.node (.node (.node (.single 27) (.single 23)) (.node (.single 139) (.single 131))) (.node (.node (.single 135) (.single 127)) (.node (.single 19) (.single 15)))) (.node (.node (.node (.single 7) (.single 11)) (.node (.single 3) (.single 75))) (.node (.node (.single 63) (.single 71)) (.node (.single 59) (.single 123))))) (.node (.node (.node (.node (.single 115) (.single 119)) (.node (.single 111) (.single 67))) (.node (.node (.single 55) (.single 267)) (.node (.single 259) (.single 263)))) (.node (.node (.node (.single 255) (.single 251)) (.node (.single 243) (.single 247))) (.node (.node (.single 239) (.single 51)) (.node (.single 47) (.node (.single 235) (.single 227))))))) (.node (.node (.node (.node (.node (.single 231) (.single 223)) (.node (.single 219) (.single 211))) (.node (.node (.single 215) (.single 207)) (.node (.single 107) (.single 99)))) (.node (.node (.node (.single 103) (.single 95)) (.node (.single 91) (.single 83))) (.node (.node (.single 87) (.single 79)) (.node (.single 43) (.node (.single 39) (.single 203)))))) (.node (.node (.node (.node (.single 195) (.single 199)) (.node (.single 191) (.single 187))) (.node (.node (.single 179) (.single 183)) (.node (.single 175) (.single 35)))) (.node (.node (.node (.single 31) (.single 171)) (.node (.single 163) (.single 167))) (.node (.node (.single 159) (.single 155)) (.node (.single 147) (.node (.single 151) (.single 143))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 141) (.single 149)) (.node (.single 145) (.single 153))) (.node (.node (.single 157) (.single 165)) (.node (.single 161) (.single 169)))) (.node (.node (.node (.single 29) (.single 33)) (.node (.single 173) (.single 181))) (.node (.node (.single 177) (.single 185)) (.node (.single 189) (.single 197))))) (.node (.node (.node (.node (.single 193) (.single 201)) (.node (.single 37) (.single 41))) (.node (.node (.single 77) (.single 85)) (.node (.single 81) (.single 89)))) (.node (.node (.node (.single 93) (.single 101)) (.node (.single 97) (.single 105))) (.node (.node (.single 205) (.single 213)) (.node (.single 209) (.node (.single 217) (.single 221))))))) (.node (.node (.node (.node (.node (.single 229) (.single 225)) (.node (.single 233) (.single 45))) (.node (.node (.single 49) (.single 237)) (.node (.single 245) (.single 241)))) (.node (.node (.node (.single 249) (.single 253)) (.node (.single 261) (.single 257))) (.node (.node (.single 265) (.single 53)) (.node (.single 65) (.node (.single 109) (.single 117)))))) (.node (.node (.node (.node (.single 113) (.single 121)) (.node (.single 57) (.single 69))) (.node (.node (.single 61) (.single 73)) (.node (.single 1) (.single 9)))) (.node (.node (.node (.single 5) (.single 13)) (.node (.single 17) (.single 125))) (.node (.node (.single 133) (.single 129)) (.node (.single 137) (.node (.single 21) (.single 25)))))))) (.node (.node (.node (.node (.node (.node (.single 26) (.single 138)) (.node (.single 134) (.single 130))) (.node (.node (.single 126) (.single 22)) (.node (.single 18) (.single 74)))) (.node (.node (.node (.single 70) (.single 62)) (.node (.single 58) (.single 66))) (.node (.node (.single 266) (.single 262)) (.node (.single 258) (.single 254))))) (.node (.node (.node (.node (.single 54) (.single 250)) (.node (.single 246) (.single 242))) (.node (.node (.single 238) (.single 122)) (.node (.single 118) (.single 114)))) (.node (.node (.node (.single 110) (.single 50)) (.node (.single 234) (.single 230))) (.node (.node (.single 226) (.single 222)) (.node (.single 46) (.node (.single 218) (.single 214))))))) (.node (.node (.node (.node (.node (.single 210) (.single 206)) (.node (.single 14) (.single 10))) (.node (.node (.single 6) (.single 2)) (.node (.single 106) (.single 102)))) (.node (.node (.node (.single 98) (.single 94)) (.node (.single 42) (.single 202))) (.node (.node (.single 198) (.single 194)) (.node (.single 190) (.node (.single 38) (.single 186)))))) (.node (.node (.node (.node (.single 182) (.single 178)) (.node (.single 174) (.single 90))) (.node (.node (.single 86) (.single 82)) (.node (.single 78) (.single 34)))) (.node (.node (.node (.single 170) (.single 166)) (.node (.single 162) (.single 158))) (.node (.node (.single 30) (.single 154)) (.node (.single 150) (.node (.single 146) (.single 142))))))))))
def cover2 (i : Fin 268) : Fin 268 := ⟨coverData2.get i % 268, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 268) : Fin 268 := ⟨sourceData2.get i % 268, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 .empty (.cutY 29696 .empty (.cutX 1536 .empty (.cutY 30208 .empty (.cutX 1792 .empty (.cutY 30464 .empty (.cutX 1920 (.cutY 30592 (.cutX 1856 (.cutY 30528 (.cutX 1824 (.cutY 30496 (.cutX 1808 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full) (.cutY 30496 (.cutX 1840 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full)) (.cutX 1824 (.cutY 30560 .full .full) (.cutY 30560 .full .full))) (.cutY 30528 (.cutX 1888 (.cutY 30496 (.cutX 1872 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full) (.cutY 30496 (.cutX 1904 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full)) (.cutX 1888 (.cutY 30560 .full .full) (.cutY 30560 .full .full)))) (.cutX 1856 (.cutY 30656 .full .full) (.cutY 30656 .full .full))) (.cutY 30592 (.cutX 1984 (.cutY 30528 (.cutX 1952 (.cutY 30496 (.cutX 1936 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full) (.cutY 30496 (.cutX 1968 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full)) (.cutX 1952 (.cutY 30560 .full .full) (.cutY 30560 .full .full))) (.cutY 30528 (.cutX 2016 (.cutY 30496 (.cutX 2000 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full) (.cutY 30496 (.cutX 2032 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full)) (.cutX 2016 (.cutY 30560 .full .full) (.cutY 30560 .full .full)))) (.cutX 1984 (.cutY 30656 .full .full) (.cutY 30656 (.cutX 2016 (.cutY 30624 .full .full) (.cutY 30624 .full .full)) .full)))))))))) .empty) (.cutY 30720 .empty (.cutX 3072 (.cutY 31744 (.cutX 2560 (.cutY 31232 (.cutX 2304 (.cutY 30976 (.cutX 2176 (.cutY 30848 (.cutX 2112 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 2144 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 2112 (.cutY 30912 .full .full) (.cutY 30912 .full .full))) (.cutY 30848 (.cutX 2240 (.cutY 30784 (.cutX 2208 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) (.cutX 2208 (.cutY 30816 .full .full) (.cutY 30816 .full .full))) (.cutY 30784 (.cutX 2272 (.cutY 30752 .full .full) (.cutY 30752 (.cutX 2288 (.cutY 30736 .full .full) (.cutY 30736 .full .full)) (.cutX 2288 (.cutY 30768 .full .full) (.cutY 30768 .full .full)))) (.cutX 2272 (.cutY 30816 .full .full) (.cutY 30816 (.cutX 2288 (.cutY 30800 .full .full) (.cutY 30800 .full .full)) (.cutX 2288 (.cutY 30832 .full .full) (.cutY 30832 .full .full)))))) (.cutX 2240 (.cutY 30912 (.cutX 2208 (.cutY 30880 .full .full) (.cutY 30880 .full .full)) (.cutX 2208 (.cutY 30944 .full .full) (.cutY 30944 .full .full))) (.cutY 30912 (.cutX 2272 (.cutY 30880 .full .full) (.cutY 30880 (.cutX 2288 (.cutY 30864 .full .full) (.cutY 30864 .full .full)) (.cutX 2288 (.cutY 30896 .full .full) (.cutY 30896 .full .full)))) (.cutX 2272 (.cutY 30944 .full .full) (.cutY 30944 (.cutX 2288 (.cutY 30928 .full .full) (.cutY 30928 .full .full)) (.cutX 2288 (.cutY 30960 .full .full) (.cutY 30960 .full .full)))))))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 .empty (.cutY 1024 .empty (.cutX 30208 .empty (.cutY 1536 .empty (.cutX 30464 .empty (.cutY 1792 .empty (.cutX 30592 (.cutY 1920 (.cutX 30528 (.cutY 1856 (.cutX 30496 (.cutY 1824 (.cutX 30480 (.cutY 1808 .full .full) (.cutY 1808 .full .full)) (.cutX 30480 (.cutY 1840 .full .full) (.cutY 1840 .full .full))) (.cutY 1824 .full .full)) (.cutX 30496 (.cutY 1888 (.cutX 30480 (.cutY 1872 .full .full) (.cutY 1872 .full .full)) (.cutX 30480 (.cutY 1904 .full .full) (.cutY 1904 .full .full))) (.cutY 1888 .full .full))) (.cutY 1856 (.cutX 30560 (.cutY 1824 .full .full) (.cutY 1824 .full .full)) (.cutX 30560 (.cutY 1888 .full .full) (.cutY 1888 .full .full)))) (.cutX 30528 (.cutY 1984 (.cutX 30496 (.cutY 1952 (.cutX 30480 (.cutY 1936 .full .full) (.cutY 1936 .full .full)) (.cutX 30480 (.cutY 1968 .full .full) (.cutY 1968 .full .full))) (.cutY 1952 .full .full)) (.cutX 30496 (.cutY 2016 (.cutX 30480 (.cutY 2000 .full .full) (.cutY 2000 .full .full)) (.cutX 30480 (.cutY 2032 .full .full) (.cutY 2032 .full .full))) (.cutY 2016 .full .full))) (.cutY 1984 (.cutX 30560 (.cutY 1952 .full .full) (.cutY 1952 .full .full)) (.cutX 30560 (.cutY 2016 .full .full) (.cutY 2016 .full .full))))) (.cutY 1920 (.cutX 30656 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 30656 (.cutY 1984 .full (.cutX 30624 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full)))))))))) .empty) (.cutY 2048 .empty (.cutX 31744 (.cutY 3072 (.cutX 31232 (.cutY 2560 (.cutX 30976 (.cutY 2304 (.cutX 30848 (.cutY 2176 (.cutX 30784 (.cutY 2112 .full (.cutX 30752 (.cutY 2144 .full .full) (.cutY 2144 .full .full))) (.cutY 2112 .full .full)) (.cutX 30784 (.cutY 2240 (.cutX 30752 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 30752 (.cutY 2272 .full (.cutX 30736 (.cutY 2288 .full .full) (.cutY 2288 .full .full))) (.cutY 2272 .full (.cutX 30768 (.cutY 2288 .full .full) (.cutY 2288 .full .full))))) (.cutY 2240 (.cutX 30816 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 30816 (.cutY 2272 .full (.cutX 30800 (.cutY 2288 .full .full) (.cutY 2288 .full .full))) (.cutY 2272 .full (.cutX 30832 (.cutY 2288 .full .full) (.cutY 2288 .full .full))))))) (.cutY 2176 (.cutX 30912 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 30912 (.cutY 2240 (.cutX 30880 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 30880 (.cutY 2272 .full (.cutX 30864 (.cutY 2288 .full .full) (.cutY 2288 .full .full))) (.cutY 2272 .full (.cutX 30896 (.cutY 2288 .full .full) (.cutY 2288 .full .full))))) (.cutY 2240 (.cutX 30944 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 30944 (.cutY 2272 .full (.cutX 30928 (.cutY 2288 .full .full) (.cutY 2288 .full .full))) (.cutY 2272 .full (.cutX 30960 (.cutY 2288 .full .full) (.cutY 2288 .full .full)))))))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty))

theorem metadata2 : 0<192502037 ∧ 7<128 ∧ 119<128 ∧ 3<4 ∧
    13446/4160=3 ∧ 13446%4160=966 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 64,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 268 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked2_64 : ∀ i : Fin 64,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 268 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked2_128 : ∀ i : Fin 64,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 268 128 64 (by decide) i) := by decide +kernel

theorem sourceChecked2_192 : ∀ i : Fin 64,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 268 192 64 (by decide) i) := by decide +kernel

theorem sourceChecked2_256 : ∀ i : Fin 12,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 268 256 12 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 268, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) (forallFinOffset_add (fun i => output2 i = raw2 (source2 i)) 0 64 204 (by decide) sourceChecked2_0
    (forallFinOffset_add (fun i => output2 i = raw2 (source2 i)) 64 64 140 (by decide) sourceChecked2_64
    (forallFinOffset_add (fun i => output2 i = raw2 (source2 i)) 128 64 76 (by decide) sourceChecked2_128
    (forallFinOffset_add (fun i => output2 i = raw2 (source2 i)) 192 64 12 (by decide) sourceChecked2_192
    sourceChecked2_256))))

theorem coverChecked2_0 : ∀ i : Fin 64,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 268 0 64 (by decide) i) := by decide +kernel

theorem coverChecked2_64 : ∀ i : Fin 64,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 268 64 64 (by decide) i) := by decide +kernel

theorem coverChecked2_128 : ∀ i : Fin 64,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 268 128 64 (by decide) i) := by decide +kernel

theorem coverChecked2_192 : ∀ i : Fin 64,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 268 192 64 (by decide) i) := by decide +kernel

theorem coverChecked2_256 : ∀ i : Fin 12,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 268 256 12 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 268, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
  forallFin_of_zero_offset (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (forallFinOffset_add (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) 0 64 204 (by decide) coverChecked2_0
    (forallFinOffset_add (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) 64 64 140 (by decide) coverChecked2_64
    (forallFinOffset_add (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) 128 64 76 (by decide) coverChecked2_128
    (forallFinOffset_add (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) 192 64 12 (by decide) coverChecked2_192
    coverChecked2_256))))

theorem treeChecked2 : tree2.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves2 : List.ofFn output2 = tree2.leaves ⟨0,32768,0,32768⟩ := by
  unfold output2
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked2 : gridTreeUnionCheck 32768 raw2 output2 cover2 source2 tree2 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked2, coverChecked2, treeChecked2, treeLeaves2⟩

theorem areaUnits2 : gridUnionAreaUnits output2 = 262144 := by decide +kernel

noncomputable def phaseMass2 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 15304, atom 12592, type 3, source (0,112).
def leavesData3 : FiniteInputTree DyadicLeaf 28 := (.node (.node (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)))) (.node (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,0,2⟩))) (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩))) (.node (.node (.single ⟨3,6,3⟩) (.single ⟨3,7,2⟩)) (.node (.single ⟨3,7,3⟩) (.single ⟨3,6,4⟩)))) (.node (.node (.single ⟨3,6,5⟩) (.node (.single ⟨3,7,4⟩) (.single ⟨3,7,5⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves3 : Fin 28 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 112) : GridBox := phaseImageBoxes 32768 8 0 112 leaves3 i
def outputData3 : FiniteInputTree GridBox 112 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,28672,28736⟩) (.node (.single ⟨0,64,28736,28800⟩) (.single ⟨64,128,28672,28736⟩))) (.node (.node (.single ⟨64,128,28736,28800⟩) (.single ⟨0,64,28800,28864⟩)) (.node (.single ⟨0,64,28864,28928⟩) (.single ⟨64,128,28800,28864⟩)))) (.node (.node (.single ⟨64,128,28864,28928⟩) (.node (.single ⟨128,192,28672,28736⟩) (.single ⟨128,192,28736,28800⟩))) (.node (.node (.single ⟨192,224,28672,28704⟩) (.single ⟨192,224,28704,28736⟩)) (.node (.single ⟨224,240,28672,28688⟩) (.single ⟨224,240,28688,28704⟩))))) (.node (.node (.node (.single ⟨240,256,28672,28688⟩) (.node (.single ⟨240,256,28688,28704⟩) (.single ⟨224,256,28704,28736⟩))) (.node (.node (.single ⟨192,224,28736,28768⟩) (.single ⟨192,224,28768,28800⟩)) (.node (.single ⟨224,256,28736,28768⟩) (.single ⟨224,256,28768,28800⟩)))) (.node (.node (.single ⟨128,192,28800,28864⟩) (.node (.single ⟨128,192,28864,28928⟩) (.single ⟨192,224,28800,28832⟩))) (.node (.node (.single ⟨192,224,28832,28864⟩) (.single ⟨224,256,28800,28832⟩)) (.node (.single ⟨224,256,28832,28864⟩) (.single ⟨192,256,28864,28928⟩)))))) (.node (.node (.node (.node (.single ⟨3840,3904,32512,32576⟩) (.node (.single ⟨3840,3904,32576,32640⟩) (.single ⟨3904,3936,32512,32544⟩))) (.node (.node (.single ⟨3904,3936,32544,32576⟩) (.single ⟨3936,3968,32512,32544⟩)) (.node (.single ⟨3936,3968,32544,32576⟩) (.single ⟨3904,3968,32576,32640⟩)))) (.node (.node (.single ⟨3840,3904,32640,32704⟩) (.node (.single ⟨3840,3904,32704,32768⟩) (.single ⟨3904,3968,32640,32704⟩))) (.node (.node (.single ⟨3904,3968,32704,32768⟩) (.single ⟨3968,4000,32512,32544⟩)) (.node (.single ⟨3968,4000,32544,32576⟩) (.single ⟨4000,4032,32512,32544⟩))))) (.node (.node (.node (.single ⟨4000,4032,32544,32576⟩) (.node (.single ⟨3968,4032,32576,32640⟩) (.single ⟨4032,4064,32512,32544⟩))) (.node (.node (.single ⟨4032,4064,32544,32576⟩) (.single ⟨4064,4080,32512,32528⟩)) (.node (.single ⟨4064,4080,32528,32544⟩) (.single ⟨4080,4096,32512,32528⟩)))) (.node (.node (.single ⟨4080,4096,32528,32544⟩) (.node (.single ⟨4064,4096,32544,32576⟩) (.single ⟨4032,4096,32576,32640⟩))) (.node (.node (.single ⟨3968,4032,32640,32704⟩) (.single ⟨3968,4032,32704,32768⟩)) (.node (.single ⟨4032,4096,32640,32704⟩) (.single ⟨4032,4096,32704,32768⟩))))))) (.node (.node (.node (.node (.node (.single ⟨28672,28736,0,64⟩) (.node (.single ⟨28672,28736,64,128⟩) (.single ⟨28736,28800,0,64⟩))) (.node (.node (.single ⟨28736,28800,64,128⟩) (.single ⟨28672,28736,128,192⟩)) (.node (.single ⟨28672,28704,192,224⟩) (.single ⟨28672,28688,224,240⟩)))) (.node (.node (.single ⟨28672,28688,240,256⟩) (.node (.single ⟨28688,28704,224,240⟩) (.single ⟨28688,28704,240,256⟩))) (.node (.node (.single ⟨28704,28736,192,224⟩) (.single ⟨28704,28736,224,256⟩)) (.node (.single ⟨28736,28800,128,192⟩) (.single ⟨28736,28768,192,224⟩))))) (.node (.node (.node (.single ⟨28736,28768,224,256⟩) (.node (.single ⟨28768,28800,192,224⟩) (.single ⟨28768,28800,224,256⟩))) (.node (.node (.single ⟨28800,28864,0,64⟩) (.single ⟨28800,28864,64,128⟩)) (.node (.single ⟨28864,28928,0,64⟩) (.single ⟨28864,28928,64,128⟩)))) (.node (.node (.single ⟨28800,28864,128,192⟩) (.node (.single ⟨28800,28832,192,224⟩) (.single ⟨28800,28832,224,256⟩))) (.node (.node (.single ⟨28832,28864,192,224⟩) (.single ⟨28832,28864,224,256⟩)) (.node (.single ⟨28864,28928,128,192⟩) (.single ⟨28864,28928,192,256⟩)))))) (.node (.node (.node (.node (.single ⟨32512,32576,3840,3904⟩) (.node (.single ⟨32512,32544,3904,3936⟩) (.single ⟨32512,32544,3936,3968⟩))) (.node (.node (.single ⟨32544,32576,3904,3936⟩) (.single ⟨32544,32576,3936,3968⟩)) (.node (.single ⟨32576,32640,3840,3904⟩) (.single ⟨32576,32640,3904,3968⟩)))) (.node (.node (.single ⟨32512,32544,3968,4000⟩) (.node (.single ⟨32512,32544,4000,4032⟩) (.single ⟨32544,32576,3968,4000⟩))) (.node (.node (.single ⟨32544,32576,4000,4032⟩) (.single ⟨32512,32544,4032,4064⟩)) (.node (.single ⟨32512,32528,4064,4080⟩) (.single ⟨32512,32528,4080,4096⟩))))) (.node (.node (.node (.single ⟨32528,32544,4064,4080⟩) (.node (.single ⟨32528,32544,4080,4096⟩) (.single ⟨32544,32576,4032,4064⟩))) (.node (.node (.single ⟨32544,32576,4064,4096⟩) (.single ⟨32576,32640,3968,4032⟩)) (.node (.single ⟨32576,32640,4032,4096⟩) (.single ⟨32640,32704,3840,3904⟩)))) (.node (.node (.single ⟨32640,32704,3904,3968⟩) (.node (.single ⟨32704,32768,3840,3904⟩) (.single ⟨32704,32768,3904,3968⟩))) (.node (.node (.single ⟨32640,32704,3968,4032⟩) (.single ⟨32640,32704,4032,4096⟩)) (.node (.single ⟨32704,32768,3968,4032⟩) (.single ⟨32704,32768,4032,4096⟩))))))))
def output3 : Fin 112 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 8) (.node (.single 60) (.single 103))) (.node (.node (.single 51) (.single 9)) (.node (.single 68) (.single 102)))) (.node (.node (.single 43) (.node (.single 21) (.single 77))) (.node (.node (.single 90) (.single 34)) (.node (.single 22) (.single 82))))) (.node (.node (.node (.single 89) (.node (.single 29) (.single 27))) (.node (.node (.single 83) (.single 84)) (.node (.single 28) (.single 0)))) (.node (.node (.single 56) (.node (.single 111) (.single 55))) (.node (.node (.single 1) (.single 58)) (.node (.single 110) (.single 53)))))) (.node (.node (.node (.node (.single 2) (.node (.single 57) (.single 109))) (.node (.node (.single 54) (.single 3)) (.node (.single 59) (.single 108)))) (.node (.node (.single 52) (.node (.single 4) (.single 73))) (.node (.node (.single 107) (.single 38)) (.node (.single 5) (.single 75))))) (.node (.node (.node (.single 106) (.node (.single 36) (.single 6))) (.node (.node (.single 74) (.single 105)) (.node (.single 37) (.single 7)))) (.node (.node (.single 76) (.node (.single 104) (.single 35))) (.node (.node (.single 10) (.single 61)) (.node (.single 101) (.single 50))))))) (.node (.node (.node (.node (.node (.single 11) (.node (.single 66) (.single 100))) (.node (.node (.single 45) (.single 16)) (.node (.single 67) (.single 95)))) (.node (.node (.single 44) (.node (.single 17) (.single 69))) (.node (.node (.single 94) (.single 42)) (.node (.single 18) (.single 71))))) (.node (.node (.node (.single 93) (.node (.single 40) (.single 19))) (.node (.node (.single 70) (.single 92)) (.node (.single 41) (.single 20)))) (.node (.node (.single 72) (.node (.single 91) (.single 39))) (.node (.node (.single 23) (.single 78)) (.node (.single 88) (.single 33)))))) (.node (.node (.node (.node (.single 24) (.node (.single 80) (.single 87))) (.node (.node (.single 31) (.single 25)) (.node (.single 79) (.single 86)))) (.node (.node (.single 32) (.node (.single 26) (.single 81))) (.node (.node (.single 85) (.single 30)) (.node (.single 12) (.single 62))))) (.node (.node (.node (.single 99) (.node (.single 49) (.single 13))) (.node (.node (.single 64) (.single 98)) (.node (.single 47) (.single 14)))) (.node (.node (.single 63) (.node (.single 97) (.single 48))) (.node (.node (.single 15) (.single 65)) (.node (.single 96) (.single 46))))))))
def sourceData3 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.single 48) (.node (.single 0) (.single 4))) (.node (.node (.single 52) (.single 56)) (.node (.single 96) (.single 100))))) (.node (.node (.node (.single 104) (.node (.single 108) (.single 60))) (.node (.node (.single 64) (.single 68)) (.node (.single 72) (.single 76)))) (.node (.node (.single 8) (.node (.single 12) (.single 80))) (.node (.node (.single 84) (.single 88)) (.node (.single 92) (.single 16)))))) (.node (.node (.node (.node (.single 19) (.node (.single 15) (.single 95))) (.node (.node (.single 87) (.single 91)) (.node (.single 83) (.single 11)))) (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.node (.single 39) (.single 79)) (.node (.single 71) (.single 75))))) (.node (.node (.node (.single 67) (.node (.single 7) (.single 63))) (.node (.node (.single 59) (.single 111)) (.node (.single 103) (.single 107)))) (.node (.node (.single 99) (.node (.single 55) (.single 3))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))))) (.node (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.node (.single 33) (.single 1)) (.node (.single 53) (.single 97)))) (.node (.node (.single 105) (.node (.single 101) (.single 109))) (.node (.node (.single 57) (.single 61)) (.node (.single 5) (.single 65))))) (.node (.node (.node (.single 73) (.node (.single 69) (.single 77))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49)))) (.node (.node (.single 9) (.node (.single 81) (.single 89))) (.node (.node (.single 85) (.single 93)) (.node (.single 13) (.single 17)))))) (.node (.node (.node (.node (.single 18) (.node (.single 94) (.single 90))) (.node (.node (.single 86) (.single 82)) (.node (.single 14) (.single 10)))) (.node (.node (.single 78) (.node (.single 74) (.single 70))) (.node (.node (.single 66) (.single 62)) (.node (.single 110) (.single 106))))) (.node (.node (.node (.single 102) (.node (.single 98) (.single 58))) (.node (.node (.single 54) (.single 6)) (.node (.single 2) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22))))))))
def cover3 (i : Fin 112) : Fin 112 := ⟨coverData3.get i % 112, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 112) : Fin 112 := ⟨sourceData3.get i % 112, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 (.cutX 512 (.cutY 29184 (.cutX 256 (.cutY 28928 (.cutX 128 (.cutY 28800 (.cutX 64 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) (.cutX 64 (.cutY 28864 .full .full) (.cutY 28864 .full .full))) (.cutY 28800 (.cutX 192 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 224 (.cutY 28704 .full .full) (.cutY 28704 (.cutX 240 (.cutY 28688 .full .full) (.cutY 28688 .full .full)) .full)) (.cutX 224 (.cutY 28768 .full .full) (.cutY 28768 .full .full)))) (.cutX 192 (.cutY 28864 .full .full) (.cutY 28864 (.cutX 224 (.cutY 28832 .full .full) (.cutY 28832 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 .empty (.cutY 31744 .empty (.cutX 3584 .empty (.cutY 32256 .empty (.cutX 3840 .empty (.cutY 32512 .empty (.cutX 3968 (.cutY 32640 (.cutX 3904 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 3936 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 3904 (.cutY 32704 .full .full) (.cutY 32704 .full .full))) (.cutY 32640 (.cutX 4032 (.cutY 32576 (.cutX 4000 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full) (.cutY 32576 (.cutX 4064 (.cutY 32544 .full .full) (.cutY 32544 (.cutX 4080 (.cutY 32528 .full .full) (.cutY 32528 .full .full)) .full)) .full)) (.cutX 4032 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))))))))))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 (.cutY 1024 (.cutX 29184 (.cutY 512 (.cutX 28928 (.cutY 256 (.cutX 28800 (.cutY 128 (.cutX 28736 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 28736 (.cutY 192 .full (.cutX 28704 (.cutY 224 .full (.cutX 28688 (.cutY 240 .full .full) (.cutY 240 .full .full))) (.cutY 224 .full .full))) (.cutY 192 .full (.cutX 28768 (.cutY 224 .full .full) (.cutY 224 .full .full))))) (.cutY 128 (.cutX 28864 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 28864 (.cutY 192 .full (.cutX 28832 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 .empty (.cutX 32256 .empty (.cutY 3584 .empty (.cutX 32512 .empty (.cutY 3840 .empty (.cutX 32640 (.cutY 3968 (.cutX 32576 (.cutY 3904 .full (.cutX 32544 (.cutY 3936 .full .full) (.cutY 3936 .full .full))) (.cutY 3904 .full .full)) (.cutX 32576 (.cutY 4032 (.cutX 32544 (.cutY 4000 .full .full) (.cutY 4000 .full .full)) (.cutX 32544 (.cutY 4064 .full (.cutX 32528 (.cutY 4080 .full .full) (.cutY 4080 .full .full))) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 (.cutX 32704 (.cutY 3904 .full .full) (.cutY 3904 .full .full)) (.cutX 32704 (.cutY 4032 .full .full) (.cutY 4032 .full .full)))))))))))) .empty)) .empty)) .empty))

theorem metadata3 : 0<192502037 ∧ 0<128 ∧ 112<128 ∧ 3<4 ∧
    12592/4160=3 ∧ 12592%4160=112 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 64,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked3_64 : ∀ i : Fin 48,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 112, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) (forallFinOffset_add (fun i => output3 i = raw3 (source3 i)) 0 64 48 (by decide) sourceChecked3_0
    sourceChecked3_64)

theorem coverChecked3_0 : ∀ i : Fin 64,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem coverChecked3_64 : ∀ i : Fin 48,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 112, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
  forallFin_of_zero_offset (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (forallFinOffset_add (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) 0 64 48 (by decide) coverChecked3_0
    coverChecked3_64)

theorem treeChecked3 : tree3.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves3 : List.ofFn output3 = tree3.leaves ⟨0,32768,0,32768⟩ := by
  unfold output3
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked3 : gridTreeUnionCheck 32768 raw3 output3 cover3 source3 tree3 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked3, coverChecked3, treeChecked3, treeLeaves3⟩

theorem areaUnits3 : gridUnionAreaUnits output3 = 262144 := by decide +kernel

noncomputable def phaseMass3 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 15305, atom 12593, type 3, source (0,113).
def leavesData4 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves4 : Fin 16 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 0 113 leaves4 i
def outputData4 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,28928,28992⟩) (.single ⟨0,64,28992,29056⟩)) (.node (.single ⟨64,128,28928,28992⟩) (.single ⟨64,128,28992,29056⟩))) (.node (.node (.single ⟨0,128,29056,29184⟩) (.single ⟨128,192,28928,28992⟩)) (.node (.single ⟨128,192,28992,29056⟩) (.single ⟨192,224,28928,28960⟩)))) (.node (.node (.node (.single ⟨192,224,28960,28992⟩) (.single ⟨224,256,28928,28960⟩)) (.node (.single ⟨224,256,28960,28992⟩) (.single ⟨192,256,28992,29056⟩))) (.node (.node (.single ⟨128,192,29056,29120⟩) (.single ⟨128,192,29120,29184⟩)) (.node (.single ⟨192,256,29056,29120⟩) (.single ⟨192,256,29120,29184⟩))))) (.node (.node (.node (.node (.single ⟨3584,3648,32512,32576⟩) (.single ⟨3584,3648,32576,32640⟩)) (.node (.single ⟨3648,3712,32512,32576⟩) (.single ⟨3648,3712,32576,32640⟩))) (.node (.node (.single ⟨3584,3712,32640,32768⟩) (.single ⟨3712,3776,32512,32576⟩)) (.node (.single ⟨3712,3776,32576,32640⟩) (.single ⟨3776,3808,32512,32544⟩)))) (.node (.node (.node (.single ⟨3776,3808,32544,32576⟩) (.single ⟨3808,3840,32512,32544⟩)) (.node (.single ⟨3808,3840,32544,32576⟩) (.single ⟨3776,3840,32576,32640⟩))) (.node (.node (.single ⟨3712,3776,32640,32704⟩) (.single ⟨3712,3776,32704,32768⟩)) (.node (.single ⟨3776,3840,32640,32704⟩) (.single ⟨3776,3840,32704,32768⟩)))))) (.node (.node (.node (.node (.node (.single ⟨28928,28992,0,64⟩) (.single ⟨28928,28992,64,128⟩)) (.node (.single ⟨28992,29056,0,64⟩) (.single ⟨28992,29056,64,128⟩))) (.node (.node (.single ⟨28928,28992,128,192⟩) (.single ⟨28928,28960,192,224⟩)) (.node (.single ⟨28928,28960,224,256⟩) (.single ⟨28960,28992,192,224⟩)))) (.node (.node (.node (.single ⟨28960,28992,224,256⟩) (.single ⟨28992,29056,128,192⟩)) (.node (.single ⟨28992,29056,192,256⟩) (.single ⟨29056,29184,0,128⟩))) (.node (.node (.single ⟨29056,29120,128,192⟩) (.single ⟨29056,29120,192,256⟩)) (.node (.single ⟨29120,29184,128,192⟩) (.single ⟨29120,29184,192,256⟩))))) (.node (.node (.node (.node (.single ⟨32512,32576,3584,3648⟩) (.single ⟨32512,32576,3648,3712⟩)) (.node (.single ⟨32576,32640,3584,3648⟩) (.single ⟨32576,32640,3648,3712⟩))) (.node (.node (.single ⟨32512,32576,3712,3776⟩) (.single ⟨32512,32544,3776,3808⟩)) (.node (.single ⟨32512,32544,3808,3840⟩) (.single ⟨32544,32576,3776,3808⟩)))) (.node (.node (.node (.single ⟨32544,32576,3808,3840⟩) (.single ⟨32576,32640,3712,3776⟩)) (.node (.single ⟨32576,32640,3776,3840⟩) (.single ⟨32640,32768,3584,3712⟩))) (.node (.node (.single ⟨32640,32704,3712,3776⟩) (.single ⟨32640,32704,3776,3840⟩)) (.node (.single ⟨32704,32768,3712,3776⟩) (.single ⟨32704,32768,3776,3840⟩)))))))
def output4 : Fin 64 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData4 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover4 (i : Fin 64) : Fin 64 := ⟨coverData4.get i % 64, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 64) : Fin 64 := ⟨sourceData4.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 (.cutX 512 (.cutY 29184 (.cutX 256 (.cutY 28928 .empty (.cutX 128 (.cutY 29056 (.cutX 64 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 192 (.cutY 28992 .full .full) (.cutY 28992 (.cutX 224 (.cutY 28960 .full .full) (.cutY 28960 .full .full)) .full)) (.cutX 192 (.cutY 29120 .full .full) (.cutY 29120 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 .empty (.cutY 31744 .empty (.cutX 3584 .empty (.cutY 32256 .empty (.cutX 3840 (.cutY 32512 .empty (.cutX 3712 (.cutY 32640 (.cutX 3648 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 3776 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 3808 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 3776 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)))))))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 (.cutY 1024 (.cutX 29184 (.cutY 512 (.cutX 28928 .empty (.cutY 256 (.cutX 29056 (.cutY 128 (.cutX 28992 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 28992 (.cutY 192 .full (.cutX 28960 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 29120 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 .empty (.cutX 32256 .empty (.cutY 3584 .empty (.cutX 32512 .empty (.cutY 3840 (.cutX 32640 (.cutY 3712 (.cutX 32576 (.cutY 3648 .full .full) (.cutY 3648 .full .full)) (.cutX 32576 (.cutY 3776 .full (.cutX 32544 (.cutY 3808 .full .full) (.cutY 3808 .full .full))) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 32704 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty)))))))) .empty)) .empty)) .empty))

theorem metadata4 : 0<192502037 ∧ 0<128 ∧ 113<128 ∧ 3<4 ∧
    12593/4160=3 ∧ 12593%4160=113 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 64,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 64, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 64,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 64, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
  forallFin_of_zero_offset (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) coverChecked4_0

theorem treeChecked4 : tree4.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves4 : List.ofFn output4 = tree4.leaves ⟨0,32768,0,32768⟩ := by
  unfold output4
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked4 : gridTreeUnionCheck 32768 raw4 output4 cover4 source4 tree4 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked4, coverChecked4, treeChecked4, treeLeaves4⟩

theorem areaUnits4 : gridUnionAreaUnits output4 = 262144 := by decide +kernel

noncomputable def phaseMass4 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 15306, atom 12594, type 3, source (0,114).
def leavesData5 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves5 : Fin 10 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 114 leaves5 i
def outputData5 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,128,29184,29312⟩) (.single ⟨0,128,29312,29440⟩)) (.node (.single ⟨128,192,29184,29248⟩) (.node (.single ⟨128,192,29248,29312⟩) (.single ⟨192,256,29184,29248⟩)))) (.node (.node (.single ⟨192,256,29248,29312⟩) (.single ⟨128,192,29312,29376⟩)) (.node (.single ⟨128,192,29376,29440⟩) (.node (.single ⟨192,256,29312,29376⟩) (.single ⟨192,256,29376,29440⟩))))) (.node (.node (.node (.single ⟨3328,3392,32512,32576⟩) (.single ⟨3328,3392,32576,32640⟩)) (.node (.single ⟨3392,3456,32512,32576⟩) (.node (.single ⟨3392,3456,32576,32640⟩) (.single ⟨3328,3456,32640,32768⟩)))) (.node (.node (.single ⟨3456,3520,32512,32576⟩) (.single ⟨3456,3520,32576,32640⟩)) (.node (.single ⟨3520,3584,32512,32576⟩) (.node (.single ⟨3520,3584,32576,32640⟩) (.single ⟨3456,3584,32640,32768⟩)))))) (.node (.node (.node (.node (.single ⟨29184,29312,0,128⟩) (.single ⟨29184,29248,128,192⟩)) (.node (.single ⟨29184,29248,192,256⟩) (.node (.single ⟨29248,29312,128,192⟩) (.single ⟨29248,29312,192,256⟩)))) (.node (.node (.single ⟨29312,29440,0,128⟩) (.single ⟨29312,29376,128,192⟩)) (.node (.single ⟨29312,29376,192,256⟩) (.node (.single ⟨29376,29440,128,192⟩) (.single ⟨29376,29440,192,256⟩))))) (.node (.node (.node (.single ⟨32512,32576,3328,3392⟩) (.single ⟨32512,32576,3392,3456⟩)) (.node (.single ⟨32576,32640,3328,3392⟩) (.node (.single ⟨32576,32640,3392,3456⟩) (.single ⟨32512,32576,3456,3520⟩)))) (.node (.node (.single ⟨32512,32576,3520,3584⟩) (.single ⟨32576,32640,3456,3520⟩)) (.node (.single ⟨32576,32640,3520,3584⟩) (.node (.single ⟨32640,32768,3328,3456⟩) (.single ⟨32640,32768,3456,3584⟩)))))))
def output5 : Fin 40 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover5 (i : Fin 40) : Fin 40 := ⟨coverData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 40) : Fin 40 := ⟨sourceData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 (.cutX 512 (.cutY 29184 .empty (.cutX 256 (.cutY 29440 (.cutX 128 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 192 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) (.cutX 192 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 .empty (.cutY 31744 .empty (.cutX 3584 (.cutY 32256 .empty (.cutX 3328 .empty (.cutY 32512 .empty (.cutX 3456 (.cutY 32640 (.cutX 3392 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 3520 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))) .empty)))))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 (.cutY 1024 (.cutX 29184 .empty (.cutY 512 (.cutX 29440 (.cutY 256 (.cutX 29312 (.cutY 128 .full (.cutX 29248 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 29376 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 .empty (.cutX 32256 .empty (.cutY 3584 (.cutX 32512 .empty (.cutY 3328 .empty (.cutX 32640 (.cutY 3456 (.cutX 32576 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 32576 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full)))) .empty)))))) .empty)) .empty)) .empty))

theorem metadata5 : 0<192502037 ∧ 0<128 ∧ 114<128 ∧ 3<4 ∧
    12594/4160=3 ∧ 12594%4160=114 ∧ ∀ i, (leaves5 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData5).mp
    (by decide +kernel)

theorem sourceChecked5_0 : ∀ i : Fin 40,
    (fun i => output5 i = raw5 (source5 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked5 : ∀ i : Fin 40, (fun i => output5 i = raw5 (source5 i)) i :=
  forallFin_of_zero_offset (fun i => output5 i = raw5 (source5 i)) sourceChecked5_0

theorem coverChecked5_0 : ∀ i : Fin 40,
    (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked5 : ∀ i : Fin 40, (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) i :=
  forallFin_of_zero_offset (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) coverChecked5_0

theorem treeChecked5 : tree5.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves5 : List.ofFn output5 = tree5.leaves ⟨0,32768,0,32768⟩ := by
  unfold output5
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked5 : gridTreeUnionCheck 32768 raw5 output5 cover5 source5 tree5 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked5, coverChecked5, treeChecked5, treeLeaves5⟩

theorem areaUnits5 : gridUnionAreaUnits output5 = 262144 := by decide +kernel

noncomputable def phaseMass5 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 15307, atom 13447, type 3, source (7,120).
def leavesData6 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨2,0,2⟩) (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)))) (.node (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves6 : Fin 19 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 7 120 leaves6 i
def outputData6 : FiniteInputTree GridBox 38 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,30720,30784⟩) (.single ⟨1792,1856,30784,30848⟩)) (.node (.single ⟨1856,1920,30720,30784⟩) (.single ⟨1856,1920,30784,30848⟩))) (.node (.node (.single ⟨1792,1856,30848,30912⟩) (.single ⟨1792,1856,30912,30976⟩)) (.node (.single ⟨1856,1920,30848,30912⟩) (.node (.single ⟨1856,1920,30912,30976⟩) (.single ⟨1920,1984,30720,30784⟩))))) (.node (.node (.node (.single ⟨1920,1984,30784,30848⟩) (.single ⟨1984,2016,30720,30752⟩)) (.node (.single ⟨1984,2016,30752,30784⟩) (.node (.single ⟨2016,2048,30720,30752⟩) (.single ⟨2016,2048,30752,30784⟩)))) (.node (.node (.single ⟨1984,2048,30784,30848⟩) (.single ⟨1920,1984,30848,30912⟩)) (.node (.single ⟨1920,1984,30912,30976⟩) (.node (.single ⟨1984,2048,30848,30912⟩) (.single ⟨1984,2048,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨30720,30784,1792,1856⟩) (.single ⟨30720,30784,1856,1920⟩)) (.node (.single ⟨30784,30848,1792,1856⟩) (.single ⟨30784,30848,1856,1920⟩))) (.node (.node (.single ⟨30720,30784,1920,1984⟩) (.single ⟨30720,30752,1984,2016⟩)) (.node (.single ⟨30720,30752,2016,2048⟩) (.node (.single ⟨30752,30784,1984,2016⟩) (.single ⟨30752,30784,2016,2048⟩))))) (.node (.node (.node (.single ⟨30784,30848,1920,1984⟩) (.single ⟨30784,30848,1984,2048⟩)) (.node (.single ⟨30848,30912,1792,1856⟩) (.node (.single ⟨30848,30912,1856,1920⟩) (.single ⟨30912,30976,1792,1856⟩)))) (.node (.node (.single ⟨30912,30976,1856,1920⟩) (.single ⟨30848,30912,1920,1984⟩)) (.node (.single ⟨30848,30912,1984,2048⟩) (.node (.single ⟨30912,30976,1920,1984⟩) (.single ⟨30912,30976,1984,2048⟩)))))))
def output6 : Fin 38 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 19)) (.node (.single 37) (.single 18))) (.node (.node (.single 1) (.single 21)) (.node (.single 36) (.node (.single 16) (.single 2))))) (.node (.node (.node (.single 20) (.single 35)) (.node (.single 17) (.node (.single 3) (.single 22)))) (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 23) (.single 29)))))) (.node (.node (.node (.node (.single 14) (.single 9)) (.node (.single 28) (.single 28))) (.node (.node (.single 9) (.single 15)) (.node (.single 34) (.node (.single 22) (.single 3))))) (.node (.node (.node (.single 16) (.single 36)) (.node (.single 21) (.node (.single 1) (.single 14)))) (.node (.node (.single 29) (.single 23)) (.node (.single 8) (.node (.single 17) (.single 35))))))) (.node (.node (.node (.node (.node (.single 20) (.single 2)) (.node (.single 18) (.single 37))) (.node (.node (.single 19) (.single 0)) (.node (.single 4) (.node (.single 30) (.single 33))))) (.node (.node (.node (.single 7) (.single 5)) (.node (.single 32) (.node (.single 32) (.single 5)))) (.node (.node (.single 6) (.single 31)) (.node (.single 31) (.node (.single 6) (.single 7)))))) (.node (.node (.node (.node (.single 33) (.single 30)) (.node (.single 4) (.single 10))) (.node (.node (.single 24) (.single 27)) (.node (.single 13) (.node (.single 11) (.single 26))))) (.node (.node (.node (.single 26) (.single 11)) (.node (.single 12) (.node (.single 25) (.single 25)))) (.node (.node (.single 12) (.single 13)) (.node (.single 27) (.node (.single 24) (.single 10))))))))
def sourceData6 : FiniteInputTree ℕ 38 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 44) (.single 48)) (.node (.single 52) (.node (.single 47) (.single 16))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 63)))) (.node (.node (.single 19) (.single 15)) (.node (.single 7) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 62))))) (.node (.node (.node (.single 21) (.single 18)) (.node (.single 45) (.node (.single 53) (.single 49)))) (.node (.node (.single 46) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover6 (i : Fin 76) : Fin 38 := ⟨coverData6.get i % 38, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 38) : Fin 76 := ⟨sourceData6.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 .empty (.cutY 31232 (.cutX 1792 .empty (.cutY 30976 (.cutX 1920 (.cutY 30848 (.cutX 1856 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 1856 (.cutY 30912 .full .full) (.cutY 30912 .full .full))) (.cutY 30848 (.cutX 1984 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 2016 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 1984 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 .empty (.cutX 30976 (.cutY 1792 .empty (.cutX 30848 (.cutY 1920 (.cutX 30784 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 30784 (.cutY 1984 .full (.cutX 30752 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 (.cutX 30912 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 30912 (.cutY 1984 .full .full) (.cutY 1984 .full .full))))) .empty)) .empty)) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata6 : 0<142718076 ∧ 7<128 ∧ 120<128 ∧ 3<4 ∧
    13447/4160=3 ∧ 13447%4160=967 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 38,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 38 0 38 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 38, (fun i => output6 i = raw6 (source6 i)) i :=
  forallFin_of_zero_offset (fun i => output6 i = raw6 (source6 i)) sourceChecked6_0

theorem coverChecked6_0 : ∀ i : Fin 64,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked6_64 : ∀ i : Fin 12,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked6 : ∀ i : Fin 76, (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) i :=
  forallFin_of_zero_offset (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (forallFinOffset_add (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) 0 64 12 (by decide) coverChecked6_0
    coverChecked6_64)

theorem treeChecked6 : tree6.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves6 : List.ofFn output6 = tree6.leaves ⟨0,32768,0,32768⟩ := by
  unfold output6
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked6 : gridTreeUnionCheck 32768 raw6 output6 cover6 source6 tree6 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked6, coverChecked6, treeChecked6, treeLeaves6⟩

theorem areaUnits6 : gridUnionAreaUnits output6 = 131072 := by decide +kernel

noncomputable def phaseMass6 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 15308, atom 13332, type 3, source (6,120).
def leavesData7 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩)))))
def leaves7 : Fin 16 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 6 120 leaves7 i
def outputData7 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1536,1600,30720,30784⟩) (.single ⟨1536,1600,30784,30848⟩)) (.node (.single ⟨1600,1664,30720,30784⟩) (.single ⟨1600,1664,30784,30848⟩))) (.node (.node (.single ⟨1536,1600,30848,30912⟩) (.single ⟨1536,1600,30912,30976⟩)) (.node (.single ⟨1600,1664,30848,30912⟩) (.single ⟨1600,1664,30912,30976⟩)))) (.node (.node (.node (.single ⟨1664,1728,30720,30784⟩) (.single ⟨1664,1728,30784,30848⟩)) (.node (.single ⟨1728,1792,30720,30784⟩) (.single ⟨1728,1792,30784,30848⟩))) (.node (.node (.single ⟨1664,1728,30848,30912⟩) (.single ⟨1664,1728,30912,30976⟩)) (.node (.single ⟨1728,1792,30848,30912⟩) (.single ⟨1728,1792,30912,30976⟩))))) (.node (.node (.node (.node (.single ⟨1792,1856,30976,31040⟩) (.single ⟨1792,1856,31040,31104⟩)) (.node (.single ⟨1856,1920,30976,31040⟩) (.single ⟨1856,1920,31040,31104⟩))) (.node (.node (.single ⟨1792,1856,31104,31168⟩) (.single ⟨1792,1856,31168,31232⟩)) (.node (.single ⟨1856,1920,31104,31168⟩) (.single ⟨1856,1920,31168,31232⟩)))) (.node (.node (.node (.single ⟨1920,1984,30976,31040⟩) (.single ⟨1920,1984,31040,31104⟩)) (.node (.single ⟨1984,2048,30976,31040⟩) (.single ⟨1984,2048,31040,31104⟩))) (.node (.node (.single ⟨1920,1984,31104,31168⟩) (.single ⟨1920,1984,31168,31232⟩)) (.node (.single ⟨1984,2048,31104,31168⟩) (.single ⟨1984,2048,31168,31232⟩)))))) (.node (.node (.node (.node (.node (.single ⟨30720,30784,1536,1600⟩) (.single ⟨30720,30784,1600,1664⟩)) (.node (.single ⟨30784,30848,1536,1600⟩) (.single ⟨30784,30848,1600,1664⟩))) (.node (.node (.single ⟨30720,30784,1664,1728⟩) (.single ⟨30720,30784,1728,1792⟩)) (.node (.single ⟨30784,30848,1664,1728⟩) (.single ⟨30784,30848,1728,1792⟩)))) (.node (.node (.node (.single ⟨30848,30912,1536,1600⟩) (.single ⟨30848,30912,1600,1664⟩)) (.node (.single ⟨30912,30976,1536,1600⟩) (.single ⟨30912,30976,1600,1664⟩))) (.node (.node (.single ⟨30848,30912,1664,1728⟩) (.single ⟨30848,30912,1728,1792⟩)) (.node (.single ⟨30912,30976,1664,1728⟩) (.single ⟨30912,30976,1728,1792⟩))))) (.node (.node (.node (.node (.single ⟨30976,31040,1792,1856⟩) (.single ⟨30976,31040,1856,1920⟩)) (.node (.single ⟨31040,31104,1792,1856⟩) (.single ⟨31040,31104,1856,1920⟩))) (.node (.node (.single ⟨30976,31040,1920,1984⟩) (.single ⟨30976,31040,1984,2048⟩)) (.node (.single ⟨31040,31104,1920,1984⟩) (.single ⟨31040,31104,1984,2048⟩)))) (.node (.node (.node (.single ⟨31104,31168,1792,1856⟩) (.single ⟨31104,31168,1856,1920⟩)) (.node (.single ⟨31168,31232,1792,1856⟩) (.single ⟨31168,31232,1856,1920⟩))) (.node (.node (.single ⟨31104,31168,1920,1984⟩) (.single ⟨31104,31168,1984,2048⟩)) (.node (.single ⟨31168,31232,1920,1984⟩) (.single ⟨31168,31232,1984,2048⟩)))))))
def output7 : Fin 64 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 8) (.single 36)) (.node (.single 55) (.single 27))) (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25)))) (.node (.node (.node (.single 10) (.single 37)) (.node (.single 53) (.single 26))) (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 4) (.single 40)) (.node (.single 59) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 58) (.single 21)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 7) (.single 43)) (.node (.single 56) (.single 20)))))))
def sourceData7 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.single 60)))) (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))) (.node (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover7 (i : Fin 64) : Fin 64 := ⟨coverData7.get i % 64, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 64) : Fin 64 := ⟨sourceData7.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 .empty (.cutY 31232 (.cutX 1792 (.cutY 30976 (.cutX 1664 (.cutY 30848 (.cutX 1600 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 1600 (.cutY 30912 .full .full) (.cutY 30912 .full .full))) (.cutY 30848 (.cutX 1728 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 1728 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) (.cutY 30976 .empty (.cutX 1920 (.cutY 31104 (.cutX 1856 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 1856 (.cutY 31168 .full .full) (.cutY 31168 .full .full))) (.cutY 31104 (.cutX 1984 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 1984 (.cutY 31168 .full .full) (.cutY 31168 .full .full)))))) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 .empty (.cutX 30976 (.cutY 1792 (.cutX 30848 (.cutY 1664 (.cutX 30784 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 30784 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 (.cutX 30912 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 30912 (.cutY 1728 .full .full) (.cutY 1728 .full .full)))) .empty) (.cutY 1792 .empty (.cutX 31104 (.cutY 1920 (.cutX 31040 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31040 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 (.cutX 31168 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31168 (.cutY 1984 .full .full) (.cutY 1984 .full .full))))))) .empty)) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata7 : 0<142718076 ∧ 6<128 ∧ 120<128 ∧ 3<4 ∧
    13332/4160=3 ∧ 13332%4160=852 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 64,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 64, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 64,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 64, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
  forallFin_of_zero_offset (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) coverChecked7_0

theorem treeChecked7 : tree7.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves7 : List.ofFn output7 = tree7.leaves ⟨0,32768,0,32768⟩ := by
  unfold output7
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked7 : gridTreeUnionCheck 32768 raw7 output7 cover7 source7 tree7 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked7, coverChecked7, treeChecked7, treeLeaves7⟩

theorem areaUnits7 : gridUnionAreaUnits output7 = 262144 := by decide +kernel

noncomputable def phaseMass7 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 15309, atom 13215, type 3, source (5,120).
def leavesData8 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves8 : Fin 16 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 5 120 leaves8 i
def outputData8 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1280,1344,30720,30784⟩) (.single ⟨1280,1344,30784,30848⟩)) (.node (.single ⟨1344,1408,30720,30784⟩) (.single ⟨1344,1408,30784,30848⟩))) (.node (.node (.single ⟨1280,1408,30848,30976⟩) (.single ⟨1408,1472,30720,30784⟩)) (.node (.single ⟨1408,1472,30784,30848⟩) (.single ⟨1472,1504,30720,30752⟩)))) (.node (.node (.node (.single ⟨1472,1504,30752,30784⟩) (.single ⟨1504,1536,30720,30752⟩)) (.node (.single ⟨1504,1536,30752,30784⟩) (.single ⟨1472,1536,30784,30848⟩))) (.node (.node (.single ⟨1408,1472,30848,30912⟩) (.single ⟨1408,1472,30912,30976⟩)) (.node (.single ⟨1472,1536,30848,30912⟩) (.single ⟨1472,1536,30912,30976⟩))))) (.node (.node (.node (.node (.single ⟨1792,1856,31232,31296⟩) (.single ⟨1792,1856,31296,31360⟩)) (.node (.single ⟨1856,1920,31232,31296⟩) (.single ⟨1856,1920,31296,31360⟩))) (.node (.node (.single ⟨1792,1920,31360,31488⟩) (.single ⟨1920,1984,31232,31296⟩)) (.node (.single ⟨1920,1984,31296,31360⟩) (.single ⟨1984,2016,31232,31264⟩)))) (.node (.node (.node (.single ⟨1984,2016,31264,31296⟩) (.single ⟨2016,2048,31232,31264⟩)) (.node (.single ⟨2016,2048,31264,31296⟩) (.single ⟨1984,2048,31296,31360⟩))) (.node (.node (.single ⟨1920,1984,31360,31424⟩) (.single ⟨1920,1984,31424,31488⟩)) (.node (.single ⟨1984,2048,31360,31424⟩) (.single ⟨1984,2048,31424,31488⟩)))))) (.node (.node (.node (.node (.node (.single ⟨30720,30784,1280,1344⟩) (.single ⟨30720,30784,1344,1408⟩)) (.node (.single ⟨30784,30848,1280,1344⟩) (.single ⟨30784,30848,1344,1408⟩))) (.node (.node (.single ⟨30720,30784,1408,1472⟩) (.single ⟨30720,30752,1472,1504⟩)) (.node (.single ⟨30720,30752,1504,1536⟩) (.single ⟨30752,30784,1472,1504⟩)))) (.node (.node (.node (.single ⟨30752,30784,1504,1536⟩) (.single ⟨30784,30848,1408,1472⟩)) (.node (.single ⟨30784,30848,1472,1536⟩) (.single ⟨30848,30976,1280,1408⟩))) (.node (.node (.single ⟨30848,30912,1408,1472⟩) (.single ⟨30848,30912,1472,1536⟩)) (.node (.single ⟨30912,30976,1408,1472⟩) (.single ⟨30912,30976,1472,1536⟩))))) (.node (.node (.node (.node (.single ⟨31232,31296,1792,1856⟩) (.single ⟨31232,31296,1856,1920⟩)) (.node (.single ⟨31296,31360,1792,1856⟩) (.single ⟨31296,31360,1856,1920⟩))) (.node (.node (.single ⟨31232,31296,1920,1984⟩) (.single ⟨31232,31264,1984,2016⟩)) (.node (.single ⟨31232,31264,2016,2048⟩) (.single ⟨31264,31296,1984,2016⟩)))) (.node (.node (.node (.single ⟨31264,31296,2016,2048⟩) (.single ⟨31296,31360,1920,1984⟩)) (.node (.single ⟨31296,31360,1984,2048⟩) (.single ⟨31360,31488,1792,1920⟩))) (.node (.node (.single ⟨31360,31424,1920,1984⟩) (.single ⟨31360,31424,1984,2048⟩)) (.node (.single ⟨31424,31488,1920,1984⟩) (.single ⟨31424,31488,1984,2048⟩)))))))
def output8 : Fin 64 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData8 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover8 (i : Fin 64) : Fin 64 := ⟨coverData8.get i % 64, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 64) : Fin 64 := ⟨sourceData8.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 (.cutX 1280 .empty (.cutY 30976 (.cutX 1408 (.cutY 30848 (.cutX 1344 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full) (.cutY 30848 (.cutX 1472 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 1504 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 1472 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty) (.cutY 31232 .empty (.cutX 1792 .empty (.cutY 31488 (.cutX 1920 (.cutY 31360 (.cutX 1856 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full) (.cutY 31360 (.cutX 1984 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 2016 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 1984 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty)))) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 (.cutX 30976 (.cutY 1280 .empty (.cutX 30848 (.cutY 1408 (.cutX 30784 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 30784 (.cutY 1472 .full (.cutX 30752 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full (.cutX 30912 (.cutY 1472 .full .full) (.cutY 1472 .full .full))))) .empty) .empty) (.cutY 1536 .empty (.cutX 31488 (.cutY 1792 .empty (.cutX 31360 (.cutY 1920 (.cutX 31296 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31296 (.cutY 1984 .full (.cutX 31264 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full (.cutX 31424 (.cutY 1984 .full .full) (.cutY 1984 .full .full))))) .empty)))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata8 : 0<142718076 ∧ 5<128 ∧ 120<128 ∧ 3<4 ∧
    13215/4160=3 ∧ 13215%4160=735 ∧ ∀ i, (leaves8 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData8).mp
    (by decide +kernel)

theorem sourceChecked8_0 : ∀ i : Fin 64,
    (fun i => output8 i = raw8 (source8 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked8 : ∀ i : Fin 64, (fun i => output8 i = raw8 (source8 i)) i :=
  forallFin_of_zero_offset (fun i => output8 i = raw8 (source8 i)) sourceChecked8_0

theorem coverChecked8_0 : ∀ i : Fin 64,
    (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked8 : ∀ i : Fin 64, (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) i :=
  forallFin_of_zero_offset (fun i => (output8 (cover8 i)).ContainsBox (raw8 i)) coverChecked8_0

theorem treeChecked8 : tree8.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves8 : List.ofFn output8 = tree8.leaves ⟨0,32768,0,32768⟩ := by
  unfold output8
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked8 : gridTreeUnionCheck 32768 raw8 output8 cover8 source8 tree8 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked8, coverChecked8, treeChecked8, treeLeaves8⟩

theorem areaUnits8 : gridUnionAreaUnits output8 = 262144 := by decide +kernel

noncomputable def phaseMass8 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 15310, atom 12852, type 3, source (2,120).
def leavesData9 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves9 : Fin 10 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 2 120 leaves9 i
def outputData9 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨512,576,30720,30784⟩) (.single ⟨512,576,30784,30848⟩)) (.node (.single ⟨576,640,30720,30784⟩) (.node (.single ⟨576,640,30784,30848⟩) (.single ⟨512,640,30848,30976⟩)))) (.node (.node (.single ⟨640,704,30720,30784⟩) (.single ⟨640,704,30784,30848⟩)) (.node (.single ⟨704,768,30720,30784⟩) (.node (.single ⟨704,768,30784,30848⟩) (.single ⟨640,768,30848,30976⟩))))) (.node (.node (.node (.single ⟨1792,1920,32000,32128⟩) (.single ⟨1792,1920,32128,32256⟩)) (.node (.single ⟨1920,1984,32000,32064⟩) (.node (.single ⟨1920,1984,32064,32128⟩) (.single ⟨1984,2048,32000,32064⟩)))) (.node (.node (.single ⟨1984,2048,32064,32128⟩) (.single ⟨1920,1984,32128,32192⟩)) (.node (.single ⟨1920,1984,32192,32256⟩) (.node (.single ⟨1984,2048,32128,32192⟩) (.single ⟨1984,2048,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨30720,30784,512,576⟩) (.single ⟨30720,30784,576,640⟩)) (.node (.single ⟨30784,30848,512,576⟩) (.node (.single ⟨30784,30848,576,640⟩) (.single ⟨30720,30784,640,704⟩)))) (.node (.node (.single ⟨30720,30784,704,768⟩) (.single ⟨30784,30848,640,704⟩)) (.node (.single ⟨30784,30848,704,768⟩) (.node (.single ⟨30848,30976,512,640⟩) (.single ⟨30848,30976,640,768⟩))))) (.node (.node (.node (.single ⟨32000,32128,1792,1920⟩) (.single ⟨32000,32064,1920,1984⟩)) (.node (.single ⟨32000,32064,1984,2048⟩) (.node (.single ⟨32064,32128,1920,1984⟩) (.single ⟨32064,32128,1984,2048⟩)))) (.node (.node (.single ⟨32128,32256,1792,1920⟩) (.single ⟨32128,32192,1920,1984⟩)) (.node (.single ⟨32128,32192,1984,2048⟩) (.node (.single ⟨32192,32256,1920,1984⟩) (.single ⟨32192,32256,1984,2048⟩)))))))
def output9 : Fin 40 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData9 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover9 (i : Fin 40) : Fin 40 := ⟨coverData9.get i % 40, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 40) : Fin 40 := ⟨sourceData9.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 (.cutX 768 (.cutY 30976 (.cutX 640 (.cutY 30848 (.cutX 576 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full) (.cutY 30848 (.cutX 704 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty) .empty) .empty)) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 (.cutX 1792 .empty (.cutY 32000 .empty (.cutX 1920 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 1984 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 1984 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 .empty (.cutX 30976 (.cutY 768 (.cutX 30848 (.cutY 640 (.cutX 30784 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 30784 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 .empty (.cutX 32000 .empty (.cutY 1792 .empty (.cutX 32128 (.cutY 1920 .full (.cutX 32064 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full (.cutX 32192 (.cutY 1984 .full .full) (.cutY 1984 .full .full))))))) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata9 : 0<142718076 ∧ 2<128 ∧ 120<128 ∧ 3<4 ∧
    12852/4160=3 ∧ 12852%4160=372 ∧ ∀ i, (leaves9 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData9).mp
    (by decide +kernel)

theorem sourceChecked9_0 : ∀ i : Fin 40,
    (fun i => output9 i = raw9 (source9 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked9 : ∀ i : Fin 40, (fun i => output9 i = raw9 (source9 i)) i :=
  forallFin_of_zero_offset (fun i => output9 i = raw9 (source9 i)) sourceChecked9_0

theorem coverChecked9_0 : ∀ i : Fin 40,
    (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked9 : ∀ i : Fin 40, (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) i :=
  forallFin_of_zero_offset (fun i => (output9 (cover9 i)).ContainsBox (raw9 i)) coverChecked9_0

theorem treeChecked9 : tree9.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves9 : List.ofFn output9 = tree9.leaves ⟨0,32768,0,32768⟩ := by
  unfold output9
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked9 : gridTreeUnionCheck 32768 raw9 output9 cover9 source9 tree9 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked9, coverChecked9, treeChecked9, treeLeaves9⟩

theorem areaUnits9 : gridUnionAreaUnits output9 = 262144 := by decide +kernel

noncomputable def phaseMass9 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 15311, atom 12727, type 3, source (1,120).
def leavesData10 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves10 : Fin 10 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 120 leaves10 i
def outputData10 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,320,30720,30784⟩) (.single ⟨256,320,30784,30848⟩)) (.node (.single ⟨320,384,30720,30784⟩) (.node (.single ⟨320,384,30784,30848⟩) (.single ⟨256,384,30848,30976⟩)))) (.node (.node (.single ⟨384,448,30720,30784⟩) (.single ⟨384,448,30784,30848⟩)) (.node (.single ⟨448,512,30720,30784⟩) (.node (.single ⟨448,512,30784,30848⟩) (.single ⟨384,512,30848,30976⟩))))) (.node (.node (.node (.single ⟨1792,1920,32256,32384⟩) (.single ⟨1792,1920,32384,32512⟩)) (.node (.single ⟨1920,1984,32256,32320⟩) (.node (.single ⟨1920,1984,32320,32384⟩) (.single ⟨1984,2048,32256,32320⟩)))) (.node (.node (.single ⟨1984,2048,32320,32384⟩) (.single ⟨1920,1984,32384,32448⟩)) (.node (.single ⟨1920,1984,32448,32512⟩) (.node (.single ⟨1984,2048,32384,32448⟩) (.single ⟨1984,2048,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨30720,30784,256,320⟩) (.single ⟨30720,30784,320,384⟩)) (.node (.single ⟨30784,30848,256,320⟩) (.node (.single ⟨30784,30848,320,384⟩) (.single ⟨30720,30784,384,448⟩)))) (.node (.node (.single ⟨30720,30784,448,512⟩) (.single ⟨30784,30848,384,448⟩)) (.node (.single ⟨30784,30848,448,512⟩) (.node (.single ⟨30848,30976,256,384⟩) (.single ⟨30848,30976,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,1792,1920⟩) (.single ⟨32256,32320,1920,1984⟩)) (.node (.single ⟨32256,32320,1984,2048⟩) (.node (.single ⟨32320,32384,1920,1984⟩) (.single ⟨32320,32384,1984,2048⟩)))) (.node (.node (.single ⟨32384,32512,1792,1920⟩) (.single ⟨32384,32448,1920,1984⟩)) (.node (.single ⟨32384,32448,1984,2048⟩) (.node (.single ⟨32448,32512,1920,1984⟩) (.single ⟨32448,32512,1984,2048⟩)))))))
def output10 : Fin 40 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData10 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover10 (i : Fin 40) : Fin 40 := ⟨coverData10.get i % 40, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 40) : Fin 40 := ⟨sourceData10.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 (.cutX 256 .empty (.cutY 30976 (.cutX 384 (.cutY 30848 (.cutX 320 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full) (.cutY 30848 (.cutX 448 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty)) .empty) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 .empty (.cutX 1792 .empty (.cutY 32512 (.cutX 1920 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 1984 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) (.cutX 1984 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 (.cutX 30976 (.cutY 256 .empty (.cutX 30848 (.cutY 384 (.cutX 30784 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 30784 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 .empty (.cutX 32512 (.cutY 1792 .empty (.cutX 32384 (.cutY 1920 .full (.cutX 32320 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full (.cutX 32448 (.cutY 1984 .full .full) (.cutY 1984 .full .full))))) .empty))))) .empty)) .empty)) .empty)) .empty))

theorem metadata10 : 0<142718076 ∧ 1<128 ∧ 120<128 ∧ 3<4 ∧
    12727/4160=3 ∧ 12727%4160=247 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 40,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 40, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 40,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 40, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
  forallFin_of_zero_offset (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) coverChecked10_0

theorem treeChecked10 : tree10.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves10 : List.ofFn output10 = tree10.leaves ⟨0,32768,0,32768⟩ := by
  unfold output10
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked10 : gridTreeUnionCheck 32768 raw10 output10 cover10 source10 tree10 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked10, coverChecked10, treeChecked10, treeLeaves10⟩

theorem areaUnits10 : gridUnionAreaUnits output10 = 262144 := by decide +kernel

noncomputable def phaseMass10 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 15312, atom 13096, type 3, source (4,120).
def leavesData11 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,0,2⟩))) (.node (.single ⟨2,0,3⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,1,2⟩)))) (.node (.node (.single ⟨2,1,3⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,3,2⟩))))) (.node (.node (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩)))) (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨3,2,0⟩) (.single ⟨3,2,1⟩)) (.node (.single ⟨3,3,0⟩) (.single ⟨3,3,1⟩))))))
def leaves11 : Fin 25 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 4 120 leaves11 i
def outputData11 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨1024,1088,30720,30784⟩) (.node (.single ⟨1024,1088,30784,30848⟩) (.single ⟨1088,1120,30720,30752⟩))) (.node (.single ⟨1088,1120,30752,30784⟩) (.node (.single ⟨1120,1152,30720,30752⟩) (.single ⟨1120,1152,30752,30784⟩)))) (.node (.node (.single ⟨1088,1152,30784,30848⟩) (.node (.single ⟨1024,1088,30848,30912⟩) (.single ⟨1024,1088,30912,30976⟩))) (.node (.single ⟨1088,1152,30848,30912⟩) (.node (.single ⟨1088,1152,30912,30976⟩) (.single ⟨1152,1184,30720,30752⟩))))) (.node (.node (.node (.single ⟨1152,1184,30752,30784⟩) (.node (.single ⟨1184,1216,30720,30752⟩) (.single ⟨1184,1216,30752,30784⟩))) (.node (.single ⟨1152,1216,30784,30848⟩) (.node (.single ⟨1216,1248,30720,30752⟩) (.single ⟨1216,1248,30752,30784⟩)))) (.node (.node (.single ⟨1248,1280,30720,30752⟩) (.node (.single ⟨1248,1280,30752,30784⟩) (.single ⟨1216,1280,30784,30848⟩))) (.node (.node (.single ⟨1152,1216,30848,30912⟩) (.single ⟨1152,1216,30912,30976⟩)) (.node (.single ⟨1216,1280,30848,30912⟩) (.single ⟨1216,1280,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨1792,1856,31488,31552⟩) (.node (.single ⟨1792,1856,31552,31616⟩) (.single ⟨1856,1920,31488,31552⟩))) (.node (.single ⟨1856,1920,31552,31616⟩) (.node (.single ⟨1792,1856,31616,31680⟩) (.single ⟨1792,1856,31680,31744⟩)))) (.node (.node (.single ⟨1856,1920,31616,31680⟩) (.node (.single ⟨1856,1920,31680,31744⟩) (.single ⟨1920,1984,31488,31552⟩))) (.node (.single ⟨1920,1984,31552,31616⟩) (.node (.single ⟨1984,2016,31488,31520⟩) (.single ⟨1984,2016,31520,31552⟩))))) (.node (.node (.node (.single ⟨2016,2048,31488,31520⟩) (.node (.single ⟨2016,2048,31520,31552⟩) (.single ⟨1984,2016,31552,31584⟩))) (.node (.single ⟨1984,2016,31584,31616⟩) (.node (.single ⟨2016,2048,31552,31584⟩) (.single ⟨2016,2048,31584,31616⟩)))) (.node (.node (.single ⟨1920,1984,31616,31680⟩) (.node (.single ⟨1920,1984,31680,31744⟩) (.single ⟨1984,2016,31616,31648⟩))) (.node (.node (.single ⟨1984,2016,31648,31680⟩) (.single ⟨2016,2048,31616,31648⟩)) (.node (.single ⟨2016,2048,31648,31680⟩) (.single ⟨1984,2048,31680,31744⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30720,30784,1024,1088⟩) (.node (.single ⟨30720,30752,1088,1120⟩) (.single ⟨30720,30752,1120,1152⟩))) (.node (.single ⟨30752,30784,1088,1120⟩) (.node (.single ⟨30752,30784,1120,1152⟩) (.single ⟨30784,30848,1024,1088⟩)))) (.node (.node (.single ⟨30784,30848,1088,1152⟩) (.node (.single ⟨30720,30752,1152,1184⟩) (.single ⟨30720,30752,1184,1216⟩))) (.node (.single ⟨30752,30784,1152,1184⟩) (.node (.single ⟨30752,30784,1184,1216⟩) (.single ⟨30720,30752,1216,1248⟩))))) (.node (.node (.node (.single ⟨30720,30752,1248,1280⟩) (.node (.single ⟨30752,30784,1216,1248⟩) (.single ⟨30752,30784,1248,1280⟩))) (.node (.single ⟨30784,30848,1152,1216⟩) (.node (.single ⟨30784,30848,1216,1280⟩) (.single ⟨30848,30912,1024,1088⟩)))) (.node (.node (.single ⟨30848,30912,1088,1152⟩) (.node (.single ⟨30912,30976,1024,1088⟩) (.single ⟨30912,30976,1088,1152⟩))) (.node (.node (.single ⟨30848,30912,1152,1216⟩) (.single ⟨30848,30912,1216,1280⟩)) (.node (.single ⟨30912,30976,1152,1216⟩) (.single ⟨30912,30976,1216,1280⟩)))))) (.node (.node (.node (.node (.single ⟨31488,31552,1792,1856⟩) (.node (.single ⟨31488,31552,1856,1920⟩) (.single ⟨31552,31616,1792,1856⟩))) (.node (.single ⟨31552,31616,1856,1920⟩) (.node (.single ⟨31488,31552,1920,1984⟩) (.single ⟨31488,31520,1984,2016⟩)))) (.node (.node (.single ⟨31488,31520,2016,2048⟩) (.node (.single ⟨31520,31552,1984,2016⟩) (.single ⟨31520,31552,2016,2048⟩))) (.node (.single ⟨31552,31616,1920,1984⟩) (.node (.single ⟨31552,31584,1984,2016⟩) (.single ⟨31552,31584,2016,2048⟩))))) (.node (.node (.node (.single ⟨31584,31616,1984,2016⟩) (.node (.single ⟨31584,31616,2016,2048⟩) (.single ⟨31616,31680,1792,1856⟩))) (.node (.single ⟨31616,31680,1856,1920⟩) (.node (.single ⟨31680,31744,1792,1856⟩) (.single ⟨31680,31744,1856,1920⟩)))) (.node (.node (.single ⟨31616,31680,1920,1984⟩) (.node (.single ⟨31616,31648,1984,2016⟩) (.single ⟨31616,31648,2016,2048⟩))) (.node (.node (.single ⟨31648,31680,1984,2016⟩) (.single ⟨31648,31680,2016,2048⟩)) (.node (.single ⟨31680,31744,1920,1984⟩) (.single ⟨31680,31744,1984,2048⟩))))))))
def output11 : Fin 100 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 50) (.single 99))) (.node (.single 49) (.node (.single 1) (.single 55)))) (.node (.node (.single 98) (.node (.single 44) (.single 7))) (.node (.single 67) (.node (.single 92) (.single 32))))) (.node (.node (.node (.single 8) (.node (.single 69) (.single 91))) (.node (.single 30) (.node (.single 6) (.single 56)))) (.node (.node (.single 93) (.node (.single 43) (.single 9))) (.node (.node (.single 68) (.single 90)) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 70) (.node (.single 89) (.single 29))) (.node (.single 15) (.node (.single 65) (.single 84)))) (.node (.node (.single 34) (.node (.single 21) (.single 71))) (.node (.single 78) (.node (.single 28) (.single 22))))) (.node (.node (.node (.single 73) (.node (.single 77) (.single 26))) (.node (.single 20) (.node (.single 66) (.single 79)))) (.node (.node (.single 33) (.node (.single 23) (.single 72))) (.node (.node (.single 76) (.single 27)) (.node (.single 24) (.single 74))))))) (.node (.node (.node (.node (.node (.single 75) (.node (.single 25) (.single 11))) (.node (.single 57) (.node (.single 88) (.single 42)))) (.node (.node (.single 12) (.node (.single 59) (.single 87))) (.node (.single 40) (.node (.single 13) (.single 58))))) (.node (.node (.node (.single 86) (.node (.single 41) (.single 14))) (.node (.single 60) (.node (.single 85) (.single 39)))) (.node (.node (.single 16) (.node (.single 61) (.single 83))) (.node (.node (.single 38) (.single 17)) (.node (.single 63) (.single 82)))))) (.node (.node (.node (.node (.single 36) (.node (.single 18) (.single 62))) (.node (.single 81) (.node (.single 37) (.single 19)))) (.node (.node (.single 64) (.node (.single 80) (.single 35))) (.node (.single 2) (.node (.single 51) (.single 97))))) (.node (.node (.node (.single 48) (.node (.single 3) (.single 53))) (.node (.single 96) (.node (.single 46) (.single 4)))) (.node (.node (.single 52) (.node (.single 95) (.single 47))) (.node (.node (.single 5) (.single 54)) (.node (.single 94) (.single 45))))))))
def sourceData11 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 84))) (.node (.single 88) (.node (.single 92) (.single 96)))) (.node (.node (.single 16) (.node (.single 8) (.single 12))) (.node (.single 20) (.node (.single 24) (.single 52))))) (.node (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 28) (.node (.single 68) (.single 72)))) (.node (.node (.single 76) (.node (.single 80) (.single 40))) (.node (.node (.single 32) (.single 36)) (.node (.single 44) (.single 48)))))) (.node (.node (.node (.node (.single 51) (.node (.single 39) (.single 47))) (.node (.single 35) (.node (.single 27) (.single 15)))) (.node (.node (.single 23) (.node (.single 11) (.single 43))) (.node (.single 31) (.node (.single 83) (.single 75))))) (.node (.node (.node (.single 79) (.node (.single 71) (.single 67))) (.node (.single 59) (.node (.single 63) (.single 55)))) (.node (.node (.single 19) (.node (.single 7) (.single 99))) (.node (.node (.single 91) (.single 95)) (.node (.single 87) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.node (.single 85) (.single 93))) (.node (.single 89) (.node (.single 97) (.single 5)))) (.node (.node (.single 17) (.node (.single 53) (.single 61))) (.node (.single 57) (.node (.single 65) (.single 69))))) (.node (.node (.node (.single 77) (.node (.single 73) (.single 81))) (.node (.single 29) (.node (.single 41) (.single 9)))) (.node (.node (.single 21) (.node (.single 13) (.single 25))) (.node (.node (.single 33) (.single 45)) (.node (.single 37) (.single 49)))))) (.node (.node (.node (.node (.single 50) (.node (.single 46) (.single 38))) (.node (.single 34) (.node (.single 42) (.single 82)))) (.node (.node (.single 78) (.node (.single 74) (.single 70))) (.node (.single 30) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 58) (.node (.single 54) (.single 26))) (.node (.single 22) (.node (.single 14) (.single 10)))) (.node (.node (.single 18) (.node (.single 98) (.single 94))) (.node (.node (.single 90) (.single 86)) (.node (.single 6) (.single 2))))))))
def cover11 (i : Fin 100) : Fin 100 := ⟨coverData11.get i % 100, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 100) : Fin 100 := ⟨sourceData11.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 (.cutX 1280 (.cutY 30976 (.cutX 1152 (.cutY 30848 (.cutX 1088 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 1120 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 1088 (.cutY 30912 .full .full) (.cutY 30912 .full .full))) (.cutY 30848 (.cutX 1216 (.cutY 30784 (.cutX 1184 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full) (.cutY 30784 (.cutX 1248 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 1216 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty) (.cutY 31232 .empty (.cutX 1792 .empty (.cutY 31488 .empty (.cutX 1920 (.cutY 31616 (.cutX 1856 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 1856 (.cutY 31680 .full .full) (.cutY 31680 .full .full))) (.cutY 31616 (.cutX 1984 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 2016 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) (.cutX 2016 (.cutY 31584 .full .full) (.cutY 31584 .full .full)))) (.cutX 1984 (.cutY 31680 .full .full) (.cutY 31680 (.cutX 2016 (.cutY 31648 .full .full) (.cutY 31648 .full .full)) .full)))))))) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 (.cutX 30976 (.cutY 1280 (.cutX 30848 (.cutY 1152 (.cutX 30784 (.cutY 1088 .full (.cutX 30752 (.cutY 1120 .full .full) (.cutY 1120 .full .full))) (.cutY 1088 .full .full)) (.cutX 30784 (.cutY 1216 (.cutX 30752 (.cutY 1184 .full .full) (.cutY 1184 .full .full)) (.cutX 30752 (.cutY 1248 .full .full) (.cutY 1248 .full .full))) (.cutY 1216 .full .full))) (.cutY 1152 (.cutX 30912 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 30912 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty) .empty) .empty) (.cutY 1536 .empty (.cutX 31488 .empty (.cutY 1792 .empty (.cutX 31616 (.cutY 1920 (.cutX 31552 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31552 (.cutY 1984 .full (.cutX 31520 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full (.cutX 31584 (.cutY 2016 .full .full) (.cutY 2016 .full .full))))) (.cutY 1920 (.cutX 31680 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31680 (.cutY 1984 .full (.cutX 31648 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))))))))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata11 : 0<142718076 ∧ 4<128 ∧ 120<128 ∧ 3<4 ∧
    13096/4160=3 ∧ 13096%4160=616 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 64,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked11_64 : ∀ i : Fin 36,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 100, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) (forallFinOffset_add (fun i => output11 i = raw11 (source11 i)) 0 64 36 (by decide) sourceChecked11_0
    sourceChecked11_64)

theorem coverChecked11_0 : ∀ i : Fin 64,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked11_64 : ∀ i : Fin 36,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 100, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
  forallFin_of_zero_offset (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (forallFinOffset_add (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) 0 64 36 (by decide) coverChecked11_0
    coverChecked11_64)

theorem treeChecked11 : tree11.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves11 : List.ofFn output11 = tree11.leaves ⟨0,32768,0,32768⟩ := by
  unfold output11
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked11 : gridTreeUnionCheck 32768 raw11 output11 cover11 source11 tree11 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked11, coverChecked11, treeChecked11, treeLeaves11⟩

theorem areaUnits11 : gridUnionAreaUnits output11 = 262144 := by decide +kernel

noncomputable def phaseMass11 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 15313, atom 12975, type 3, source (3,120).
def leavesData12 : FiniteInputTree DyadicLeaf 28 := (.node (.node (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))))) (.node (.node (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩))) (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)) (.node (.single ⟨3,7,1⟩) (.single ⟨3,0,0⟩)))) (.node (.node (.single ⟨3,0,1⟩) (.node (.single ⟨3,1,0⟩) (.single ⟨3,1,1⟩))) (.node (.node (.single ⟨3,2,0⟩) (.single ⟨3,2,1⟩)) (.node (.single ⟨3,3,0⟩) (.single ⟨3,3,1⟩))))))
def leaves12 : Fin 28 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 112) : GridBox := phaseImageBoxes 32768 8 3 120 leaves12 i
def outputData12 : FiniteInputTree GridBox 112 := (.node (.node (.node (.node (.node (.node (.single ⟨768,800,30720,30752⟩) (.node (.single ⟨768,800,30752,30784⟩) (.single ⟨800,832,30720,30752⟩))) (.node (.node (.single ⟨800,832,30752,30784⟩) (.single ⟨768,832,30784,30848⟩)) (.node (.single ⟨832,864,30720,30752⟩) (.single ⟨832,864,30752,30784⟩)))) (.node (.node (.single ⟨864,896,30720,30752⟩) (.node (.single ⟨864,896,30752,30784⟩) (.single ⟨832,896,30784,30848⟩))) (.node (.node (.single ⟨768,832,30848,30912⟩) (.single ⟨768,832,30912,30976⟩)) (.node (.single ⟨832,896,30848,30912⟩) (.single ⟨832,896,30912,30976⟩))))) (.node (.node (.node (.single ⟨896,928,30720,30752⟩) (.node (.single ⟨896,928,30752,30784⟩) (.single ⟨928,960,30720,30752⟩))) (.node (.node (.single ⟨928,960,30752,30784⟩) (.single ⟨896,960,30784,30848⟩)) (.node (.single ⟨960,992,30720,30752⟩) (.single ⟨960,992,30752,30784⟩)))) (.node (.node (.single ⟨992,1024,30720,30752⟩) (.node (.single ⟨992,1024,30752,30784⟩) (.single ⟨960,1024,30784,30848⟩))) (.node (.node (.single ⟨896,960,30848,30912⟩) (.single ⟨896,960,30912,30976⟩)) (.node (.single ⟨960,1024,30848,30912⟩) (.single ⟨960,1024,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨1792,1856,31744,31808⟩) (.node (.single ⟨1792,1856,31808,31872⟩) (.single ⟨1856,1920,31744,31808⟩))) (.node (.node (.single ⟨1856,1920,31808,31872⟩) (.single ⟨1792,1856,31872,31936⟩)) (.node (.single ⟨1792,1856,31936,32000⟩) (.single ⟨1856,1920,31872,31936⟩)))) (.node (.node (.single ⟨1856,1920,31936,32000⟩) (.node (.single ⟨1920,1984,31744,31808⟩) (.single ⟨1920,1984,31808,31872⟩))) (.node (.node (.single ⟨1984,2016,31744,31776⟩) (.single ⟨1984,2016,31776,31808⟩)) (.node (.single ⟨2016,2048,31744,31776⟩) (.single ⟨2016,2048,31776,31808⟩))))) (.node (.node (.node (.single ⟨1984,2016,31808,31840⟩) (.node (.single ⟨1984,2016,31840,31872⟩) (.single ⟨2016,2048,31808,31840⟩))) (.node (.node (.single ⟨2016,2048,31840,31872⟩) (.single ⟨1920,1984,31872,31936⟩)) (.node (.single ⟨1920,1984,31936,32000⟩) (.single ⟨1984,2016,31872,31904⟩)))) (.node (.node (.single ⟨1984,2016,31904,31936⟩) (.node (.single ⟨2016,2048,31872,31904⟩) (.single ⟨2016,2048,31904,31936⟩))) (.node (.node (.single ⟨1984,2016,31936,31968⟩) (.single ⟨1984,2016,31968,32000⟩)) (.node (.single ⟨2016,2048,31936,31968⟩) (.single ⟨2016,2048,31968,32000⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30720,30752,768,800⟩) (.node (.single ⟨30720,30752,800,832⟩) (.single ⟨30752,30784,768,800⟩))) (.node (.node (.single ⟨30752,30784,800,832⟩) (.single ⟨30720,30752,832,864⟩)) (.node (.single ⟨30720,30752,864,896⟩) (.single ⟨30752,30784,832,864⟩)))) (.node (.node (.single ⟨30752,30784,864,896⟩) (.node (.single ⟨30784,30848,768,832⟩) (.single ⟨30784,30848,832,896⟩))) (.node (.node (.single ⟨30720,30752,896,928⟩) (.single ⟨30720,30752,928,960⟩)) (.node (.single ⟨30752,30784,896,928⟩) (.single ⟨30752,30784,928,960⟩))))) (.node (.node (.node (.single ⟨30720,30752,960,992⟩) (.node (.single ⟨30720,30752,992,1024⟩) (.single ⟨30752,30784,960,992⟩))) (.node (.node (.single ⟨30752,30784,992,1024⟩) (.single ⟨30784,30848,896,960⟩)) (.node (.single ⟨30784,30848,960,1024⟩) (.single ⟨30848,30912,768,832⟩)))) (.node (.node (.single ⟨30848,30912,832,896⟩) (.node (.single ⟨30912,30976,768,832⟩) (.single ⟨30912,30976,832,896⟩))) (.node (.node (.single ⟨30848,30912,896,960⟩) (.single ⟨30848,30912,960,1024⟩)) (.node (.single ⟨30912,30976,896,960⟩) (.single ⟨30912,30976,960,1024⟩)))))) (.node (.node (.node (.node (.single ⟨31744,31808,1792,1856⟩) (.node (.single ⟨31744,31808,1856,1920⟩) (.single ⟨31808,31872,1792,1856⟩))) (.node (.node (.single ⟨31808,31872,1856,1920⟩) (.single ⟨31744,31808,1920,1984⟩)) (.node (.single ⟨31744,31776,1984,2016⟩) (.single ⟨31744,31776,2016,2048⟩)))) (.node (.node (.single ⟨31776,31808,1984,2016⟩) (.node (.single ⟨31776,31808,2016,2048⟩) (.single ⟨31808,31872,1920,1984⟩))) (.node (.node (.single ⟨31808,31840,1984,2016⟩) (.single ⟨31808,31840,2016,2048⟩)) (.node (.single ⟨31840,31872,1984,2016⟩) (.single ⟨31840,31872,2016,2048⟩))))) (.node (.node (.node (.single ⟨31872,31936,1792,1856⟩) (.node (.single ⟨31872,31936,1856,1920⟩) (.single ⟨31936,32000,1792,1856⟩))) (.node (.node (.single ⟨31936,32000,1856,1920⟩) (.single ⟨31872,31936,1920,1984⟩)) (.node (.single ⟨31872,31904,1984,2016⟩) (.single ⟨31872,31904,2016,2048⟩)))) (.node (.node (.single ⟨31904,31936,1984,2016⟩) (.node (.single ⟨31904,31936,2016,2048⟩) (.single ⟨31936,32000,1920,1984⟩))) (.node (.node (.single ⟨31936,31968,1984,2016⟩) (.single ⟨31936,31968,2016,2048⟩)) (.node (.single ⟨31968,32000,1984,2016⟩) (.single ⟨31968,32000,2016,2048⟩))))))))
def output12 : Fin 112 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 64) (.single 107))) (.node (.node (.single 47) (.single 10)) (.node (.single 76) (.single 101)))) (.node (.node (.single 35) (.node (.single 11) (.single 78))) (.node (.node (.single 100) (.single 33)) (.node (.single 9) (.single 65))))) (.node (.node (.node (.single 102) (.node (.single 46) (.single 12))) (.node (.node (.single 77) (.single 99)) (.node (.single 34) (.single 13)))) (.node (.node (.single 79) (.node (.single 98) (.single 32))) (.node (.node (.single 18) (.single 74)) (.node (.single 93) (.single 37)))))) (.node (.node (.node (.node (.single 24) (.node (.single 80) (.single 87))) (.node (.node (.single 31) (.single 25)) (.node (.single 82) (.single 86)))) (.node (.node (.single 29) (.node (.single 23) (.single 75))) (.node (.node (.single 88) (.single 36)) (.node (.single 26) (.single 81))))) (.node (.node (.node (.single 85) (.node (.single 30) (.single 27))) (.node (.node (.single 83) (.single 84)) (.node (.single 28) (.single 14)))) (.node (.node (.single 66) (.node (.single 97) (.single 45))) (.node (.node (.single 15) (.single 68)) (.node (.single 96) (.single 43))))))) (.node (.node (.node (.node (.node (.single 16) (.node (.single 67) (.single 95))) (.node (.node (.single 44) (.single 17)) (.node (.single 69) (.single 94)))) (.node (.node (.single 42) (.node (.single 19) (.single 70))) (.node (.node (.single 92) (.single 41)) (.node (.single 20) (.single 72))))) (.node (.node (.node (.single 91) (.node (.single 39) (.single 21))) (.node (.node (.single 71) (.single 90)) (.node (.single 40) (.single 22)))) (.node (.node (.single 73) (.node (.single 89) (.single 38))) (.node (.node (.single 0) (.single 56)) (.node (.single 111) (.single 55)))))) (.node (.node (.node (.node (.single 1) (.node (.single 58) (.single 110))) (.node (.node (.single 53) (.single 2)) (.node (.single 57) (.single 109)))) (.node (.node (.single 54) (.node (.single 3) (.single 59))) (.node (.node (.single 108) (.single 52)) (.node (.single 5) (.single 60))))) (.node (.node (.node (.single 106) (.node (.single 51) (.single 6))) (.node (.node (.single 62) (.single 105)) (.node (.single 49) (.single 7)))) (.node (.node (.single 61) (.node (.single 104) (.single 50))) (.node (.node (.single 8) (.single 63)) (.node (.single 103) (.single 48))))))))
def sourceData12 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 80) (.node (.single 84) (.single 88))) (.node (.node (.single 92) (.single 0)) (.node (.single 96) (.single 100)))) (.node (.node (.single 104) (.node (.single 108) (.single 12))) (.node (.node (.single 4) (.single 8)) (.node (.single 16) (.single 20))))) (.node (.node (.node (.single 48) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 24)) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.node (.single 76) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44)))))) (.node (.node (.node (.node (.single 47) (.node (.single 35) (.single 43))) (.node (.node (.single 31) (.single 23)) (.node (.single 11) (.single 19)))) (.node (.node (.single 7) (.node (.single 39) (.single 27))) (.node (.node (.single 79) (.single 71)) (.node (.single 75) (.single 67))))) (.node (.node (.node (.single 63) (.node (.single 55) (.single 59))) (.node (.node (.single 51) (.single 15)) (.node (.single 3) (.single 111)))) (.node (.node (.single 103) (.node (.single 107) (.single 99))) (.node (.node (.single 95) (.single 87)) (.node (.single 91) (.single 83))))))) (.node (.node (.node (.node (.node (.single 81) (.node (.single 89) (.single 85))) (.node (.node (.single 93) (.single 97)) (.node (.single 105) (.single 101)))) (.node (.node (.single 109) (.node (.single 1) (.single 13))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))))) (.node (.node (.node (.single 65) (.node (.single 73) (.single 69))) (.node (.node (.single 77) (.single 25)) (.node (.single 37) (.single 5)))) (.node (.node (.single 17) (.node (.single 9) (.single 21))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45)))))) (.node (.node (.node (.node (.single 46) (.node (.single 42) (.single 34))) (.node (.node (.single 30) (.single 38)) (.node (.single 78) (.single 74)))) (.node (.node (.single 70) (.node (.single 66) (.single 26))) (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))))) (.node (.node (.node (.single 22) (.node (.single 18) (.single 10))) (.node (.node (.single 6) (.single 14)) (.node (.single 110) (.single 106)))) (.node (.node (.single 102) (.node (.single 98) (.single 2))) (.node (.node (.single 94) (.single 90)) (.node (.single 86) (.single 82))))))))
def cover12 (i : Fin 112) : Fin 112 := ⟨coverData12.get i % 112, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 112) : Fin 112 := ⟨sourceData12.get i % 112, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 (.cutX 768 .empty (.cutY 30976 (.cutX 896 (.cutY 30848 (.cutX 832 (.cutY 30784 (.cutX 800 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full) (.cutY 30784 (.cutX 864 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 832 (.cutY 30912 .full .full) (.cutY 30912 .full .full))) (.cutY 30848 (.cutX 960 (.cutY 30784 (.cutX 928 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full) (.cutY 30784 (.cutX 992 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 960 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty)) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 (.cutX 1792 .empty (.cutY 32000 (.cutX 1920 (.cutY 31872 (.cutX 1856 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1856 (.cutY 31936 .full .full) (.cutY 31936 .full .full))) (.cutY 31872 (.cutX 1984 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 2016 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) (.cutX 2016 (.cutY 31840 .full .full) (.cutY 31840 .full .full)))) (.cutX 1984 (.cutY 31936 .full .full) (.cutY 31936 (.cutX 2016 (.cutY 31904 .full .full) (.cutY 31904 .full .full)) (.cutX 2016 (.cutY 31968 .full .full) (.cutY 31968 .full .full)))))) .empty)) .empty))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 .empty (.cutX 30976 (.cutY 768 .empty (.cutX 30848 (.cutY 896 (.cutX 30784 (.cutY 832 (.cutX 30752 (.cutY 800 .full .full) (.cutY 800 .full .full)) (.cutX 30752 (.cutY 864 .full .full) (.cutY 864 .full .full))) (.cutY 832 .full .full)) (.cutX 30784 (.cutY 960 (.cutX 30752 (.cutY 928 .full .full) (.cutY 928 .full .full)) (.cutX 30752 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 (.cutX 30912 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 30912 (.cutY 960 .full .full) (.cutY 960 .full .full))))) .empty)) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 .empty (.cutX 32000 (.cutY 1792 .empty (.cutX 31872 (.cutY 1920 (.cutX 31808 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31808 (.cutY 1984 .full (.cutX 31776 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full (.cutX 31840 (.cutY 2016 .full .full) (.cutY 2016 .full .full))))) (.cutY 1920 (.cutX 31936 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 31936 (.cutY 1984 .full (.cutX 31904 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full (.cutX 31968 (.cutY 2016 .full .full) (.cutY 2016 .full .full))))))) .empty)) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata12 : 0<142718076 ∧ 3<128 ∧ 120<128 ∧ 3<4 ∧
    12975/4160=3 ∧ 12975%4160=495 ∧ ∀ i, (leaves12 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData12).mp
    (by decide +kernel)

theorem sourceChecked12_0 : ∀ i : Fin 64,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked12_64 : ∀ i : Fin 48,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem sourceChecked12 : ∀ i : Fin 112, (fun i => output12 i = raw12 (source12 i)) i :=
  forallFin_of_zero_offset (fun i => output12 i = raw12 (source12 i)) (forallFinOffset_add (fun i => output12 i = raw12 (source12 i)) 0 64 48 (by decide) sourceChecked12_0
    sourceChecked12_64)

theorem coverChecked12_0 : ∀ i : Fin 64,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem coverChecked12_64 : ∀ i : Fin 48,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem coverChecked12 : ∀ i : Fin 112, (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) i :=
  forallFin_of_zero_offset (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (forallFinOffset_add (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) 0 64 48 (by decide) coverChecked12_0
    coverChecked12_64)

theorem treeChecked12 : tree12.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves12 : List.ofFn output12 = tree12.leaves ⟨0,32768,0,32768⟩ := by
  unfold output12
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked12 : gridTreeUnionCheck 32768 raw12 output12 cover12 source12 tree12 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked12, coverChecked12, treeChecked12, treeLeaves12⟩

theorem areaUnits12 : gridUnionAreaUnits output12 = 262144 := by decide +kernel

noncomputable def phaseMass12 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 15314, atom 13333, type 3, source (6,121).
def leavesData13 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨2,0,2⟩) (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)))) (.node (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves13 : Fin 19 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 6 121 leaves13 i
def outputData13 : FiniteInputTree GridBox 38 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,30976,31040⟩) (.single ⟨1536,1600,31040,31104⟩)) (.node (.single ⟨1600,1664,30976,31040⟩) (.single ⟨1600,1664,31040,31104⟩))) (.node (.node (.single ⟨1536,1600,31104,31168⟩) (.single ⟨1536,1600,31168,31232⟩)) (.node (.single ⟨1600,1664,31104,31168⟩) (.node (.single ⟨1600,1664,31168,31232⟩) (.single ⟨1664,1728,30976,31040⟩))))) (.node (.node (.node (.single ⟨1664,1728,31040,31104⟩) (.single ⟨1728,1760,30976,31008⟩)) (.node (.single ⟨1728,1760,31008,31040⟩) (.node (.single ⟨1760,1792,30976,31008⟩) (.single ⟨1760,1792,31008,31040⟩)))) (.node (.node (.single ⟨1728,1792,31040,31104⟩) (.single ⟨1664,1728,31104,31168⟩)) (.node (.single ⟨1664,1728,31168,31232⟩) (.node (.single ⟨1728,1792,31104,31168⟩) (.single ⟨1728,1792,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨30976,31040,1536,1600⟩) (.single ⟨30976,31040,1600,1664⟩)) (.node (.single ⟨31040,31104,1536,1600⟩) (.single ⟨31040,31104,1600,1664⟩))) (.node (.node (.single ⟨30976,31040,1664,1728⟩) (.single ⟨30976,31008,1728,1760⟩)) (.node (.single ⟨30976,31008,1760,1792⟩) (.node (.single ⟨31008,31040,1728,1760⟩) (.single ⟨31008,31040,1760,1792⟩))))) (.node (.node (.node (.single ⟨31040,31104,1664,1728⟩) (.single ⟨31040,31104,1728,1792⟩)) (.node (.single ⟨31104,31168,1536,1600⟩) (.node (.single ⟨31104,31168,1600,1664⟩) (.single ⟨31168,31232,1536,1600⟩)))) (.node (.node (.single ⟨31168,31232,1600,1664⟩) (.single ⟨31104,31168,1664,1728⟩)) (.node (.single ⟨31104,31168,1728,1792⟩) (.node (.single ⟨31168,31232,1664,1728⟩) (.single ⟨31168,31232,1728,1792⟩)))))))
def output13 : Fin 38 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 19)) (.node (.single 37) (.single 18))) (.node (.node (.single 1) (.single 21)) (.node (.single 36) (.node (.single 16) (.single 2))))) (.node (.node (.node (.single 20) (.single 35)) (.node (.single 17) (.node (.single 3) (.single 22)))) (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 23) (.single 29)))))) (.node (.node (.node (.node (.single 14) (.single 9)) (.node (.single 28) (.single 28))) (.node (.node (.single 9) (.single 15)) (.node (.single 34) (.node (.single 22) (.single 3))))) (.node (.node (.node (.single 16) (.single 36)) (.node (.single 21) (.node (.single 1) (.single 14)))) (.node (.node (.single 29) (.single 23)) (.node (.single 8) (.node (.single 17) (.single 35))))))) (.node (.node (.node (.node (.node (.single 20) (.single 2)) (.node (.single 18) (.single 37))) (.node (.node (.single 19) (.single 0)) (.node (.single 4) (.node (.single 30) (.single 33))))) (.node (.node (.node (.single 7) (.single 5)) (.node (.single 32) (.node (.single 32) (.single 5)))) (.node (.node (.single 6) (.single 31)) (.node (.single 31) (.node (.single 6) (.single 7)))))) (.node (.node (.node (.node (.single 33) (.single 30)) (.node (.single 4) (.single 10))) (.node (.node (.single 24) (.single 27)) (.node (.single 13) (.node (.single 11) (.single 26))))) (.node (.node (.node (.single 26) (.single 11)) (.node (.single 12) (.node (.single 25) (.single 25)))) (.node (.node (.single 12) (.single 13)) (.node (.single 27) (.node (.single 24) (.single 10))))))))
def sourceData13 : FiniteInputTree ℕ 38 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 44) (.single 48)) (.node (.single 52) (.node (.single 47) (.single 16))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 63)))) (.node (.node (.single 19) (.single 15)) (.node (.single 7) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 62))))) (.node (.node (.node (.single 21) (.single 18)) (.node (.single 45) (.node (.single 53) (.single 49)))) (.node (.node (.single 46) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover13 (i : Fin 76) : Fin 38 := ⟨coverData13.get i % 38, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 38) : Fin 76 := ⟨sourceData13.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 .empty (.cutY 31232 (.cutX 1792 (.cutY 30976 .empty (.cutX 1664 (.cutY 31104 (.cutX 1600 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 1600 (.cutY 31168 .full .full) (.cutY 31168 .full .full))) (.cutY 31104 (.cutX 1728 (.cutY 31040 .full .full) (.cutY 31040 (.cutX 1760 (.cutY 31008 .full .full) (.cutY 31008 .full .full)) .full)) (.cutX 1728 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty)) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 .empty (.cutX 30976 .empty (.cutY 1792 (.cutX 31104 (.cutY 1664 (.cutX 31040 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 31040 (.cutY 1728 .full (.cutX 31008 (.cutY 1760 .full .full) (.cutY 1760 .full .full))) (.cutY 1728 .full .full))) (.cutY 1664 (.cutX 31168 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 31168 (.cutY 1728 .full .full) (.cutY 1728 .full .full)))) .empty))) .empty)) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata13 : 0<142718076 ∧ 6<128 ∧ 121<128 ∧ 3<4 ∧
    13333/4160=3 ∧ 13333%4160=853 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 38,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 38 0 38 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 38, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 64,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked13_64 : ∀ i : Fin 12,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 76, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
  forallFin_of_zero_offset (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (forallFinOffset_add (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) 0 64 12 (by decide) coverChecked13_0
    coverChecked13_64)

theorem treeChecked13 : tree13.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves13 : List.ofFn output13 = tree13.leaves ⟨0,32768,0,32768⟩ := by
  unfold output13
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked13 : gridTreeUnionCheck 32768 raw13 output13 cover13 source13 tree13 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked13, coverChecked13, treeChecked13, treeLeaves13⟩

theorem areaUnits13 : gridUnionAreaUnits output13 = 131072 := by decide +kernel

noncomputable def phaseMass13 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 15315, atom 13216, type 3, source (5,121).
def leavesData14 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves14 : Fin 13 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 121 leaves14 i
def outputData14 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,30976,31040⟩) (.node (.single ⟨1280,1344,31040,31104⟩) (.single ⟨1344,1408,30976,31040⟩))) (.node (.single ⟨1344,1408,31040,31104⟩) (.node (.single ⟨1280,1408,31104,31232⟩) (.single ⟨1408,1472,30976,31040⟩)))) (.node (.node (.single ⟨1408,1472,31040,31104⟩) (.node (.single ⟨1472,1536,30976,31040⟩) (.single ⟨1472,1536,31040,31104⟩))) (.node (.node (.single ⟨1408,1472,31104,31168⟩) (.single ⟨1408,1472,31168,31232⟩)) (.node (.single ⟨1472,1536,31104,31168⟩) (.single ⟨1472,1536,31168,31232⟩))))) (.node (.node (.node (.single ⟨1536,1600,31232,31296⟩) (.node (.single ⟨1536,1600,31296,31360⟩) (.single ⟨1600,1664,31232,31296⟩))) (.node (.single ⟨1600,1664,31296,31360⟩) (.node (.single ⟨1536,1664,31360,31488⟩) (.single ⟨1664,1728,31232,31296⟩)))) (.node (.node (.single ⟨1664,1728,31296,31360⟩) (.node (.single ⟨1728,1792,31232,31296⟩) (.single ⟨1728,1792,31296,31360⟩))) (.node (.node (.single ⟨1664,1728,31360,31424⟩) (.single ⟨1664,1728,31424,31488⟩)) (.node (.single ⟨1728,1792,31360,31424⟩) (.single ⟨1728,1792,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨30976,31040,1280,1344⟩) (.node (.single ⟨30976,31040,1344,1408⟩) (.single ⟨31040,31104,1280,1344⟩))) (.node (.single ⟨31040,31104,1344,1408⟩) (.node (.single ⟨30976,31040,1408,1472⟩) (.single ⟨30976,31040,1472,1536⟩)))) (.node (.node (.single ⟨31040,31104,1408,1472⟩) (.node (.single ⟨31040,31104,1472,1536⟩) (.single ⟨31104,31232,1280,1408⟩))) (.node (.node (.single ⟨31104,31168,1408,1472⟩) (.single ⟨31104,31168,1472,1536⟩)) (.node (.single ⟨31168,31232,1408,1472⟩) (.single ⟨31168,31232,1472,1536⟩))))) (.node (.node (.node (.single ⟨31232,31296,1536,1600⟩) (.node (.single ⟨31232,31296,1600,1664⟩) (.single ⟨31296,31360,1536,1600⟩))) (.node (.single ⟨31296,31360,1600,1664⟩) (.node (.single ⟨31232,31296,1664,1728⟩) (.single ⟨31232,31296,1728,1792⟩)))) (.node (.node (.single ⟨31296,31360,1664,1728⟩) (.node (.single ⟨31296,31360,1728,1792⟩) (.single ⟨31360,31488,1536,1664⟩))) (.node (.node (.single ⟨31360,31424,1664,1728⟩) (.single ⟨31360,31424,1728,1792⟩)) (.node (.single ⟨31424,31488,1664,1728⟩) (.single ⟨31424,31488,1728,1792⟩)))))))
def output14 : Fin 52 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 7))) (.node (.single 31) (.node (.single 44) (.single 20)))) (.node (.node (.single 8) (.node (.single 33) (.single 43))) (.node (.node (.single 18) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 35)))) (.node (.node (.single 27) (.node (.single 31) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 29)))) (.node (.node (.single 25) (.node (.single 33) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover14 (i : Fin 52) : Fin 52 := ⟨coverData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 52) : Fin 52 := ⟨sourceData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 (.cutX 1280 .empty (.cutY 30976 .empty (.cutX 1408 (.cutY 31104 (.cutX 1344 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full) (.cutY 31104 (.cutX 1472 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 1472 (.cutY 31168 .full .full) (.cutY 31168 .full .full)))))) .empty) (.cutY 31232 .empty (.cutX 1792 (.cutY 31488 (.cutX 1664 (.cutY 31360 (.cutX 1600 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full) (.cutY 31360 (.cutX 1728 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 1728 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty))) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 (.cutX 30976 .empty (.cutY 1280 .empty (.cutX 31104 (.cutY 1408 (.cutX 31040 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 31040 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full (.cutX 31168 (.cutY 1472 .full .full) (.cutY 1472 .full .full)))))) .empty) (.cutY 1536 .empty (.cutX 31488 (.cutY 1792 (.cutX 31360 (.cutY 1664 (.cutX 31296 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 31296 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full (.cutX 31424 (.cutY 1728 .full .full) (.cutY 1728 .full .full)))) .empty) .empty)))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata14 : 0<142718076 ∧ 5<128 ∧ 121<128 ∧ 3<4 ∧
    13216/4160=3 ∧ 13216%4160=736 ∧ ∀ i, (leaves14 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData14).mp
    (by decide +kernel)

theorem sourceChecked14_0 : ∀ i : Fin 52,
    (fun i => output14 i = raw14 (source14 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked14 : ∀ i : Fin 52, (fun i => output14 i = raw14 (source14 i)) i :=
  forallFin_of_zero_offset (fun i => output14 i = raw14 (source14 i)) sourceChecked14_0

theorem coverChecked14_0 : ∀ i : Fin 52,
    (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked14 : ∀ i : Fin 52, (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) i :=
  forallFin_of_zero_offset (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) coverChecked14_0

theorem treeChecked14 : tree14.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves14 : List.ofFn output14 = tree14.leaves ⟨0,32768,0,32768⟩ := by
  unfold output14
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked14 : gridTreeUnionCheck 32768 raw14 output14 cover14 source14 tree14 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked14, coverChecked14, treeChecked14, treeLeaves14⟩

theorem areaUnits14 : gridUnionAreaUnits output14 = 262144 := by decide +kernel

noncomputable def phaseMass14 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 15316, atom 13217, type 3, source (5,122).
def leavesData15 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves15 : Fin 13 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 122 leaves15 i
def outputData15 : FiniteInputTree GridBox 26 := (.node (.node (.node (.node (.single ⟨1280,1344,31232,31296⟩) (.node (.single ⟨1280,1344,31296,31360⟩) (.single ⟨1344,1408,31232,31296⟩))) (.node (.single ⟨1344,1408,31296,31360⟩) (.node (.single ⟨1280,1408,31360,31488⟩) (.single ⟨1408,1472,31232,31296⟩)))) (.node (.node (.single ⟨1408,1472,31296,31360⟩) (.node (.single ⟨1472,1536,31232,31296⟩) (.single ⟨1472,1536,31296,31360⟩))) (.node (.node (.single ⟨1408,1472,31360,31424⟩) (.single ⟨1408,1472,31424,31488⟩)) (.node (.single ⟨1472,1536,31360,31424⟩) (.single ⟨1472,1536,31424,31488⟩))))) (.node (.node (.node (.single ⟨31232,31296,1280,1344⟩) (.node (.single ⟨31232,31296,1344,1408⟩) (.single ⟨31296,31360,1280,1344⟩))) (.node (.single ⟨31296,31360,1344,1408⟩) (.node (.single ⟨31232,31296,1408,1472⟩) (.single ⟨31232,31296,1472,1536⟩)))) (.node (.node (.single ⟨31296,31360,1408,1472⟩) (.node (.single ⟨31296,31360,1472,1536⟩) (.single ⟨31360,31488,1280,1408⟩))) (.node (.node (.single ⟨31360,31424,1408,1472⟩) (.single ⟨31360,31424,1472,1536⟩)) (.node (.single ⟨31424,31488,1408,1472⟩) (.single ⟨31424,31488,1472,1536⟩))))))
def output15 : Fin 26 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 21) (.single 21))) (.node (.single 4) (.node (.single 5) (.single 17)))) (.node (.node (.single 20) (.node (.single 8) (.single 6))) (.node (.node (.single 19) (.single 19)) (.node (.single 6) (.single 7))))) (.node (.node (.node (.single 18) (.node (.single 18) (.single 7))) (.node (.single 8) (.node (.single 20) (.single 17)))) (.node (.node (.single 5) (.node (.single 0) (.single 13))) (.node (.node (.single 25) (.single 12)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 24) (.node (.single 10) (.single 2))) (.node (.single 14) (.node (.single 23) (.single 11)))) (.node (.node (.single 3) (.node (.single 16) (.single 22))) (.node (.node (.single 9) (.single 9)) (.node (.single 22) (.single 16))))) (.node (.node (.node (.single 3) (.node (.single 10) (.single 24))) (.node (.single 15) (.node (.single 1) (.single 11)))) (.node (.node (.single 23) (.node (.single 14) (.single 2))) (.node (.node (.single 12) (.single 25)) (.node (.single 13) (.single 0)))))))
def sourceData15 : FiniteInputTree ℕ 26 := (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 6) (.single 1))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22))))))
def cover15 (i : Fin 52) : Fin 26 := ⟨coverData15.get i % 26, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 26) : Fin 52 := ⟨sourceData15.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 .empty (.cutX 1280 .empty (.cutY 31488 (.cutX 1408 (.cutY 31360 (.cutX 1344 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full) (.cutY 31360 (.cutX 1472 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 1472 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty))) .empty) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 .empty (.cutY 1536 (.cutX 31488 (.cutY 1280 .empty (.cutX 31360 (.cutY 1408 (.cutX 31296 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 31296 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full (.cutX 31424 (.cutY 1472 .full .full) (.cutY 1472 .full .full))))) .empty) .empty))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata15 : 0<142718076 ∧ 5<128 ∧ 122<128 ∧ 3<4 ∧
    13217/4160=3 ∧ 13217%4160=737 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 26,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 26 0 26 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 26, (fun i => output15 i = raw15 (source15 i)) i :=
  forallFin_of_zero_offset (fun i => output15 i = raw15 (source15 i)) sourceChecked15_0

theorem coverChecked15_0 : ∀ i : Fin 52,
    (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked15 : ∀ i : Fin 52, (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) i :=
  forallFin_of_zero_offset (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) coverChecked15_0

theorem treeChecked15 : tree15.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves15 : List.ofFn output15 = tree15.leaves ⟨0,32768,0,32768⟩ := by
  unfold output15
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked15 : gridTreeUnionCheck 32768 raw15 output15 cover15 source15 tree15 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked15, coverChecked15, treeChecked15, treeLeaves15⟩

theorem areaUnits15 : gridUnionAreaUnits output15 = 131072 := by decide +kernel

noncomputable def phaseMass15 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 15317, atom 12853, type 3, source (2,121).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 121 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,30976,31104⟩) (.node (.single ⟨512,640,31104,31232⟩) (.single ⟨640,704,30976,31040⟩))) (.node (.node (.single ⟨640,704,31040,31104⟩) (.single ⟨704,768,30976,31040⟩)) (.node (.single ⟨704,768,31040,31104⟩) (.single ⟨640,768,31104,31232⟩)))) (.node (.node (.single ⟨1536,1664,32000,32128⟩) (.node (.single ⟨1536,1664,32128,32256⟩) (.single ⟨1664,1728,32000,32064⟩))) (.node (.node (.single ⟨1664,1728,32064,32128⟩) (.single ⟨1728,1792,32000,32064⟩)) (.node (.single ⟨1728,1792,32064,32128⟩) (.single ⟨1664,1792,32128,32256⟩))))) (.node (.node (.node (.single ⟨30976,31104,512,640⟩) (.node (.single ⟨30976,31040,640,704⟩) (.single ⟨30976,31040,704,768⟩))) (.node (.node (.single ⟨31040,31104,640,704⟩) (.single ⟨31040,31104,704,768⟩)) (.node (.single ⟨31104,31232,512,640⟩) (.single ⟨31104,31232,640,768⟩)))) (.node (.node (.single ⟨32000,32128,1536,1664⟩) (.node (.single ⟨32000,32064,1664,1728⟩) (.single ⟨32000,32064,1728,1792⟩))) (.node (.node (.single ⟨32064,32128,1664,1728⟩) (.single ⟨32064,32128,1728,1792⟩)) (.node (.single ⟨32128,32256,1536,1664⟩) (.single ⟨32128,32256,1664,1792⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 (.cutX 768 (.cutY 30976 .empty (.cutX 640 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 704 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full))) .empty) .empty)) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 (.cutX 1792 (.cutY 32000 .empty (.cutX 1664 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 1728 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full))) .empty) .empty))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 .empty (.cutX 30976 .empty (.cutY 768 (.cutX 31104 (.cutY 640 .full (.cutX 31040 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty))) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 .empty (.cutX 32000 .empty (.cutY 1792 (.cutX 32128 (.cutY 1664 .full (.cutX 32064 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty))) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata16 : 0<142718076 ∧ 2<128 ∧ 121<128 ∧ 3<4 ∧
    12853/4160=3 ∧ 12853%4160=373 ∧ ∀ i, (leaves16 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData16).mp
    (by decide +kernel)

theorem sourceChecked16_0 : ∀ i : Fin 28,
    (fun i => output16 i = raw16 (source16 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked16 : ∀ i : Fin 28, (fun i => output16 i = raw16 (source16 i)) i :=
  forallFin_of_zero_offset (fun i => output16 i = raw16 (source16 i)) sourceChecked16_0

theorem coverChecked16_0 : ∀ i : Fin 28,
    (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked16 : ∀ i : Fin 28, (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) i :=
  forallFin_of_zero_offset (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) coverChecked16_0

theorem treeChecked16 : tree16.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves16 : List.ofFn output16 = tree16.leaves ⟨0,32768,0,32768⟩ := by
  unfold output16
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked16 : gridTreeUnionCheck 32768 raw16 output16 cover16 source16 tree16 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked16, coverChecked16, treeChecked16, treeLeaves16⟩

theorem areaUnits16 : gridUnionAreaUnits output16 = 262144 := by decide +kernel

noncomputable def phaseMass16 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 15318, atom 12728, type 3, source (1,121).
def leavesData17 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves17 : Fin 7 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 1 121 leaves17 i
def outputData17 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨256,384,30976,31104⟩) (.node (.single ⟨256,384,31104,31232⟩) (.single ⟨384,448,30976,31040⟩))) (.node (.node (.single ⟨384,448,31040,31104⟩) (.single ⟨448,512,30976,31040⟩)) (.node (.single ⟨448,512,31040,31104⟩) (.single ⟨384,512,31104,31232⟩)))) (.node (.node (.single ⟨1536,1664,32256,32384⟩) (.node (.single ⟨1536,1664,32384,32512⟩) (.single ⟨1664,1728,32256,32320⟩))) (.node (.node (.single ⟨1664,1728,32320,32384⟩) (.single ⟨1728,1792,32256,32320⟩)) (.node (.single ⟨1728,1792,32320,32384⟩) (.single ⟨1664,1792,32384,32512⟩))))) (.node (.node (.node (.single ⟨30976,31104,256,384⟩) (.node (.single ⟨30976,31040,384,448⟩) (.single ⟨30976,31040,448,512⟩))) (.node (.node (.single ⟨31040,31104,384,448⟩) (.single ⟨31040,31104,448,512⟩)) (.node (.single ⟨31104,31232,256,384⟩) (.single ⟨31104,31232,384,512⟩)))) (.node (.node (.single ⟨32256,32384,1536,1664⟩) (.node (.single ⟨32256,32320,1664,1728⟩) (.single ⟨32256,32320,1728,1792⟩))) (.node (.node (.single ⟨32320,32384,1664,1728⟩) (.single ⟨32320,32384,1728,1792⟩)) (.node (.single ⟨32384,32512,1536,1664⟩) (.single ⟨32384,32512,1664,1792⟩))))))
def output17 : Fin 28 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover17 (i : Fin 28) : Fin 28 := ⟨coverData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 28) : Fin 28 := ⟨sourceData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 (.cutX 256 .empty (.cutY 30976 .empty (.cutX 384 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 448 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full)))) .empty) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 .empty (.cutX 1792 (.cutY 32512 (.cutX 1664 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 1728 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty) .empty)))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 (.cutX 30976 .empty (.cutY 256 .empty (.cutX 31104 (.cutY 384 .full (.cutX 31040 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 .empty (.cutX 32512 (.cutY 1792 (.cutX 32384 (.cutY 1664 .full (.cutX 32320 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty))))) .empty)) .empty)) .empty)) .empty))

theorem metadata17 : 0<142718076 ∧ 1<128 ∧ 121<128 ∧ 3<4 ∧
    12728/4160=3 ∧ 12728%4160=248 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 28,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 28, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) sourceChecked17_0

theorem coverChecked17_0 : ∀ i : Fin 28,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 28, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
  forallFin_of_zero_offset (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) coverChecked17_0

theorem treeChecked17 : tree17.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves17 : List.ofFn output17 = tree17.leaves ⟨0,32768,0,32768⟩ := by
  unfold output17
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked17 : gridTreeUnionCheck 32768 raw17 output17 cover17 source17 tree17 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked17, coverChecked17, treeChecked17, treeLeaves17⟩

theorem areaUnits17 : gridUnionAreaUnits output17 = 262144 := by decide +kernel

noncomputable def phaseMass17 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 15319, atom 12976, type 3, source (3,121).
def leavesData18 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves18 : Fin 16 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 3 121 leaves18 i
def outputData18 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨768,832,30976,31040⟩) (.single ⟨768,832,31040,31104⟩)) (.node (.single ⟨832,896,30976,31040⟩) (.single ⟨832,896,31040,31104⟩))) (.node (.node (.single ⟨768,832,31104,31168⟩) (.single ⟨768,832,31168,31232⟩)) (.node (.single ⟨832,896,31104,31168⟩) (.single ⟨832,896,31168,31232⟩)))) (.node (.node (.node (.single ⟨896,960,30976,31040⟩) (.single ⟨896,960,31040,31104⟩)) (.node (.single ⟨960,1024,30976,31040⟩) (.single ⟨960,1024,31040,31104⟩))) (.node (.node (.single ⟨896,960,31104,31168⟩) (.single ⟨896,960,31168,31232⟩)) (.node (.single ⟨960,1024,31104,31168⟩) (.single ⟨960,1024,31168,31232⟩))))) (.node (.node (.node (.node (.single ⟨1536,1600,31744,31808⟩) (.single ⟨1536,1600,31808,31872⟩)) (.node (.single ⟨1600,1664,31744,31808⟩) (.single ⟨1600,1664,31808,31872⟩))) (.node (.node (.single ⟨1536,1600,31872,31936⟩) (.single ⟨1536,1600,31936,32000⟩)) (.node (.single ⟨1600,1664,31872,31936⟩) (.single ⟨1600,1664,31936,32000⟩)))) (.node (.node (.node (.single ⟨1664,1728,31744,31808⟩) (.single ⟨1664,1728,31808,31872⟩)) (.node (.single ⟨1728,1792,31744,31808⟩) (.single ⟨1728,1792,31808,31872⟩))) (.node (.node (.single ⟨1664,1728,31872,31936⟩) (.single ⟨1664,1728,31936,32000⟩)) (.node (.single ⟨1728,1792,31872,31936⟩) (.single ⟨1728,1792,31936,32000⟩)))))) (.node (.node (.node (.node (.node (.single ⟨30976,31040,768,832⟩) (.single ⟨30976,31040,832,896⟩)) (.node (.single ⟨31040,31104,768,832⟩) (.single ⟨31040,31104,832,896⟩))) (.node (.node (.single ⟨30976,31040,896,960⟩) (.single ⟨30976,31040,960,1024⟩)) (.node (.single ⟨31040,31104,896,960⟩) (.single ⟨31040,31104,960,1024⟩)))) (.node (.node (.node (.single ⟨31104,31168,768,832⟩) (.single ⟨31104,31168,832,896⟩)) (.node (.single ⟨31168,31232,768,832⟩) (.single ⟨31168,31232,832,896⟩))) (.node (.node (.single ⟨31104,31168,896,960⟩) (.single ⟨31104,31168,960,1024⟩)) (.node (.single ⟨31168,31232,896,960⟩) (.single ⟨31168,31232,960,1024⟩))))) (.node (.node (.node (.node (.single ⟨31744,31808,1536,1600⟩) (.single ⟨31744,31808,1600,1664⟩)) (.node (.single ⟨31808,31872,1536,1600⟩) (.single ⟨31808,31872,1600,1664⟩))) (.node (.node (.single ⟨31744,31808,1664,1728⟩) (.single ⟨31744,31808,1728,1792⟩)) (.node (.single ⟨31808,31872,1664,1728⟩) (.single ⟨31808,31872,1728,1792⟩)))) (.node (.node (.node (.single ⟨31872,31936,1536,1600⟩) (.single ⟨31872,31936,1600,1664⟩)) (.node (.single ⟨31936,32000,1536,1600⟩) (.single ⟨31936,32000,1600,1664⟩))) (.node (.node (.single ⟨31872,31936,1664,1728⟩) (.single ⟨31872,31936,1728,1792⟩)) (.node (.single ⟨31936,32000,1664,1728⟩) (.single ⟨31936,32000,1728,1792⟩)))))))
def output18 : Fin 64 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 8) (.single 36)) (.node (.single 55) (.single 27))) (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25)))) (.node (.node (.node (.single 10) (.single 37)) (.node (.single 53) (.single 26))) (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24)))))) (.node (.node (.node (.node (.node (.single 4) (.single 40)) (.node (.single 59) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 58) (.single 21)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 7) (.single 43)) (.node (.single 56) (.single 20))))) (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))))
def sourceData18 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.single 60))))) (.node (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))))) (.node (.node (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))) (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover18 (i : Fin 64) : Fin 64 := ⟨coverData18.get i % 64, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 64) : Fin 64 := ⟨sourceData18.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 (.cutX 768 .empty (.cutY 30976 .empty (.cutX 896 (.cutY 31104 (.cutX 832 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 832 (.cutY 31168 .full .full) (.cutY 31168 .full .full))) (.cutY 31104 (.cutX 960 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 960 (.cutY 31168 .full .full) (.cutY 31168 .full .full)))))) .empty)) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 (.cutX 1792 (.cutY 32000 (.cutX 1664 (.cutY 31872 (.cutX 1600 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1600 (.cutY 31936 .full .full) (.cutY 31936 .full .full))) (.cutY 31872 (.cutX 1728 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1728 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 .empty (.cutX 30976 .empty (.cutY 768 .empty (.cutX 31104 (.cutY 896 (.cutX 31040 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 31040 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 (.cutX 31168 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 31168 (.cutY 960 .full .full) (.cutY 960 .full .full))))))) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 .empty (.cutX 32000 (.cutY 1792 (.cutX 31872 (.cutY 1664 (.cutX 31808 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 31808 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 (.cutX 31936 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 31936 (.cutY 1728 .full .full) (.cutY 1728 .full .full)))) .empty) .empty)) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata18 : 0<142718076 ∧ 3<128 ∧ 121<128 ∧ 3<4 ∧
    12976/4160=3 ∧ 12976%4160=496 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 64,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 64, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 64,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 64, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
  forallFin_of_zero_offset (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) coverChecked18_0

theorem treeChecked18 : tree18.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves18 : List.ofFn output18 = tree18.leaves ⟨0,32768,0,32768⟩ := by
  unfold output18
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked18 : gridTreeUnionCheck 32768 raw18 output18 cover18 source18 tree18 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked18, coverChecked18, treeChecked18, treeLeaves18⟩

theorem areaUnits18 : gridUnionAreaUnits output18 = 262144 := by decide +kernel

noncomputable def phaseMass18 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 15320, atom 12854, type 3, source (2,122).
def leavesData19 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves19 : Fin 4 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 2 122 leaves19 i
def outputData19 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨512,640,31232,31360⟩) (.single ⟨512,640,31360,31488⟩)) (.node (.single ⟨640,768,31232,31360⟩) (.single ⟨640,768,31360,31488⟩))) (.node (.node (.single ⟨1280,1408,32000,32128⟩) (.single ⟨1280,1408,32128,32256⟩)) (.node (.single ⟨1408,1536,32000,32128⟩) (.single ⟨1408,1536,32128,32256⟩)))) (.node (.node (.node (.single ⟨31232,31360,512,640⟩) (.single ⟨31232,31360,640,768⟩)) (.node (.single ⟨31360,31488,512,640⟩) (.single ⟨31360,31488,640,768⟩))) (.node (.node (.single ⟨32000,32128,1280,1408⟩) (.single ⟨32000,32128,1408,1536⟩)) (.node (.single ⟨32128,32256,1280,1408⟩) (.single ⟨32128,32256,1408,1536⟩)))))
def output19 : Fin 16 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData19 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover19 (i : Fin 16) : Fin 16 := ⟨coverData19.get i % 16, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 16) : Fin 16 := ⟨sourceData19.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 .empty (.cutX 768 (.cutY 31488 (.cutX 640 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty) .empty))) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 (.cutX 1280 .empty (.cutY 32000 .empty (.cutX 1408 (.cutY 32128 .full .full) (.cutY 32128 .full .full)))) .empty) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 .empty (.cutX 31488 (.cutY 768 (.cutX 31360 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty) .empty))) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 (.cutX 32000 .empty (.cutY 1280 .empty (.cutX 32128 (.cutY 1408 .full .full) (.cutY 1408 .full .full)))) .empty) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata19 : 0<142718076 ∧ 2<128 ∧ 122<128 ∧ 3<4 ∧
    12854/4160=3 ∧ 12854%4160=374 ∧ ∀ i, (leaves19 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData19).mp
    (by decide +kernel)

theorem sourceChecked19_0 : ∀ i : Fin 16,
    (fun i => output19 i = raw19 (source19 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked19 : ∀ i : Fin 16, (fun i => output19 i = raw19 (source19 i)) i :=
  forallFin_of_zero_offset (fun i => output19 i = raw19 (source19 i)) sourceChecked19_0

theorem coverChecked19_0 : ∀ i : Fin 16,
    (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked19 : ∀ i : Fin 16, (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) i :=
  forallFin_of_zero_offset (fun i => (output19 (cover19 i)).ContainsBox (raw19 i)) coverChecked19_0

theorem treeChecked19 : tree19.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves19 : List.ofFn output19 = tree19.leaves ⟨0,32768,0,32768⟩ := by
  unfold output19
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked19 : gridTreeUnionCheck 32768 raw19 output19 cover19 source19 tree19 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked19, coverChecked19, treeChecked19, treeLeaves19⟩

theorem areaUnits19 : gridUnionAreaUnits output19 = 262144 := by decide +kernel

noncomputable def phaseMass19 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 15321, atom 12729, type 3, source (1,122).
def leavesData20 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves20 : Fin 4 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 1 122 leaves20 i
def outputData20 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨256,384,31232,31360⟩) (.single ⟨256,384,31360,31488⟩)) (.node (.single ⟨384,512,31232,31360⟩) (.single ⟨384,512,31360,31488⟩))) (.node (.node (.single ⟨1280,1408,32256,32384⟩) (.single ⟨1280,1408,32384,32512⟩)) (.node (.single ⟨1408,1536,32256,32384⟩) (.single ⟨1408,1536,32384,32512⟩)))) (.node (.node (.node (.single ⟨31232,31360,256,384⟩) (.single ⟨31232,31360,384,512⟩)) (.node (.single ⟨31360,31488,256,384⟩) (.single ⟨31360,31488,384,512⟩))) (.node (.node (.single ⟨32256,32384,1280,1408⟩) (.single ⟨32256,32384,1408,1536⟩)) (.node (.single ⟨32384,32512,1280,1408⟩) (.single ⟨32384,32512,1408,1536⟩)))))
def output20 : Fin 16 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData20 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover20 (i : Fin 16) : Fin 16 := ⟨coverData20.get i % 16, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 16) : Fin 16 := ⟨sourceData20.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 .empty (.cutX 256 .empty (.cutY 31488 (.cutX 384 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty))) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 .empty (.cutX 1280 .empty (.cutY 32512 (.cutX 1408 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty))) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 (.cutX 31488 (.cutY 256 .empty (.cutX 31360 (.cutY 384 .full .full) (.cutY 384 .full .full))) .empty) .empty)) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 (.cutX 32512 (.cutY 1280 .empty (.cutX 32384 (.cutY 1408 .full .full) (.cutY 1408 .full .full))) .empty) .empty)))) .empty)) .empty)) .empty)) .empty))

theorem metadata20 : 0<142718076 ∧ 1<128 ∧ 122<128 ∧ 3<4 ∧
    12729/4160=3 ∧ 12729%4160=249 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 16,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 16, (fun i => output20 i = raw20 (source20 i)) i :=
  forallFin_of_zero_offset (fun i => output20 i = raw20 (source20 i)) sourceChecked20_0

theorem coverChecked20_0 : ∀ i : Fin 16,
    (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked20 : ∀ i : Fin 16, (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) i :=
  forallFin_of_zero_offset (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) coverChecked20_0

theorem treeChecked20 : tree20.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves20 : List.ofFn output20 = tree20.leaves ⟨0,32768,0,32768⟩ := by
  unfold output20
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked20 : gridTreeUnionCheck 32768 raw20 output20 cover20 source20 tree20 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked20, coverChecked20, treeChecked20, treeLeaves20⟩

theorem areaUnits20 : gridUnionAreaUnits output20 = 262144 := by decide +kernel

noncomputable def phaseMass20 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 15322, atom 13097, type 3, source (4,121).
def leavesData21 : FiniteInputTree DyadicLeaf 67 := (.node (.node (.node (.node (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,3⟩) (.single ⟨3,0,0⟩)))) (.node (.node (.node (.single ⟨3,0,1⟩) (.single ⟨3,1,0⟩)) (.node (.single ⟨3,1,1⟩) (.single ⟨3,2,1⟩))) (.node (.node (.single ⟨3,3,1⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,2⟩))))) (.node (.node (.node (.node (.single ⟨3,6,3⟩) (.single ⟨3,7,2⟩)) (.node (.single ⟨3,7,3⟩) (.single ⟨3,0,2⟩))) (.node (.node (.single ⟨3,0,3⟩) (.single ⟨3,1,2⟩)) (.node (.single ⟨3,1,3⟩) (.single ⟨3,2,2⟩)))) (.node (.node (.node (.single ⟨3,2,3⟩) (.single ⟨3,3,2⟩)) (.node (.single ⟨3,3,3⟩) (.single ⟨3,4,2⟩))) (.node (.node (.single ⟨3,4,3⟩) (.single ⟨3,5,2⟩)) (.node (.single ⟨3,5,3⟩) (.node (.single ⟨3,6,4⟩) (.single ⟨3,6,5⟩))))))) (.node (.node (.node (.node (.node (.single ⟨3,7,4⟩) (.single ⟨3,7,5⟩)) (.node (.single ⟨4,12,0⟩) (.single ⟨4,12,1⟩))) (.node (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩)) (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)))) (.node (.node (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)) (.node (.single ⟨4,4,0⟩) (.single ⟨4,4,1⟩))) (.node (.node (.single ⟨4,5,0⟩) (.single ⟨4,5,1⟩)) (.node (.single ⟨4,6,0⟩) (.node (.single ⟨4,6,1⟩) (.single ⟨4,7,0⟩)))))) (.node (.node (.node (.node (.single ⟨4,7,1⟩) (.single ⟨4,8,0⟩)) (.node (.single ⟨4,8,1⟩) (.single ⟨4,9,0⟩))) (.node (.node (.single ⟨4,9,1⟩) (.single ⟨4,10,0⟩)) (.node (.single ⟨4,10,1⟩) (.single ⟨4,11,0⟩)))) (.node (.node (.node (.single ⟨4,11,1⟩) (.single ⟨4,12,2⟩)) (.node (.single ⟨4,12,3⟩) (.single ⟨4,13,2⟩))) (.node (.node (.single ⟨4,13,3⟩) (.single ⟨4,14,2⟩)) (.node (.single ⟨4,14,3⟩) (.node (.single ⟨4,15,2⟩) (.single ⟨4,15,3⟩))))))))
def leaves21 : Fin 67 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 268) : GridBox := phaseImageBoxes 32768 8 4 121 leaves21 i
def outputData21 : FiniteInputTree GridBox 268 := (.node (.node (.node (.node (.node (.node (.node (.node (.single ⟨1024,1056,30976,31008⟩) (.single ⟨1024,1056,31008,31040⟩)) (.node (.single ⟨1056,1088,30976,31008⟩) (.single ⟨1056,1088,31008,31040⟩))) (.node (.node (.single ⟨1024,1056,31040,31072⟩) (.single ⟨1024,1056,31072,31104⟩)) (.node (.single ⟨1056,1088,31040,31072⟩) (.single ⟨1056,1088,31072,31104⟩)))) (.node (.node (.node (.single ⟨1088,1104,30976,30992⟩) (.single ⟨1088,1104,30992,31008⟩)) (.node (.single ⟨1104,1120,30976,30992⟩) (.single ⟨1104,1120,30992,31008⟩))) (.node (.node (.single ⟨1088,1120,31008,31040⟩) (.single ⟨1120,1136,30976,30992⟩)) (.node (.single ⟨1120,1136,30992,31008⟩) (.single ⟨1136,1152,30976,30992⟩))))) (.node (.node (.node (.node (.single ⟨1136,1152,30992,31008⟩) (.single ⟨1120,1152,31008,31040⟩)) (.node (.single ⟨1088,1120,31040,31072⟩) (.single ⟨1088,1120,31072,31104⟩))) (.node (.node (.single ⟨1120,1152,31040,31072⟩) (.single ⟨1120,1152,31072,31104⟩)) (.node (.single ⟨1024,1088,31104,31168⟩) (.single ⟨1024,1088,31168,31232⟩)))) (.node (.node (.node (.single ⟨1088,1152,31104,31168⟩) (.single ⟨1088,1152,31168,31232⟩)) (.node (.single ⟨1152,1168,30976,30992⟩) (.single ⟨1152,1168,30992,31008⟩))) (.node (.node (.single ⟨1168,1184,30976,30992⟩) (.single ⟨1168,1184,30992,31008⟩)) (.node (.single ⟨1152,1184,31008,31040⟩) (.node (.single ⟨1184,1200,30976,30992⟩) (.single ⟨1184,1200,30992,31008⟩))))))) (.node (.node (.node (.node (.node (.single ⟨1200,1216,30976,30992⟩) (.single ⟨1200,1216,30992,31008⟩)) (.node (.single ⟨1184,1216,31008,31040⟩) (.single ⟨1152,1184,31040,31072⟩))) (.node (.node (.single ⟨1152,1184,31072,31104⟩) (.single ⟨1184,1216,31040,31072⟩)) (.node (.single ⟨1184,1216,31072,31104⟩) (.single ⟨1216,1232,30976,30992⟩)))) (.node (.node (.node (.single ⟨1216,1232,30992,31008⟩) (.single ⟨1232,1248,30976,30992⟩)) (.node (.single ⟨1232,1248,30992,31008⟩) (.single ⟨1216,1232,31008,31024⟩))) (.node (.node (.single ⟨1216,1232,31024,31040⟩) (.single ⟨1232,1248,31008,31024⟩)) (.node (.single ⟨1232,1248,31024,31040⟩) (.node (.single ⟨1248,1264,30976,30992⟩) (.single ⟨1248,1264,30992,31008⟩)))))) (.node (.node (.node (.node (.single ⟨1264,1280,30976,30992⟩) (.single ⟨1264,1280,30992,31008⟩)) (.node (.single ⟨1248,1264,31008,31024⟩) (.single ⟨1248,1264,31024,31040⟩))) (.node (.node (.single ⟨1264,1280,31008,31024⟩) (.single ⟨1264,1280,31024,31040⟩)) (.node (.single ⟨1216,1248,31040,31072⟩) (.single ⟨1216,1248,31072,31104⟩)))) (.node (.node (.node (.single ⟨1248,1280,31040,31072⟩) (.single ⟨1248,1280,31072,31104⟩)) (.node (.single ⟨1152,1216,31104,31168⟩) (.single ⟨1152,1216,31168,31232⟩))) (.node (.node (.single ⟨1216,1248,31104,31136⟩) (.single ⟨1216,1248,31136,31168⟩)) (.node (.single ⟨1248,1280,31104,31136⟩) (.node (.single ⟨1248,1280,31136,31168⟩) (.single ⟨1216,1280,31168,31232⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨1536,1600,31488,31552⟩) (.single ⟨1536,1600,31552,31616⟩)) (.node (.single ⟨1600,1632,31488,31520⟩) (.single ⟨1600,1632,31520,31552⟩))) (.node (.node (.single ⟨1632,1664,31488,31520⟩) (.single ⟨1632,1664,31520,31552⟩)) (.node (.single ⟨1600,1664,31552,31616⟩) (.single ⟨1536,1600,31616,31680⟩)))) (.node (.node (.node (.single ⟨1536,1600,31680,31744⟩) (.single ⟨1600,1664,31616,31680⟩)) (.node (.single ⟨1600,1664,31680,31744⟩) (.single ⟨1664,1696,31488,31520⟩))) (.node (.node (.single ⟨1664,1696,31520,31552⟩) (.single ⟨1696,1728,31488,31520⟩)) (.node (.single ⟨1696,1728,31520,31552⟩) (.single ⟨1664,1696,31552,31584⟩))))) (.node (.node (.node (.node (.single ⟨1664,1696,31584,31616⟩) (.single ⟨1696,1728,31552,31584⟩)) (.node (.single ⟨1696,1728,31584,31616⟩) (.single ⟨1728,1744,31488,31504⟩))) (.node (.node (.single ⟨1728,1744,31504,31520⟩) (.single ⟨1744,1760,31488,31504⟩)) (.node (.single ⟨1744,1760,31504,31520⟩) (.single ⟨1728,1744,31520,31536⟩)))) (.node (.node (.node (.single ⟨1728,1744,31536,31552⟩) (.single ⟨1744,1760,31520,31536⟩)) (.node (.single ⟨1744,1760,31536,31552⟩) (.single ⟨1760,1776,31488,31504⟩))) (.node (.node (.single ⟨1760,1776,31504,31520⟩) (.single ⟨1776,1792,31488,31504⟩)) (.node (.single ⟨1776,1792,31504,31520⟩) (.node (.single ⟨1760,1776,31520,31536⟩) (.single ⟨1760,1776,31536,31552⟩))))))) (.node (.node (.node (.node (.node (.single ⟨1776,1792,31520,31536⟩) (.single ⟨1776,1792,31536,31552⟩)) (.node (.single ⟨1728,1760,31552,31584⟩) (.single ⟨1728,1760,31584,31616⟩))) (.node (.node (.single ⟨1760,1776,31552,31568⟩) (.single ⟨1760,1776,31568,31584⟩)) (.node (.single ⟨1776,1792,31552,31568⟩) (.single ⟨1776,1792,31568,31584⟩)))) (.node (.node (.node (.single ⟨1760,1776,31584,31600⟩) (.single ⟨1760,1776,31600,31616⟩)) (.node (.single ⟨1776,1792,31584,31600⟩) (.single ⟨1776,1792,31600,31616⟩))) (.node (.node (.single ⟨1664,1696,31616,31648⟩) (.single ⟨1664,1696,31648,31680⟩)) (.node (.single ⟨1696,1728,31616,31648⟩) (.node (.single ⟨1696,1728,31648,31680⟩) (.single ⟨1664,1696,31680,31712⟩)))))) (.node (.node (.node (.node (.single ⟨1664,1696,31712,31744⟩) (.single ⟨1696,1728,31680,31712⟩)) (.node (.single ⟨1696,1728,31712,31744⟩) (.single ⟨1728,1760,31616,31648⟩))) (.node (.node (.single ⟨1728,1760,31648,31680⟩) (.single ⟨1760,1776,31616,31632⟩)) (.node (.single ⟨1760,1776,31632,31648⟩) (.single ⟨1776,1792,31616,31632⟩)))) (.node (.node (.node (.single ⟨1776,1792,31632,31648⟩) (.single ⟨1760,1776,31648,31664⟩)) (.node (.single ⟨1760,1776,31664,31680⟩) (.single ⟨1776,1792,31648,31664⟩))) (.node (.node (.single ⟨1776,1792,31664,31680⟩) (.single ⟨1728,1760,31680,31712⟩)) (.node (.single ⟨1728,1760,31712,31744⟩) (.node (.single ⟨1760,1792,31680,31712⟩) (.single ⟨1760,1792,31712,31744⟩))))))))) (.node (.node (.node (.node (.node (.node (.node (.single ⟨30976,31008,1024,1056⟩) (.single ⟨30976,31008,1056,1088⟩)) (.node (.single ⟨31008,31040,1024,1056⟩) (.single ⟨31008,31040,1056,1088⟩))) (.node (.node (.single ⟨30976,30992,1088,1104⟩) (.single ⟨30976,30992,1104,1120⟩)) (.node (.single ⟨30992,31008,1088,1104⟩) (.single ⟨30992,31008,1104,1120⟩)))) (.node (.node (.node (.single ⟨30976,30992,1120,1136⟩) (.single ⟨30976,30992,1136,1152⟩)) (.node (.single ⟨30992,31008,1120,1136⟩) (.single ⟨30992,31008,1136,1152⟩))) (.node (.node (.single ⟨31008,31040,1088,1120⟩) (.single ⟨31008,31040,1120,1152⟩)) (.node (.single ⟨31040,31072,1024,1056⟩) (.single ⟨31040,31072,1056,1088⟩))))) (.node (.node (.node (.node (.single ⟨31072,31104,1024,1056⟩) (.single ⟨31072,31104,1056,1088⟩)) (.node (.single ⟨31040,31072,1088,1120⟩) (.single ⟨31040,31072,1120,1152⟩))) (.node (.node (.single ⟨31072,31104,1088,1120⟩) (.single ⟨31072,31104,1120,1152⟩)) (.node (.single ⟨30976,30992,1152,1168⟩) (.single ⟨30976,30992,1168,1184⟩)))) (.node (.node (.node (.single ⟨30992,31008,1152,1168⟩) (.single ⟨30992,31008,1168,1184⟩)) (.node (.single ⟨30976,30992,1184,1200⟩) (.single ⟨30976,30992,1200,1216⟩))) (.node (.node (.single ⟨30992,31008,1184,1200⟩) (.single ⟨30992,31008,1200,1216⟩)) (.node (.single ⟨31008,31040,1152,1184⟩) (.node (.single ⟨31008,31040,1184,1216⟩) (.single ⟨30976,30992,1216,1232⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30976,30992,1232,1248⟩) (.single ⟨30992,31008,1216,1232⟩)) (.node (.single ⟨30992,31008,1232,1248⟩) (.single ⟨30976,30992,1248,1264⟩))) (.node (.node (.single ⟨30976,30992,1264,1280⟩) (.single ⟨30992,31008,1248,1264⟩)) (.node (.single ⟨30992,31008,1264,1280⟩) (.single ⟨31008,31024,1216,1232⟩)))) (.node (.node (.node (.single ⟨31008,31024,1232,1248⟩) (.single ⟨31024,31040,1216,1232⟩)) (.node (.single ⟨31024,31040,1232,1248⟩) (.single ⟨31008,31024,1248,1264⟩))) (.node (.node (.single ⟨31008,31024,1264,1280⟩) (.single ⟨31024,31040,1248,1264⟩)) (.node (.single ⟨31024,31040,1264,1280⟩) (.node (.single ⟨31040,31072,1152,1184⟩) (.single ⟨31040,31072,1184,1216⟩)))))) (.node (.node (.node (.node (.single ⟨31072,31104,1152,1184⟩) (.single ⟨31072,31104,1184,1216⟩)) (.node (.single ⟨31040,31072,1216,1248⟩) (.single ⟨31040,31072,1248,1280⟩))) (.node (.node (.single ⟨31072,31104,1216,1248⟩) (.single ⟨31072,31104,1248,1280⟩)) (.node (.single ⟨31104,31168,1024,1088⟩) (.single ⟨31104,31168,1088,1152⟩)))) (.node (.node (.node (.single ⟨31168,31232,1024,1088⟩) (.single ⟨31168,31232,1088,1152⟩)) (.node (.single ⟨31104,31168,1152,1216⟩) (.single ⟨31104,31136,1216,1248⟩))) (.node (.node (.single ⟨31104,31136,1248,1280⟩) (.single ⟨31136,31168,1216,1248⟩)) (.node (.single ⟨31136,31168,1248,1280⟩) (.node (.single ⟨31168,31232,1152,1216⟩) (.single ⟨31168,31232,1216,1280⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨31488,31552,1536,1600⟩) (.single ⟨31488,31520,1600,1632⟩)) (.node (.single ⟨31488,31520,1632,1664⟩) (.single ⟨31520,31552,1600,1632⟩))) (.node (.node (.single ⟨31520,31552,1632,1664⟩) (.single ⟨31552,31616,1536,1600⟩)) (.node (.single ⟨31552,31616,1600,1664⟩) (.single ⟨31488,31520,1664,1696⟩)))) (.node (.node (.node (.single ⟨31488,31520,1696,1728⟩) (.single ⟨31520,31552,1664,1696⟩)) (.node (.single ⟨31520,31552,1696,1728⟩) (.single ⟨31488,31504,1728,1744⟩))) (.node (.node (.single ⟨31488,31504,1744,1760⟩) (.single ⟨31504,31520,1728,1744⟩)) (.node (.single ⟨31504,31520,1744,1760⟩) (.single ⟨31488,31504,1760,1776⟩))))) (.node (.node (.node (.node (.single ⟨31488,31504,1776,1792⟩) (.single ⟨31504,31520,1760,1776⟩)) (.node (.single ⟨31504,31520,1776,1792⟩) (.single ⟨31520,31536,1728,1744⟩))) (.node (.node (.single ⟨31520,31536,1744,1760⟩) (.single ⟨31536,31552,1728,1744⟩)) (.node (.single ⟨31536,31552,1744,1760⟩) (.single ⟨31520,31536,1760,1776⟩)))) (.node (.node (.node (.single ⟨31520,31536,1776,1792⟩) (.single ⟨31536,31552,1760,1776⟩)) (.node (.single ⟨31536,31552,1776,1792⟩) (.single ⟨31552,31584,1664,1696⟩))) (.node (.node (.single ⟨31552,31584,1696,1728⟩) (.single ⟨31584,31616,1664,1696⟩)) (.node (.single ⟨31584,31616,1696,1728⟩) (.node (.single ⟨31552,31584,1728,1760⟩) (.single ⟨31552,31568,1760,1776⟩))))))) (.node (.node (.node (.node (.node (.single ⟨31552,31568,1776,1792⟩) (.single ⟨31568,31584,1760,1776⟩)) (.node (.single ⟨31568,31584,1776,1792⟩) (.single ⟨31584,31616,1728,1760⟩))) (.node (.node (.single ⟨31584,31600,1760,1776⟩) (.single ⟨31584,31600,1776,1792⟩)) (.node (.single ⟨31600,31616,1760,1776⟩) (.single ⟨31600,31616,1776,1792⟩)))) (.node (.node (.node (.single ⟨31616,31680,1536,1600⟩) (.single ⟨31616,31680,1600,1664⟩)) (.node (.single ⟨31680,31744,1536,1600⟩) (.single ⟨31680,31744,1600,1664⟩))) (.node (.node (.single ⟨31616,31648,1664,1696⟩) (.single ⟨31616,31648,1696,1728⟩)) (.node (.single ⟨31648,31680,1664,1696⟩) (.node (.single ⟨31648,31680,1696,1728⟩) (.single ⟨31616,31648,1728,1760⟩)))))) (.node (.node (.node (.node (.single ⟨31616,31632,1760,1776⟩) (.single ⟨31616,31632,1776,1792⟩)) (.node (.single ⟨31632,31648,1760,1776⟩) (.single ⟨31632,31648,1776,1792⟩))) (.node (.node (.single ⟨31648,31680,1728,1760⟩) (.single ⟨31648,31664,1760,1776⟩)) (.node (.single ⟨31648,31664,1776,1792⟩) (.single ⟨31664,31680,1760,1776⟩)))) (.node (.node (.node (.single ⟨31664,31680,1776,1792⟩) (.single ⟨31680,31712,1664,1696⟩)) (.node (.single ⟨31680,31712,1696,1728⟩) (.single ⟨31712,31744,1664,1696⟩))) (.node (.node (.single ⟨31712,31744,1696,1728⟩) (.single ⟨31680,31712,1728,1760⟩)) (.node (.single ⟨31680,31712,1760,1792⟩) (.node (.single ⟨31712,31744,1728,1760⟩) (.single ⟨31712,31744,1760,1792⟩))))))))))
def output21 : Fin 268 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 268 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 22) (.single 190)) (.node (.single 245) (.single 77))) (.node (.node (.single 23) (.single 192)) (.node (.single 244) (.single 75)))) (.node (.node (.node (.single 24) (.single 191)) (.node (.single 243) (.single 76))) (.node (.node (.single 25) (.single 193)) (.node (.single 242) (.single 74))))) (.node (.node (.node (.node (.single 60) (.single 194)) (.node (.single 207) (.single 73))) (.node (.node (.single 61) (.single 199)) (.node (.single 206) (.single 68)))) (.node (.node (.node (.single 66) (.single 200)) (.node (.single 201) (.single 67))) (.node (.node (.single 0) (.single 134)) (.node (.single 267) (.node (.single 133) (.single 1))))))) (.node (.node (.node (.node (.node (.single 136) (.single 266)) (.node (.single 131) (.single 2))) (.node (.node (.single 135) (.single 265)) (.node (.single 132) (.single 3)))) (.node (.node (.node (.single 137) (.single 264)) (.node (.single 130) (.single 12))) (.node (.node (.single 146) (.single 255)) (.node (.single 121) (.node (.single 17) (.single 147)))))) (.node (.node (.node (.node (.single 250) (.single 120)) (.node (.single 30) (.single 164))) (.node (.node (.single 237) (.single 103)) (.node (.single 35) (.single 165)))) (.node (.node (.node (.single 232) (.single 102)) (.node (.single 56) (.single 186))) (.node (.node (.single 211) (.single 81)) (.node (.single 57) (.node (.single 188) (.single 210)))))))) (.node (.node (.node (.node (.node (.node (.single 79) (.single 58)) (.node (.single 187) (.single 209))) (.node (.node (.single 80) (.single 59)) (.node (.single 189) (.single 208)))) (.node (.node (.node (.single 78) (.single 4)) (.node (.single 148) (.single 263))) (.node (.node (.single 119) (.single 5)) (.node (.single 150) (.single 262))))) (.node (.node (.node (.node (.single 117) (.single 6)) (.node (.single 149) (.single 261))) (.node (.node (.single 118) (.single 7)) (.node (.single 151) (.single 260)))) (.node (.node (.node (.single 116) (.single 18)) (.node (.single 152) (.single 249))) (.node (.node (.single 115) (.single 19)) (.node (.single 154) (.node (.single 248) (.single 113))))))) (.node (.node (.node (.node (.node (.single 20) (.single 153)) (.node (.single 247) (.single 114))) (.node (.node (.single 21) (.single 155)) (.node (.single 246) (.single 112)))) (.node (.node (.node (.single 36) (.single 182)) (.node (.single 231) (.single 85))) (.node (.node (.single 37) (.single 184)) (.node (.single 230) (.node (.single 83) (.single 38)))))) (.node (.node (.node (.node (.single 183) (.single 229)) (.node (.single 84) (.single 39))) (.node (.node (.single 185) (.single 228)) (.node (.single 82) (.single 62)))) (.node (.node (.node (.single 195) (.single 205)) (.node (.single 72) (.single 63))) (.node (.node (.single 197) (.single 204)) (.node (.single 70) (.node (.single 64) (.single 196))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 203) (.single 71)) (.node (.single 65) (.single 198))) (.node (.node (.single 202) (.single 69)) (.node (.single 40) (.single 166)))) (.node (.node (.node (.single 227) (.single 101)) (.node (.single 41) (.single 168))) (.node (.node (.single 226) (.single 99)) (.node (.single 42) (.single 167))))) (.node (.node (.node (.node (.single 225) (.single 100)) (.node (.single 43) (.single 169))) (.node (.node (.single 224) (.single 98)) (.node (.single 48) (.single 170)))) (.node (.node (.node (.single 219) (.single 97)) (.node (.single 49) (.single 172))) (.node (.node (.single 218) (.single 95)) (.node (.single 50) (.node (.single 171) (.single 217))))))) (.node (.node (.node (.node (.node (.single 96) (.single 51)) (.node (.single 173) (.single 216))) (.node (.node (.single 94) (.single 8)) (.node (.single 138) (.single 259)))) (.node (.node (.node (.single 129) (.single 9)) (.node (.single 140) (.single 258))) (.node (.node (.single 127) (.single 10)) (.node (.single 139) (.node (.single 257) (.single 128)))))) (.node (.node (.node (.node (.single 11) (.single 141)) (.node (.single 256) (.single 126))) (.node (.node (.single 13) (.single 142)) (.node (.single 254) (.single 125)))) (.node (.node (.node (.single 14) (.single 144)) (.node (.single 253) (.single 123))) (.node (.node (.single 15) (.single 143)) (.node (.single 252) (.node (.single 124) (.single 16)))))))) (.node (.node (.node (.node (.node (.node (.single 145) (.single 251)) (.node (.single 122) (.single 26))) (.node (.node (.single 156) (.single 241)) (.node (.single 111) (.single 27)))) (.node (.node (.node (.single 158) (.single 240)) (.node (.single 109) (.single 28))) (.node (.node (.single 157) (.single 239)) (.node (.single 110) (.single 29))))) (.node (.node (.node (.node (.single 159) (.single 238)) (.node (.single 108) (.single 31))) (.node (.node (.single 160) (.single 236)) (.node (.single 107) (.single 32)))) (.node (.node (.node (.single 162) (.single 235)) (.node (.single 105) (.single 33))) (.node (.node (.single 161) (.single 234)) (.node (.single 106) (.node (.single 34) (.single 163))))))) (.node (.node (.node (.node (.node (.single 233) (.single 104)) (.node (.single 44) (.single 174))) (.node (.node (.single 223) (.single 93)) (.node (.single 45) (.single 176)))) (.node (.node (.node (.single 222) (.single 91)) (.node (.single 46) (.single 175))) (.node (.node (.single 221) (.single 92)) (.node (.single 47) (.node (.single 177) (.single 220)))))) (.node (.node (.node (.node (.single 90) (.single 52)) (.node (.single 178) (.single 215))) (.node (.node (.single 89) (.single 53)) (.node (.single 180) (.single 214)))) (.node (.node (.node (.single 87) (.single 54)) (.node (.single 179) (.single 213))) (.node (.node (.single 88) (.single 55)) (.node (.single 181) (.node (.single 212) (.single 86))))))))))
def sourceData21 : FiniteInputTree ℕ 268 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 76) (.single 80)) (.node (.single 84) (.single 88)))) (.node (.node (.node (.single 172) (.single 176)) (.node (.single 180) (.single 184))) (.node (.node (.single 44) (.single 188)) (.node (.single 192) (.single 196))))) (.node (.node (.node (.node (.single 200) (.single 48)) (.node (.single 92) (.single 96))) (.node (.node (.single 100) (.single 104)) (.node (.single 0) (.single 4)))) (.node (.node (.node (.single 8) (.single 12)) (.node (.single 204) (.single 208))) (.node (.node (.single 212) (.single 216)) (.node (.single 52) (.node (.single 220) (.single 224))))))) (.node (.node (.node (.node (.node (.single 228) (.single 232)) (.node (.single 56) (.single 108))) (.node (.node (.single 112) (.single 116)) (.node (.single 120) (.single 140)))) (.node (.node (.node (.single 144) (.single 148)) (.node (.single 152) (.single 236))) (.node (.node (.single 240) (.single 244)) (.node (.single 248) (.node (.single 156) (.single 160)))))) (.node (.node (.node (.node (.single 164) (.single 168)) (.node (.single 252) (.single 256))) (.node (.node (.single 260) (.single 264)) (.node (.single 60) (.single 64)))) (.node (.node (.node (.single 68) (.single 72)) (.node (.single 16) (.single 20))) (.node (.node (.single 124) (.single 128)) (.node (.single 132) (.node (.single 136) (.single 24)))))))) (.node (.node (.node (.node (.node (.node (.single 27) (.single 23)) (.node (.single 139) (.single 131))) (.node (.node (.single 135) (.single 127)) (.node (.single 19) (.single 15)))) (.node (.node (.node (.single 7) (.single 11)) (.node (.single 3) (.single 75))) (.node (.node (.single 67) (.single 71)) (.node (.single 63) (.single 123))))) (.node (.node (.node (.node (.single 115) (.single 119)) (.node (.single 111) (.single 267))) (.node (.node (.single 259) (.single 263)) (.node (.single 255) (.single 251)))) (.node (.node (.node (.single 243) (.single 247)) (.node (.single 239) (.single 171))) (.node (.node (.single 163) (.single 167)) (.node (.single 159) (.node (.single 155) (.single 147))))))) (.node (.node (.node (.node (.node (.single 151) (.single 143)) (.node (.single 59) (.single 55))) (.node (.node (.single 235) (.single 227)) (.node (.single 231) (.single 223)))) (.node (.node (.node (.single 219) (.single 211)) (.node (.single 215) (.single 207))) (.node (.node (.single 107) (.single 99)) (.node (.single 103) (.node (.single 95) (.single 91)))))) (.node (.node (.node (.node (.single 83) (.single 87)) (.node (.single 79) (.single 51))) (.node (.node (.single 47) (.single 203)) (.node (.single 195) (.single 199)))) (.node (.node (.node (.single 191) (.single 187)) (.node (.single 179) (.single 183))) (.node (.node (.single 175) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 173) (.single 181)) (.node (.single 177) (.single 185)))) (.node (.node (.node (.single 189) (.single 197)) (.node (.single 193) (.single 201))) (.node (.node (.single 45) (.single 49)) (.node (.single 77) (.single 85))))) (.node (.node (.node (.node (.single 81) (.single 89)) (.node (.single 93) (.single 101))) (.node (.node (.single 97) (.single 105)) (.node (.single 205) (.single 213)))) (.node (.node (.node (.single 209) (.single 217)) (.node (.single 221) (.single 229))) (.node (.node (.single 225) (.single 233)) (.node (.single 53) (.node (.single 57) (.single 141))))))) (.node (.node (.node (.node (.node (.single 149) (.single 145)) (.node (.single 153) (.single 157))) (.node (.node (.single 165) (.single 161)) (.node (.single 169) (.single 237)))) (.node (.node (.node (.single 245) (.single 241)) (.node (.single 249) (.single 253))) (.node (.node (.single 261) (.single 257)) (.node (.single 265) (.node (.single 109) (.single 117)))))) (.node (.node (.node (.node (.single 113) (.single 121)) (.node (.single 61) (.single 69))) (.node (.node (.single 65) (.single 73)) (.node (.single 1) (.single 9)))) (.node (.node (.node (.single 5) (.single 13)) (.node (.single 17) (.single 125))) (.node (.node (.single 133) (.single 129)) (.node (.single 137) (.node (.single 21) (.single 25)))))))) (.node (.node (.node (.node (.node (.node (.single 26) (.single 138)) (.node (.single 134) (.single 130))) (.node (.node (.single 126) (.single 22)) (.node (.single 18) (.single 74)))) (.node (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.single 266))) (.node (.node (.single 262) (.single 258)) (.node (.single 254) (.single 170))))) (.node (.node (.node (.node (.single 166) (.single 162)) (.node (.single 158) (.single 250))) (.node (.node (.single 246) (.single 242)) (.node (.single 238) (.single 154)))) (.node (.node (.node (.single 150) (.single 146)) (.node (.single 142) (.single 122))) (.node (.node (.single 118) (.single 114)) (.node (.single 110) (.node (.single 58) (.single 234))))))) (.node (.node (.node (.node (.node (.single 230) (.single 226)) (.node (.single 222) (.single 54))) (.node (.node (.single 218) (.single 214)) (.node (.single 210) (.single 206)))) (.node (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 106) (.single 102)) (.node (.single 98) (.node (.single 94) (.single 50)))))) (.node (.node (.node (.node (.single 202) (.single 198)) (.node (.single 194) (.single 190))) (.node (.node (.single 46) (.single 186)) (.node (.single 182) (.single 178)))) (.node (.node (.node (.single 174) (.single 90)) (.node (.single 86) (.single 82))) (.node (.node (.single 78) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))))
def cover21 (i : Fin 268) : Fin 268 := ⟨coverData21.get i % 268, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 268) : Fin 268 := ⟨sourceData21.get i % 268, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 (.cutX 1280 (.cutY 30976 .empty (.cutX 1152 (.cutY 31104 (.cutX 1088 (.cutY 31040 (.cutX 1056 (.cutY 31008 .full .full) (.cutY 31008 .full .full)) (.cutX 1056 (.cutY 31072 .full .full) (.cutY 31072 .full .full))) (.cutY 31040 (.cutX 1120 (.cutY 31008 (.cutX 1104 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) .full) (.cutY 31008 (.cutX 1136 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) .full)) (.cutX 1120 (.cutY 31072 .full .full) (.cutY 31072 .full .full)))) (.cutX 1088 (.cutY 31168 .full .full) (.cutY 31168 .full .full))) (.cutY 31104 (.cutX 1216 (.cutY 31040 (.cutX 1184 (.cutY 31008 (.cutX 1168 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) .full) (.cutY 31008 (.cutX 1200 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) .full)) (.cutX 1184 (.cutY 31072 .full .full) (.cutY 31072 .full .full))) (.cutY 31040 (.cutX 1248 (.cutY 31008 (.cutX 1232 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) (.cutX 1232 (.cutY 31024 .full .full) (.cutY 31024 .full .full))) (.cutY 31008 (.cutX 1264 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) (.cutX 1264 (.cutY 31024 .full .full) (.cutY 31024 .full .full)))) (.cutX 1248 (.cutY 31072 .full .full) (.cutY 31072 .full .full)))) (.cutX 1216 (.cutY 31168 .full .full) (.cutY 31168 (.cutX 1248 (.cutY 31136 .full .full) (.cutY 31136 .full .full)) .full))))) .empty) .empty) (.cutY 31232 .empty (.cutX 1792 (.cutY 31488 .empty (.cutX 1664 (.cutY 31616 (.cutX 1600 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 1632 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) .full)) (.cutX 1600 (.cutY 31680 .full .full) (.cutY 31680 .full .full))) (.cutY 31616 (.cutX 1728 (.cutY 31552 (.cutX 1696 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) (.cutX 1696 (.cutY 31584 .full .full) (.cutY 31584 .full .full))) (.cutY 31552 (.cutX 1760 (.cutY 31520 (.cutX 1744 (.cutY 31504 .full .full) (.cutY 31504 .full .full)) (.cutX 1744 (.cutY 31536 .full .full) (.cutY 31536 .full .full))) (.cutY 31520 (.cutX 1776 (.cutY 31504 .full .full) (.cutY 31504 .full .full)) (.cutX 1776 (.cutY 31536 .full .full) (.cutY 31536 .full .full)))) (.cutX 1760 (.cutY 31584 .full .full) (.cutY 31584 (.cutX 1776 (.cutY 31568 .full .full) (.cutY 31568 .full .full)) (.cutX 1776 (.cutY 31600 .full .full) (.cutY 31600 .full .full)))))) (.cutX 1728 (.cutY 31680 (.cutX 1696 (.cutY 31648 .full .full) (.cutY 31648 .full .full)) (.cutX 1696 (.cutY 31712 .full .full) (.cutY 31712 .full .full))) (.cutY 31680 (.cutX 1760 (.cutY 31648 .full .full) (.cutY 31648 (.cutX 1776 (.cutY 31632 .full .full) (.cutY 31632 .full .full)) (.cutX 1776 (.cutY 31664 .full .full) (.cutY 31664 .full .full)))) (.cutX 1760 (.cutY 31712 .full .full) (.cutY 31712 .full .full))))))) .empty))) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 (.cutY 1536 (.cutX 30976 .empty (.cutY 1280 (.cutX 31104 (.cutY 1152 (.cutX 31040 (.cutY 1088 (.cutX 31008 (.cutY 1056 .full .full) (.cutY 1056 .full .full)) (.cutX 31008 (.cutY 1120 (.cutX 30992 (.cutY 1104 .full .full) (.cutY 1104 .full .full)) (.cutX 30992 (.cutY 1136 .full .full) (.cutY 1136 .full .full))) (.cutY 1120 .full .full))) (.cutY 1088 (.cutX 31072 (.cutY 1056 .full .full) (.cutY 1056 .full .full)) (.cutX 31072 (.cutY 1120 .full .full) (.cutY 1120 .full .full)))) (.cutX 31040 (.cutY 1216 (.cutX 31008 (.cutY 1184 (.cutX 30992 (.cutY 1168 .full .full) (.cutY 1168 .full .full)) (.cutX 30992 (.cutY 1200 .full .full) (.cutY 1200 .full .full))) (.cutY 1184 .full .full)) (.cutX 31008 (.cutY 1248 (.cutX 30992 (.cutY 1232 .full .full) (.cutY 1232 .full .full)) (.cutX 30992 (.cutY 1264 .full .full) (.cutY 1264 .full .full))) (.cutY 1248 (.cutX 31024 (.cutY 1232 .full .full) (.cutY 1232 .full .full)) (.cutX 31024 (.cutY 1264 .full .full) (.cutY 1264 .full .full))))) (.cutY 1216 (.cutX 31072 (.cutY 1184 .full .full) (.cutY 1184 .full .full)) (.cutX 31072 (.cutY 1248 .full .full) (.cutY 1248 .full .full))))) (.cutY 1152 (.cutX 31168 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 31168 (.cutY 1216 .full (.cutX 31136 (.cutY 1248 .full .full) (.cutY 1248 .full .full))) (.cutY 1216 .full .full)))) .empty)) .empty) (.cutY 1536 .empty (.cutX 31488 .empty (.cutY 1792 (.cutX 31616 (.cutY 1664 (.cutX 31552 (.cutY 1600 .full (.cutX 31520 (.cutY 1632 .full .full) (.cutY 1632 .full .full))) (.cutY 1600 .full .full)) (.cutX 31552 (.cutY 1728 (.cutX 31520 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 31520 (.cutY 1760 (.cutX 31504 (.cutY 1744 .full .full) (.cutY 1744 .full .full)) (.cutX 31504 (.cutY 1776 .full .full) (.cutY 1776 .full .full))) (.cutY 1760 (.cutX 31536 (.cutY 1744 .full .full) (.cutY 1744 .full .full)) (.cutX 31536 (.cutY 1776 .full .full) (.cutY 1776 .full .full))))) (.cutY 1728 (.cutX 31584 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 31584 (.cutY 1760 .full (.cutX 31568 (.cutY 1776 .full .full) (.cutY 1776 .full .full))) (.cutY 1760 .full (.cutX 31600 (.cutY 1776 .full .full) (.cutY 1776 .full .full))))))) (.cutY 1664 (.cutX 31680 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 31680 (.cutY 1728 (.cutX 31648 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 31648 (.cutY 1760 .full (.cutX 31632 (.cutY 1776 .full .full) (.cutY 1776 .full .full))) (.cutY 1760 .full (.cutX 31664 (.cutY 1776 .full .full) (.cutY 1776 .full .full))))) (.cutY 1728 (.cutX 31712 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 31712 (.cutY 1760 .full .full) (.cutY 1760 .full .full)))))) .empty))))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata21 : 0<142718076 ∧ 4<128 ∧ 121<128 ∧ 3<4 ∧
    13097/4160=3 ∧ 13097%4160=617 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 64,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 268 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked21_64 : ∀ i : Fin 64,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 268 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked21_128 : ∀ i : Fin 64,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 268 128 64 (by decide) i) := by decide +kernel

theorem sourceChecked21_192 : ∀ i : Fin 64,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 268 192 64 (by decide) i) := by decide +kernel

theorem sourceChecked21_256 : ∀ i : Fin 12,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 268 256 12 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 268, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) (forallFinOffset_add (fun i => output21 i = raw21 (source21 i)) 0 64 204 (by decide) sourceChecked21_0
    (forallFinOffset_add (fun i => output21 i = raw21 (source21 i)) 64 64 140 (by decide) sourceChecked21_64
    (forallFinOffset_add (fun i => output21 i = raw21 (source21 i)) 128 64 76 (by decide) sourceChecked21_128
    (forallFinOffset_add (fun i => output21 i = raw21 (source21 i)) 192 64 12 (by decide) sourceChecked21_192
    sourceChecked21_256))))

theorem coverChecked21_0 : ∀ i : Fin 64,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 268 0 64 (by decide) i) := by decide +kernel

theorem coverChecked21_64 : ∀ i : Fin 64,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 268 64 64 (by decide) i) := by decide +kernel

theorem coverChecked21_128 : ∀ i : Fin 64,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 268 128 64 (by decide) i) := by decide +kernel

theorem coverChecked21_192 : ∀ i : Fin 64,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 268 192 64 (by decide) i) := by decide +kernel

theorem coverChecked21_256 : ∀ i : Fin 12,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 268 256 12 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 268, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
  forallFin_of_zero_offset (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (forallFinOffset_add (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) 0 64 204 (by decide) coverChecked21_0
    (forallFinOffset_add (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) 64 64 140 (by decide) coverChecked21_64
    (forallFinOffset_add (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) 128 64 76 (by decide) coverChecked21_128
    (forallFinOffset_add (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) 192 64 12 (by decide) coverChecked21_192
    coverChecked21_256))))

theorem treeChecked21 : tree21.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves21 : List.ofFn output21 = tree21.leaves ⟨0,32768,0,32768⟩ := by
  unfold output21
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked21 : gridTreeUnionCheck 32768 raw21 output21 cover21 source21 tree21 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked21, coverChecked21, treeChecked21, treeLeaves21⟩

theorem areaUnits21 : gridUnionAreaUnits output21 = 262144 := by decide +kernel

noncomputable def phaseMass21 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 15323, atom 13098, type 3, source (4,122).
def leavesData22 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨2,0,2⟩) (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)))) (.node (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves22 : Fin 19 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 4 122 leaves22 i
def outputData22 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨1024,1088,31232,31296⟩) (.single ⟨1024,1088,31296,31360⟩)) (.node (.single ⟨1088,1152,31232,31296⟩) (.single ⟨1088,1152,31296,31360⟩))) (.node (.node (.single ⟨1024,1088,31360,31424⟩) (.single ⟨1024,1088,31424,31488⟩)) (.node (.single ⟨1088,1152,31360,31424⟩) (.node (.single ⟨1088,1152,31424,31488⟩) (.single ⟨1152,1216,31232,31296⟩))))) (.node (.node (.node (.single ⟨1152,1216,31296,31360⟩) (.single ⟨1216,1248,31232,31264⟩)) (.node (.single ⟨1216,1248,31264,31296⟩) (.node (.single ⟨1248,1280,31232,31264⟩) (.single ⟨1248,1280,31264,31296⟩)))) (.node (.node (.single ⟨1216,1280,31296,31360⟩) (.single ⟨1152,1216,31360,31424⟩)) (.node (.single ⟨1152,1216,31424,31488⟩) (.node (.single ⟨1216,1280,31360,31424⟩) (.single ⟨1216,1280,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨1280,1344,31488,31552⟩) (.single ⟨1280,1344,31552,31616⟩)) (.node (.single ⟨1344,1408,31488,31552⟩) (.single ⟨1344,1408,31552,31616⟩))) (.node (.node (.single ⟨1280,1344,31616,31680⟩) (.single ⟨1280,1344,31680,31744⟩)) (.node (.single ⟨1344,1408,31616,31680⟩) (.node (.single ⟨1344,1408,31680,31744⟩) (.single ⟨1408,1472,31488,31552⟩))))) (.node (.node (.node (.single ⟨1408,1472,31552,31616⟩) (.single ⟨1472,1504,31488,31520⟩)) (.node (.single ⟨1472,1504,31520,31552⟩) (.node (.single ⟨1504,1536,31488,31520⟩) (.single ⟨1504,1536,31520,31552⟩)))) (.node (.node (.single ⟨1472,1536,31552,31616⟩) (.single ⟨1408,1472,31616,31680⟩)) (.node (.single ⟨1408,1472,31680,31744⟩) (.node (.single ⟨1472,1536,31616,31680⟩) (.single ⟨1472,1536,31680,31744⟩))))))) (.node (.node (.node (.node (.node (.single ⟨31232,31296,1024,1088⟩) (.single ⟨31232,31296,1088,1152⟩)) (.node (.single ⟨31296,31360,1024,1088⟩) (.single ⟨31296,31360,1088,1152⟩))) (.node (.node (.single ⟨31232,31296,1152,1216⟩) (.single ⟨31232,31264,1216,1248⟩)) (.node (.single ⟨31232,31264,1248,1280⟩) (.node (.single ⟨31264,31296,1216,1248⟩) (.single ⟨31264,31296,1248,1280⟩))))) (.node (.node (.node (.single ⟨31296,31360,1152,1216⟩) (.single ⟨31296,31360,1216,1280⟩)) (.node (.single ⟨31360,31424,1024,1088⟩) (.node (.single ⟨31360,31424,1088,1152⟩) (.single ⟨31424,31488,1024,1088⟩)))) (.node (.node (.single ⟨31424,31488,1088,1152⟩) (.single ⟨31360,31424,1152,1216⟩)) (.node (.single ⟨31360,31424,1216,1280⟩) (.node (.single ⟨31424,31488,1152,1216⟩) (.single ⟨31424,31488,1216,1280⟩)))))) (.node (.node (.node (.node (.single ⟨31488,31552,1280,1344⟩) (.single ⟨31488,31552,1344,1408⟩)) (.node (.single ⟨31552,31616,1280,1344⟩) (.single ⟨31552,31616,1344,1408⟩))) (.node (.node (.single ⟨31488,31552,1408,1472⟩) (.single ⟨31488,31520,1472,1504⟩)) (.node (.single ⟨31488,31520,1504,1536⟩) (.node (.single ⟨31520,31552,1472,1504⟩) (.single ⟨31520,31552,1504,1536⟩))))) (.node (.node (.node (.single ⟨31552,31616,1408,1472⟩) (.single ⟨31552,31616,1472,1536⟩)) (.node (.single ⟨31616,31680,1280,1344⟩) (.node (.single ⟨31616,31680,1344,1408⟩) (.single ⟨31680,31744,1280,1344⟩)))) (.node (.node (.single ⟨31680,31744,1344,1408⟩) (.single ⟨31616,31680,1408,1472⟩)) (.node (.single ⟨31616,31680,1472,1536⟩) (.node (.single ⟨31680,31744,1408,1472⟩) (.single ⟨31680,31744,1472,1536⟩))))))))
def output22 : Fin 76 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.single 37))) (.node (.node (.single 1) (.single 40)) (.node (.single 74) (.node (.single 35) (.single 2))))) (.node (.node (.node (.single 39) (.single 73)) (.node (.single 36) (.node (.single 3) (.single 41)))) (.node (.node (.single 72) (.single 34)) (.node (.single 8) (.node (.single 42) (.single 67)))))) (.node (.node (.node (.node (.single 33) (.single 9)) (.node (.single 47) (.single 66))) (.node (.node (.single 28) (.single 15)) (.node (.single 53) (.node (.single 60) (.single 22))))) (.node (.node (.node (.single 16) (.single 55)) (.node (.single 59) (.node (.single 20) (.single 14)))) (.node (.node (.single 48) (.single 61)) (.node (.single 27) (.node (.single 17) (.single 54))))))) (.node (.node (.node (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.single 56))) (.node (.node (.single 57) (.single 19)) (.node (.single 4) (.node (.single 49) (.single 71))))) (.node (.node (.node (.single 26) (.single 5)) (.node (.single 51) (.node (.single 70) (.single 24)))) (.node (.node (.single 6) (.single 50)) (.node (.single 69) (.node (.single 25) (.single 7)))))) (.node (.node (.node (.node (.single 52) (.single 68)) (.node (.single 23) (.single 10))) (.node (.node (.single 43) (.single 65)) (.node (.single 32) (.node (.single 11) (.single 45))))) (.node (.node (.node (.single 64) (.single 30)) (.node (.single 12) (.node (.single 44) (.single 63)))) (.node (.node (.single 31) (.single 13)) (.node (.single 46) (.node (.single 62) (.single 29))))))))
def sourceData22 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 44) (.single 48)) (.node (.single 52) (.node (.single 56) (.single 16))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 72)))) (.node (.node (.single 32) (.single 24)) (.node (.single 28) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 31)) (.node (.single 39) (.single 27))) (.node (.node (.single 59) (.single 51)) (.node (.single 55) (.node (.single 47) (.single 35))))) (.node (.node (.node (.single 23) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63)))) (.node (.node (.single 19) (.single 15)) (.node (.single 7) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73))))) (.node (.node (.node (.single 21) (.single 33)) (.node (.single 45) (.node (.single 53) (.single 49)))) (.node (.node (.single 57) (.single 25)) (.node (.single 37) (.node (.single 29) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 30) (.single 26))) (.node (.node (.single 34) (.single 74)) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 22) (.single 18)) (.node (.single 58) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2))))))))
def cover22 (i : Fin 76) : Fin 76 := ⟨coverData22.get i % 76, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 76) : Fin 76 := ⟨sourceData22.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 .empty (.cutX 1280 (.cutY 31488 (.cutX 1152 (.cutY 31360 (.cutX 1088 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 1088 (.cutY 31424 .full .full) (.cutY 31424 .full .full))) (.cutY 31360 (.cutX 1216 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 1248 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 1216 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) (.cutY 31488 .empty (.cutX 1408 (.cutY 31616 (.cutX 1344 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 1344 (.cutY 31680 .full .full) (.cutY 31680 .full .full))) (.cutY 31616 (.cutX 1472 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 1504 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) .full)) (.cutX 1472 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))))) .empty) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 .empty (.cutY 1536 (.cutX 31488 (.cutY 1280 (.cutX 31360 (.cutY 1152 (.cutX 31296 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 31296 (.cutY 1216 .full (.cutX 31264 (.cutY 1248 .full .full) (.cutY 1248 .full .full))) (.cutY 1216 .full .full))) (.cutY 1152 (.cutX 31424 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 31424 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty) (.cutY 1280 .empty (.cutX 31616 (.cutY 1408 (.cutX 31552 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 31552 (.cutY 1472 .full (.cutX 31520 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 (.cutX 31680 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 31680 (.cutY 1472 .full .full) (.cutY 1472 .full .full)))))) .empty))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata22 : 0<142718076 ∧ 4<128 ∧ 122<128 ∧ 3<4 ∧
    13098/4160=3 ∧ 13098%4160=618 ∧ ∀ i, (leaves22 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData22).mp
    (by decide +kernel)

theorem sourceChecked22_0 : ∀ i : Fin 64,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked22_64 : ∀ i : Fin 12,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked22 : ∀ i : Fin 76, (fun i => output22 i = raw22 (source22 i)) i :=
  forallFin_of_zero_offset (fun i => output22 i = raw22 (source22 i)) (forallFinOffset_add (fun i => output22 i = raw22 (source22 i)) 0 64 12 (by decide) sourceChecked22_0
    sourceChecked22_64)

theorem coverChecked22_0 : ∀ i : Fin 64,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked22_64 : ∀ i : Fin 12,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked22 : ∀ i : Fin 76, (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) i :=
  forallFin_of_zero_offset (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (forallFinOffset_add (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) 0 64 12 (by decide) coverChecked22_0
    coverChecked22_64)

theorem treeChecked22 : tree22.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves22 : List.ofFn output22 = tree22.leaves ⟨0,32768,0,32768⟩ := by
  unfold output22
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked22 : gridTreeUnionCheck 32768 raw22 output22 cover22 source22 tree22 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked22, coverChecked22, treeChecked22, treeLeaves22⟩

theorem areaUnits22 : gridUnionAreaUnits output22 = 262144 := by decide +kernel

noncomputable def phaseMass22 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 15324, atom 12977, type 3, source (3,122).
def leavesData23 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves23 : Fin 16 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 3 122 leaves23 i
def outputData23 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨768,832,31232,31296⟩) (.single ⟨768,832,31296,31360⟩)) (.node (.single ⟨832,896,31232,31296⟩) (.single ⟨832,896,31296,31360⟩))) (.node (.node (.single ⟨768,832,31360,31424⟩) (.single ⟨768,832,31424,31488⟩)) (.node (.single ⟨832,896,31360,31424⟩) (.single ⟨832,896,31424,31488⟩)))) (.node (.node (.node (.single ⟨896,960,31232,31296⟩) (.single ⟨896,960,31296,31360⟩)) (.node (.single ⟨960,1024,31232,31296⟩) (.single ⟨960,1024,31296,31360⟩))) (.node (.node (.single ⟨896,960,31360,31424⟩) (.single ⟨896,960,31424,31488⟩)) (.node (.single ⟨960,1024,31360,31424⟩) (.single ⟨960,1024,31424,31488⟩))))) (.node (.node (.node (.node (.single ⟨1280,1344,31744,31808⟩) (.single ⟨1280,1344,31808,31872⟩)) (.node (.single ⟨1344,1408,31744,31808⟩) (.single ⟨1344,1408,31808,31872⟩))) (.node (.node (.single ⟨1280,1344,31872,31936⟩) (.single ⟨1280,1344,31936,32000⟩)) (.node (.single ⟨1344,1408,31872,31936⟩) (.single ⟨1344,1408,31936,32000⟩)))) (.node (.node (.node (.single ⟨1408,1472,31744,31808⟩) (.single ⟨1408,1472,31808,31872⟩)) (.node (.single ⟨1472,1536,31744,31808⟩) (.single ⟨1472,1536,31808,31872⟩))) (.node (.node (.single ⟨1408,1472,31872,31936⟩) (.single ⟨1408,1472,31936,32000⟩)) (.node (.single ⟨1472,1536,31872,31936⟩) (.single ⟨1472,1536,31936,32000⟩)))))) (.node (.node (.node (.node (.node (.single ⟨31232,31296,768,832⟩) (.single ⟨31232,31296,832,896⟩)) (.node (.single ⟨31296,31360,768,832⟩) (.single ⟨31296,31360,832,896⟩))) (.node (.node (.single ⟨31232,31296,896,960⟩) (.single ⟨31232,31296,960,1024⟩)) (.node (.single ⟨31296,31360,896,960⟩) (.single ⟨31296,31360,960,1024⟩)))) (.node (.node (.node (.single ⟨31360,31424,768,832⟩) (.single ⟨31360,31424,832,896⟩)) (.node (.single ⟨31424,31488,768,832⟩) (.single ⟨31424,31488,832,896⟩))) (.node (.node (.single ⟨31360,31424,896,960⟩) (.single ⟨31360,31424,960,1024⟩)) (.node (.single ⟨31424,31488,896,960⟩) (.single ⟨31424,31488,960,1024⟩))))) (.node (.node (.node (.node (.single ⟨31744,31808,1280,1344⟩) (.single ⟨31744,31808,1344,1408⟩)) (.node (.single ⟨31808,31872,1280,1344⟩) (.single ⟨31808,31872,1344,1408⟩))) (.node (.node (.single ⟨31744,31808,1408,1472⟩) (.single ⟨31744,31808,1472,1536⟩)) (.node (.single ⟨31808,31872,1408,1472⟩) (.single ⟨31808,31872,1472,1536⟩)))) (.node (.node (.node (.single ⟨31872,31936,1280,1344⟩) (.single ⟨31872,31936,1344,1408⟩)) (.node (.single ⟨31936,32000,1280,1344⟩) (.single ⟨31936,32000,1344,1408⟩))) (.node (.node (.single ⟨31872,31936,1408,1472⟩) (.single ⟨31872,31936,1472,1536⟩)) (.node (.single ⟨31936,32000,1408,1472⟩) (.single ⟨31936,32000,1472,1536⟩)))))))
def output23 : Fin 64 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 8) (.single 36)) (.node (.single 55) (.single 27))) (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25)))) (.node (.node (.node (.single 10) (.single 37)) (.node (.single 53) (.single 26))) (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24)))))) (.node (.node (.node (.node (.node (.single 4) (.single 40)) (.node (.single 59) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 58) (.single 21)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 7) (.single 43)) (.node (.single 56) (.single 20))))) (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))))
def sourceData23 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.single 60))))) (.node (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))))) (.node (.node (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))) (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover23 (i : Fin 64) : Fin 64 := ⟨coverData23.get i % 64, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 64) : Fin 64 := ⟨sourceData23.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 .empty (.cutX 768 .empty (.cutY 31488 (.cutX 896 (.cutY 31360 (.cutX 832 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 832 (.cutY 31424 .full .full) (.cutY 31424 .full .full))) (.cutY 31360 (.cutX 960 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 960 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty)))) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 (.cutX 1280 .empty (.cutY 32000 (.cutX 1408 (.cutY 31872 (.cutX 1344 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1344 (.cutY 31936 .full .full) (.cutY 31936 .full .full))) (.cutY 31872 (.cutX 1472 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1472 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 .empty (.cutX 31488 (.cutY 768 .empty (.cutX 31360 (.cutY 896 (.cutX 31296 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 31296 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 (.cutX 31424 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 31424 (.cutY 960 .full .full) (.cutY 960 .full .full))))) .empty))) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 (.cutX 32000 (.cutY 1280 .empty (.cutX 31872 (.cutY 1408 (.cutX 31808 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 31808 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 (.cutX 31936 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 31936 (.cutY 1472 .full .full) (.cutY 1472 .full .full))))) .empty) .empty) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata23 : 0<142718076 ∧ 3<128 ∧ 122<128 ∧ 3<4 ∧
    12977/4160=3 ∧ 12977%4160=497 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 64,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 64, (fun i => output23 i = raw23 (source23 i)) i :=
  forallFin_of_zero_offset (fun i => output23 i = raw23 (source23 i)) sourceChecked23_0

theorem coverChecked23_0 : ∀ i : Fin 64,
    (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked23 : ∀ i : Fin 64, (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) i :=
  forallFin_of_zero_offset (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) coverChecked23_0

theorem treeChecked23 : tree23.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves23 : List.ofFn output23 = tree23.leaves ⟨0,32768,0,32768⟩ := by
  unfold output23
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked23 : gridTreeUnionCheck 32768 raw23 output23 cover23 source23 tree23 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked23, coverChecked23, treeChecked23, treeLeaves23⟩

theorem areaUnits23 : gridUnionAreaUnits output23 = 262144 := by decide +kernel

noncomputable def phaseMass23 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 15325, atom 12595, type 3, source (0,115).
def leavesData24 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves24 : Fin 16 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 0 115 leaves24 i
def outputData24 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,29440,29504⟩) (.single ⟨0,64,29504,29568⟩)) (.node (.single ⟨64,128,29440,29504⟩) (.single ⟨64,128,29504,29568⟩))) (.node (.node (.single ⟨0,128,29568,29696⟩) (.single ⟨128,192,29440,29504⟩)) (.node (.single ⟨128,192,29504,29568⟩) (.single ⟨192,224,29440,29472⟩)))) (.node (.node (.node (.single ⟨192,224,29472,29504⟩) (.single ⟨224,256,29440,29472⟩)) (.node (.single ⟨224,256,29472,29504⟩) (.single ⟨192,256,29504,29568⟩))) (.node (.node (.single ⟨128,192,29568,29632⟩) (.single ⟨128,192,29632,29696⟩)) (.node (.single ⟨192,256,29568,29632⟩) (.single ⟨192,256,29632,29696⟩))))) (.node (.node (.node (.node (.single ⟨3072,3136,32512,32576⟩) (.single ⟨3072,3136,32576,32640⟩)) (.node (.single ⟨3136,3200,32512,32576⟩) (.single ⟨3136,3200,32576,32640⟩))) (.node (.node (.single ⟨3072,3200,32640,32768⟩) (.single ⟨3200,3264,32512,32576⟩)) (.node (.single ⟨3200,3264,32576,32640⟩) (.single ⟨3264,3296,32512,32544⟩)))) (.node (.node (.node (.single ⟨3264,3296,32544,32576⟩) (.single ⟨3296,3328,32512,32544⟩)) (.node (.single ⟨3296,3328,32544,32576⟩) (.single ⟨3264,3328,32576,32640⟩))) (.node (.node (.single ⟨3200,3264,32640,32704⟩) (.single ⟨3200,3264,32704,32768⟩)) (.node (.single ⟨3264,3328,32640,32704⟩) (.single ⟨3264,3328,32704,32768⟩)))))) (.node (.node (.node (.node (.node (.single ⟨29440,29504,0,64⟩) (.single ⟨29440,29504,64,128⟩)) (.node (.single ⟨29504,29568,0,64⟩) (.single ⟨29504,29568,64,128⟩))) (.node (.node (.single ⟨29440,29504,128,192⟩) (.single ⟨29440,29472,192,224⟩)) (.node (.single ⟨29440,29472,224,256⟩) (.single ⟨29472,29504,192,224⟩)))) (.node (.node (.node (.single ⟨29472,29504,224,256⟩) (.single ⟨29504,29568,128,192⟩)) (.node (.single ⟨29504,29568,192,256⟩) (.single ⟨29568,29696,0,128⟩))) (.node (.node (.single ⟨29568,29632,128,192⟩) (.single ⟨29568,29632,192,256⟩)) (.node (.single ⟨29632,29696,128,192⟩) (.single ⟨29632,29696,192,256⟩))))) (.node (.node (.node (.node (.single ⟨32512,32576,3072,3136⟩) (.single ⟨32512,32576,3136,3200⟩)) (.node (.single ⟨32576,32640,3072,3136⟩) (.single ⟨32576,32640,3136,3200⟩))) (.node (.node (.single ⟨32512,32576,3200,3264⟩) (.single ⟨32512,32544,3264,3296⟩)) (.node (.single ⟨32512,32544,3296,3328⟩) (.single ⟨32544,32576,3264,3296⟩)))) (.node (.node (.node (.single ⟨32544,32576,3296,3328⟩) (.single ⟨32576,32640,3200,3264⟩)) (.node (.single ⟨32576,32640,3264,3328⟩) (.single ⟨32640,32768,3072,3200⟩))) (.node (.node (.single ⟨32640,32704,3200,3264⟩) (.single ⟨32640,32704,3264,3328⟩)) (.node (.single ⟨32704,32768,3200,3264⟩) (.single ⟨32704,32768,3264,3328⟩)))))))
def output24 : Fin 64 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData24 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover24 (i : Fin 64) : Fin 64 := ⟨coverData24.get i % 64, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 64) : Fin 64 := ⟨sourceData24.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 (.cutX 512 (.cutY 29184 .empty (.cutX 256 (.cutY 29440 .empty (.cutX 128 (.cutY 29568 (.cutX 64 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 192 (.cutY 29504 .full .full) (.cutY 29504 (.cutX 224 (.cutY 29472 .full .full) (.cutY 29472 .full .full)) .full)) (.cutX 192 (.cutY 29632 .full .full) (.cutY 29632 .full .full))))) .empty)) .empty) .empty) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 .empty (.cutY 31744 .empty (.cutX 3584 (.cutY 32256 .empty (.cutX 3328 (.cutY 32512 .empty (.cutX 3200 (.cutY 32640 (.cutX 3136 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 3264 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 3296 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 3264 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)) .empty)))))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 (.cutY 1024 (.cutX 29184 .empty (.cutY 512 (.cutX 29440 .empty (.cutY 256 (.cutX 29568 (.cutY 128 (.cutX 29504 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 29504 (.cutY 192 .full (.cutX 29472 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 29632 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 .empty (.cutX 32256 .empty (.cutY 3584 (.cutX 32512 .empty (.cutY 3328 (.cutX 32640 (.cutY 3200 (.cutX 32576 (.cutY 3136 .full .full) (.cutY 3136 .full .full)) (.cutX 32576 (.cutY 3264 .full (.cutX 32544 (.cutY 3296 .full .full) (.cutY 3296 .full .full))) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 32704 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty)) .empty)))))) .empty)) .empty)) .empty))

theorem metadata24 : 0<192502037 ∧ 0<128 ∧ 115<128 ∧ 3<4 ∧
    12595/4160=3 ∧ 12595%4160=115 ∧ ∀ i, (leaves24 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData24).mp
    (by decide +kernel)

theorem sourceChecked24_0 : ∀ i : Fin 64,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked24 : ∀ i : Fin 64, (fun i => output24 i = raw24 (source24 i)) i :=
  forallFin_of_zero_offset (fun i => output24 i = raw24 (source24 i)) sourceChecked24_0

theorem coverChecked24_0 : ∀ i : Fin 64,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked24 : ∀ i : Fin 64, (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) i :=
  forallFin_of_zero_offset (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) coverChecked24_0

theorem treeChecked24 : tree24.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves24 : List.ofFn output24 = tree24.leaves ⟨0,32768,0,32768⟩ := by
  unfold output24
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked24 : gridTreeUnionCheck 32768 raw24 output24 cover24 source24 tree24 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked24, coverChecked24, treeChecked24, treeLeaves24⟩

theorem areaUnits24 : gridUnionAreaUnits output24 = 262144 := by decide +kernel

noncomputable def phaseMass24 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 15326, atom 13099, type 3, source (4,123).
def leavesData25 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves25 : Fin 13 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 4 123 leaves25 i
def outputData25 : FiniteInputTree GridBox 26 := (.node (.node (.node (.node (.single ⟨1024,1088,31488,31552⟩) (.node (.single ⟨1024,1088,31552,31616⟩) (.single ⟨1088,1152,31488,31552⟩))) (.node (.single ⟨1088,1152,31552,31616⟩) (.node (.single ⟨1024,1152,31616,31744⟩) (.single ⟨1152,1216,31488,31552⟩)))) (.node (.node (.single ⟨1152,1216,31552,31616⟩) (.node (.single ⟨1216,1280,31488,31552⟩) (.single ⟨1216,1280,31552,31616⟩))) (.node (.node (.single ⟨1152,1216,31616,31680⟩) (.single ⟨1152,1216,31680,31744⟩)) (.node (.single ⟨1216,1280,31616,31680⟩) (.single ⟨1216,1280,31680,31744⟩))))) (.node (.node (.node (.single ⟨31488,31552,1024,1088⟩) (.node (.single ⟨31488,31552,1088,1152⟩) (.single ⟨31552,31616,1024,1088⟩))) (.node (.single ⟨31552,31616,1088,1152⟩) (.node (.single ⟨31488,31552,1152,1216⟩) (.single ⟨31488,31552,1216,1280⟩)))) (.node (.node (.single ⟨31552,31616,1152,1216⟩) (.node (.single ⟨31552,31616,1216,1280⟩) (.single ⟨31616,31744,1024,1152⟩))) (.node (.node (.single ⟨31616,31680,1152,1216⟩) (.single ⟨31616,31680,1216,1280⟩)) (.node (.single ⟨31680,31744,1152,1216⟩) (.single ⟨31680,31744,1216,1280⟩))))))
def output25 : Fin 26 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 21) (.single 21))) (.node (.single 4) (.node (.single 0) (.single 13)))) (.node (.node (.single 25) (.node (.single 12) (.single 1))) (.node (.node (.single 15) (.single 24)) (.node (.single 10) (.single 2))))) (.node (.node (.node (.single 14) (.node (.single 23) (.single 11))) (.node (.single 3) (.node (.single 16) (.single 22)))) (.node (.node (.single 9) (.node (.single 5) (.single 17))) (.node (.node (.single 20) (.single 8)) (.node (.single 6) (.single 19)))))) (.node (.node (.node (.node (.single 19) (.node (.single 6) (.single 9))) (.node (.single 22) (.node (.single 16) (.single 3)))) (.node (.node (.single 10) (.node (.single 24) (.single 15))) (.node (.node (.single 1) (.single 7)) (.node (.single 18) (.single 18))))) (.node (.node (.node (.single 7) (.node (.single 8) (.single 20))) (.node (.single 17) (.node (.single 5) (.single 11)))) (.node (.node (.single 23) (.node (.single 14) (.single 2))) (.node (.node (.single 12) (.single 25)) (.node (.single 13) (.single 0)))))))
def sourceData25 : FiniteInputTree ℕ 26 := (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 36) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))) (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 37)))) (.node (.node (.single 25) (.node (.single 22) (.single 1))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))
def cover25 (i : Fin 52) : Fin 26 := ⟨coverData25.get i % 26, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 26) : Fin 52 := ⟨sourceData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 .empty (.cutY 31744 (.cutX 1536 (.cutY 31232 .empty (.cutX 1280 (.cutY 31488 .empty (.cutX 1152 (.cutY 31616 (.cutX 1088 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full) (.cutY 31616 (.cutX 1216 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 1216 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))) .empty)) .empty) .empty))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 .empty (.cutX 31232 .empty (.cutY 1536 (.cutX 31488 .empty (.cutY 1280 (.cutX 31616 (.cutY 1152 (.cutX 31552 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 31552 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full (.cutX 31680 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty)) .empty))) .empty) .empty)) .empty)) .empty)) .empty))

theorem metadata25 : 0<142718076 ∧ 4<128 ∧ 123<128 ∧ 3<4 ∧
    13099/4160=3 ∧ 13099%4160=619 ∧ ∀ i, (leaves25 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData25).mp
    (by decide +kernel)

theorem sourceChecked25_0 : ∀ i : Fin 26,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 26 0 26 (by decide) i) := by decide +kernel

theorem sourceChecked25 : ∀ i : Fin 26, (fun i => output25 i = raw25 (source25 i)) i :=
  forallFin_of_zero_offset (fun i => output25 i = raw25 (source25 i)) sourceChecked25_0

theorem coverChecked25_0 : ∀ i : Fin 52,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked25 : ∀ i : Fin 52, (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) i :=
  forallFin_of_zero_offset (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) coverChecked25_0

theorem treeChecked25 : tree25.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves25 : List.ofFn output25 = tree25.leaves ⟨0,32768,0,32768⟩ := by
  unfold output25
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked25 : gridTreeUnionCheck 32768 raw25 output25 cover25 source25 tree25 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked25, coverChecked25, treeChecked25, treeLeaves25⟩

theorem areaUnits25 : gridUnionAreaUnits output25 = 131072 := by decide +kernel

noncomputable def phaseMass25 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 15327, atom 12857, type 3, source (2,125).
def leavesData26 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves26 : Fin 4 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 2 125 leaves26 i
def outputData26 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨512,640,32000,32128⟩) (.single ⟨512,640,32128,32256⟩)) (.node (.single ⟨640,768,32000,32128⟩) (.single ⟨640,768,32128,32256⟩))) (.node (.node (.single ⟨32000,32128,512,640⟩) (.single ⟨32000,32128,640,768⟩)) (.node (.single ⟨32128,32256,512,640⟩) (.single ⟨32128,32256,640,768⟩))))
def output26 : Fin 8 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 7) (.single 3))) (.node (.node (.single 1) (.single 6)) (.node (.single 6) (.single 1)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 5) (.single 2))) (.node (.node (.single 3) (.single 7)) (.node (.single 4) (.single 0)))))
def sourceData26 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 3))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 2))))
def cover26 (i : Fin 16) : Fin 8 := ⟨coverData26.get i % 8, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 8) : Fin 16 := ⟨sourceData26.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 .empty (.cutY 32256 (.cutX 768 (.cutY 32000 .empty (.cutX 640 (.cutY 32128 .full .full) (.cutY 32128 .full .full))) .empty) .empty))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 .empty (.cutX 32000 .empty (.cutY 768 (.cutX 32128 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty))) .empty) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata26 : 0<142718076 ∧ 2<128 ∧ 125<128 ∧ 3<4 ∧
    12857/4160=3 ∧ 12857%4160=377 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 8,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 8, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) sourceChecked26_0

theorem coverChecked26_0 : ∀ i : Fin 16,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 16, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
  forallFin_of_zero_offset (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) coverChecked26_0

theorem treeChecked26 : tree26.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves26 : List.ofFn output26 = tree26.leaves ⟨0,32768,0,32768⟩ := by
  unfold output26
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked26 : gridTreeUnionCheck 32768 raw26 output26 cover26 source26 tree26 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked26, coverChecked26, treeChecked26, treeLeaves26⟩

theorem areaUnits26 : gridUnionAreaUnits output26 = 131072 := by decide +kernel

noncomputable def phaseMass26 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 15328, atom 12733, type 3, source (1,126).
def leavesData27 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves27 : Fin 4 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 1 126 leaves27 i
def outputData27 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨256,384,32256,32384⟩) (.single ⟨256,384,32384,32512⟩)) (.node (.single ⟨384,512,32256,32384⟩) (.single ⟨384,512,32384,32512⟩))) (.node (.node (.single ⟨32256,32384,256,384⟩) (.single ⟨32256,32384,384,512⟩)) (.node (.single ⟨32384,32512,256,384⟩) (.single ⟨32384,32512,384,512⟩))))
def output27 : Fin 8 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 7) (.single 3))) (.node (.node (.single 1) (.single 6)) (.node (.single 6) (.single 1)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 5) (.single 2))) (.node (.node (.single 3) (.single 7)) (.node (.single 4) (.single 0)))))
def sourceData27 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 3))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 2))))
def cover27 (i : Fin 16) : Fin 8 := ⟨coverData27.get i % 8, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 8) : Fin 16 := ⟨sourceData27.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 .empty (.cutX 256 .empty (.cutY 32512 (.cutX 384 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty))) .empty)) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 .empty (.cutY 512 (.cutX 32512 (.cutY 256 .empty (.cutX 32384 (.cutY 384 .full .full) (.cutY 384 .full .full))) .empty) .empty)) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata27 : 0<142718076 ∧ 1<128 ∧ 126<128 ∧ 3<4 ∧
    12733/4160=3 ∧ 12733%4160=253 ∧ ∀ i, (leaves27 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData27).mp
    (by decide +kernel)

theorem sourceChecked27_0 : ∀ i : Fin 8,
    (fun i => output27 i = raw27 (source27 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked27 : ∀ i : Fin 8, (fun i => output27 i = raw27 (source27 i)) i :=
  forallFin_of_zero_offset (fun i => output27 i = raw27 (source27 i)) sourceChecked27_0

theorem coverChecked27_0 : ∀ i : Fin 16,
    (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked27 : ∀ i : Fin 16, (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) i :=
  forallFin_of_zero_offset (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) coverChecked27_0

theorem treeChecked27 : tree27.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves27 : List.ofFn output27 = tree27.leaves ⟨0,32768,0,32768⟩ := by
  unfold output27
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked27 : gridTreeUnionCheck 32768 raw27 output27 cover27 source27 tree27 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked27, coverChecked27, treeChecked27, treeLeaves27⟩

theorem areaUnits27 : gridUnionAreaUnits output27 = 131072 := by decide +kernel

noncomputable def phaseMass27 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 15329, atom 12978, type 3, source (3,123).
def leavesData28 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩)))) (.node (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves28 : Fin 16 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 3 123 leaves28 i
def outputData28 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨768,832,31488,31552⟩) (.single ⟨768,832,31552,31616⟩)) (.node (.single ⟨832,896,31488,31552⟩) (.single ⟨832,896,31552,31616⟩))) (.node (.node (.single ⟨768,832,31616,31680⟩) (.single ⟨768,832,31680,31744⟩)) (.node (.single ⟨832,896,31616,31680⟩) (.single ⟨832,896,31680,31744⟩)))) (.node (.node (.node (.single ⟨896,960,31488,31552⟩) (.single ⟨896,960,31552,31616⟩)) (.node (.single ⟨960,1024,31488,31552⟩) (.single ⟨960,1024,31552,31616⟩))) (.node (.node (.single ⟨896,960,31616,31680⟩) (.single ⟨896,960,31680,31744⟩)) (.node (.single ⟨960,1024,31616,31680⟩) (.single ⟨960,1024,31680,31744⟩))))) (.node (.node (.node (.node (.single ⟨1024,1088,31744,31808⟩) (.single ⟨1024,1088,31808,31872⟩)) (.node (.single ⟨1088,1152,31744,31808⟩) (.single ⟨1088,1152,31808,31872⟩))) (.node (.node (.single ⟨1024,1088,31872,31936⟩) (.single ⟨1024,1088,31936,32000⟩)) (.node (.single ⟨1088,1152,31872,31936⟩) (.single ⟨1088,1152,31936,32000⟩)))) (.node (.node (.node (.single ⟨1152,1216,31744,31808⟩) (.single ⟨1152,1216,31808,31872⟩)) (.node (.single ⟨1216,1280,31744,31808⟩) (.single ⟨1216,1280,31808,31872⟩))) (.node (.node (.single ⟨1152,1216,31872,31936⟩) (.single ⟨1152,1216,31936,32000⟩)) (.node (.single ⟨1216,1280,31872,31936⟩) (.single ⟨1216,1280,31936,32000⟩)))))) (.node (.node (.node (.node (.node (.single ⟨31488,31552,768,832⟩) (.single ⟨31488,31552,832,896⟩)) (.node (.single ⟨31552,31616,768,832⟩) (.single ⟨31552,31616,832,896⟩))) (.node (.node (.single ⟨31488,31552,896,960⟩) (.single ⟨31488,31552,960,1024⟩)) (.node (.single ⟨31552,31616,896,960⟩) (.single ⟨31552,31616,960,1024⟩)))) (.node (.node (.node (.single ⟨31616,31680,768,832⟩) (.single ⟨31616,31680,832,896⟩)) (.node (.single ⟨31680,31744,768,832⟩) (.single ⟨31680,31744,832,896⟩))) (.node (.node (.single ⟨31616,31680,896,960⟩) (.single ⟨31616,31680,960,1024⟩)) (.node (.single ⟨31680,31744,896,960⟩) (.single ⟨31680,31744,960,1024⟩))))) (.node (.node (.node (.node (.single ⟨31744,31808,1024,1088⟩) (.single ⟨31744,31808,1088,1152⟩)) (.node (.single ⟨31808,31872,1024,1088⟩) (.single ⟨31808,31872,1088,1152⟩))) (.node (.node (.single ⟨31744,31808,1152,1216⟩) (.single ⟨31744,31808,1216,1280⟩)) (.node (.single ⟨31808,31872,1152,1216⟩) (.single ⟨31808,31872,1216,1280⟩)))) (.node (.node (.node (.single ⟨31872,31936,1024,1088⟩) (.single ⟨31872,31936,1088,1152⟩)) (.node (.single ⟨31936,32000,1024,1088⟩) (.single ⟨31936,32000,1088,1152⟩))) (.node (.node (.single ⟨31872,31936,1152,1216⟩) (.single ⟨31872,31936,1216,1280⟩)) (.node (.single ⟨31936,32000,1152,1216⟩) (.single ⟨31936,32000,1216,1280⟩)))))))
def output28 : Fin 64 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 4) (.single 40)) (.node (.single 59) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 58) (.single 21))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 7) (.single 43)) (.node (.single 56) (.single 20)))))) (.node (.node (.node (.node (.node (.single 8) (.single 36)) (.node (.single 55) (.single 27))) (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25)))) (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))))) (.node (.node (.node (.node (.single 10) (.single 37)) (.node (.single 53) (.single 26))) (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))))
def sourceData28 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 16) (.single 20))) (.node (.node (.single 8) (.single 12)) (.node (.single 24) (.single 28)))) (.node (.node (.node (.single 32) (.single 36)) (.node (.single 48) (.single 52))) (.node (.node (.single 40) (.single 44)) (.node (.single 56) (.single 60))))) (.node (.node (.node (.node (.single 63) (.single 47)) (.node (.single 59) (.single 43))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.single 11)))) (.node (.node (.node (.single 55) (.single 39)) (.node (.single 51) (.single 35))) (.node (.node (.single 23) (.single 7)) (.node (.single 19) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 17)) (.node (.single 5) (.single 21))) (.node (.node (.single 33) (.single 49)) (.node (.single 37) (.single 53)))) (.node (.node (.node (.single 9) (.single 25)) (.node (.single 13) (.single 29))) (.node (.node (.single 41) (.single 57)) (.node (.single 45) (.single 61))))) (.node (.node (.node (.node (.single 62) (.single 58)) (.node (.single 46) (.single 42))) (.node (.node (.single 54) (.single 50)) (.node (.single 38) (.single 34)))) (.node (.node (.node (.single 30) (.single 26)) (.node (.single 14) (.single 10))) (.node (.node (.single 22) (.single 18)) (.node (.single 6) (.single 2)))))))
def cover28 (i : Fin 64) : Fin 64 := ⟨coverData28.get i % 64, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 64) : Fin 64 := ⟨sourceData28.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 .empty (.cutX 768 .empty (.cutY 31488 .empty (.cutX 896 (.cutY 31616 (.cutX 832 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 832 (.cutY 31680 .full .full) (.cutY 31680 .full .full))) (.cutY 31616 (.cutX 960 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 960 (.cutY 31680 .full .full) (.cutY 31680 .full .full)))))))) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 (.cutX 1280 (.cutY 32000 (.cutX 1152 (.cutY 31872 (.cutX 1088 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1088 (.cutY 31936 .full .full) (.cutY 31936 .full .full))) (.cutY 31872 (.cutX 1216 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 1216 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 .empty (.cutX 31488 .empty (.cutY 768 .empty (.cutX 31616 (.cutY 896 (.cutX 31552 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 31552 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 (.cutX 31680 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 31680 (.cutY 960 .full .full) (.cutY 960 .full .full)))))))) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 (.cutX 32000 (.cutY 1280 (.cutX 31872 (.cutY 1152 (.cutX 31808 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 31808 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 (.cutX 31936 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 31936 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata28 : 0<142718076 ∧ 3<128 ∧ 123<128 ∧ 3<4 ∧
    12978/4160=3 ∧ 12978%4160=498 ∧ ∀ i, (leaves28 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData28).mp
    (by decide +kernel)

theorem sourceChecked28_0 : ∀ i : Fin 64,
    (fun i => output28 i = raw28 (source28 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked28 : ∀ i : Fin 64, (fun i => output28 i = raw28 (source28 i)) i :=
  forallFin_of_zero_offset (fun i => output28 i = raw28 (source28 i)) sourceChecked28_0

theorem coverChecked28_0 : ∀ i : Fin 64,
    (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked28 : ∀ i : Fin 64, (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) i :=
  forallFin_of_zero_offset (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) coverChecked28_0

theorem treeChecked28 : tree28.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves28 : List.ofFn output28 = tree28.leaves ⟨0,32768,0,32768⟩ := by
  unfold output28
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked28 : gridTreeUnionCheck 32768 raw28 output28 cover28 source28 tree28 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked28, coverChecked28, treeChecked28, treeLeaves28⟩

theorem areaUnits28 : gridUnionAreaUnits output28 = 262144 := by decide +kernel

noncomputable def phaseMass28 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 15330, atom 12855, type 3, source (2,123).
def leavesData29 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩)))))
def leaves29 : Fin 16 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 2 123 leaves29 i
def outputData29 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨512,576,31488,31552⟩) (.single ⟨512,576,31552,31616⟩)) (.node (.single ⟨576,640,31488,31552⟩) (.single ⟨576,640,31552,31616⟩))) (.node (.node (.single ⟨512,576,31616,31680⟩) (.single ⟨512,576,31680,31744⟩)) (.node (.single ⟨576,640,31616,31680⟩) (.single ⟨576,640,31680,31744⟩)))) (.node (.node (.node (.single ⟨640,704,31488,31552⟩) (.single ⟨640,704,31552,31616⟩)) (.node (.single ⟨704,768,31488,31552⟩) (.single ⟨704,768,31552,31616⟩))) (.node (.node (.single ⟨640,704,31616,31680⟩) (.single ⟨640,704,31680,31744⟩)) (.node (.single ⟨704,768,31616,31680⟩) (.single ⟨704,768,31680,31744⟩))))) (.node (.node (.node (.node (.single ⟨1024,1088,32000,32064⟩) (.single ⟨1024,1088,32064,32128⟩)) (.node (.single ⟨1088,1152,32000,32064⟩) (.single ⟨1088,1152,32064,32128⟩))) (.node (.node (.single ⟨1024,1088,32128,32192⟩) (.single ⟨1024,1088,32192,32256⟩)) (.node (.single ⟨1088,1152,32128,32192⟩) (.single ⟨1088,1152,32192,32256⟩)))) (.node (.node (.node (.single ⟨1152,1216,32000,32064⟩) (.single ⟨1152,1216,32064,32128⟩)) (.node (.single ⟨1216,1280,32000,32064⟩) (.single ⟨1216,1280,32064,32128⟩))) (.node (.node (.single ⟨1152,1216,32128,32192⟩) (.single ⟨1152,1216,32192,32256⟩)) (.node (.single ⟨1216,1280,32128,32192⟩) (.single ⟨1216,1280,32192,32256⟩)))))) (.node (.node (.node (.node (.node (.single ⟨31488,31552,512,576⟩) (.single ⟨31488,31552,576,640⟩)) (.node (.single ⟨31552,31616,512,576⟩) (.single ⟨31552,31616,576,640⟩))) (.node (.node (.single ⟨31488,31552,640,704⟩) (.single ⟨31488,31552,704,768⟩)) (.node (.single ⟨31552,31616,640,704⟩) (.single ⟨31552,31616,704,768⟩)))) (.node (.node (.node (.single ⟨31616,31680,512,576⟩) (.single ⟨31616,31680,576,640⟩)) (.node (.single ⟨31680,31744,512,576⟩) (.single ⟨31680,31744,576,640⟩))) (.node (.node (.single ⟨31616,31680,640,704⟩) (.single ⟨31616,31680,704,768⟩)) (.node (.single ⟨31680,31744,640,704⟩) (.single ⟨31680,31744,704,768⟩))))) (.node (.node (.node (.node (.single ⟨32000,32064,1024,1088⟩) (.single ⟨32000,32064,1088,1152⟩)) (.node (.single ⟨32064,32128,1024,1088⟩) (.single ⟨32064,32128,1088,1152⟩))) (.node (.node (.single ⟨32000,32064,1152,1216⟩) (.single ⟨32000,32064,1216,1280⟩)) (.node (.single ⟨32064,32128,1152,1216⟩) (.single ⟨32064,32128,1216,1280⟩)))) (.node (.node (.node (.single ⟨32128,32192,1024,1088⟩) (.single ⟨32128,32192,1088,1152⟩)) (.node (.single ⟨32192,32256,1024,1088⟩) (.single ⟨32192,32256,1088,1152⟩))) (.node (.node (.single ⟨32128,32192,1152,1216⟩) (.single ⟨32128,32192,1216,1280⟩)) (.node (.single ⟨32192,32256,1152,1216⟩) (.single ⟨32192,32256,1216,1280⟩)))))))
def output29 : Fin 64 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 8) (.single 36)) (.node (.single 55) (.single 27))) (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25)))) (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))))) (.node (.node (.node (.node (.node (.single 10) (.single 37)) (.node (.single 53) (.single 26))) (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 4) (.single 40)) (.node (.single 59) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 58) (.single 21)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 7) (.single 43)) (.node (.single 56) (.single 20)))))))
def sourceData29 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.single 60)))) (.node (.node (.node (.single 16) (.single 20)) (.node (.single 32) (.single 36))) (.node (.node (.single 24) (.single 28)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 31)) (.node (.single 43) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.single 19))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 33)) (.node (.single 21) (.single 37)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 41)) (.node (.single 29) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 30) (.single 26))) (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.single 18)))) (.node (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover29 (i : Fin 64) : Fin 64 := ⟨coverData29.get i % 64, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 64) : Fin 64 := ⟨sourceData29.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 .empty (.cutY 31232 .empty (.cutX 768 (.cutY 31488 .empty (.cutX 640 (.cutY 31616 (.cutX 576 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 576 (.cutY 31680 .full .full) (.cutY 31680 .full .full))) (.cutY 31616 (.cutX 704 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 704 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))) .empty))) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 (.cutX 1280 (.cutY 32000 .empty (.cutX 1152 (.cutY 32128 (.cutX 1088 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 1088 (.cutY 32192 .full .full) (.cutY 32192 .full .full))) (.cutY 32128 (.cutX 1216 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 1216 (.cutY 32192 .full .full) (.cutY 32192 .full .full))))) .empty) .empty) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 .empty (.cutX 31488 .empty (.cutY 768 (.cutX 31616 (.cutY 640 (.cutX 31552 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 31552 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 (.cutX 31680 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 31680 (.cutY 704 .full .full) (.cutY 704 .full .full)))) .empty)))) .empty) (.cutY 1024 .empty (.cutX 32256 (.cutY 1536 (.cutX 32000 .empty (.cutY 1280 (.cutX 32128 (.cutY 1152 (.cutX 32064 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 32064 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 (.cutX 32192 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 32192 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty)) .empty) .empty))) .empty)) .empty)) .empty)) .empty))

theorem metadata29 : 0<142718076 ∧ 2<128 ∧ 123<128 ∧ 3<4 ∧
    12855/4160=3 ∧ 12855%4160=375 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 64,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 64, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) sourceChecked29_0

theorem coverChecked29_0 : ∀ i : Fin 64,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 64, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
  forallFin_of_zero_offset (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) coverChecked29_0

theorem treeChecked29 : tree29.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves29 : List.ofFn output29 = tree29.leaves ⟨0,32768,0,32768⟩ := by
  unfold output29
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked29 : gridTreeUnionCheck 32768 raw29 output29 cover29 source29 tree29 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked29, coverChecked29, treeChecked29, treeLeaves29⟩

theorem areaUnits29 : gridUnionAreaUnits output29 = 262144 := by decide +kernel

noncomputable def phaseMass29 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 15331, atom 12732, type 3, source (1,125).
def leavesData30 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves30 : Fin 4 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 1 125 leaves30 i
def outputData30 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨256,384,32000,32128⟩) (.single ⟨256,384,32128,32256⟩)) (.node (.single ⟨384,512,32000,32128⟩) (.single ⟨384,512,32128,32256⟩))) (.node (.node (.single ⟨512,640,32256,32384⟩) (.single ⟨512,640,32384,32512⟩)) (.node (.single ⟨640,768,32256,32384⟩) (.single ⟨640,768,32384,32512⟩)))) (.node (.node (.node (.single ⟨32000,32128,256,384⟩) (.single ⟨32000,32128,384,512⟩)) (.node (.single ⟨32128,32256,256,384⟩) (.single ⟨32128,32256,384,512⟩))) (.node (.node (.single ⟨32256,32384,512,640⟩) (.single ⟨32256,32384,640,768⟩)) (.node (.single ⟨32384,32512,512,640⟩) (.single ⟨32384,32512,640,768⟩)))))
def output30 : Fin 16 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData30 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover30 (i : Fin 16) : Fin 16 := ⟨coverData30.get i % 16, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 16) : Fin 16 := ⟨sourceData30.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 (.cutX 256 .empty (.cutY 32000 .empty (.cutX 384 (.cutY 32128 .full .full) (.cutY 32128 .full .full)))) .empty) (.cutY 32256 .empty (.cutX 768 (.cutY 32512 (.cutX 640 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty) .empty)))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 (.cutX 32000 .empty (.cutY 256 .empty (.cutX 32128 (.cutY 384 .full .full) (.cutY 384 .full .full)))) .empty) (.cutY 512 .empty (.cutX 32512 (.cutY 768 (.cutX 32384 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty) .empty))) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata30 : 0<142718076 ∧ 1<128 ∧ 125<128 ∧ 3<4 ∧
    12732/4160=3 ∧ 12732%4160=252 ∧ ∀ i, (leaves30 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData30).mp
    (by decide +kernel)

theorem sourceChecked30_0 : ∀ i : Fin 16,
    (fun i => output30 i = raw30 (source30 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked30 : ∀ i : Fin 16, (fun i => output30 i = raw30 (source30 i)) i :=
  forallFin_of_zero_offset (fun i => output30 i = raw30 (source30 i)) sourceChecked30_0

theorem coverChecked30_0 : ∀ i : Fin 16,
    (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked30 : ∀ i : Fin 16, (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) i :=
  forallFin_of_zero_offset (fun i => (output30 (cover30 i)).ContainsBox (raw30 i)) coverChecked30_0

theorem treeChecked30 : tree30.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves30 : List.ofFn output30 = tree30.leaves ⟨0,32768,0,32768⟩ := by
  unfold output30
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked30 : gridTreeUnionCheck 32768 raw30 output30 cover30 source30 tree30 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked30, coverChecked30, treeChecked30, treeLeaves30⟩

theorem areaUnits30 : gridUnionAreaUnits output30 = 262144 := by decide +kernel

noncomputable def phaseMass30 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 15332, atom 12856, type 3, source (2,124).
def leavesData31 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,1,2⟩) (.node (.single ⟨2,1,3⟩) (.single ⟨2,2,0⟩))))) (.node (.node (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,3,2⟩)))) (.node (.node (.single ⟨2,3,3⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves31 : Fin 19 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 2 124 leaves31 i
def outputData31 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨512,576,31744,31808⟩) (.single ⟨512,576,31808,31872⟩)) (.node (.single ⟨576,640,31744,31808⟩) (.single ⟨576,640,31808,31872⟩))) (.node (.node (.single ⟨512,576,31872,31936⟩) (.single ⟨512,576,31936,32000⟩)) (.node (.single ⟨576,640,31872,31936⟩) (.node (.single ⟨576,640,31936,32000⟩) (.single ⟨640,704,31744,31808⟩))))) (.node (.node (.node (.single ⟨640,704,31808,31872⟩) (.single ⟨704,736,31744,31776⟩)) (.node (.single ⟨704,736,31776,31808⟩) (.node (.single ⟨736,768,31744,31776⟩) (.single ⟨736,768,31776,31808⟩)))) (.node (.node (.single ⟨704,768,31808,31872⟩) (.single ⟨640,704,31872,31936⟩)) (.node (.single ⟨640,704,31936,32000⟩) (.node (.single ⟨704,768,31872,31936⟩) (.single ⟨704,768,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨768,832,32000,32064⟩) (.single ⟨768,832,32064,32128⟩)) (.node (.single ⟨832,896,32000,32064⟩) (.single ⟨832,896,32064,32128⟩))) (.node (.node (.single ⟨768,832,32128,32192⟩) (.single ⟨768,832,32192,32256⟩)) (.node (.single ⟨832,896,32128,32192⟩) (.node (.single ⟨832,896,32192,32256⟩) (.single ⟨896,960,32000,32064⟩))))) (.node (.node (.node (.single ⟨896,960,32064,32128⟩) (.single ⟨960,992,32000,32032⟩)) (.node (.single ⟨960,992,32032,32064⟩) (.node (.single ⟨992,1024,32000,32032⟩) (.single ⟨992,1024,32032,32064⟩)))) (.node (.node (.single ⟨960,1024,32064,32128⟩) (.single ⟨896,960,32128,32192⟩)) (.node (.single ⟨896,960,32192,32256⟩) (.node (.single ⟨960,1024,32128,32192⟩) (.single ⟨960,1024,32192,32256⟩))))))) (.node (.node (.node (.node (.node (.single ⟨31744,31808,512,576⟩) (.single ⟨31744,31808,576,640⟩)) (.node (.single ⟨31808,31872,512,576⟩) (.single ⟨31808,31872,576,640⟩))) (.node (.node (.single ⟨31744,31808,640,704⟩) (.single ⟨31744,31776,704,736⟩)) (.node (.single ⟨31744,31776,736,768⟩) (.node (.single ⟨31776,31808,704,736⟩) (.single ⟨31776,31808,736,768⟩))))) (.node (.node (.node (.single ⟨31808,31872,640,704⟩) (.single ⟨31808,31872,704,768⟩)) (.node (.single ⟨31872,31936,512,576⟩) (.node (.single ⟨31872,31936,576,640⟩) (.single ⟨31936,32000,512,576⟩)))) (.node (.node (.single ⟨31936,32000,576,640⟩) (.single ⟨31872,31936,640,704⟩)) (.node (.single ⟨31872,31936,704,768⟩) (.node (.single ⟨31936,32000,640,704⟩) (.single ⟨31936,32000,704,768⟩)))))) (.node (.node (.node (.node (.single ⟨32000,32064,768,832⟩) (.single ⟨32000,32064,832,896⟩)) (.node (.single ⟨32064,32128,768,832⟩) (.single ⟨32064,32128,832,896⟩))) (.node (.node (.single ⟨32000,32064,896,960⟩) (.single ⟨32000,32032,960,992⟩)) (.node (.single ⟨32000,32032,992,1024⟩) (.node (.single ⟨32032,32064,960,992⟩) (.single ⟨32032,32064,992,1024⟩))))) (.node (.node (.node (.single ⟨32064,32128,896,960⟩) (.single ⟨32064,32128,960,1024⟩)) (.node (.single ⟨32128,32192,768,832⟩) (.node (.single ⟨32128,32192,832,896⟩) (.single ⟨32192,32256,768,832⟩)))) (.node (.node (.single ⟨32192,32256,832,896⟩) (.single ⟨32128,32192,896,960⟩)) (.node (.single ⟨32128,32192,960,1024⟩) (.node (.single ⟨32192,32256,896,960⟩) (.single ⟨32192,32256,960,1024⟩))))))))
def output31 : Fin 76 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.single 37))) (.node (.node (.single 1) (.single 40)) (.node (.single 74) (.node (.single 35) (.single 4))))) (.node (.node (.node (.single 49) (.single 71)) (.node (.single 26) (.node (.single 5) (.single 51)))) (.node (.node (.single 70) (.single 24)) (.node (.single 2) (.node (.single 39) (.single 73)))))) (.node (.node (.node (.node (.single 36) (.single 3)) (.node (.single 41) (.single 72))) (.node (.node (.single 34) (.single 6)) (.node (.single 50) (.node (.single 69) (.single 25))))) (.node (.node (.node (.single 7) (.single 52)) (.node (.single 68) (.node (.single 23) (.single 8)))) (.node (.node (.single 42) (.single 67)) (.node (.single 33) (.node (.single 9) (.single 47))))))) (.node (.node (.node (.node (.node (.single 66) (.single 28)) (.node (.single 15) (.single 53))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59))))) (.node (.node (.node (.single 20) (.single 14)) (.node (.single 48) (.node (.single 61) (.single 27)))) (.node (.node (.single 17) (.single 54)) (.node (.single 58) (.node (.single 21) (.single 18)))))) (.node (.node (.node (.node (.single 56) (.single 57)) (.node (.single 19) (.single 10))) (.node (.node (.single 43) (.single 65)) (.node (.single 32) (.node (.single 11) (.single 45))))) (.node (.node (.node (.single 64) (.single 30)) (.node (.single 12) (.node (.single 44) (.single 63)))) (.node (.node (.single 31) (.single 13)) (.node (.single 46) (.node (.single 62) (.single 29))))))))
def sourceData31 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 16) (.single 20))) (.node (.node (.single 8) (.single 12)) (.node (.single 24) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 36) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 72)))) (.node (.node (.single 48) (.single 40)) (.node (.single 44) (.node (.single 52) (.single 56)))))) (.node (.node (.node (.node (.single 59) (.single 47)) (.node (.single 55) (.single 43))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 51))))) (.node (.node (.node (.single 39) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63)))) (.node (.node (.single 35) (.single 23)) (.node (.single 7) (.node (.single 19) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.single 17)) (.node (.single 5) (.single 21))) (.node (.node (.single 33) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73))))) (.node (.node (.node (.single 37) (.single 49)) (.node (.single 9) (.node (.single 25) (.single 13)))) (.node (.node (.single 29) (.single 41)) (.node (.single 53) (.node (.single 45) (.single 57)))))) (.node (.node (.node (.node (.single 58) (.single 54)) (.node (.single 46) (.single 42))) (.node (.node (.single 50) (.single 74)) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 14)))) (.node (.node (.single 10) (.single 22)) (.node (.single 18) (.node (.single 6) (.single 2))))))))
def cover31 (i : Fin 76) : Fin 76 := ⟨coverData31.get i % 76, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 76) : Fin 76 := ⟨sourceData31.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 .empty (.cutY 32256 (.cutX 768 (.cutY 32000 (.cutX 640 (.cutY 31872 (.cutX 576 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 576 (.cutY 31936 .full .full) (.cutY 31936 .full .full))) (.cutY 31872 (.cutX 704 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 736 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) .full)) (.cutX 704 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) (.cutY 32000 .empty (.cutX 896 (.cutY 32128 (.cutX 832 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 832 (.cutY 32192 .full .full) (.cutY 32192 .full .full))) (.cutY 32128 (.cutX 960 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 992 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) .full)) (.cutX 960 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 .empty (.cutX 32000 (.cutY 768 (.cutX 31872 (.cutY 640 (.cutX 31808 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 31808 (.cutY 704 .full (.cutX 31776 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 (.cutX 31936 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 31936 (.cutY 704 .full .full) (.cutY 704 .full .full)))) .empty) (.cutY 768 .empty (.cutX 32128 (.cutY 896 (.cutX 32064 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 32064 (.cutY 960 .full (.cutX 32032 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 (.cutX 32192 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 32192 (.cutY 960 .full .full) (.cutY 960 .full .full))))))) .empty) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata31 : 0<142718076 ∧ 2<128 ∧ 124<128 ∧ 3<4 ∧
    12856/4160=3 ∧ 12856%4160=376 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 64,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked31_64 : ∀ i : Fin 12,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 76, (fun i => output31 i = raw31 (source31 i)) i :=
  forallFin_of_zero_offset (fun i => output31 i = raw31 (source31 i)) (forallFinOffset_add (fun i => output31 i = raw31 (source31 i)) 0 64 12 (by decide) sourceChecked31_0
    sourceChecked31_64)

theorem coverChecked31_0 : ∀ i : Fin 64,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked31_64 : ∀ i : Fin 12,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked31 : ∀ i : Fin 76, (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) i :=
  forallFin_of_zero_offset (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (forallFinOffset_add (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) 0 64 12 (by decide) coverChecked31_0
    coverChecked31_64)

theorem treeChecked31 : tree31.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves31 : List.ofFn output31 = tree31.leaves ⟨0,32768,0,32768⟩ := by
  unfold output31
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked31 : gridTreeUnionCheck 32768 raw31 output31 cover31 source31 tree31 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked31, coverChecked31, treeChecked31, treeLeaves31⟩

theorem areaUnits31 : gridUnionAreaUnits output31 = 262144 := by decide +kernel

noncomputable def phaseMass31 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 15333, atom 12979, type 3, source (3,124).
def leavesData32 : FiniteInputTree DyadicLeaf 94 := (.node (.node (.node (.node (.node (.node (.single ⟨3,0,0⟩) (.single ⟨3,0,1⟩)) (.node (.single ⟨3,0,2⟩) (.node (.single ⟨3,0,3⟩) (.single ⟨3,1,0⟩)))) (.node (.node (.single ⟨3,1,1⟩) (.node (.single ⟨3,1,2⟩) (.single ⟨3,1,3⟩))) (.node (.single ⟨3,2,0⟩) (.node (.single ⟨3,2,1⟩) (.single ⟨3,2,2⟩))))) (.node (.node (.node (.single ⟨3,2,3⟩) (.node (.single ⟨3,2,4⟩) (.single ⟨3,2,5⟩))) (.node (.single ⟨3,3,0⟩) (.node (.single ⟨3,3,1⟩) (.single ⟨3,3,2⟩)))) (.node (.node (.single ⟨3,3,3⟩) (.node (.single ⟨3,3,4⟩) (.single ⟨3,3,5⟩))) (.node (.single ⟨3,4,1⟩) (.node (.single ⟨3,4,2⟩) (.single ⟨3,4,3⟩)))))) (.node (.node (.node (.node (.single ⟨3,4,4⟩) (.node (.single ⟨3,4,5⟩) (.single ⟨3,4,6⟩))) (.node (.single ⟨3,4,7⟩) (.node (.single ⟨3,5,2⟩) (.single ⟨3,5,3⟩)))) (.node (.node (.single ⟨3,5,4⟩) (.node (.single ⟨3,5,5⟩) (.single ⟨3,5,6⟩))) (.node (.single ⟨3,5,7⟩) (.node (.single ⟨3,6,3⟩) (.single ⟨3,6,4⟩))))) (.node (.node (.node (.single ⟨3,6,5⟩) (.node (.single ⟨3,6,6⟩) (.single ⟨3,6,7⟩))) (.node (.single ⟨3,7,4⟩) (.node (.single ⟨3,7,5⟩) (.single ⟨3,7,6⟩)))) (.node (.node (.single ⟨3,7,7⟩) (.node (.single ⟨3,0,4⟩) (.single ⟨3,0,5⟩))) (.node (.single ⟨3,1,4⟩) (.node (.single ⟨3,1,5⟩) (.single ⟨3,0,6⟩))))))) (.node (.node (.node (.node (.node (.single ⟨3,0,7⟩) (.single ⟨3,1,6⟩)) (.node (.single ⟨3,1,7⟩) (.node (.single ⟨3,2,6⟩) (.single ⟨3,2,7⟩)))) (.node (.node (.single ⟨3,3,6⟩) (.node (.single ⟨3,3,7⟩) (.single ⟨4,12,0⟩))) (.node (.single ⟨4,12,1⟩) (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩))))) (.node (.node (.node (.single ⟨4,14,0⟩) (.node (.single ⟨4,14,1⟩) (.single ⟨4,15,0⟩))) (.node (.single ⟨4,15,1⟩) (.node (.single ⟨4,14,2⟩) (.single ⟨4,14,3⟩)))) (.node (.node (.single ⟨4,15,2⟩) (.node (.single ⟨4,15,3⟩) (.single ⟨4,8,0⟩))) (.node (.single ⟨4,8,1⟩) (.node (.single ⟨4,9,0⟩) (.single ⟨4,9,1⟩)))))) (.node (.node (.node (.node (.single ⟨4,10,0⟩) (.node (.single ⟨4,10,1⟩) (.single ⟨4,11,0⟩))) (.node (.single ⟨4,11,1⟩) (.node (.single ⟨4,10,2⟩) (.single ⟨4,10,3⟩)))) (.node (.node (.single ⟨4,11,2⟩) (.node (.single ⟨4,11,3⟩) (.single ⟨4,12,2⟩))) (.node (.single ⟨4,12,3⟩) (.node (.single ⟨4,13,2⟩) (.single ⟨4,13,3⟩))))) (.node (.node (.node (.single ⟨4,12,4⟩) (.node (.single ⟨4,12,5⟩) (.single ⟨4,13,4⟩))) (.node (.single ⟨4,13,5⟩) (.node (.single ⟨4,14,4⟩) (.single ⟨4,14,5⟩)))) (.node (.node (.single ⟨4,15,4⟩) (.node (.single ⟨4,15,5⟩) (.single ⟨4,14,6⟩))) (.node (.single ⟨4,14,7⟩) (.node (.single ⟨4,15,6⟩) (.single ⟨4,15,7⟩))))))))
def leaves32 : Fin 94 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 376) : GridBox := phaseImageBoxes 32768 8 3 124 leaves32 i
def outputData32 : FiniteInputTree GridBox 188 := (.node (.node (.node (.node (.node (.node (.node (.single ⟨768,800,31744,31776⟩) (.single ⟨768,800,31776,31808⟩)) (.node (.single ⟨800,832,31744,31776⟩) (.node (.single ⟨800,832,31776,31808⟩) (.single ⟨768,800,31808,31840⟩)))) (.node (.node (.single ⟨768,800,31840,31872⟩) (.node (.single ⟨800,832,31808,31840⟩) (.single ⟨800,832,31840,31872⟩))) (.node (.single ⟨832,864,31744,31776⟩) (.node (.single ⟨832,864,31776,31808⟩) (.single ⟨864,896,31744,31776⟩))))) (.node (.node (.node (.single ⟨864,896,31776,31808⟩) (.node (.single ⟨832,864,31808,31840⟩) (.single ⟨832,864,31840,31872⟩))) (.node (.single ⟨864,896,31808,31840⟩) (.node (.single ⟨864,896,31840,31872⟩) (.single ⟨768,800,31872,31904⟩)))) (.node (.node (.single ⟨768,800,31904,31936⟩) (.node (.single ⟨800,832,31872,31904⟩) (.single ⟨800,832,31904,31936⟩))) (.node (.single ⟨768,800,31936,31968⟩) (.node (.single ⟨768,800,31968,32000⟩) (.single ⟨800,832,31936,31968⟩)))))) (.node (.node (.node (.node (.single ⟨800,832,31968,32000⟩) (.node (.single ⟨832,864,31872,31904⟩) (.single ⟨832,864,31904,31936⟩))) (.node (.single ⟨864,896,31872,31904⟩) (.node (.single ⟨864,896,31904,31936⟩) (.single ⟨832,864,31936,31968⟩)))) (.node (.node (.single ⟨832,864,31968,32000⟩) (.node (.single ⟨864,896,31936,31968⟩) (.single ⟨864,896,31968,32000⟩))) (.node (.single ⟨896,912,31744,31760⟩) (.node (.single ⟨896,912,31760,31776⟩) (.single ⟨912,928,31744,31760⟩))))) (.node (.node (.node (.single ⟨912,928,31760,31776⟩) (.node (.single ⟨896,928,31776,31808⟩) (.single ⟨928,944,31744,31760⟩))) (.node (.single ⟨928,944,31760,31776⟩) (.node (.single ⟨944,960,31744,31760⟩) (.single ⟨944,960,31760,31776⟩)))) (.node (.node (.single ⟨928,944,31776,31792⟩) (.node (.single ⟨928,944,31792,31808⟩) (.single ⟨944,960,31776,31792⟩))) (.node (.single ⟨944,960,31792,31808⟩) (.node (.single ⟨896,928,31808,31840⟩) (.single ⟨896,928,31840,31872⟩))))))) (.node (.node (.node (.node (.node (.single ⟨928,960,31808,31840⟩) (.single ⟨928,960,31840,31872⟩)) (.node (.single ⟨960,976,31744,31760⟩) (.node (.single ⟨960,976,31760,31776⟩) (.single ⟨976,992,31744,31760⟩)))) (.node (.node (.single ⟨976,992,31760,31776⟩) (.node (.single ⟨960,976,31776,31792⟩) (.single ⟨960,976,31792,31808⟩))) (.node (.single ⟨976,992,31776,31792⟩) (.node (.single ⟨976,992,31792,31808⟩) (.single ⟨992,1008,31744,31760⟩))))) (.node (.node (.node (.single ⟨992,1008,31760,31776⟩) (.node (.single ⟨1008,1024,31744,31760⟩) (.single ⟨1008,1024,31760,31776⟩))) (.node (.single ⟨992,1008,31776,31792⟩) (.node (.single ⟨992,1008,31792,31808⟩) (.single ⟨1008,1024,31776,31792⟩)))) (.node (.node (.single ⟨1008,1024,31792,31808⟩) (.node (.single ⟨960,976,31808,31824⟩) (.single ⟨960,976,31824,31840⟩))) (.node (.single ⟨976,992,31808,31824⟩) (.node (.single ⟨976,992,31824,31840⟩) (.single ⟨960,992,31840,31872⟩)))))) (.node (.node (.node (.node (.single ⟨992,1008,31808,31824⟩) (.node (.single ⟨992,1008,31824,31840⟩) (.single ⟨1008,1024,31808,31824⟩))) (.node (.single ⟨1008,1024,31824,31840⟩) (.node (.single ⟨992,1008,31840,31856⟩) (.single ⟨992,1008,31856,31872⟩)))) (.node (.node (.single ⟨1008,1024,31840,31856⟩) (.node (.single ⟨1008,1024,31856,31872⟩) (.single ⟨896,928,31872,31904⟩))) (.node (.single ⟨896,928,31904,31936⟩) (.node (.single ⟨928,960,31872,31904⟩) (.single ⟨928,960,31904,31936⟩))))) (.node (.node (.node (.single ⟨896,928,31936,31968⟩) (.node (.single ⟨896,928,31968,32000⟩) (.single ⟨928,960,31936,31968⟩))) (.node (.single ⟨928,960,31968,32000⟩) (.node (.single ⟨960,992,31872,31904⟩) (.single ⟨960,992,31904,31936⟩)))) (.node (.node (.single ⟨992,1024,31872,31904⟩) (.node (.single ⟨992,1024,31904,31936⟩) (.single ⟨960,992,31936,31968⟩))) (.node (.single ⟨960,992,31968,32000⟩) (.node (.single ⟨992,1024,31936,31968⟩) (.single ⟨992,1024,31968,32000⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨31744,31776,768,800⟩) (.single ⟨31744,31776,800,832⟩)) (.node (.single ⟨31776,31808,768,800⟩) (.node (.single ⟨31776,31808,800,832⟩) (.single ⟨31744,31776,832,864⟩)))) (.node (.node (.single ⟨31744,31776,864,896⟩) (.node (.single ⟨31776,31808,832,864⟩) (.single ⟨31776,31808,864,896⟩))) (.node (.single ⟨31808,31840,768,800⟩) (.node (.single ⟨31808,31840,800,832⟩) (.single ⟨31840,31872,768,800⟩))))) (.node (.node (.node (.single ⟨31840,31872,800,832⟩) (.node (.single ⟨31808,31840,832,864⟩) (.single ⟨31808,31840,864,896⟩))) (.node (.single ⟨31840,31872,832,864⟩) (.node (.single ⟨31840,31872,864,896⟩) (.single ⟨31744,31760,896,912⟩)))) (.node (.node (.single ⟨31744,31760,912,928⟩) (.node (.single ⟨31760,31776,896,912⟩) (.single ⟨31760,31776,912,928⟩))) (.node (.single ⟨31744,31760,928,944⟩) (.node (.single ⟨31744,31760,944,960⟩) (.single ⟨31760,31776,928,944⟩)))))) (.node (.node (.node (.node (.single ⟨31760,31776,944,960⟩) (.node (.single ⟨31776,31808,896,928⟩) (.single ⟨31776,31792,928,944⟩))) (.node (.single ⟨31776,31792,944,960⟩) (.node (.single ⟨31792,31808,928,944⟩) (.single ⟨31792,31808,944,960⟩)))) (.node (.node (.single ⟨31744,31760,960,976⟩) (.node (.single ⟨31744,31760,976,992⟩) (.single ⟨31760,31776,960,976⟩))) (.node (.single ⟨31760,31776,976,992⟩) (.node (.single ⟨31744,31760,992,1008⟩) (.single ⟨31744,31760,1008,1024⟩))))) (.node (.node (.node (.single ⟨31760,31776,992,1008⟩) (.node (.single ⟨31760,31776,1008,1024⟩) (.single ⟨31776,31792,960,976⟩))) (.node (.single ⟨31776,31792,976,992⟩) (.node (.single ⟨31792,31808,960,976⟩) (.single ⟨31792,31808,976,992⟩)))) (.node (.node (.single ⟨31776,31792,992,1008⟩) (.node (.single ⟨31776,31792,1008,1024⟩) (.single ⟨31792,31808,992,1008⟩))) (.node (.single ⟨31792,31808,1008,1024⟩) (.node (.single ⟨31808,31840,896,928⟩) (.single ⟨31808,31840,928,960⟩))))))) (.node (.node (.node (.node (.node (.single ⟨31840,31872,896,928⟩) (.single ⟨31840,31872,928,960⟩)) (.node (.single ⟨31808,31824,960,976⟩) (.node (.single ⟨31808,31824,976,992⟩) (.single ⟨31824,31840,960,976⟩)))) (.node (.node (.single ⟨31824,31840,976,992⟩) (.node (.single ⟨31808,31824,992,1008⟩) (.single ⟨31808,31824,1008,1024⟩))) (.node (.single ⟨31824,31840,992,1008⟩) (.node (.single ⟨31824,31840,1008,1024⟩) (.single ⟨31840,31872,960,992⟩))))) (.node (.node (.node (.single ⟨31840,31856,992,1008⟩) (.node (.single ⟨31840,31856,1008,1024⟩) (.single ⟨31856,31872,992,1008⟩))) (.node (.single ⟨31856,31872,1008,1024⟩) (.node (.single ⟨31872,31904,768,800⟩) (.single ⟨31872,31904,800,832⟩)))) (.node (.node (.single ⟨31904,31936,768,800⟩) (.node (.single ⟨31904,31936,800,832⟩) (.single ⟨31872,31904,832,864⟩))) (.node (.single ⟨31872,31904,864,896⟩) (.node (.single ⟨31904,31936,832,864⟩) (.single ⟨31904,31936,864,896⟩)))))) (.node (.node (.node (.node (.single ⟨31936,31968,768,800⟩) (.node (.single ⟨31936,31968,800,832⟩) (.single ⟨31968,32000,768,800⟩))) (.node (.single ⟨31968,32000,800,832⟩) (.node (.single ⟨31936,31968,832,864⟩) (.single ⟨31936,31968,864,896⟩)))) (.node (.node (.single ⟨31968,32000,832,864⟩) (.node (.single ⟨31968,32000,864,896⟩) (.single ⟨31872,31904,896,928⟩))) (.node (.single ⟨31872,31904,928,960⟩) (.node (.single ⟨31904,31936,896,928⟩) (.single ⟨31904,31936,928,960⟩))))) (.node (.node (.node (.single ⟨31872,31904,960,992⟩) (.node (.single ⟨31872,31904,992,1024⟩) (.single ⟨31904,31936,960,992⟩))) (.node (.single ⟨31904,31936,992,1024⟩) (.node (.single ⟨31936,31968,896,928⟩) (.single ⟨31936,31968,928,960⟩)))) (.node (.node (.single ⟨31968,32000,896,928⟩) (.node (.single ⟨31968,32000,928,960⟩) (.single ⟨31936,31968,960,992⟩))) (.node (.single ⟨31936,31968,992,1024⟩) (.node (.single ⟨31968,32000,960,992⟩) (.single ⟨31968,32000,992,1024⟩)))))))))
def output32 : Fin 188 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 376 := (.node (.node (.node (.node (.node (.node (.node (.node (.single 0) (.single 94)) (.node (.single 187) (.node (.single 93) (.single 1)))) (.node (.node (.single 96) (.node (.single 186) (.single 91))) (.node (.single 4) (.node (.single 102) (.single 183))))) (.node (.node (.node (.single 85) (.node (.single 5) (.single 104))) (.node (.single 182) (.node (.single 83) (.single 2)))) (.node (.node (.single 95) (.node (.single 185) (.single 92))) (.node (.single 3) (.node (.single 97) (.single 184)))))) (.node (.node (.node (.node (.single 90) (.node (.single 6) (.single 103))) (.node (.single 181) (.node (.single 84) (.single 7)))) (.node (.node (.single 105) (.node (.single 180) (.single 82))) (.node (.single 8) (.node (.single 98) (.single 179))))) (.node (.node (.node (.single 89) (.node (.single 9) (.single 100))) (.node (.single 178) (.node (.single 87) (.single 12)))) (.node (.node (.single 106) (.node (.single 175) (.single 81))) (.node (.single 13) (.node (.single 108) (.single 174))))))) (.node (.node (.node (.node (.node (.single 79) (.single 24)) (.node (.single 160) (.node (.single 163) (.single 27)))) (.node (.node (.single 25) (.node (.single 162) (.single 162))) (.node (.single 25) (.node (.single 10) (.single 99))))) (.node (.node (.node (.single 177) (.node (.single 88) (.single 11))) (.node (.single 101) (.node (.single 176) (.single 86)))) (.node (.node (.single 14) (.node (.single 107) (.single 173))) (.node (.single 80) (.node (.single 15) (.single 109)))))) (.node (.node (.node (.node (.single 172) (.node (.single 78) (.single 26))) (.node (.single 161) (.node (.single 161) (.single 26)))) (.node (.node (.single 27) (.node (.single 163) (.single 160))) (.node (.single 24) (.node (.single 36) (.single 118))))) (.node (.node (.node (.single 151) (.node (.single 69) (.single 45))) (.node (.single 139) (.node (.single 142) (.single 48)))) (.node (.node (.single 46) (.node (.single 141) (.single 141))) (.node (.single 46) (.node (.single 78) (.single 172)))))))) (.node (.node (.node (.node (.node (.node (.single 109) (.single 15)) (.node (.single 79) (.node (.single 174) (.single 108)))) (.node (.node (.single 13) (.node (.single 82) (.single 180))) (.node (.single 105) (.node (.single 7) (.single 83))))) (.node (.node (.node (.single 182) (.node (.single 104) (.single 5))) (.node (.single 47) (.node (.single 140) (.single 140)))) (.node (.node (.single 47) (.node (.single 48) (.single 142))) (.node (.single 139) (.node (.single 45) (.single 80)))))) (.node (.node (.node (.node (.single 173) (.node (.single 107) (.single 14))) (.node (.single 81) (.node (.single 175) (.single 106)))) (.node (.node (.single 12) (.node (.single 84) (.single 181))) (.node (.single 103) (.node (.single 6) (.single 85))))) (.node (.node (.node (.single 183) (.node (.single 102) (.single 4))) (.node (.single 69) (.node (.single 151) (.single 118)))) (.node (.node (.single 36) (.node (.single 86) (.single 176))) (.node (.single 101) (.node (.single 11) (.single 87))))))) (.node (.node (.node (.node (.node (.single 178) (.single 100)) (.node (.single 9) (.node (.single 90) (.single 184)))) (.node (.node (.single 97) (.node (.single 3) (.single 91))) (.node (.single 186) (.node (.single 96) (.single 1))))) (.node (.node (.node (.single 88) (.node (.single 177) (.single 99))) (.node (.single 10) (.node (.single 89) (.single 179)))) (.node (.node (.single 98) (.node (.single 8) (.single 92))) (.node (.single 185) (.node (.single 95) (.single 2)))))) (.node (.node (.node (.node (.single 93) (.node (.single 187) (.single 94))) (.node (.single 0) (.node (.single 16) (.single 156)))) (.node (.node (.single 171) (.node (.single 31) (.single 17))) (.node (.single 158) (.node (.single 170) (.single 29))))) (.node (.node (.node (.single 18) (.node (.single 157) (.single 169))) (.node (.single 30) (.node (.single 19) (.single 159)))) (.node (.node (.single 168) (.node (.single 28) (.single 20))) (.node (.single 164) (.node (.single 167) (.single 23))))))))) (.node (.node (.node (.node (.node (.node (.node (.single 21) (.single 166)) (.node (.single 166) (.node (.single 21) (.single 22)))) (.node (.node (.single 165) (.node (.single 165) (.single 22))) (.node (.single 23) (.node (.single 167) (.single 164))))) (.node (.node (.node (.single 20) (.node (.single 28) (.single 168))) (.node (.single 159) (.node (.single 19) (.single 29)))) (.node (.node (.single 170) (.node (.single 158) (.single 17))) (.node (.single 30) (.node (.single 169) (.single 157)))))) (.node (.node (.node (.node (.single 18) (.node (.single 31) (.single 171))) (.node (.single 156) (.node (.single 16) (.single 49)))) (.node (.node (.single 123) (.node (.single 138) (.single 64))) (.node (.single 50) (.node (.single 125) (.single 137))))) (.node (.node (.node (.single 62) (.node (.single 51) (.single 124))) (.node (.single 136) (.node (.single 63) (.single 52)))) (.node (.node (.single 126) (.node (.single 135) (.single 61))) (.node (.single 57) (.node (.single 127) (.single 130))))))) (.node (.node (.node (.node (.node (.single 60) (.single 58)) (.node (.single 129) (.node (.single 129) (.single 58)))) (.node (.node (.single 59) (.node (.single 128) (.single 128))) (.node (.single 59) (.node (.single 60) (.single 130))))) (.node (.node (.node (.single 127) (.node (.single 57) (.single 61))) (.node (.single 135) (.node (.single 126) (.single 52)))) (.node (.node (.single 62) (.node (.single 137) (.single 125))) (.node (.single 50) (.node (.single 63) (.single 136)))))) (.node (.node (.node (.node (.single 124) (.node (.single 51) (.single 64))) (.node (.single 138) (.node (.single 123) (.single 49)))) (.node (.node (.single 32) (.node (.single 110) (.single 155))) (.node (.single 77) (.node (.single 33) (.single 112))))) (.node (.node (.node (.single 154) (.node (.single 75) (.single 34))) (.node (.single 111) (.node (.single 153) (.single 76)))) (.node (.node (.single 35) (.node (.single 113) (.single 152))) (.node (.single 74) (.node (.single 37) (.single 114)))))))) (.node (.node (.node (.node (.node (.node (.single 150) (.single 73)) (.node (.single 38) (.node (.single 116) (.single 149)))) (.node (.node (.single 71) (.node (.single 39) (.single 115))) (.node (.single 148) (.node (.single 72) (.single 40))))) (.node (.node (.node (.single 117) (.node (.single 147) (.single 70))) (.node (.single 41) (.node (.single 119) (.single 146)))) (.node (.node (.single 68) (.node (.single 42) (.single 121))) (.node (.single 145) (.node (.single 66) (.single 43)))))) (.node (.node (.node (.node (.single 120) (.node (.single 144) (.single 67))) (.node (.single 44) (.node (.single 122) (.single 143)))) (.node (.node (.single 65) (.node (.single 53) (.single 131))) (.node (.single 134) (.node (.single 56) (.single 54))))) (.node (.node (.node (.single 133) (.node (.single 133) (.single 54))) (.node (.single 55) (.node (.single 132) (.single 132)))) (.node (.node (.single 55) (.node (.single 56) (.single 134))) (.node (.single 131) (.node (.single 53) (.single 65))))))) (.node (.node (.node (.node (.node (.single 143) (.single 122)) (.node (.single 44) (.node (.single 66) (.single 145)))) (.node (.node (.single 121) (.node (.single 42) (.single 67))) (.node (.single 144) (.node (.single 120) (.single 43))))) (.node (.node (.node (.single 68) (.node (.single 146) (.single 119))) (.node (.single 41) (.node (.single 70) (.single 147)))) (.node (.node (.single 117) (.node (.single 40) (.single 71))) (.node (.single 149) (.node (.single 116) (.single 38)))))) (.node (.node (.node (.node (.single 72) (.node (.single 148) (.single 115))) (.node (.single 39) (.node (.single 73) (.single 150)))) (.node (.node (.single 114) (.node (.single 37) (.single 74))) (.node (.single 152) (.node (.single 113) (.single 35))))) (.node (.node (.node (.single 75) (.node (.single 154) (.single 112))) (.node (.single 33) (.node (.single 76) (.single 153)))) (.node (.node (.single 111) (.node (.single 34) (.single 77))) (.node (.single 155) (.node (.single 110) (.single 32))))))))))
def sourceData32 : FiniteInputTree ℕ 188 := (.node (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 16) (.node (.single 20) (.single 8)))) (.node (.node (.single 12) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 36) (.single 56))))) (.node (.node (.node (.single 60) (.node (.single 40) (.single 44))) (.node (.single 64) (.node (.single 68) (.single 168)))) (.node (.node (.single 172) (.node (.single 176) (.single 180))) (.node (.single 184) (.node (.single 188) (.single 192)))))) (.node (.node (.node (.node (.single 187) (.node (.single 48) (.single 52))) (.node (.single 72) (.node (.single 51) (.single 183)))) (.node (.node (.single 175) (.node (.single 179) (.single 171))) (.node (.single 264) (.node (.single 268) (.single 272))))) (.node (.node (.node (.single 276) (.node (.single 80) (.single 280))) (.node (.single 284) (.node (.single 288) (.single 292)))) (.node (.node (.single 296) (.node (.single 300) (.single 304))) (.node (.single 308) (.node (.single 84) (.single 88))))))) (.node (.node (.node (.node (.node (.single 108) (.single 87)) (.node (.single 216) (.node (.single 220) (.single 224)))) (.node (.node (.single 228) (.node (.single 312) (.single 316))) (.node (.single 320) (.node (.single 315) (.single 232))))) (.node (.node (.node (.single 236) (.node (.single 240) (.single 235))) (.node (.single 231) (.node (.single 223) (.single 227)))) (.node (.node (.single 219) (.node (.single 311) (.single 303))) (.node (.single 307) (.node (.single 299) (.single 83)))))) (.node (.node (.node (.node (.single 295) (.node (.single 287) (.single 291))) (.node (.single 283) (.node (.single 279) (.single 271)))) (.node (.node (.single 275) (.node (.single 267) (.single 71))) (.node (.single 47) (.node (.single 67) (.single 43))))) (.node (.node (.node (.single 31) (.node (.single 15) (.single 27))) (.node (.single 11) (.node (.single 63) (.single 39)))) (.node (.node (.single 59) (.node (.single 35) (.single 23))) (.node (.single 7) (.node (.single 19) (.single 3)))))))) (.node (.node (.node (.node (.node (.node (.single 1) (.single 17)) (.node (.single 5) (.node (.single 21) (.single 33)))) (.node (.node (.single 57) (.node (.single 37) (.single 61))) (.node (.single 9) (.node (.single 25) (.single 13))))) (.node (.node (.node (.single 29) (.node (.single 41) (.single 65))) (.node (.single 45) (.node (.single 69) (.single 265)))) (.node (.node (.single 273) (.node (.single 269) (.single 277))) (.node (.single 281) (.node (.single 289) (.single 285)))))) (.node (.node (.node (.node (.single 293) (.node (.single 81) (.single 297))) (.node (.single 305) (.node (.single 301) (.single 309)))) (.node (.node (.single 217) (.node (.single 225) (.single 221))) (.node (.single 229) (.node (.single 233) (.single 241))))) (.node (.node (.node (.single 237) (.node (.single 234) (.single 313))) (.node (.single 321) (.node (.single 317) (.single 314)))) (.node (.node (.single 230) (.node (.single 226) (.single 222))) (.node (.single 218) (.node (.single 85) (.single 109))))))) (.node (.node (.node (.node (.node (.single 89) (.single 86)) (.node (.single 310) (.node (.single 306) (.single 302)))) (.node (.node (.single 298) (.node (.single 294) (.single 290))) (.node (.single 286) (.node (.single 282) (.single 82))))) (.node (.node (.node (.single 278) (.node (.single 274) (.single 270))) (.node (.single 266) (.node (.single 169) (.single 177)))) (.node (.node (.single 173) (.node (.single 181) (.single 49))) (.node (.single 73) (.node (.single 53) (.single 50)))))) (.node (.node (.node (.node (.single 185) (.node (.single 193) (.single 189))) (.node (.single 186) (.node (.single 182) (.single 178)))) (.node (.node (.single 174) (.node (.single 170) (.single 70))) (.node (.single 66) (.node (.single 46) (.single 42))))) (.node (.node (.node (.single 62) (.node (.single 58) (.single 38))) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 14) (.node (.single 10) (.single 22))) (.node (.single 18) (.node (.single 6) (.single 2)))))))))
def cover32 (i : Fin 376) : Fin 188 := ⟨coverData32.get i % 188, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 188) : Fin 376 := ⟨sourceData32.get i % 376, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 .empty (.cutY 32256 (.cutX 768 .empty (.cutY 32000 (.cutX 896 (.cutY 31872 (.cutX 832 (.cutY 31808 (.cutX 800 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) (.cutX 800 (.cutY 31840 .full .full) (.cutY 31840 .full .full))) (.cutY 31808 (.cutX 864 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) (.cutX 864 (.cutY 31840 .full .full) (.cutY 31840 .full .full)))) (.cutX 832 (.cutY 31936 (.cutX 800 (.cutY 31904 .full .full) (.cutY 31904 .full .full)) (.cutX 800 (.cutY 31968 .full .full) (.cutY 31968 .full .full))) (.cutY 31936 (.cutX 864 (.cutY 31904 .full .full) (.cutY 31904 .full .full)) (.cutX 864 (.cutY 31968 .full .full) (.cutY 31968 .full .full))))) (.cutY 31872 (.cutX 960 (.cutY 31808 (.cutX 928 (.cutY 31776 (.cutX 912 (.cutY 31760 .full .full) (.cutY 31760 .full .full)) .full) (.cutY 31776 (.cutX 944 (.cutY 31760 .full .full) (.cutY 31760 .full .full)) (.cutX 944 (.cutY 31792 .full .full) (.cutY 31792 .full .full)))) (.cutX 928 (.cutY 31840 .full .full) (.cutY 31840 .full .full))) (.cutY 31808 (.cutX 992 (.cutY 31776 (.cutX 976 (.cutY 31760 .full .full) (.cutY 31760 .full .full)) (.cutX 976 (.cutY 31792 .full .full) (.cutY 31792 .full .full))) (.cutY 31776 (.cutX 1008 (.cutY 31760 .full .full) (.cutY 31760 .full .full)) (.cutX 1008 (.cutY 31792 .full .full) (.cutY 31792 .full .full)))) (.cutX 992 (.cutY 31840 (.cutX 976 (.cutY 31824 .full .full) (.cutY 31824 .full .full)) .full) (.cutY 31840 (.cutX 1008 (.cutY 31824 .full .full) (.cutY 31824 .full .full)) (.cutX 1008 (.cutY 31856 .full .full) (.cutY 31856 .full .full)))))) (.cutX 960 (.cutY 31936 (.cutX 928 (.cutY 31904 .full .full) (.cutY 31904 .full .full)) (.cutX 928 (.cutY 31968 .full .full) (.cutY 31968 .full .full))) (.cutY 31936 (.cutX 992 (.cutY 31904 .full .full) (.cutY 31904 .full .full)) (.cutX 992 (.cutY 31968 .full .full) (.cutY 31968 .full .full)))))) .empty)) .empty))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 .empty (.cutX 32000 (.cutY 768 .empty (.cutX 31872 (.cutY 896 (.cutX 31808 (.cutY 832 (.cutX 31776 (.cutY 800 .full .full) (.cutY 800 .full .full)) (.cutX 31776 (.cutY 864 .full .full) (.cutY 864 .full .full))) (.cutY 832 (.cutX 31840 (.cutY 800 .full .full) (.cutY 800 .full .full)) (.cutX 31840 (.cutY 864 .full .full) (.cutY 864 .full .full)))) (.cutX 31808 (.cutY 960 (.cutX 31776 (.cutY 928 (.cutX 31760 (.cutY 912 .full .full) (.cutY 912 .full .full)) (.cutX 31760 (.cutY 944 .full .full) (.cutY 944 .full .full))) (.cutY 928 .full (.cutX 31792 (.cutY 944 .full .full) (.cutY 944 .full .full)))) (.cutX 31776 (.cutY 992 (.cutX 31760 (.cutY 976 .full .full) (.cutY 976 .full .full)) (.cutX 31760 (.cutY 1008 .full .full) (.cutY 1008 .full .full))) (.cutY 992 (.cutX 31792 (.cutY 976 .full .full) (.cutY 976 .full .full)) (.cutX 31792 (.cutY 1008 .full .full) (.cutY 1008 .full .full))))) (.cutY 960 (.cutX 31840 (.cutY 928 .full .full) (.cutY 928 .full .full)) (.cutX 31840 (.cutY 992 (.cutX 31824 (.cutY 976 .full .full) (.cutY 976 .full .full)) (.cutX 31824 (.cutY 1008 .full .full) (.cutY 1008 .full .full))) (.cutY 992 .full (.cutX 31856 (.cutY 1008 .full .full) (.cutY 1008 .full .full))))))) (.cutY 896 (.cutX 31936 (.cutY 832 (.cutX 31904 (.cutY 800 .full .full) (.cutY 800 .full .full)) (.cutX 31904 (.cutY 864 .full .full) (.cutY 864 .full .full))) (.cutY 832 (.cutX 31968 (.cutY 800 .full .full) (.cutY 800 .full .full)) (.cutX 31968 (.cutY 864 .full .full) (.cutY 864 .full .full)))) (.cutX 31936 (.cutY 960 (.cutX 31904 (.cutY 928 .full .full) (.cutY 928 .full .full)) (.cutX 31904 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 (.cutX 31968 (.cutY 928 .full .full) (.cutY 928 .full .full)) (.cutX 31968 (.cutY 992 .full .full) (.cutY 992 .full .full))))))) .empty)) .empty) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata32 : 0<142718076 ∧ 3<128 ∧ 124<128 ∧ 3<4 ∧
    12979/4160=3 ∧ 12979%4160=499 ∧ ∀ i, (leaves32 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData32).mp
    (by decide +kernel)

theorem sourceChecked32_0 : ∀ i : Fin 64,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 188 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked32_64 : ∀ i : Fin 64,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 188 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked32_128 : ∀ i : Fin 60,
    (fun i => output32 i = raw32 (source32 i)) (finOffset 188 128 60 (by decide) i) := by decide +kernel

theorem sourceChecked32 : ∀ i : Fin 188, (fun i => output32 i = raw32 (source32 i)) i :=
  forallFin_of_zero_offset (fun i => output32 i = raw32 (source32 i)) (forallFinOffset_add (fun i => output32 i = raw32 (source32 i)) 0 64 124 (by decide) sourceChecked32_0
    (forallFinOffset_add (fun i => output32 i = raw32 (source32 i)) 64 64 60 (by decide) sourceChecked32_64
    sourceChecked32_128))

theorem coverChecked32_0 : ∀ i : Fin 64,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 376 0 64 (by decide) i) := by decide +kernel

theorem coverChecked32_64 : ∀ i : Fin 64,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 376 64 64 (by decide) i) := by decide +kernel

theorem coverChecked32_128 : ∀ i : Fin 64,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 376 128 64 (by decide) i) := by decide +kernel

theorem coverChecked32_192 : ∀ i : Fin 64,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 376 192 64 (by decide) i) := by decide +kernel

theorem coverChecked32_256 : ∀ i : Fin 64,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 376 256 64 (by decide) i) := by decide +kernel

theorem coverChecked32_320 : ∀ i : Fin 56,
    (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (finOffset 376 320 56 (by decide) i) := by decide +kernel

theorem coverChecked32 : ∀ i : Fin 376, (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) i :=
  forallFin_of_zero_offset (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) (forallFinOffset_add (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) 0 64 312 (by decide) coverChecked32_0
    (forallFinOffset_add (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) 64 64 248 (by decide) coverChecked32_64
    (forallFinOffset_add (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) 128 64 184 (by decide) coverChecked32_128
    (forallFinOffset_add (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) 192 64 120 (by decide) coverChecked32_192
    (forallFinOffset_add (fun i => (output32 (cover32 i)).ContainsBox (raw32 i)) 256 64 56 (by decide) coverChecked32_256
    coverChecked32_320)))))

theorem treeChecked32 : tree32.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves32 : List.ofFn output32 = tree32.leaves ⟨0,32768,0,32768⟩ := by
  unfold output32
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked32 : gridTreeUnionCheck 32768 raw32 output32 cover32 source32 tree32 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked32, coverChecked32, treeChecked32, treeLeaves32⟩

theorem areaUnits32 : gridUnionAreaUnits output32 = 131072 := by decide +kernel

noncomputable def phaseMass32 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 15334, atom 12730, type 3, source (1,123).
def leavesData33 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves33 : Fin 10 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 123 leaves33 i
def outputData33 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,384,31488,31616⟩) (.single ⟨256,384,31616,31744⟩)) (.node (.single ⟨384,448,31488,31552⟩) (.node (.single ⟨384,448,31552,31616⟩) (.single ⟨448,512,31488,31552⟩)))) (.node (.node (.single ⟨448,512,31552,31616⟩) (.single ⟨384,448,31616,31680⟩)) (.node (.single ⟨384,448,31680,31744⟩) (.node (.single ⟨448,512,31616,31680⟩) (.single ⟨448,512,31680,31744⟩))))) (.node (.node (.node (.single ⟨1024,1088,32256,32320⟩) (.single ⟨1024,1088,32320,32384⟩)) (.node (.single ⟨1088,1152,32256,32320⟩) (.node (.single ⟨1088,1152,32320,32384⟩) (.single ⟨1024,1152,32384,32512⟩)))) (.node (.node (.single ⟨1152,1216,32256,32320⟩) (.single ⟨1152,1216,32320,32384⟩)) (.node (.single ⟨1216,1280,32256,32320⟩) (.node (.single ⟨1216,1280,32320,32384⟩) (.single ⟨1152,1280,32384,32512⟩)))))) (.node (.node (.node (.node (.single ⟨31488,31616,256,384⟩) (.single ⟨31488,31552,384,448⟩)) (.node (.single ⟨31488,31552,448,512⟩) (.node (.single ⟨31552,31616,384,448⟩) (.single ⟨31552,31616,448,512⟩)))) (.node (.node (.single ⟨31616,31744,256,384⟩) (.single ⟨31616,31680,384,448⟩)) (.node (.single ⟨31616,31680,448,512⟩) (.node (.single ⟨31680,31744,384,448⟩) (.single ⟨31680,31744,448,512⟩))))) (.node (.node (.node (.single ⟨32256,32320,1024,1088⟩) (.single ⟨32256,32320,1088,1152⟩)) (.node (.single ⟨32320,32384,1024,1088⟩) (.node (.single ⟨32320,32384,1088,1152⟩) (.single ⟨32256,32320,1152,1216⟩)))) (.node (.node (.single ⟨32256,32320,1216,1280⟩) (.single ⟨32320,32384,1152,1216⟩)) (.node (.single ⟨32320,32384,1216,1280⟩) (.node (.single ⟨32384,32512,1024,1152⟩) (.single ⟨32384,32512,1152,1280⟩)))))))
def output33 : Fin 40 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover33 (i : Fin 40) : Fin 40 := ⟨coverData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 40) : Fin 40 := ⟨sourceData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 .empty (.cutX 256 .empty (.cutY 31488 .empty (.cutX 384 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 448 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 448 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))))) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 .empty (.cutX 1280 (.cutY 32512 (.cutX 1152 (.cutY 32384 (.cutX 1088 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full) (.cutY 32384 (.cutX 1216 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty) .empty)) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 (.cutX 31488 .empty (.cutY 256 .empty (.cutX 31616 (.cutY 384 .full (.cutX 31552 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full (.cutX 31680 (.cutY 448 .full .full) (.cutY 448 .full .full)))))) .empty)) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 (.cutX 32512 (.cutY 1280 (.cutX 32384 (.cutY 1152 (.cutX 32320 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 32320 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty)))) .empty)) .empty)) .empty)) .empty))

theorem metadata33 : 0<142718076 ∧ 1<128 ∧ 123<128 ∧ 3<4 ∧
    12730/4160=3 ∧ 12730%4160=250 ∧ ∀ i, (leaves33 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData33).mp
    (by decide +kernel)

theorem sourceChecked33_0 : ∀ i : Fin 40,
    (fun i => output33 i = raw33 (source33 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked33 : ∀ i : Fin 40, (fun i => output33 i = raw33 (source33 i)) i :=
  forallFin_of_zero_offset (fun i => output33 i = raw33 (source33 i)) sourceChecked33_0

theorem coverChecked33_0 : ∀ i : Fin 40,
    (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked33 : ∀ i : Fin 40, (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) i :=
  forallFin_of_zero_offset (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) coverChecked33_0

theorem treeChecked33 : tree33.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves33 : List.ofFn output33 = tree33.leaves ⟨0,32768,0,32768⟩ := by
  unfold output33
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked33 : gridTreeUnionCheck 32768 raw33 output33 cover33 source33 tree33 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked33, coverChecked33, treeChecked33, treeLeaves33⟩

theorem areaUnits33 : gridUnionAreaUnits output33 = 262144 := by decide +kernel

noncomputable def phaseMass33 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 15335, atom 12731, type 3, source (1,124).
def leavesData34 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves34 : Fin 10 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 124 leaves34 i
def outputData34 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,384,31744,31872⟩) (.single ⟨256,384,31872,32000⟩)) (.node (.single ⟨384,448,31744,31808⟩) (.node (.single ⟨384,448,31808,31872⟩) (.single ⟨448,512,31744,31808⟩)))) (.node (.node (.single ⟨448,512,31808,31872⟩) (.single ⟨384,448,31872,31936⟩)) (.node (.single ⟨384,448,31936,32000⟩) (.node (.single ⟨448,512,31872,31936⟩) (.single ⟨448,512,31936,32000⟩))))) (.node (.node (.node (.single ⟨768,832,32256,32320⟩) (.single ⟨768,832,32320,32384⟩)) (.node (.single ⟨832,896,32256,32320⟩) (.node (.single ⟨832,896,32320,32384⟩) (.single ⟨768,896,32384,32512⟩)))) (.node (.node (.single ⟨896,960,32256,32320⟩) (.single ⟨896,960,32320,32384⟩)) (.node (.single ⟨960,1024,32256,32320⟩) (.node (.single ⟨960,1024,32320,32384⟩) (.single ⟨896,1024,32384,32512⟩)))))) (.node (.node (.node (.node (.single ⟨31744,31872,256,384⟩) (.single ⟨31744,31808,384,448⟩)) (.node (.single ⟨31744,31808,448,512⟩) (.node (.single ⟨31808,31872,384,448⟩) (.single ⟨31808,31872,448,512⟩)))) (.node (.node (.single ⟨31872,32000,256,384⟩) (.single ⟨31872,31936,384,448⟩)) (.node (.single ⟨31872,31936,448,512⟩) (.node (.single ⟨31936,32000,384,448⟩) (.single ⟨31936,32000,448,512⟩))))) (.node (.node (.node (.single ⟨32256,32320,768,832⟩) (.single ⟨32256,32320,832,896⟩)) (.node (.single ⟨32320,32384,768,832⟩) (.node (.single ⟨32320,32384,832,896⟩) (.single ⟨32256,32320,896,960⟩)))) (.node (.node (.single ⟨32256,32320,960,1024⟩) (.single ⟨32320,32384,896,960⟩)) (.node (.single ⟨32320,32384,960,1024⟩) (.node (.single ⟨32384,32512,768,896⟩) (.single ⟨32384,32512,896,1024⟩)))))))
def output34 : Fin 40 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover34 (i : Fin 40) : Fin 40 := ⟨coverData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 40) : Fin 40 := ⟨sourceData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 (.cutX 256 .empty (.cutY 32000 (.cutX 384 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 448 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 448 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty) (.cutY 32256 .empty (.cutX 768 .empty (.cutY 32512 (.cutX 896 (.cutY 32384 (.cutX 832 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full) (.cutY 32384 (.cutX 960 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty))))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 (.cutX 32000 (.cutY 256 .empty (.cutX 31872 (.cutY 384 .full (.cutX 31808 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full (.cutX 31936 (.cutY 448 .full .full) (.cutY 448 .full .full))))) .empty) .empty) (.cutY 512 .empty (.cutX 32512 (.cutY 768 .empty (.cutX 32384 (.cutY 896 (.cutX 32320 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 32320 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty))) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata34 : 0<142718076 ∧ 1<128 ∧ 124<128 ∧ 3<4 ∧
    12731/4160=3 ∧ 12731%4160=251 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 40,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 40, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 40,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 40, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
  forallFin_of_zero_offset (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) coverChecked34_0

theorem treeChecked34 : tree34.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves34 : List.ofFn output34 = tree34.leaves ⟨0,32768,0,32768⟩ := by
  unfold output34
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked34 : gridTreeUnionCheck 32768 raw34 output34 cover34 source34 tree34 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked34, coverChecked34, treeChecked34, treeLeaves34⟩

theorem areaUnits34 : gridUnionAreaUnits output34 = 262144 := by decide +kernel

noncomputable def phaseMass34 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 15336, atom 12596, type 3, source (0,116).
def leavesData35 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)))) (.node (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,0,2⟩))))) (.node (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩))) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves35 : Fin 22 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 0 116 leaves35 i
def outputData35 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,29696,29760⟩) (.single ⟨0,64,29760,29824⟩)) (.node (.single ⟨64,128,29696,29760⟩) (.node (.single ⟨64,128,29760,29824⟩) (.single ⟨0,64,29824,29888⟩)))) (.node (.node (.single ⟨0,64,29888,29952⟩) (.node (.single ⟨64,128,29824,29888⟩) (.single ⟨64,128,29888,29952⟩))) (.node (.single ⟨128,192,29696,29760⟩) (.node (.single ⟨128,192,29760,29824⟩) (.single ⟨192,224,29696,29728⟩))))) (.node (.node (.node (.single ⟨192,224,29728,29760⟩) (.single ⟨224,256,29696,29728⟩)) (.node (.single ⟨224,256,29728,29760⟩) (.node (.single ⟨192,224,29760,29792⟩) (.single ⟨192,224,29792,29824⟩)))) (.node (.node (.single ⟨224,256,29760,29792⟩) (.node (.single ⟨224,256,29792,29824⟩) (.single ⟨128,192,29824,29888⟩))) (.node (.single ⟨128,192,29888,29952⟩) (.node (.single ⟨192,256,29824,29888⟩) (.single ⟨192,256,29888,29952⟩)))))) (.node (.node (.node (.node (.single ⟨2816,2880,32512,32576⟩) (.single ⟨2816,2880,32576,32640⟩)) (.node (.single ⟨2880,2944,32512,32576⟩) (.node (.single ⟨2880,2944,32576,32640⟩) (.single ⟨2816,2880,32640,32704⟩)))) (.node (.node (.single ⟨2816,2880,32704,32768⟩) (.node (.single ⟨2880,2944,32640,32704⟩) (.single ⟨2880,2944,32704,32768⟩))) (.node (.single ⟨2944,2976,32512,32544⟩) (.node (.single ⟨2944,2976,32544,32576⟩) (.single ⟨2976,3008,32512,32544⟩))))) (.node (.node (.node (.single ⟨2976,3008,32544,32576⟩) (.single ⟨2944,3008,32576,32640⟩)) (.node (.single ⟨3008,3040,32512,32544⟩) (.node (.single ⟨3008,3040,32544,32576⟩) (.single ⟨3040,3072,32512,32544⟩)))) (.node (.node (.single ⟨3040,3072,32544,32576⟩) (.node (.single ⟨3008,3072,32576,32640⟩) (.single ⟨2944,3008,32640,32704⟩))) (.node (.single ⟨2944,3008,32704,32768⟩) (.node (.single ⟨3008,3072,32640,32704⟩) (.single ⟨3008,3072,32704,32768⟩))))))) (.node (.node (.node (.node (.node (.single ⟨29696,29760,0,64⟩) (.single ⟨29696,29760,64,128⟩)) (.node (.single ⟨29760,29824,0,64⟩) (.node (.single ⟨29760,29824,64,128⟩) (.single ⟨29696,29760,128,192⟩)))) (.node (.node (.single ⟨29696,29728,192,224⟩) (.node (.single ⟨29696,29728,224,256⟩) (.single ⟨29728,29760,192,224⟩))) (.node (.single ⟨29728,29760,224,256⟩) (.node (.single ⟨29760,29824,128,192⟩) (.single ⟨29760,29792,192,224⟩))))) (.node (.node (.node (.single ⟨29760,29792,224,256⟩) (.single ⟨29792,29824,192,224⟩)) (.node (.single ⟨29792,29824,224,256⟩) (.node (.single ⟨29824,29888,0,64⟩) (.single ⟨29824,29888,64,128⟩)))) (.node (.node (.single ⟨29888,29952,0,64⟩) (.node (.single ⟨29888,29952,64,128⟩) (.single ⟨29824,29888,128,192⟩))) (.node (.single ⟨29824,29888,192,256⟩) (.node (.single ⟨29888,29952,128,192⟩) (.single ⟨29888,29952,192,256⟩)))))) (.node (.node (.node (.node (.single ⟨32512,32576,2816,2880⟩) (.single ⟨32512,32576,2880,2944⟩)) (.node (.single ⟨32576,32640,2816,2880⟩) (.node (.single ⟨32576,32640,2880,2944⟩) (.single ⟨32512,32544,2944,2976⟩)))) (.node (.node (.single ⟨32512,32544,2976,3008⟩) (.node (.single ⟨32544,32576,2944,2976⟩) (.single ⟨32544,32576,2976,3008⟩))) (.node (.single ⟨32512,32544,3008,3040⟩) (.node (.single ⟨32512,32544,3040,3072⟩) (.single ⟨32544,32576,3008,3040⟩))))) (.node (.node (.node (.single ⟨32544,32576,3040,3072⟩) (.single ⟨32576,32640,2944,3008⟩)) (.node (.single ⟨32576,32640,3008,3072⟩) (.node (.single ⟨32640,32704,2816,2880⟩) (.single ⟨32640,32704,2880,2944⟩)))) (.node (.node (.single ⟨32704,32768,2816,2880⟩) (.node (.single ⟨32704,32768,2880,2944⟩) (.single ⟨32640,32704,2944,3008⟩))) (.node (.single ⟨32640,32704,3008,3072⟩) (.node (.single ⟨32704,32768,2944,3008⟩) (.single ⟨32704,32768,3008,3072⟩))))))))
def output35 : Fin 88 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 48)) (.node (.single 79) (.node (.single 39) (.single 9)))) (.node (.node (.single 53) (.node (.single 78) (.single 34))) (.node (.single 18) (.node (.single 62) (.single 69))))) (.node (.node (.node (.single 25) (.single 19)) (.node (.single 64) (.node (.single 68) (.single 23)))) (.node (.node (.single 20) (.node (.single 63) (.single 67))) (.node (.single 24) (.node (.single 21) (.single 65)))))) (.node (.node (.node (.node (.single 66) (.single 22)) (.node (.single 0) (.node (.single 44) (.single 87)))) (.node (.node (.single 43) (.node (.single 1) (.single 46))) (.node (.single 86) (.node (.single 41) (.single 2))))) (.node (.node (.node (.single 45) (.single 85)) (.node (.single 42) (.node (.single 3) (.single 47)))) (.node (.node (.single 84) (.node (.single 40) (.single 4))) (.node (.single 58) (.node (.single 83) (.single 29))))))) (.node (.node (.node (.node (.node (.single 5) (.single 60)) (.node (.single 82) (.node (.single 27) (.single 6)))) (.node (.node (.single 59) (.node (.single 81) (.single 28))) (.node (.single 7) (.node (.single 61) (.single 80))))) (.node (.node (.node (.single 26) (.single 10)) (.node (.single 49) (.node (.single 77) (.single 38)))) (.node (.node (.single 11) (.node (.single 51) (.single 76))) (.node (.single 36) (.node (.single 12) (.single 50)))))) (.node (.node (.node (.node (.single 75) (.single 37)) (.node (.single 13) (.node (.single 52) (.single 74)))) (.node (.node (.single 35) (.node (.single 14) (.single 54))) (.node (.single 73) (.node (.single 33) (.single 15))))) (.node (.node (.node (.single 56) (.single 72)) (.node (.single 31) (.node (.single 16) (.single 55)))) (.node (.node (.single 71) (.node (.single 32) (.single 17))) (.node (.single 57) (.node (.single 70) (.single 30))))))))
def sourceData35 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 0) (.node (.single 4) (.single 56))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 76)))) (.node (.node (.single 80) (.node (.single 84) (.single 8))) (.node (.single 12) (.node (.single 16) (.single 20)))))) (.node (.node (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 55)))) (.node (.node (.single 47) (.node (.single 51) (.single 43))) (.node (.single 87) (.node (.single 79) (.single 83))))) (.node (.node (.node (.single 75) (.single 7)) (.node (.single 71) (.node (.single 63) (.single 67)))) (.node (.node (.single 59) (.node (.single 3) (.single 39))) (.node (.single 31) (.node (.single 35) (.single 27))))))) (.node (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 1)))) (.node (.node (.single 57) (.node (.single 65) (.single 61))) (.node (.single 69) (.node (.single 5) (.single 73))))) (.node (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 41) (.single 49)))) (.node (.node (.single 45) (.node (.single 53) (.single 9))) (.node (.single 17) (.node (.single 13) (.single 21)))))) (.node (.node (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 86)))) (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 58) (.single 6)) (.node (.single 2) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.single 34) (.node (.single 30) (.single 26))))))))
def cover35 (i : Fin 88) : Fin 88 := ⟨coverData35.get i % 88, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 88) : Fin 88 := ⟨sourceData35.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 .empty (.cutX 512 (.cutY 30208 (.cutX 256 (.cutY 29952 (.cutX 128 (.cutY 29824 (.cutX 64 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) (.cutX 64 (.cutY 29888 .full .full) (.cutY 29888 .full .full))) (.cutY 29824 (.cutX 192 (.cutY 29760 .full .full) (.cutY 29760 (.cutX 224 (.cutY 29728 .full .full) (.cutY 29728 .full .full)) (.cutX 224 (.cutY 29792 .full .full) (.cutY 29792 .full .full)))) (.cutX 192 (.cutY 29888 .full .full) (.cutY 29888 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 (.cutY 31744 .empty (.cutX 2560 .empty (.cutY 32256 .empty (.cutX 2816 .empty (.cutY 32512 .empty (.cutX 2944 (.cutY 32640 (.cutX 2880 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 2880 (.cutY 32704 .full .full) (.cutY 32704 .full .full))) (.cutY 32640 (.cutX 3008 (.cutY 32576 (.cutX 2976 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full) (.cutY 32576 (.cutX 3040 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 3008 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))))))) .empty)))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 .empty (.cutY 1024 (.cutX 30208 (.cutY 512 (.cutX 29952 (.cutY 256 (.cutX 29824 (.cutY 128 (.cutX 29760 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 29760 (.cutY 192 .full (.cutX 29728 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full (.cutX 29792 (.cutY 224 .full .full) (.cutY 224 .full .full))))) (.cutY 128 (.cutX 29888 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 29888 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 (.cutX 32256 .empty (.cutY 2560 .empty (.cutX 32512 .empty (.cutY 2816 .empty (.cutX 32640 (.cutY 2944 (.cutX 32576 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 32576 (.cutY 3008 (.cutX 32544 (.cutY 2976 .full .full) (.cutY 2976 .full .full)) (.cutX 32544 (.cutY 3040 .full .full) (.cutY 3040 .full .full))) (.cutY 3008 .full .full))) (.cutY 2944 (.cutX 32704 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 32704 (.cutY 3008 .full .full) (.cutY 3008 .full .full)))))))) .empty)))) .empty)) .empty)) .empty))

theorem metadata35 : 0<192502037 ∧ 0<128 ∧ 116<128 ∧ 3<4 ∧
    12596/4160=3 ∧ 12596%4160=116 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 64,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked35_64 : ∀ i : Fin 24,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 88, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) (forallFinOffset_add (fun i => output35 i = raw35 (source35 i)) 0 64 24 (by decide) sourceChecked35_0
    sourceChecked35_64)

theorem coverChecked35_0 : ∀ i : Fin 64,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked35_64 : ∀ i : Fin 24,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 88, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
  forallFin_of_zero_offset (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (forallFinOffset_add (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) 0 64 24 (by decide) coverChecked35_0
    coverChecked35_64)

theorem treeChecked35 : tree35.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves35 : List.ofFn output35 = tree35.leaves ⟨0,32768,0,32768⟩ := by
  unfold output35
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked35 : gridTreeUnionCheck 32768 raw35 output35 cover35 source35 tree35 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked35, coverChecked35, treeChecked35, treeLeaves35⟩

theorem areaUnits35 : gridUnionAreaUnits output35 = 262144 := by decide +kernel

noncomputable def phaseMass35 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 15337, atom 12597, type 3, source (0,117).
def leavesData36 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)))) (.node (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,0,2⟩))))) (.node (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩))) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves36 : Fin 22 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 0 117 leaves36 i
def outputData36 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,29952,30016⟩) (.single ⟨0,64,30016,30080⟩)) (.node (.single ⟨64,128,29952,30016⟩) (.node (.single ⟨64,128,30016,30080⟩) (.single ⟨0,64,30080,30144⟩)))) (.node (.node (.single ⟨0,64,30144,30208⟩) (.node (.single ⟨64,128,30080,30144⟩) (.single ⟨64,128,30144,30208⟩))) (.node (.single ⟨128,192,29952,30016⟩) (.node (.single ⟨128,192,30016,30080⟩) (.single ⟨192,224,29952,29984⟩))))) (.node (.node (.node (.single ⟨192,224,29984,30016⟩) (.single ⟨224,256,29952,29984⟩)) (.node (.single ⟨224,256,29984,30016⟩) (.node (.single ⟨192,224,30016,30048⟩) (.single ⟨192,224,30048,30080⟩)))) (.node (.node (.single ⟨224,256,30016,30048⟩) (.node (.single ⟨224,256,30048,30080⟩) (.single ⟨128,192,30080,30144⟩))) (.node (.single ⟨128,192,30144,30208⟩) (.node (.single ⟨192,256,30080,30144⟩) (.single ⟨192,256,30144,30208⟩)))))) (.node (.node (.node (.node (.single ⟨2560,2624,32512,32576⟩) (.single ⟨2560,2624,32576,32640⟩)) (.node (.single ⟨2624,2688,32512,32576⟩) (.node (.single ⟨2624,2688,32576,32640⟩) (.single ⟨2560,2624,32640,32704⟩)))) (.node (.node (.single ⟨2560,2624,32704,32768⟩) (.node (.single ⟨2624,2688,32640,32704⟩) (.single ⟨2624,2688,32704,32768⟩))) (.node (.single ⟨2688,2720,32512,32544⟩) (.node (.single ⟨2688,2720,32544,32576⟩) (.single ⟨2720,2752,32512,32544⟩))))) (.node (.node (.node (.single ⟨2720,2752,32544,32576⟩) (.single ⟨2688,2752,32576,32640⟩)) (.node (.single ⟨2752,2784,32512,32544⟩) (.node (.single ⟨2752,2784,32544,32576⟩) (.single ⟨2784,2816,32512,32544⟩)))) (.node (.node (.single ⟨2784,2816,32544,32576⟩) (.node (.single ⟨2752,2816,32576,32640⟩) (.single ⟨2688,2752,32640,32704⟩))) (.node (.single ⟨2688,2752,32704,32768⟩) (.node (.single ⟨2752,2816,32640,32704⟩) (.single ⟨2752,2816,32704,32768⟩))))))) (.node (.node (.node (.node (.node (.single ⟨29952,30016,0,64⟩) (.single ⟨29952,30016,64,128⟩)) (.node (.single ⟨30016,30080,0,64⟩) (.node (.single ⟨30016,30080,64,128⟩) (.single ⟨29952,30016,128,192⟩)))) (.node (.node (.single ⟨29952,29984,192,224⟩) (.node (.single ⟨29952,29984,224,256⟩) (.single ⟨29984,30016,192,224⟩))) (.node (.single ⟨29984,30016,224,256⟩) (.node (.single ⟨30016,30080,128,192⟩) (.single ⟨30016,30048,192,224⟩))))) (.node (.node (.node (.single ⟨30016,30048,224,256⟩) (.single ⟨30048,30080,192,224⟩)) (.node (.single ⟨30048,30080,224,256⟩) (.node (.single ⟨30080,30144,0,64⟩) (.single ⟨30080,30144,64,128⟩)))) (.node (.node (.single ⟨30144,30208,0,64⟩) (.node (.single ⟨30144,30208,64,128⟩) (.single ⟨30080,30144,128,192⟩))) (.node (.single ⟨30080,30144,192,256⟩) (.node (.single ⟨30144,30208,128,192⟩) (.single ⟨30144,30208,192,256⟩)))))) (.node (.node (.node (.node (.single ⟨32512,32576,2560,2624⟩) (.single ⟨32512,32576,2624,2688⟩)) (.node (.single ⟨32576,32640,2560,2624⟩) (.node (.single ⟨32576,32640,2624,2688⟩) (.single ⟨32512,32544,2688,2720⟩)))) (.node (.node (.single ⟨32512,32544,2720,2752⟩) (.node (.single ⟨32544,32576,2688,2720⟩) (.single ⟨32544,32576,2720,2752⟩))) (.node (.single ⟨32512,32544,2752,2784⟩) (.node (.single ⟨32512,32544,2784,2816⟩) (.single ⟨32544,32576,2752,2784⟩))))) (.node (.node (.node (.single ⟨32544,32576,2784,2816⟩) (.single ⟨32576,32640,2688,2752⟩)) (.node (.single ⟨32576,32640,2752,2816⟩) (.node (.single ⟨32640,32704,2560,2624⟩) (.single ⟨32640,32704,2624,2688⟩)))) (.node (.node (.single ⟨32704,32768,2560,2624⟩) (.node (.single ⟨32704,32768,2624,2688⟩) (.single ⟨32640,32704,2688,2752⟩))) (.node (.single ⟨32640,32704,2752,2816⟩) (.node (.single ⟨32704,32768,2688,2752⟩) (.single ⟨32704,32768,2752,2816⟩))))))))
def output36 : Fin 88 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 48)) (.node (.single 79) (.node (.single 39) (.single 9)))) (.node (.node (.single 53) (.node (.single 78) (.single 34))) (.node (.single 18) (.node (.single 62) (.single 69))))) (.node (.node (.node (.single 25) (.single 19)) (.node (.single 64) (.node (.single 68) (.single 23)))) (.node (.node (.single 20) (.node (.single 63) (.single 67))) (.node (.single 24) (.node (.single 21) (.single 65)))))) (.node (.node (.node (.node (.single 66) (.single 22)) (.node (.single 0) (.node (.single 44) (.single 87)))) (.node (.node (.single 43) (.node (.single 1) (.single 46))) (.node (.single 86) (.node (.single 41) (.single 2))))) (.node (.node (.node (.single 45) (.single 85)) (.node (.single 42) (.node (.single 3) (.single 47)))) (.node (.node (.single 84) (.node (.single 40) (.single 4))) (.node (.single 58) (.node (.single 83) (.single 29))))))) (.node (.node (.node (.node (.node (.single 5) (.single 60)) (.node (.single 82) (.node (.single 27) (.single 6)))) (.node (.node (.single 59) (.node (.single 81) (.single 28))) (.node (.single 7) (.node (.single 61) (.single 80))))) (.node (.node (.node (.single 26) (.single 10)) (.node (.single 49) (.node (.single 77) (.single 38)))) (.node (.node (.single 11) (.node (.single 51) (.single 76))) (.node (.single 36) (.node (.single 12) (.single 50)))))) (.node (.node (.node (.node (.single 75) (.single 37)) (.node (.single 13) (.node (.single 52) (.single 74)))) (.node (.node (.single 35) (.node (.single 14) (.single 54))) (.node (.single 73) (.node (.single 33) (.single 15))))) (.node (.node (.node (.single 56) (.single 72)) (.node (.single 31) (.node (.single 16) (.single 55)))) (.node (.node (.single 71) (.node (.single 32) (.single 17))) (.node (.single 57) (.node (.single 70) (.single 30))))))))
def sourceData36 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 0) (.node (.single 4) (.single 56))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 76)))) (.node (.node (.single 80) (.node (.single 84) (.single 8))) (.node (.single 12) (.node (.single 16) (.single 20)))))) (.node (.node (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 55)))) (.node (.node (.single 47) (.node (.single 51) (.single 43))) (.node (.single 87) (.node (.single 79) (.single 83))))) (.node (.node (.node (.single 75) (.single 7)) (.node (.single 71) (.node (.single 63) (.single 67)))) (.node (.node (.single 59) (.node (.single 3) (.single 39))) (.node (.single 31) (.node (.single 35) (.single 27))))))) (.node (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 1)))) (.node (.node (.single 57) (.node (.single 65) (.single 61))) (.node (.single 69) (.node (.single 5) (.single 73))))) (.node (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 41) (.single 49)))) (.node (.node (.single 45) (.node (.single 53) (.single 9))) (.node (.single 17) (.node (.single 13) (.single 21)))))) (.node (.node (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 86)))) (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 58) (.single 6)) (.node (.single 2) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.single 34) (.node (.single 30) (.single 26))))))))
def cover36 (i : Fin 88) : Fin 88 := ⟨coverData36.get i % 88, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 88) : Fin 88 := ⟨sourceData36.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 .empty (.cutX 512 (.cutY 30208 (.cutX 256 (.cutY 29952 .empty (.cutX 128 (.cutY 30080 (.cutX 64 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) (.cutX 64 (.cutY 30144 .full .full) (.cutY 30144 .full .full))) (.cutY 30080 (.cutX 192 (.cutY 30016 .full .full) (.cutY 30016 (.cutX 224 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) (.cutX 224 (.cutY 30048 .full .full) (.cutY 30048 .full .full)))) (.cutX 192 (.cutY 30144 .full .full) (.cutY 30144 .full .full))))) .empty) .empty) .empty)) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 (.cutY 31744 .empty (.cutX 2560 .empty (.cutY 32256 .empty (.cutX 2816 (.cutY 32512 .empty (.cutX 2688 (.cutY 32640 (.cutX 2624 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 2624 (.cutY 32704 .full .full) (.cutY 32704 .full .full))) (.cutY 32640 (.cutX 2752 (.cutY 32576 (.cutX 2720 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full) (.cutY 32576 (.cutX 2784 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 2752 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)))) .empty)))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 .empty (.cutY 1024 (.cutX 30208 (.cutY 512 (.cutX 29952 .empty (.cutY 256 (.cutX 30080 (.cutY 128 (.cutX 30016 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30016 (.cutY 192 .full (.cutX 29984 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full (.cutX 30048 (.cutY 224 .full .full) (.cutY 224 .full .full))))) (.cutY 128 (.cutX 30144 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30144 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty)) .empty) .empty) .empty)) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 (.cutX 32256 .empty (.cutY 2560 .empty (.cutX 32512 .empty (.cutY 2816 (.cutX 32640 (.cutY 2688 (.cutX 32576 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 32576 (.cutY 2752 (.cutX 32544 (.cutY 2720 .full .full) (.cutY 2720 .full .full)) (.cutX 32544 (.cutY 2784 .full .full) (.cutY 2784 .full .full))) (.cutY 2752 .full .full))) (.cutY 2688 (.cutX 32704 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 32704 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty)))) .empty)))) .empty)) .empty)) .empty))

theorem metadata36 : 0<192502037 ∧ 0<128 ∧ 117<128 ∧ 3<4 ∧
    12597/4160=3 ∧ 12597%4160=117 ∧ ∀ i, (leaves36 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData36).mp
    (by decide +kernel)

theorem sourceChecked36_0 : ∀ i : Fin 64,
    (fun i => output36 i = raw36 (source36 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked36_64 : ∀ i : Fin 24,
    (fun i => output36 i = raw36 (source36 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked36 : ∀ i : Fin 88, (fun i => output36 i = raw36 (source36 i)) i :=
  forallFin_of_zero_offset (fun i => output36 i = raw36 (source36 i)) (forallFinOffset_add (fun i => output36 i = raw36 (source36 i)) 0 64 24 (by decide) sourceChecked36_0
    sourceChecked36_64)

theorem coverChecked36_0 : ∀ i : Fin 64,
    (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked36_64 : ∀ i : Fin 24,
    (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked36 : ∀ i : Fin 88, (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) i :=
  forallFin_of_zero_offset (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (forallFinOffset_add (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) 0 64 24 (by decide) coverChecked36_0
    coverChecked36_64)

theorem treeChecked36 : tree36.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves36 : List.ofFn output36 = tree36.leaves ⟨0,32768,0,32768⟩ := by
  unfold output36
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked36 : gridTreeUnionCheck 32768 raw36 output36 cover36 source36 tree36 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked36, coverChecked36, treeChecked36, treeLeaves36⟩

theorem areaUnits36 : gridUnionAreaUnits output36 = 262144 := by decide +kernel

noncomputable def phaseMass36 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 15338, atom 12598, type 3, source (0,118).
def leavesData37 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)))) (.node (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,0,2⟩))))) (.node (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩))) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves37 : Fin 22 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 0 118 leaves37 i
def outputData37 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,30208,30272⟩) (.single ⟨0,64,30272,30336⟩)) (.node (.single ⟨64,128,30208,30272⟩) (.node (.single ⟨64,128,30272,30336⟩) (.single ⟨0,64,30336,30400⟩)))) (.node (.node (.single ⟨0,64,30400,30464⟩) (.node (.single ⟨64,128,30336,30400⟩) (.single ⟨64,128,30400,30464⟩))) (.node (.single ⟨128,192,30208,30272⟩) (.node (.single ⟨128,192,30272,30336⟩) (.single ⟨192,224,30208,30240⟩))))) (.node (.node (.node (.single ⟨192,224,30240,30272⟩) (.single ⟨224,256,30208,30240⟩)) (.node (.single ⟨224,256,30240,30272⟩) (.node (.single ⟨192,224,30272,30304⟩) (.single ⟨192,224,30304,30336⟩)))) (.node (.node (.single ⟨224,256,30272,30304⟩) (.node (.single ⟨224,256,30304,30336⟩) (.single ⟨128,192,30336,30400⟩))) (.node (.single ⟨128,192,30400,30464⟩) (.node (.single ⟨192,256,30336,30400⟩) (.single ⟨192,256,30400,30464⟩)))))) (.node (.node (.node (.node (.single ⟨2304,2368,32512,32576⟩) (.single ⟨2304,2368,32576,32640⟩)) (.node (.single ⟨2368,2432,32512,32576⟩) (.node (.single ⟨2368,2432,32576,32640⟩) (.single ⟨2304,2368,32640,32704⟩)))) (.node (.node (.single ⟨2304,2368,32704,32768⟩) (.node (.single ⟨2368,2432,32640,32704⟩) (.single ⟨2368,2432,32704,32768⟩))) (.node (.single ⟨2432,2464,32512,32544⟩) (.node (.single ⟨2432,2464,32544,32576⟩) (.single ⟨2464,2496,32512,32544⟩))))) (.node (.node (.node (.single ⟨2464,2496,32544,32576⟩) (.single ⟨2432,2496,32576,32640⟩)) (.node (.single ⟨2496,2528,32512,32544⟩) (.node (.single ⟨2496,2528,32544,32576⟩) (.single ⟨2528,2560,32512,32544⟩)))) (.node (.node (.single ⟨2528,2560,32544,32576⟩) (.node (.single ⟨2496,2560,32576,32640⟩) (.single ⟨2432,2496,32640,32704⟩))) (.node (.single ⟨2432,2496,32704,32768⟩) (.node (.single ⟨2496,2560,32640,32704⟩) (.single ⟨2496,2560,32704,32768⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30208,30272,0,64⟩) (.single ⟨30208,30272,64,128⟩)) (.node (.single ⟨30272,30336,0,64⟩) (.node (.single ⟨30272,30336,64,128⟩) (.single ⟨30208,30272,128,192⟩)))) (.node (.node (.single ⟨30208,30240,192,224⟩) (.node (.single ⟨30208,30240,224,256⟩) (.single ⟨30240,30272,192,224⟩))) (.node (.single ⟨30240,30272,224,256⟩) (.node (.single ⟨30272,30336,128,192⟩) (.single ⟨30272,30304,192,224⟩))))) (.node (.node (.node (.single ⟨30272,30304,224,256⟩) (.single ⟨30304,30336,192,224⟩)) (.node (.single ⟨30304,30336,224,256⟩) (.node (.single ⟨30336,30400,0,64⟩) (.single ⟨30336,30400,64,128⟩)))) (.node (.node (.single ⟨30400,30464,0,64⟩) (.node (.single ⟨30400,30464,64,128⟩) (.single ⟨30336,30400,128,192⟩))) (.node (.single ⟨30336,30400,192,256⟩) (.node (.single ⟨30400,30464,128,192⟩) (.single ⟨30400,30464,192,256⟩)))))) (.node (.node (.node (.node (.single ⟨32512,32576,2304,2368⟩) (.single ⟨32512,32576,2368,2432⟩)) (.node (.single ⟨32576,32640,2304,2368⟩) (.node (.single ⟨32576,32640,2368,2432⟩) (.single ⟨32512,32544,2432,2464⟩)))) (.node (.node (.single ⟨32512,32544,2464,2496⟩) (.node (.single ⟨32544,32576,2432,2464⟩) (.single ⟨32544,32576,2464,2496⟩))) (.node (.single ⟨32512,32544,2496,2528⟩) (.node (.single ⟨32512,32544,2528,2560⟩) (.single ⟨32544,32576,2496,2528⟩))))) (.node (.node (.node (.single ⟨32544,32576,2528,2560⟩) (.single ⟨32576,32640,2432,2496⟩)) (.node (.single ⟨32576,32640,2496,2560⟩) (.node (.single ⟨32640,32704,2304,2368⟩) (.single ⟨32640,32704,2368,2432⟩)))) (.node (.node (.single ⟨32704,32768,2304,2368⟩) (.node (.single ⟨32704,32768,2368,2432⟩) (.single ⟨32640,32704,2432,2496⟩))) (.node (.single ⟨32640,32704,2496,2560⟩) (.node (.single ⟨32704,32768,2432,2496⟩) (.single ⟨32704,32768,2496,2560⟩))))))))
def output37 : Fin 88 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 48)) (.node (.single 79) (.node (.single 39) (.single 9)))) (.node (.node (.single 53) (.node (.single 78) (.single 34))) (.node (.single 18) (.node (.single 62) (.single 69))))) (.node (.node (.node (.single 25) (.single 19)) (.node (.single 64) (.node (.single 68) (.single 23)))) (.node (.node (.single 20) (.node (.single 63) (.single 67))) (.node (.single 24) (.node (.single 21) (.single 65)))))) (.node (.node (.node (.node (.single 66) (.single 22)) (.node (.single 0) (.node (.single 44) (.single 87)))) (.node (.node (.single 43) (.node (.single 1) (.single 46))) (.node (.single 86) (.node (.single 41) (.single 2))))) (.node (.node (.node (.single 45) (.single 85)) (.node (.single 42) (.node (.single 3) (.single 47)))) (.node (.node (.single 84) (.node (.single 40) (.single 4))) (.node (.single 58) (.node (.single 83) (.single 29))))))) (.node (.node (.node (.node (.node (.single 5) (.single 60)) (.node (.single 82) (.node (.single 27) (.single 6)))) (.node (.node (.single 59) (.node (.single 81) (.single 28))) (.node (.single 7) (.node (.single 61) (.single 80))))) (.node (.node (.node (.single 26) (.single 10)) (.node (.single 49) (.node (.single 77) (.single 38)))) (.node (.node (.single 11) (.node (.single 51) (.single 76))) (.node (.single 36) (.node (.single 12) (.single 50)))))) (.node (.node (.node (.node (.single 75) (.single 37)) (.node (.single 13) (.node (.single 52) (.single 74)))) (.node (.node (.single 35) (.node (.single 14) (.single 54))) (.node (.single 73) (.node (.single 33) (.single 15))))) (.node (.node (.node (.single 56) (.single 72)) (.node (.single 31) (.node (.single 16) (.single 55)))) (.node (.node (.single 71) (.node (.single 32) (.single 17))) (.node (.single 57) (.node (.single 70) (.single 30))))))))
def sourceData37 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 0) (.node (.single 4) (.single 56))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 76)))) (.node (.node (.single 80) (.node (.single 84) (.single 8))) (.node (.single 12) (.node (.single 16) (.single 20)))))) (.node (.node (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 55)))) (.node (.node (.single 47) (.node (.single 51) (.single 43))) (.node (.single 87) (.node (.single 79) (.single 83))))) (.node (.node (.node (.single 75) (.single 7)) (.node (.single 71) (.node (.single 63) (.single 67)))) (.node (.node (.single 59) (.node (.single 3) (.single 39))) (.node (.single 31) (.node (.single 35) (.single 27))))))) (.node (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 1)))) (.node (.node (.single 57) (.node (.single 65) (.single 61))) (.node (.single 69) (.node (.single 5) (.single 73))))) (.node (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 41) (.single 49)))) (.node (.node (.single 45) (.node (.single 53) (.single 9))) (.node (.single 17) (.node (.single 13) (.single 21)))))) (.node (.node (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 86)))) (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 58) (.single 6)) (.node (.single 2) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.single 34) (.node (.single 30) (.single 26))))))))
def cover37 (i : Fin 88) : Fin 88 := ⟨coverData37.get i % 88, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 88) : Fin 88 := ⟨sourceData37.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 .empty (.cutX 512 (.cutY 30208 .empty (.cutX 256 (.cutY 30464 (.cutX 128 (.cutY 30336 (.cutX 64 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) (.cutX 64 (.cutY 30400 .full .full) (.cutY 30400 .full .full))) (.cutY 30336 (.cutX 192 (.cutY 30272 .full .full) (.cutY 30272 (.cutX 224 (.cutY 30240 .full .full) (.cutY 30240 .full .full)) (.cutX 224 (.cutY 30304 .full .full) (.cutY 30304 .full .full)))) (.cutX 192 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 (.cutY 31744 .empty (.cutX 2560 (.cutY 32256 .empty (.cutX 2304 .empty (.cutY 32512 .empty (.cutX 2432 (.cutY 32640 (.cutX 2368 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 2368 (.cutY 32704 .full .full) (.cutY 32704 .full .full))) (.cutY 32640 (.cutX 2496 (.cutY 32576 (.cutX 2464 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full) (.cutY 32576 (.cutX 2528 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 2496 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))))) .empty)) .empty)))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 .empty (.cutY 1024 (.cutX 30208 .empty (.cutY 512 (.cutX 30464 (.cutY 256 (.cutX 30336 (.cutY 128 (.cutX 30272 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30272 (.cutY 192 .full (.cutX 30240 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full (.cutX 30304 (.cutY 224 .full .full) (.cutY 224 .full .full))))) (.cutY 128 (.cutX 30400 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30400 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 (.cutX 32256 .empty (.cutY 2560 (.cutX 32512 .empty (.cutY 2304 .empty (.cutX 32640 (.cutY 2432 (.cutX 32576 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 32576 (.cutY 2496 (.cutX 32544 (.cutY 2464 .full .full) (.cutY 2464 .full .full)) (.cutX 32544 (.cutY 2528 .full .full) (.cutY 2528 .full .full))) (.cutY 2496 .full .full))) (.cutY 2432 (.cutX 32704 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 32704 (.cutY 2496 .full .full) (.cutY 2496 .full .full)))))) .empty)) .empty)))) .empty)) .empty)) .empty))

theorem metadata37 : 0<192502037 ∧ 0<128 ∧ 118<128 ∧ 3<4 ∧
    12598/4160=3 ∧ 12598%4160=118 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 64,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked37_64 : ∀ i : Fin 24,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 88, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) (forallFinOffset_add (fun i => output37 i = raw37 (source37 i)) 0 64 24 (by decide) sourceChecked37_0
    sourceChecked37_64)

theorem coverChecked37_0 : ∀ i : Fin 64,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked37_64 : ∀ i : Fin 24,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 88, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
  forallFin_of_zero_offset (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (forallFinOffset_add (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) 0 64 24 (by decide) coverChecked37_0
    coverChecked37_64)

theorem treeChecked37 : tree37.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves37 : List.ofFn output37 = tree37.leaves ⟨0,32768,0,32768⟩ := by
  unfold output37
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked37 : gridTreeUnionCheck 32768 raw37 output37 cover37 source37 tree37 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked37, coverChecked37, treeChecked37, treeLeaves37⟩

theorem areaUnits37 : gridUnionAreaUnits output37 = 262144 := by decide +kernel

noncomputable def phaseMass37 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 15339, atom 12599, type 3, source (0,119).
def leavesData38 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,0,2⟩))) (.node (.single ⟨2,0,3⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,1,2⟩) (.node (.single ⟨2,1,3⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))))) (.node (.node (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩))) (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)))) (.node (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))) (.node (.node (.single ⟨3,6,4⟩) (.single ⟨3,6,5⟩)) (.node (.single ⟨3,7,4⟩) (.single ⟨3,7,5⟩))))))
def leaves38 : Fin 25 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 0 119 leaves38 i
def outputData38 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,30464,30528⟩) (.node (.single ⟨0,64,30528,30592⟩) (.single ⟨64,128,30464,30528⟩))) (.node (.single ⟨64,128,30528,30592⟩) (.node (.single ⟨0,64,30592,30656⟩) (.single ⟨0,64,30656,30720⟩)))) (.node (.node (.single ⟨64,128,30592,30656⟩) (.node (.single ⟨64,128,30656,30720⟩) (.single ⟨128,192,30464,30528⟩))) (.node (.single ⟨128,192,30528,30592⟩) (.node (.single ⟨192,224,30464,30496⟩) (.single ⟨192,224,30496,30528⟩))))) (.node (.node (.node (.single ⟨224,256,30464,30496⟩) (.node (.single ⟨224,256,30496,30528⟩) (.single ⟨192,224,30528,30560⟩))) (.node (.single ⟨192,224,30560,30592⟩) (.node (.single ⟨224,256,30528,30560⟩) (.single ⟨224,256,30560,30592⟩)))) (.node (.node (.single ⟨128,192,30592,30656⟩) (.node (.single ⟨128,192,30656,30720⟩) (.single ⟨192,224,30592,30624⟩))) (.node (.node (.single ⟨192,224,30624,30656⟩) (.single ⟨224,256,30592,30624⟩)) (.node (.single ⟨224,256,30624,30656⟩) (.single ⟨192,256,30656,30720⟩)))))) (.node (.node (.node (.node (.single ⟨2048,2112,32512,32576⟩) (.node (.single ⟨2048,2112,32576,32640⟩) (.single ⟨2112,2144,32512,32544⟩))) (.node (.single ⟨2112,2144,32544,32576⟩) (.node (.single ⟨2144,2176,32512,32544⟩) (.single ⟨2144,2176,32544,32576⟩)))) (.node (.node (.single ⟨2112,2176,32576,32640⟩) (.node (.single ⟨2048,2112,32640,32704⟩) (.single ⟨2048,2112,32704,32768⟩))) (.node (.single ⟨2112,2176,32640,32704⟩) (.node (.single ⟨2112,2176,32704,32768⟩) (.single ⟨2176,2208,32512,32544⟩))))) (.node (.node (.node (.single ⟨2176,2208,32544,32576⟩) (.node (.single ⟨2208,2240,32512,32544⟩) (.single ⟨2208,2240,32544,32576⟩))) (.node (.single ⟨2176,2240,32576,32640⟩) (.node (.single ⟨2240,2272,32512,32544⟩) (.single ⟨2240,2272,32544,32576⟩)))) (.node (.node (.single ⟨2272,2304,32512,32544⟩) (.node (.single ⟨2272,2304,32544,32576⟩) (.single ⟨2240,2304,32576,32640⟩))) (.node (.node (.single ⟨2176,2240,32640,32704⟩) (.single ⟨2176,2240,32704,32768⟩)) (.node (.single ⟨2240,2304,32640,32704⟩) (.single ⟨2240,2304,32704,32768⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30464,30528,0,64⟩) (.node (.single ⟨30464,30528,64,128⟩) (.single ⟨30528,30592,0,64⟩))) (.node (.single ⟨30528,30592,64,128⟩) (.node (.single ⟨30464,30528,128,192⟩) (.single ⟨30464,30496,192,224⟩)))) (.node (.node (.single ⟨30464,30496,224,256⟩) (.node (.single ⟨30496,30528,192,224⟩) (.single ⟨30496,30528,224,256⟩))) (.node (.single ⟨30528,30592,128,192⟩) (.node (.single ⟨30528,30560,192,224⟩) (.single ⟨30528,30560,224,256⟩))))) (.node (.node (.node (.single ⟨30560,30592,192,224⟩) (.node (.single ⟨30560,30592,224,256⟩) (.single ⟨30592,30656,0,64⟩))) (.node (.single ⟨30592,30656,64,128⟩) (.node (.single ⟨30656,30720,0,64⟩) (.single ⟨30656,30720,64,128⟩)))) (.node (.node (.single ⟨30592,30656,128,192⟩) (.node (.single ⟨30592,30624,192,224⟩) (.single ⟨30592,30624,224,256⟩))) (.node (.node (.single ⟨30624,30656,192,224⟩) (.single ⟨30624,30656,224,256⟩)) (.node (.single ⟨30656,30720,128,192⟩) (.single ⟨30656,30720,192,256⟩)))))) (.node (.node (.node (.node (.single ⟨32512,32576,2048,2112⟩) (.node (.single ⟨32512,32544,2112,2144⟩) (.single ⟨32512,32544,2144,2176⟩))) (.node (.single ⟨32544,32576,2112,2144⟩) (.node (.single ⟨32544,32576,2144,2176⟩) (.single ⟨32576,32640,2048,2112⟩)))) (.node (.node (.single ⟨32576,32640,2112,2176⟩) (.node (.single ⟨32512,32544,2176,2208⟩) (.single ⟨32512,32544,2208,2240⟩))) (.node (.single ⟨32544,32576,2176,2208⟩) (.node (.single ⟨32544,32576,2208,2240⟩) (.single ⟨32512,32544,2240,2272⟩))))) (.node (.node (.node (.single ⟨32512,32544,2272,2304⟩) (.node (.single ⟨32544,32576,2240,2272⟩) (.single ⟨32544,32576,2272,2304⟩))) (.node (.single ⟨32576,32640,2176,2240⟩) (.node (.single ⟨32576,32640,2240,2304⟩) (.single ⟨32640,32704,2048,2112⟩)))) (.node (.node (.single ⟨32640,32704,2112,2176⟩) (.node (.single ⟨32704,32768,2048,2112⟩) (.single ⟨32704,32768,2112,2176⟩))) (.node (.node (.single ⟨32640,32704,2176,2240⟩) (.single ⟨32640,32704,2240,2304⟩)) (.node (.single ⟨32704,32768,2176,2240⟩) (.single ⟨32704,32768,2240,2304⟩))))))))
def output38 : Fin 100 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 50) (.single 99))) (.node (.single 49) (.node (.single 1) (.single 52)))) (.node (.node (.single 98) (.node (.single 47) (.single 4))) (.node (.single 64) (.node (.single 95) (.single 35))))) (.node (.node (.node (.single 5) (.node (.single 66) (.single 94))) (.node (.single 33) (.node (.single 2) (.single 51)))) (.node (.node (.single 97) (.node (.single 48) (.single 3))) (.node (.node (.single 53) (.single 96)) (.node (.single 46) (.single 6)))))) (.node (.node (.node (.node (.single 65) (.node (.single 93) (.single 34))) (.node (.single 7) (.node (.single 67) (.single 92)))) (.node (.node (.single 32) (.node (.single 8) (.single 54))) (.node (.single 91) (.node (.single 45) (.single 9))))) (.node (.node (.node (.single 59) (.node (.single 90) (.single 40))) (.node (.single 18) (.node (.single 68) (.single 81)))) (.node (.node (.single 31) (.node (.single 19) (.single 73))) (.node (.node (.single 80) (.single 26)) (.node (.single 24) (.single 74))))))) (.node (.node (.node (.node (.node (.single 75) (.node (.single 25) (.single 10))) (.node (.single 55) (.node (.single 89) (.single 44)))) (.node (.node (.single 11) (.node (.single 57) (.single 88))) (.node (.single 42) (.node (.single 12) (.single 56))))) (.node (.node (.node (.single 87) (.node (.single 43) (.single 13))) (.node (.single 58) (.node (.single 86) (.single 41)))) (.node (.node (.single 14) (.node (.single 60) (.single 85))) (.node (.node (.single 39) (.single 15)) (.node (.single 62) (.single 84)))))) (.node (.node (.node (.node (.single 37) (.node (.single 16) (.single 61))) (.node (.single 83) (.node (.single 38) (.single 17)))) (.node (.node (.single 63) (.node (.single 82) (.single 36))) (.node (.single 20) (.node (.single 69) (.single 79))))) (.node (.node (.node (.single 30) (.node (.single 21) (.single 71))) (.node (.single 78) (.node (.single 28) (.single 22)))) (.node (.node (.single 70) (.node (.single 77) (.single 29))) (.node (.node (.single 23) (.single 72)) (.node (.single 76) (.single 27))))))))
def sourceData38 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 16))) (.node (.single 20) (.node (.single 8) (.single 12)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.single 36) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 60) (.node (.single 64) (.single 68))) (.node (.single 72) (.node (.single 76) (.single 80)))) (.node (.node (.single 40) (.node (.single 44) (.single 84))) (.node (.node (.single 88) (.single 92)) (.node (.single 96) (.single 48)))))) (.node (.node (.node (.node (.single 51) (.node (.single 47) (.single 99))) (.node (.single 91) (.node (.single 95) (.single 87)))) (.node (.node (.single 43) (.node (.single 31) (.single 15))) (.node (.single 27) (.node (.single 11) (.single 83))))) (.node (.node (.node (.single 75) (.node (.single 79) (.single 71))) (.node (.single 39) (.node (.single 67) (.single 59)))) (.node (.node (.single 63) (.node (.single 55) (.single 35))) (.node (.node (.single 23) (.single 7)) (.node (.single 19) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.node (.single 17) (.single 5))) (.node (.single 21) (.node (.single 33) (.single 53)))) (.node (.node (.single 61) (.node (.single 57) (.single 65))) (.node (.single 37) (.node (.single 69) (.single 77))))) (.node (.node (.node (.single 73) (.node (.single 81) (.single 9))) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 41) (.node (.single 85) (.single 93))) (.node (.node (.single 89) (.single 97)) (.node (.single 45) (.single 49)))))) (.node (.node (.node (.node (.single 50) (.node (.single 98) (.single 94))) (.node (.single 90) (.node (.single 86) (.single 46)))) (.node (.node (.single 42) (.node (.single 82) (.single 78))) (.node (.single 74) (.node (.single 70) (.single 66))))) (.node (.node (.node (.single 62) (.node (.single 58) (.single 54))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 14) (.single 10))) (.node (.node (.single 22) (.single 18)) (.node (.single 6) (.single 2))))))))
def cover38 (i : Fin 100) : Fin 100 := ⟨coverData38.get i % 100, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 100) : Fin 100 := ⟨sourceData38.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 (.cutX 1024 (.cutY 29696 .empty (.cutX 512 (.cutY 30208 .empty (.cutX 256 (.cutY 30464 .empty (.cutX 128 (.cutY 30592 (.cutX 64 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 64 (.cutY 30656 .full .full) (.cutY 30656 .full .full))) (.cutY 30592 (.cutX 192 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 224 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) (.cutX 224 (.cutY 30560 .full .full) (.cutY 30560 .full .full)))) (.cutX 192 (.cutY 30656 .full .full) (.cutY 30656 (.cutX 224 (.cutY 30624 .full .full) (.cutY 30624 .full .full)) .full))))) .empty)) .empty)) .empty) .empty) (.cutY 30720 .empty (.cutX 3072 (.cutY 31744 .empty (.cutX 2560 (.cutY 32256 .empty (.cutX 2304 (.cutY 32512 .empty (.cutX 2176 (.cutY 32640 (.cutX 2112 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 2144 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 2112 (.cutY 32704 .full .full) (.cutY 32704 .full .full))) (.cutY 32640 (.cutX 2240 (.cutY 32576 (.cutX 2208 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full) (.cutY 32576 (.cutX 2272 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 2240 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)) .empty)) .empty)))) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 (.cutY 2048 (.cutX 29696 .empty (.cutY 1024 (.cutX 30208 .empty (.cutY 512 (.cutX 30464 .empty (.cutY 256 (.cutX 30592 (.cutY 128 (.cutX 30528 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30528 (.cutY 192 .full (.cutX 30496 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full (.cutX 30560 (.cutY 224 .full .full) (.cutY 224 .full .full))))) (.cutY 128 (.cutX 30656 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30656 (.cutY 192 .full (.cutX 30624 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full)))) .empty)) .empty)) .empty)) .empty) (.cutY 2048 .empty (.cutX 31744 .empty (.cutY 3072 (.cutX 32256 .empty (.cutY 2560 (.cutX 32512 .empty (.cutY 2304 (.cutX 32640 (.cutY 2176 (.cutX 32576 (.cutY 2112 .full (.cutX 32544 (.cutY 2144 .full .full) (.cutY 2144 .full .full))) (.cutY 2112 .full .full)) (.cutX 32576 (.cutY 2240 (.cutX 32544 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 32544 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 (.cutX 32704 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 32704 (.cutY 2240 .full .full) (.cutY 2240 .full .full)))) .empty)) .empty)) .empty)))) .empty)) .empty)) .empty))

theorem metadata38 : 0<192502037 ∧ 0<128 ∧ 119<128 ∧ 3<4 ∧
    12599/4160=3 ∧ 12599%4160=119 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 64,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked38_64 : ∀ i : Fin 36,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 100, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) (forallFinOffset_add (fun i => output38 i = raw38 (source38 i)) 0 64 36 (by decide) sourceChecked38_0
    sourceChecked38_64)

theorem coverChecked38_0 : ∀ i : Fin 64,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked38_64 : ∀ i : Fin 36,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 100, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
  forallFin_of_zero_offset (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (forallFinOffset_add (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) 0 64 36 (by decide) coverChecked38_0
    coverChecked38_64)

theorem treeChecked38 : tree38.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves38 : List.ofFn output38 = tree38.leaves ⟨0,32768,0,32768⟩ := by
  unfold output38
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked38 : gridTreeUnionCheck 32768 raw38 output38 cover38 source38 tree38 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked38, coverChecked38, treeChecked38, treeLeaves38⟩

theorem areaUnits38 : gridUnionAreaUnits output38 = 262144 := by decide +kernel

noncomputable def phaseMass38 : ℝ := singlePhaseMass (192502037/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (192502037/1638400000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 15340, atom 12600, type 3, source (0,120).
def leavesData39 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves39 : Fin 16 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 0 120 leaves39 i
def outputData39 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨0,64,30720,30784⟩) (.single ⟨0,64,30784,30848⟩)) (.node (.single ⟨64,128,30720,30784⟩) (.single ⟨64,128,30784,30848⟩))) (.node (.node (.single ⟨0,128,30848,30976⟩) (.single ⟨128,192,30720,30784⟩)) (.node (.single ⟨128,192,30784,30848⟩) (.single ⟨192,224,30720,30752⟩)))) (.node (.node (.node (.single ⟨192,224,30752,30784⟩) (.single ⟨224,256,30720,30752⟩)) (.node (.single ⟨224,256,30752,30784⟩) (.single ⟨192,256,30784,30848⟩))) (.node (.node (.single ⟨128,192,30848,30912⟩) (.single ⟨128,192,30912,30976⟩)) (.node (.single ⟨192,256,30848,30912⟩) (.single ⟨192,256,30912,30976⟩))))) (.node (.node (.node (.node (.single ⟨1792,1856,32512,32576⟩) (.single ⟨1792,1856,32576,32640⟩)) (.node (.single ⟨1856,1920,32512,32576⟩) (.single ⟨1856,1920,32576,32640⟩))) (.node (.node (.single ⟨1792,1920,32640,32768⟩) (.single ⟨1920,1984,32512,32576⟩)) (.node (.single ⟨1920,1984,32576,32640⟩) (.single ⟨1984,2016,32512,32544⟩)))) (.node (.node (.node (.single ⟨1984,2016,32544,32576⟩) (.single ⟨2016,2048,32512,32544⟩)) (.node (.single ⟨2016,2048,32544,32576⟩) (.single ⟨1984,2048,32576,32640⟩))) (.node (.node (.single ⟨1920,1984,32640,32704⟩) (.single ⟨1920,1984,32704,32768⟩)) (.node (.single ⟨1984,2048,32640,32704⟩) (.single ⟨1984,2048,32704,32768⟩)))))) (.node (.node (.node (.node (.node (.single ⟨30720,30784,0,64⟩) (.single ⟨30720,30784,64,128⟩)) (.node (.single ⟨30784,30848,0,64⟩) (.single ⟨30784,30848,64,128⟩))) (.node (.node (.single ⟨30720,30784,128,192⟩) (.single ⟨30720,30752,192,224⟩)) (.node (.single ⟨30720,30752,224,256⟩) (.single ⟨30752,30784,192,224⟩)))) (.node (.node (.node (.single ⟨30752,30784,224,256⟩) (.single ⟨30784,30848,128,192⟩)) (.node (.single ⟨30784,30848,192,256⟩) (.single ⟨30848,30976,0,128⟩))) (.node (.node (.single ⟨30848,30912,128,192⟩) (.single ⟨30848,30912,192,256⟩)) (.node (.single ⟨30912,30976,128,192⟩) (.single ⟨30912,30976,192,256⟩))))) (.node (.node (.node (.node (.single ⟨32512,32576,1792,1856⟩) (.single ⟨32512,32576,1856,1920⟩)) (.node (.single ⟨32576,32640,1792,1856⟩) (.single ⟨32576,32640,1856,1920⟩))) (.node (.node (.single ⟨32512,32576,1920,1984⟩) (.single ⟨32512,32544,1984,2016⟩)) (.node (.single ⟨32512,32544,2016,2048⟩) (.single ⟨32544,32576,1984,2016⟩)))) (.node (.node (.node (.single ⟨32544,32576,2016,2048⟩) (.single ⟨32576,32640,1920,1984⟩)) (.node (.single ⟨32576,32640,1984,2048⟩) (.single ⟨32640,32768,1792,1920⟩))) (.node (.node (.single ⟨32640,32704,1920,1984⟩) (.single ⟨32640,32704,1984,2048⟩)) (.node (.single ⟨32704,32768,1920,1984⟩) (.single ⟨32704,32768,1984,2048⟩)))))))
def output39 : Fin 64 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData39 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover39 (i : Fin 64) : Fin 64 := ⟨coverData39.get i % 64, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 64) : Fin 64 := ⟨sourceData39.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 (.cutX 256 (.cutY 30976 (.cutX 128 (.cutY 30848 (.cutX 64 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full) (.cutY 30848 (.cutX 192 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 224 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) .full)) (.cutX 192 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 .empty (.cutX 1792 .empty (.cutY 32512 .empty (.cutX 1920 (.cutY 32640 (.cutX 1856 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 1984 (.cutY 32576 .full .full) (.cutY 32576 (.cutX 2016 (.cutY 32544 .full .full) (.cutY 32544 .full .full)) .full)) (.cutX 1984 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))))))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 (.cutX 30976 (.cutY 256 (.cutX 30848 (.cutY 128 (.cutX 30784 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 30784 (.cutY 192 .full (.cutX 30752 (.cutY 224 .full .full) (.cutY 224 .full .full))) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 30912 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty) .empty) .empty) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 .empty (.cutX 32512 .empty (.cutY 1792 .empty (.cutX 32640 (.cutY 1920 (.cutX 32576 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 32576 (.cutY 1984 .full (.cutX 32544 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full (.cutX 32704 (.cutY 1984 .full .full) (.cutY 1984 .full .full)))))))))) .empty)) .empty)) .empty)) .empty))

theorem metadata39 : 0<142718076 ∧ 0<128 ∧ 120<128 ∧ 3<4 ∧
    12600/4160=3 ∧ 12600%4160=120 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 64,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 64, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) sourceChecked39_0

theorem coverChecked39_0 : ∀ i : Fin 64,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 64, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
  forallFin_of_zero_offset (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) coverChecked39_0

theorem treeChecked39 : tree39.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves39 : List.ofFn output39 = tree39.leaves ⟨0,32768,0,32768⟩ := by
  unfold output39
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked39 : gridTreeUnionCheck 32768 raw39 output39 cover39 source39 tree39 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked39, coverChecked39, treeChecked39, treeLeaves39⟩

theorem areaUnits39 : gridUnionAreaUnits output39 = 262144 := by decide +kernel

noncomputable def phaseMass39 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 15341, atom 12602, type 3, source (0,122).
def leavesData40 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves40 : Fin 7 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 122 leaves40 i
def outputData40 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,31232,31360⟩) (.node (.single ⟨0,128,31360,31488⟩) (.single ⟨128,192,31232,31296⟩))) (.node (.node (.single ⟨128,192,31296,31360⟩) (.single ⟨192,256,31232,31296⟩)) (.node (.single ⟨192,256,31296,31360⟩) (.single ⟨128,256,31360,31488⟩)))) (.node (.node (.single ⟨1280,1408,32512,32640⟩) (.node (.single ⟨1280,1408,32640,32768⟩) (.single ⟨1408,1472,32512,32576⟩))) (.node (.node (.single ⟨1408,1472,32576,32640⟩) (.single ⟨1472,1536,32512,32576⟩)) (.node (.single ⟨1472,1536,32576,32640⟩) (.single ⟨1408,1536,32640,32768⟩))))) (.node (.node (.node (.single ⟨31232,31360,0,128⟩) (.node (.single ⟨31232,31296,128,192⟩) (.single ⟨31232,31296,192,256⟩))) (.node (.node (.single ⟨31296,31360,128,192⟩) (.single ⟨31296,31360,192,256⟩)) (.node (.single ⟨31360,31488,0,128⟩) (.single ⟨31360,31488,128,256⟩)))) (.node (.node (.single ⟨32512,32640,1280,1408⟩) (.node (.single ⟨32512,32576,1408,1472⟩) (.single ⟨32512,32576,1472,1536⟩))) (.node (.node (.single ⟨32576,32640,1408,1472⟩) (.single ⟨32576,32640,1472,1536⟩)) (.node (.single ⟨32640,32768,1280,1408⟩) (.single ⟨32640,32768,1408,1536⟩))))))
def output40 : Fin 28 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData40 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover40 (i : Fin 28) : Fin 28 := ⟨coverData40.get i % 28, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 28) : Fin 28 := ⟨sourceData40.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 .empty (.cutX 256 (.cutY 31488 (.cutX 128 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 192 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty) .empty)) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 .empty (.cutX 1280 .empty (.cutY 32512 .empty (.cutX 1408 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 1472 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 (.cutX 31488 (.cutY 256 (.cutX 31360 (.cutY 128 .full (.cutX 31296 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty)) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 (.cutX 32512 .empty (.cutY 1280 .empty (.cutX 32640 (.cutY 1408 .full (.cutX 32576 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty)))) .empty)) .empty)) .empty)) .empty))

theorem metadata40 : 0<142718076 ∧ 0<128 ∧ 122<128 ∧ 3<4 ∧
    12602/4160=3 ∧ 12602%4160=122 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 28,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 28, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) sourceChecked40_0

theorem coverChecked40_0 : ∀ i : Fin 28,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 28, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
  forallFin_of_zero_offset (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) coverChecked40_0

theorem treeChecked40 : tree40.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves40 : List.ofFn output40 = tree40.leaves ⟨0,32768,0,32768⟩ := by
  unfold output40
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked40 : gridTreeUnionCheck 32768 raw40 output40 cover40 source40 tree40 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked40, coverChecked40, treeChecked40, treeLeaves40⟩

theorem areaUnits40 : gridUnionAreaUnits output40 = 262144 := by decide +kernel

noncomputable def phaseMass40 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 15342, atom 12601, type 3, source (0,121).
def leavesData41 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves41 : Fin 10 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 121 leaves41 i
def outputData41 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,128,30976,31104⟩) (.single ⟨0,128,31104,31232⟩)) (.node (.single ⟨128,192,30976,31040⟩) (.node (.single ⟨128,192,31040,31104⟩) (.single ⟨192,256,30976,31040⟩)))) (.node (.node (.single ⟨192,256,31040,31104⟩) (.single ⟨128,192,31104,31168⟩)) (.node (.single ⟨128,192,31168,31232⟩) (.node (.single ⟨192,256,31104,31168⟩) (.single ⟨192,256,31168,31232⟩))))) (.node (.node (.node (.single ⟨1536,1600,32512,32576⟩) (.single ⟨1536,1600,32576,32640⟩)) (.node (.single ⟨1600,1664,32512,32576⟩) (.node (.single ⟨1600,1664,32576,32640⟩) (.single ⟨1536,1664,32640,32768⟩)))) (.node (.node (.single ⟨1664,1728,32512,32576⟩) (.single ⟨1664,1728,32576,32640⟩)) (.node (.single ⟨1728,1792,32512,32576⟩) (.node (.single ⟨1728,1792,32576,32640⟩) (.single ⟨1664,1792,32640,32768⟩)))))) (.node (.node (.node (.node (.single ⟨30976,31104,0,128⟩) (.single ⟨30976,31040,128,192⟩)) (.node (.single ⟨30976,31040,192,256⟩) (.node (.single ⟨31040,31104,128,192⟩) (.single ⟨31040,31104,192,256⟩)))) (.node (.node (.single ⟨31104,31232,0,128⟩) (.single ⟨31104,31168,128,192⟩)) (.node (.single ⟨31104,31168,192,256⟩) (.node (.single ⟨31168,31232,128,192⟩) (.single ⟨31168,31232,192,256⟩))))) (.node (.node (.node (.single ⟨32512,32576,1536,1600⟩) (.single ⟨32512,32576,1600,1664⟩)) (.node (.single ⟨32576,32640,1536,1600⟩) (.node (.single ⟨32576,32640,1600,1664⟩) (.single ⟨32512,32576,1664,1728⟩)))) (.node (.node (.single ⟨32512,32576,1728,1792⟩) (.single ⟨32576,32640,1664,1728⟩)) (.node (.single ⟨32576,32640,1728,1792⟩) (.node (.single ⟨32640,32768,1536,1664⟩) (.single ⟨32640,32768,1664,1792⟩)))))))
def output41 : Fin 40 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData41 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover41 (i : Fin 40) : Fin 40 := ⟨coverData41.get i % 40, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 40) : Fin 40 := ⟨sourceData41.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 (.cutX 256 (.cutY 30976 .empty (.cutX 128 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 192 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 192 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 .empty (.cutY 32256 .empty (.cutX 1792 (.cutY 32512 .empty (.cutX 1664 (.cutY 32640 (.cutX 1600 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 1728 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)))))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 (.cutY 512 (.cutX 30976 .empty (.cutY 256 (.cutX 31104 (.cutY 128 .full (.cutX 31040 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 31168 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty)) .empty) .empty) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 .empty (.cutX 32512 .empty (.cutY 1792 (.cutX 32640 (.cutY 1664 (.cutX 32576 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 32576 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty)))))) .empty)) .empty)) .empty)) .empty))

theorem metadata41 : 0<142718076 ∧ 0<128 ∧ 121<128 ∧ 3<4 ∧
    12601/4160=3 ∧ 12601%4160=121 ∧ ∀ i, (leaves41 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData41).mp
    (by decide +kernel)

theorem sourceChecked41_0 : ∀ i : Fin 40,
    (fun i => output41 i = raw41 (source41 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked41 : ∀ i : Fin 40, (fun i => output41 i = raw41 (source41 i)) i :=
  forallFin_of_zero_offset (fun i => output41 i = raw41 (source41 i)) sourceChecked41_0

theorem coverChecked41_0 : ∀ i : Fin 40,
    (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked41 : ∀ i : Fin 40, (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) i :=
  forallFin_of_zero_offset (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) coverChecked41_0

theorem treeChecked41 : tree41.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves41 : List.ofFn output41 = tree41.leaves ⟨0,32768,0,32768⟩ := by
  unfold output41
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked41 : gridTreeUnionCheck 32768 raw41 output41 cover41 source41 tree41 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked41, coverChecked41, treeChecked41, treeLeaves41⟩

theorem areaUnits41 : gridUnionAreaUnits output41 = 262144 := by decide +kernel

noncomputable def phaseMass41 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 15343, atom 12606, type 3, source (0,126).
def leavesData42 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves42 : Fin 4 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 126 leaves42 i
def outputData42 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,32256,32384⟩) (.single ⟨0,128,32384,32512⟩)) (.node (.single ⟨128,256,32256,32384⟩) (.single ⟨128,256,32384,32512⟩))) (.node (.node (.single ⟨256,384,32512,32640⟩) (.single ⟨256,384,32640,32768⟩)) (.node (.single ⟨384,512,32512,32640⟩) (.single ⟨384,512,32640,32768⟩)))) (.node (.node (.node (.single ⟨32256,32384,0,128⟩) (.single ⟨32256,32384,128,256⟩)) (.node (.single ⟨32384,32512,0,128⟩) (.single ⟨32384,32512,128,256⟩))) (.node (.node (.single ⟨32512,32640,256,384⟩) (.single ⟨32512,32640,384,512⟩)) (.node (.single ⟨32640,32768,256,384⟩) (.single ⟨32640,32768,384,512⟩)))))
def output42 : Fin 16 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData42 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover42 (i : Fin 16) : Fin 16 := ⟨coverData42.get i % 16, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 16) : Fin 16 := ⟨sourceData42.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 .empty (.cutX 256 (.cutY 32512 (.cutX 128 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty) (.cutY 32512 .empty (.cutX 384 (.cutY 32640 .full .full) (.cutY 32640 .full .full))))) .empty)) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 .empty (.cutY 512 (.cutX 32512 (.cutY 256 (.cutX 32384 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty) (.cutY 256 .empty (.cutX 32640 (.cutY 384 .full .full) (.cutY 384 .full .full)))) .empty)) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata42 : 0<142718076 ∧ 0<128 ∧ 126<128 ∧ 3<4 ∧
    12606/4160=3 ∧ 12606%4160=126 ∧ ∀ i, (leaves42 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData42).mp
    (by decide +kernel)

theorem sourceChecked42_0 : ∀ i : Fin 16,
    (fun i => output42 i = raw42 (source42 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked42 : ∀ i : Fin 16, (fun i => output42 i = raw42 (source42 i)) i :=
  forallFin_of_zero_offset (fun i => output42 i = raw42 (source42 i)) sourceChecked42_0

theorem coverChecked42_0 : ∀ i : Fin 16,
    (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked42 : ∀ i : Fin 16, (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) i :=
  forallFin_of_zero_offset (fun i => (output42 (cover42 i)).ContainsBox (raw42 i)) coverChecked42_0

theorem treeChecked42 : tree42.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves42 : List.ofFn output42 = tree42.leaves ⟨0,32768,0,32768⟩ := by
  unfold output42
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked42 : gridTreeUnionCheck 32768 raw42 output42 cover42 source42 tree42 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked42, coverChecked42, treeChecked42, treeLeaves42⟩

theorem areaUnits42 : gridUnionAreaUnits output42 = 262144 := by decide +kernel

noncomputable def phaseMass42 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 15344, atom 12605, type 3, source (0,125).
def leavesData43 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves43 : Fin 7 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 125 leaves43 i
def outputData43 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,32000,32128⟩) (.node (.single ⟨0,128,32128,32256⟩) (.single ⟨128,192,32000,32064⟩))) (.node (.node (.single ⟨128,192,32064,32128⟩) (.single ⟨192,256,32000,32064⟩)) (.node (.single ⟨192,256,32064,32128⟩) (.single ⟨128,256,32128,32256⟩)))) (.node (.node (.single ⟨512,640,32512,32640⟩) (.node (.single ⟨512,640,32640,32768⟩) (.single ⟨640,704,32512,32576⟩))) (.node (.node (.single ⟨640,704,32576,32640⟩) (.single ⟨704,768,32512,32576⟩)) (.node (.single ⟨704,768,32576,32640⟩) (.single ⟨640,768,32640,32768⟩))))) (.node (.node (.node (.single ⟨32000,32128,0,128⟩) (.node (.single ⟨32000,32064,128,192⟩) (.single ⟨32000,32064,192,256⟩))) (.node (.node (.single ⟨32064,32128,128,192⟩) (.single ⟨32064,32128,192,256⟩)) (.node (.single ⟨32128,32256,0,128⟩) (.single ⟨32128,32256,128,256⟩)))) (.node (.node (.single ⟨32512,32640,512,640⟩) (.node (.single ⟨32512,32576,640,704⟩) (.single ⟨32512,32576,704,768⟩))) (.node (.node (.single ⟨32576,32640,640,704⟩) (.single ⟨32576,32640,704,768⟩)) (.node (.single ⟨32640,32768,512,640⟩) (.single ⟨32640,32768,640,768⟩))))))
def output43 : Fin 28 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover43 (i : Fin 28) : Fin 28 := ⟨coverData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 28) : Fin 28 := ⟨sourceData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 (.cutX 256 (.cutY 32000 .empty (.cutX 128 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 192 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full))) .empty) .empty) (.cutY 32256 .empty (.cutX 768 (.cutY 32512 .empty (.cutX 640 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 704 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 (.cutX 32000 .empty (.cutY 256 (.cutX 32128 (.cutY 128 .full (.cutX 32064 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty) (.cutY 512 .empty (.cutX 32512 .empty (.cutY 768 (.cutX 32640 (.cutY 640 .full (.cutX 32576 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty)))) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata43 : 0<142718076 ∧ 0<128 ∧ 125<128 ∧ 3<4 ∧
    12605/4160=3 ∧ 12605%4160=125 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 28,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 28, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 28,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 28, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
  forallFin_of_zero_offset (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) coverChecked43_0

theorem treeChecked43 : tree43.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves43 : List.ofFn output43 = tree43.leaves ⟨0,32768,0,32768⟩ := by
  unfold output43
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked43 : gridTreeUnionCheck 32768 raw43 output43 cover43 source43 tree43 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked43, coverChecked43, treeChecked43, treeLeaves43⟩

theorem areaUnits43 : gridUnionAreaUnits output43 = 262144 := by decide +kernel

noncomputable def phaseMass43 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 15345, atom 12603, type 3, source (0,123).
def leavesData44 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves44 : Fin 10 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 123 leaves44 i
def outputData44 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,128,31488,31616⟩) (.single ⟨0,128,31616,31744⟩)) (.node (.single ⟨128,192,31488,31552⟩) (.node (.single ⟨128,192,31552,31616⟩) (.single ⟨192,256,31488,31552⟩)))) (.node (.node (.single ⟨192,256,31552,31616⟩) (.single ⟨128,192,31616,31680⟩)) (.node (.single ⟨128,192,31680,31744⟩) (.node (.single ⟨192,256,31616,31680⟩) (.single ⟨192,256,31680,31744⟩))))) (.node (.node (.node (.single ⟨1024,1088,32512,32576⟩) (.single ⟨1024,1088,32576,32640⟩)) (.node (.single ⟨1088,1152,32512,32576⟩) (.node (.single ⟨1088,1152,32576,32640⟩) (.single ⟨1024,1152,32640,32768⟩)))) (.node (.node (.single ⟨1152,1216,32512,32576⟩) (.single ⟨1152,1216,32576,32640⟩)) (.node (.single ⟨1216,1280,32512,32576⟩) (.node (.single ⟨1216,1280,32576,32640⟩) (.single ⟨1152,1280,32640,32768⟩)))))) (.node (.node (.node (.node (.single ⟨31488,31616,0,128⟩) (.single ⟨31488,31552,128,192⟩)) (.node (.single ⟨31488,31552,192,256⟩) (.node (.single ⟨31552,31616,128,192⟩) (.single ⟨31552,31616,192,256⟩)))) (.node (.node (.single ⟨31616,31744,0,128⟩) (.single ⟨31616,31680,128,192⟩)) (.node (.single ⟨31616,31680,192,256⟩) (.node (.single ⟨31680,31744,128,192⟩) (.single ⟨31680,31744,192,256⟩))))) (.node (.node (.node (.single ⟨32512,32576,1024,1088⟩) (.single ⟨32512,32576,1088,1152⟩)) (.node (.single ⟨32576,32640,1024,1088⟩) (.node (.single ⟨32576,32640,1088,1152⟩) (.single ⟨32512,32576,1152,1216⟩)))) (.node (.node (.single ⟨32512,32576,1216,1280⟩) (.single ⟨32576,32640,1152,1216⟩)) (.node (.single ⟨32576,32640,1216,1280⟩) (.node (.single ⟨32640,32768,1024,1152⟩) (.single ⟨32640,32768,1152,1280⟩)))))))
def output44 : Fin 40 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData44 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover44 (i : Fin 40) : Fin 40 := ⟨coverData44.get i % 40, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 40) : Fin 40 := ⟨sourceData44.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 (.cutX 512 (.cutY 31232 .empty (.cutX 256 (.cutY 31488 .empty (.cutX 128 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 192 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 192 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))) .empty)) .empty) .empty) (.cutY 31744 .empty (.cutX 1536 (.cutY 32256 .empty (.cutX 1280 (.cutY 32512 .empty (.cutX 1152 (.cutY 32640 (.cutX 1088 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 1216 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)) .empty)))) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 (.cutY 1024 (.cutX 31232 .empty (.cutY 512 (.cutX 31488 .empty (.cutY 256 (.cutX 31616 (.cutY 128 .full (.cutX 31552 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 31680 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty)) .empty)) .empty) (.cutY 1024 .empty (.cutX 32256 .empty (.cutY 1536 (.cutX 32512 .empty (.cutY 1280 (.cutX 32640 (.cutY 1152 (.cutX 32576 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 32576 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty)))) .empty)) .empty)) .empty)) .empty))

theorem metadata44 : 0<142718076 ∧ 0<128 ∧ 123<128 ∧ 3<4 ∧
    12603/4160=3 ∧ 12603%4160=123 ∧ ∀ i, (leaves44 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData44).mp
    (by decide +kernel)

theorem sourceChecked44_0 : ∀ i : Fin 40,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked44 : ∀ i : Fin 40, (fun i => output44 i = raw44 (source44 i)) i :=
  forallFin_of_zero_offset (fun i => output44 i = raw44 (source44 i)) sourceChecked44_0

theorem coverChecked44_0 : ∀ i : Fin 40,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked44 : ∀ i : Fin 40, (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) i :=
  forallFin_of_zero_offset (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) coverChecked44_0

theorem treeChecked44 : tree44.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves44 : List.ofFn output44 = tree44.leaves ⟨0,32768,0,32768⟩ := by
  unfold output44
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked44 : gridTreeUnionCheck 32768 raw44 output44 cover44 source44 tree44 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked44, coverChecked44, treeChecked44, treeLeaves44⟩

theorem areaUnits44 : gridUnionAreaUnits output44 = 262144 := by decide +kernel

noncomputable def phaseMass44 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 15346, atom 12604, type 3, source (0,124).
def leavesData45 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves45 : Fin 10 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 124 leaves45 i
def outputData45 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,128,31744,31872⟩) (.single ⟨0,128,31872,32000⟩)) (.node (.single ⟨128,192,31744,31808⟩) (.node (.single ⟨128,192,31808,31872⟩) (.single ⟨192,256,31744,31808⟩)))) (.node (.node (.single ⟨192,256,31808,31872⟩) (.single ⟨128,192,31872,31936⟩)) (.node (.single ⟨128,192,31936,32000⟩) (.node (.single ⟨192,256,31872,31936⟩) (.single ⟨192,256,31936,32000⟩))))) (.node (.node (.node (.single ⟨768,832,32512,32576⟩) (.single ⟨768,832,32576,32640⟩)) (.node (.single ⟨832,896,32512,32576⟩) (.node (.single ⟨832,896,32576,32640⟩) (.single ⟨768,896,32640,32768⟩)))) (.node (.node (.single ⟨896,960,32512,32576⟩) (.single ⟨896,960,32576,32640⟩)) (.node (.single ⟨960,1024,32512,32576⟩) (.node (.single ⟨960,1024,32576,32640⟩) (.single ⟨896,1024,32640,32768⟩)))))) (.node (.node (.node (.node (.single ⟨31744,31872,0,128⟩) (.single ⟨31744,31808,128,192⟩)) (.node (.single ⟨31744,31808,192,256⟩) (.node (.single ⟨31808,31872,128,192⟩) (.single ⟨31808,31872,192,256⟩)))) (.node (.node (.single ⟨31872,32000,0,128⟩) (.single ⟨31872,31936,128,192⟩)) (.node (.single ⟨31872,31936,192,256⟩) (.node (.single ⟨31936,32000,128,192⟩) (.single ⟨31936,32000,192,256⟩))))) (.node (.node (.node (.single ⟨32512,32576,768,832⟩) (.single ⟨32512,32576,832,896⟩)) (.node (.single ⟨32576,32640,768,832⟩) (.node (.single ⟨32576,32640,832,896⟩) (.single ⟨32512,32576,896,960⟩)))) (.node (.node (.single ⟨32512,32576,960,1024⟩) (.single ⟨32576,32640,896,960⟩)) (.node (.single ⟨32576,32640,960,1024⟩) (.node (.single ⟨32640,32768,768,896⟩) (.single ⟨32640,32768,896,1024⟩)))))))
def output45 : Fin 40 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData45 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover45 (i : Fin 40) : Fin 40 := ⟨coverData45.get i % 40, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 40) : Fin 40 := ⟨sourceData45.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 (.cutX 256 (.cutY 32000 (.cutX 128 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 192 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 192 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty) (.cutY 32256 .empty (.cutX 768 .empty (.cutY 32512 .empty (.cutX 896 (.cutY 32640 (.cutX 832 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full) (.cutY 32640 (.cutX 960 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))))) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 (.cutY 512 (.cutX 32000 (.cutY 256 (.cutX 31872 (.cutY 128 .full (.cutX 31808 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full (.cutX 31936 (.cutY 192 .full .full) (.cutY 192 .full .full)))) .empty) .empty) .empty) (.cutY 512 .empty (.cutX 32512 .empty (.cutY 768 .empty (.cutX 32640 (.cutY 896 (.cutX 32576 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 32576 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full)))))) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata45 : 0<142718076 ∧ 0<128 ∧ 124<128 ∧ 3<4 ∧
    12604/4160=3 ∧ 12604%4160=124 ∧ ∀ i, (leaves45 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData45).mp
    (by decide +kernel)

theorem sourceChecked45_0 : ∀ i : Fin 40,
    (fun i => output45 i = raw45 (source45 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked45 : ∀ i : Fin 40, (fun i => output45 i = raw45 (source45 i)) i :=
  forallFin_of_zero_offset (fun i => output45 i = raw45 (source45 i)) sourceChecked45_0

theorem coverChecked45_0 : ∀ i : Fin 40,
    (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked45 : ∀ i : Fin 40, (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) i :=
  forallFin_of_zero_offset (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) coverChecked45_0

theorem treeChecked45 : tree45.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves45 : List.ofFn output45 = tree45.leaves ⟨0,32768,0,32768⟩ := by
  unfold output45
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked45 : gridTreeUnionCheck 32768 raw45 output45 cover45 source45 tree45 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked45, coverChecked45, treeChecked45, treeLeaves45⟩

theorem areaUnits45 : gridUnionAreaUnits output45 = 262144 := by decide +kernel

noncomputable def phaseMass45 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (35679519/409600000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 15347, atom 12607, type 3, source (0,127).
def leavesData46 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves46 : Fin 4 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 127 leaves46 i
def outputData46 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨0,128,32512,32640⟩) (.single ⟨0,128,32640,32768⟩)) (.node (.single ⟨128,256,32512,32640⟩) (.single ⟨128,256,32640,32768⟩))) (.node (.node (.single ⟨32512,32640,0,128⟩) (.single ⟨32512,32640,128,256⟩)) (.node (.single ⟨32640,32768,0,128⟩) (.single ⟨32640,32768,128,256⟩))))
def output46 : Fin 8 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 7) (.single 3))) (.node (.node (.single 1) (.single 6)) (.node (.single 6) (.single 1)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 5) (.single 2))) (.node (.node (.single 3) (.single 7)) (.node (.single 4) (.single 0)))))
def sourceData46 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 3))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 2))))
def cover46 (i : Fin 16) : Fin 8 := ⟨coverData46.get i % 8, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 8) : Fin 16 := ⟨sourceData46.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 (.cutY 28672 .empty (.cutX 2048 (.cutY 30720 .empty (.cutX 1024 (.cutY 31744 .empty (.cutX 512 (.cutY 32256 .empty (.cutX 256 (.cutY 32512 .empty (.cutX 128 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)) .empty)) .empty)) .empty)) .empty)) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 .empty (.cutY 4096 (.cutX 30720 .empty (.cutY 2048 (.cutX 31744 .empty (.cutY 1024 (.cutX 32256 .empty (.cutY 512 (.cutX 32512 .empty (.cutY 256 (.cutX 32640 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty)) .empty)) .empty)) .empty)) .empty)) .empty))

theorem metadata46 : 0<142718076 ∧ 0<128 ∧ 127<128 ∧ 3<4 ∧
    12607/4160=3 ∧ 12607%4160=127 ∧ ∀ i, (leaves46 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData46).mp
    (by decide +kernel)

theorem sourceChecked46_0 : ∀ i : Fin 8,
    (fun i => output46 i = raw46 (source46 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked46 : ∀ i : Fin 8, (fun i => output46 i = raw46 (source46 i)) i :=
  forallFin_of_zero_offset (fun i => output46 i = raw46 (source46 i)) sourceChecked46_0

theorem coverChecked46_0 : ∀ i : Fin 16,
    (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked46 : ∀ i : Fin 16, (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) i :=
  forallFin_of_zero_offset (fun i => (output46 (cover46 i)).ContainsBox (raw46 i)) coverChecked46_0

theorem treeChecked46 : tree46.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves46 : List.ofFn output46 = tree46.leaves ⟨0,32768,0,32768⟩ := by
  unfold output46
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked46 : gridTreeUnionCheck 32768 raw46 output46 cover46 source46 tree46 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked46, coverChecked46, treeChecked46, treeLeaves46⟩

theorem areaUnits46 : gridUnionAreaUnits output46 = 131072 := by decide +kernel

noncomputable def phaseMass46 : ℝ := singlePhaseMass (142718076/100000000 : ℝ) (3 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (35679519/819200000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46].sum

theorem actual_batch_mass : batchActualMass = (3346515609677/838860800000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch15301
#print axioms NoThreeLine.ScheduleUnionBatch15301.actual_batch_mass

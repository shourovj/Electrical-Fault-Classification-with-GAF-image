clc

open("FaultModel.slx");
out = sim("FaultModel");
toWksData1 = get(out,"voltage1");
assignin("base","toWksData",toWksData1);
toWksData2 = get(out,"voltage2");
assignin("base","toWksData",toWksData2);
toWksData3 = get(out,"voltage3");
assignin("base","toWksData",toWksData3);
toWksData4 = get(out,"voltage4");
assignin("base","toWksData",toWksData4);
toWksData5 = get(out,"current1");
assignin("base","toWksData",toWksData5);
toWksData6 = get(out,"current2");
assignin("base","toWksData",toWksData6);
toWksData7 = get(out,"current3");
assignin("base","toWksData",toWksData7);
toWksData8 = get(out,"current4");
assignin("base","toWksData",toWksData8);

voltageA = toWksData1;
voltageB = toWksData2;
voltageC = toWksData3;
voltageG = toWksData4;
currentA = toWksData5;
currentB = toWksData6;
currentC = toWksData7;
currentG = toWksData8;

[vA, MA] = wavedec(voltageA, 1, 'db4');
[vB, MB] = wavedec(voltageB, 1, 'db4');
[vC, MC] = wavedec(voltageC, 1, 'db4');
[vG, MG] = wavedec(voltageG, 1, 'db4');
coefvA = detcoef(vA, MA, 1);
coefvB = detcoef(vB, MB, 1);
coefvC = detcoef(vC, MC, 1);
coefvG = detcoef(vG, MG, 1);
Va = max(coefvA)
Vb = max(coefvB)
Vc = max(coefvC)
Vg = max(coefvG)

[iA, LA] = wavedec(currentA, 1, 'db4');
[iB, LB] = wavedec(currentB, 1, 'db4');
[iC, LC] = wavedec(currentC, 1, 'db4');
[iG, LG] = wavedec(currentG, 1, 'db4');
coefiA = detcoef(iA, LA, 1);
coefiB = detcoef(iB, LB, 1);
coefiC = detcoef(iC, LC, 1);
coefvG = detcoef(iG, LG, 1);
Ia = max(coefiA)
Ib = max(coefiB)
Ic = max(coefiC)
Ig = max(coefiG)
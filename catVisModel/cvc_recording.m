RS.saveDir = '~/VERTEX_bsf_results/';
RS.LFP = true;
[meaX, meaY, meaZ] = meshgrid(-400:400:4400, 200, 2450:-400:-1150);
RS.meaXpositions = meaX;
RS.meaYpositions = meaY;
RS.meaZpositions = meaZ;
RS.minDistToElectrodeTip = 20;
RS.maxRecTime = 200;
RS.sampleRate = 1000;

RS.v_m = 1000:1000:49600; %175000;
clear meaX meaY meaZ;
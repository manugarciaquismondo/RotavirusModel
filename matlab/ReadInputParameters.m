if(not(exist('dailyVaccinationRate')))
    dailyVaccinationRate=0.0001;
end
% base_nu=0;
base_nu=dailyVaccinationRate;
% base_nu=0.0002;
nu=base_nu;
% Set Rotavirus reproductive number
if(not(exist('rotavirusReproductiveNumber')))
%     offset_value=19.45;
%     offset_value=19.44;
%     offset_value=19.3;
%     offset_value=19.27;
%     offset_value=19.2695;
%     offset_value=19.269;
%     offset_value=19.2685;
%     offset_value=19.268;
%     offset_value=19.266;
%     offset_value=19.267;
%     offset_value=19.2678;
%     offset_value=19.2675;
%     offset_value=19.2673;
    rotavirusReproductiveNumber=19.2671;
end
offset_value=rotavirusReproductiveNumber;
% If an initial state is given, start with it.
if(exist('stableData'))
%     load '../data/stableState.mat';
    load(strcat('../data/',stableData,'.mat'))
else
    StartPopulation
end
if(not(exist('imageFileName')))
    imageFileName='image';
end
if(not(exist('parametersFileName')))
    parametersFileName='parameters';
end
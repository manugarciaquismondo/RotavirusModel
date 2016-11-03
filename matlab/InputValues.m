base_nu=.001;
rotavirusReproductiveNumber=40;
simulatedYears=200; % 2500 for generation of stable values
scenarioName='exaggerationandwarming';
productionIterationFunction=@ExaggerationAndWarmingLambda; % Default is @BaselineLambda
finalValues=strcat('simulationResults',scenarioName);
seriesFileName=strcat('seriesResults',scenarioName);
parametersFileName=strcat('parameters', scenarioName);
imageFileName=scenarioName;
startValues='burninAltData';
Rotaviruscode12_15_2015

% base_nu=.001;rotavirusReproductiveNumber=40;simulatedYears=1200;imageRoute='results';parametersFileName='results';Rotaviruscode12_15_2015




base_nu=.001;
rotavirusReproductiveNumber=20.85; %With 21 we get 3.6%, that is acceptable
simulatedYears=100; % 2500 for generation of stable values
scenarioName='exaggerationandwarming';
productionIterationFunction=@ExaggerationAndWarmingLambda; % Default is @BaselineLambda
finalValues=strcat('simulationResults',scenarioName);
seriesFileName=strcat('seriesResults',scenarioName);
parametersFileName=strcat('parameters', scenarioName);
imageFileName=scenarioName;
startValues='data';
Rotaviruscode12_15_2015

% base_nu=.001;rotavirusReproductiveNumber=40;simulatedYears=1200;imageRoute='results';parametersFileName='results';Rotaviruscode12_15_2015




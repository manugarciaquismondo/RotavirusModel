iterations=iterationsMultiplier*days_per_year;
clearvars globalStoreMaternity globalStoreSusceptible globalStoreInfected globalStoreRecovered globalStoreVaccinated
betaVersions=size(lambda_equation_versions,2)-1;
globalStoreMaternity=zeros(betaVersions,iterations);
globalStoreSusceptible=zeros(betaVersions,stages,iterations);
globalStoreInfected=zeros(betaVersions,stages,iterations);
globalStoreRecovered=zeros(betaVersions,stages,iterations);
globalStoreVaccinated=zeros(betaVersions,stages,iterations);
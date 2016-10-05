
for betaVersion=1:betaVersions
    lambda_initial_expression=lambda_equation_versions(betaVersion+1);
    lambda_initial_expression=lambda_initial_expression{1};
    InitializeVectors
    siriteration
    globalStoreMaternity(betaVersion,:)=storeMaternity;
    globalStoreSusceptible(betaVersion,:,:)=storeSusceptible;
    globalStoreInfected(betaVersion,:,:)=storeInfected;
    globalStoreRecovered(betaVersion,:,:)=storeRecovered;
    globalStoreVaccinated(betaVersion,:,:)=storeVaccinated;
end
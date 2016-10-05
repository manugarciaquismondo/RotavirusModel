diffSusceptible=0;
diffInfected=0;
diffRecovered=0;
diffVaccinated=0;
for betaVersion1=1:betaVersions
    for betaVersion2=(betaVersion1+1):betaVersions
        diffSusceptible = UpdateMaxDifference(diffSusceptible, globalStoreSusceptible, betaVersion1, betaVersion2, 'Susceptible' );
        diffInfected = UpdateMaxDifference(diffInfected, globalStoreInfected, betaVersion1, betaVersion2, 'Infected' );
        diffRecovered=UpdateMaxDifference(diffRecovered, globalStoreRecovered, betaVersion1, betaVersion2, 'Recovered' );
        diffVaccinated=UpdateMaxDifference(diffVaccinated, globalStoreVaccinated, betaVersion1, betaVersion2, 'Vaccinated' );
    end
end

maxDifferences=[diffSusceptible diffInfected diffRecovered diffVaccinated];
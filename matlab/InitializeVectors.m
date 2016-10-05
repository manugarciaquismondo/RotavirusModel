iterations=iterationsMultiplier*days_per_year;


clearvars storeMaternity storeSusceptible storeInfected storeRecovered storeVaccinated
storeMaternity=zeros(1,iterations);
storeSusceptible=zeros(stages,iterations);
storeInfected=zeros(stages,iterations);
storeRecovered=zeros(stages,iterations);
storeVaccinated=zeros(stages,iterations);
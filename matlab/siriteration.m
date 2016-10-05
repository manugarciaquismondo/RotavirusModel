for t=1:iterations
firstDivisor=firstDivisorVector(1);
%lambda=0.02; %.02
global lambda
lambda= lambda_numerator/lambda_initial_expression(t);
bufferData= RotavirusPopulation(InitialTotalPop, stages);

%dM/dt = x(1)
bufferData.maternity = rotavirusPop.maternity + mu*eta - firstDivisor*rotavirusPop.maternity;
% m0 + mu*eta - (1/183)*m0;

global sumInfected
sumInfected=sum(rotavirusPop.infected(:));
secondStageMultiplier=(1-kappa*lambda*sumInfected);
stageMultiplierVector=[1 secondStageMultiplier secondStageMultiplier secondStageMultiplier];
stageSumVector=[rotavirusPop.maternity rotavirusPop.vaccinated(2) rotavirusPop.vaccinated(3) rotavirusPop.vaccinated(4)];
kappaLambdaInfected=kappa*lambda*sumInfected;
kappaLambdaInfectedSusceptible=rotavirusPop.susceptible(1)*kappaLambdaInfected;
%dS0/dt = x(2)
bufferData.susceptible(1)= rotavirusPop.susceptible(1) + mu*(1-eta) -firstDivisor*rotavirusPop.susceptible(1) - (1-firstDivisor)*kappa*lambda*rotavirusPop.susceptible(1)*sum(rotavirusPop.infected(:))...
    - firstDivisor*kappa*lambda*rotavirusPop.susceptible(1)*sum(rotavirusPop.infected(:))+(1-firstDivisor)*(1-iota)*gamma*rotavirusPop.infected(1)...
    + (1-firstDivisor)*kappa*(1-lambda)*omega_R*rotavirusPop.recovered(1)*sum(rotavirusPop.infected(:));
% S0= s0 + mu*(1-eta) -(1/183)*s0 - (1-(1/183))*kappa*lambda*s0*(i0+i1+i2+i3+i4)...
%     - (1/183)*kappa*lambda*s0*(i0+i1+i2+i3+i4)+(1-(1/183))*(1-iota)*gamma*i0...
%     + (1-(1/183))*kappa*(1-lambda)*omega_R*r0*(i0+i1+i2+i3+i4);

%dI0/dt = x(3)
% I0= i0  + (1-(1/183))*kappa*lambda*s0*(i0+i1+i2+i3+i4) - (1/183)*i0 -...
%     (1-(1/183))*gamma*i0;

bufferData.infected(1)= rotavirusPop.infected(1)  + (1-firstDivisor)*kappa*lambda*rotavirusPop.susceptible(1)*sum(rotavirusPop.infected(:)) - firstDivisor*rotavirusPop.infected(1) -...
    (1-firstDivisor)*gamma*rotavirusPop.infected(1);;

%dR0/dt = x(4)
bufferData.recovered(1)= rotavirusPop.recovered(1) + (1-firstDivisor)*iota*gamma*rotavirusPop.infected(1)  - firstDivisor*rotavirusPop.recovered(1) ...
    -(1-firstDivisor)*kappa*omega_R*(1-lambda)*rotavirusPop.recovered(1)*sum(rotavirusPop.infected(:));

%dV1/dt = x(5)
% V1= v1  + nu*(1/183)*r0  + nu*(1/183)*s0  + nu*(1-(1/183))*s1  +...
%     nu*(1-(1/183))*r1 - (1/183)*v1  - ...
%     (1-(1/183))*kappa*(1-lambda)*omega_V*v1*(i0+i1+i2+i3+i4);

for stage=1:(stages-1)
    firstDivisor=firstDivisorVector(stage);
    secondDivisor=secondDivisorVector(stage);
    stageMultiplier=stageMultiplierVector(stage);
    stageSum=stageSumVector(stage);
    bufferData.vaccinated(stage+1)= updateVaccinated(rotavirusPop, stage+1, stageMultiplier, firstDivisor, secondDivisor);
    bufferData.susceptible(stage+1) = updateSusceptible(rotavirusPop, stage+1, stageMultiplier, stageSum, firstDivisor, secondDivisor);
    bufferData.infected(stage+1) = updateInfected(rotavirusPop, stage+1, firstDivisor, secondDivisor);
    bufferData.recovered(stage+1) = updateRecovered(rotavirusPop, stage+1, firstDivisor, secondDivisor);
end


bufferData.vaccinated(1)=0;
rotavirusPop.maternity=max(bufferData.maternity, 0);
rotavirusPop.susceptible=max(bufferData.susceptible, 0);
rotavirusPop.infected=max(bufferData.infected, 0);
rotavirusPop.recovered=max(bufferData.recovered, 0);
rotavirusPop.vaccinated=max(bufferData.vaccinated, 0);

storeMaternity(t)=rotavirusPop.maternity;
storeSusceptible(:,t)=rotavirusPop.susceptible;
storeInfected(:,t)=rotavirusPop.infected;
storeRecovered(:,t)=rotavirusPop.recovered;
storeVaccinated(:,t)=rotavirusPop.vaccinated;




end
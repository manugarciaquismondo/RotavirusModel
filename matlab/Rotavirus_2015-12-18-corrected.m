%M is maternal immunity protected
%S are susceptible
%I are infectious
%R are recovered with immunity
%V are vaccine protected
%_0 indicates in the first half year of life
%_1 indicates you are between 0.5 and 1 years old
%(after _1 there should be annual subscripts, but then the M and S terms in the S_ equation drop out, and the denominator time counter becomes 1/365 instead of 1/183)
%mu is a birth rate
%eta is a percentage of maternal immune protection
%kappa is the contact rate
%lambda is the per contact transmission probability
%omega_R is the rate at which you lose natural immune memory when you aren’t re-challenged with the disease (if you are rechallenged, we assume immunity holds)
%omega_V is the rate at which you lose vaccine-derived immune memory when you aren’t re-challenged with the disease (if you are rechallenged, we assume immunity holds)
%iota is the percent of recovering people who retain immunity
%gamma is the recovery rate from infection
%nu is the rate of vaccination

%%
global nu kappa omega_R omega_V iota gamma multiplier4 stages

%mu is a birth rate = 20 = x / sum
 %(5)
%eta is a percentage of maternal immune protection = .5
eta=0.74; %(.74)
%kappa is the contact rate = (percent population)

kappa=0.45; %(.45)
%lambda is the per contact transmission probability = .01-.05

%lambda= 250/(45.552468-9.312496*sin(2*pi*(t/365.25))-23.16327*cos((2*pi*(t/365.25))));

%(5)/...
%omega_R is the rate at which you lose natural immune memory (not
%re-challenged)
omega_R=1/152; %(1/152)
%omega_V is the rate at which you lose vaccine-derived immune memory (not
%re-challenged)
omega_V=1/3000; %(1/1826)
%iota is the percent of recovering people who retain immunity = .25
iota = 0.48; %(.48)
%gamma is the recovery rate from infection = 1/5
gamma=1/7 ; %(1/7)
%nu is the rate of vaccination = (percentage)
nu=0.45;%(.45)

%reminder: preallocating arrays

lambda_numerator=250;

%Number of runs%
InitialTotalPop = 20000;


debug_mode=0;
lambda_equation_versions={@DebugLambda @BaselineLambda @WarmingLambda @ExternalAndWarmingLambda @ExaggerationAndWarmingLambda};

stages=5;

if(debug_mode==1)
    days_per_year=1;
    multiplier4=0;
    lambda_initial_expression= @DebugLambda;
    mu= 0;
else
    days_per_year=365;
    multiplier4=1;
    lambda_initial_expression= @BaselineLambda;
    mu= 5/20000;
end

globalFirstDivisor=1/183;
globalSecondDivisor=1/365;
globalThirdDivisor=1/1095;
rotavirusPop= RotavirusPopulation(InitialTotalPop, stages);
firstDivisorVector=[globalFirstDivisor globalFirstDivisor globalSecondDivisor globalThirdDivisor];
secondDivisorVector=[globalFirstDivisor globalSecondDivisor globalThirdDivisor globalThirdDivisor];






%to do:
%Ij and sum of I vs time
%determine weighted average of each Ij and therefore average sum of I
%each lambda in separate file or separate with %% *check*
%set up everything for when initial conditions are accurate
%tic
%beta=lambda*kappa

% These are equations for lambda/kappa
% All this is replacing lambda
% Run the model with B and take the initial conditions when at least one of them
% stops increasing
% Then run the model for all the equations (B, W, T, C)

iterationsMultiplier=30;
InitializeVectors
siriteration
iterationsMultiplier=10;
InitializeBetaVersionedVectors
RepeatSIRIteration
%toc
%figure(1)
%plot(Store_i0)
finalInfected=storeInfected;

%no summations
%I0(1), I1(1) sum to have total of infection on given day. Daily Itotal 

Itotal=(sum(finalInfected(:)));
%wrong - Iavg_total=(.0625*I0avg+.0625*I1avg+.125*I2avg+.375*I3avg+.375*I4avg)/4
Iavg=(finalInfected(1)*0.25 + finalInfected(2)*0.75 + finalInfected(3)*1.5 + finalInfected(4)*3.5 + finalInfected(5)*6.5)/Itotal

%midpoint of age time interval
sum(storeSusceptible + storeInfected + storeRecovered + storeVaccinated) + storeMaternity
maxSusceptible=FindMaxIndex(storeSusceptible)
maxInfected=FindMaxIndex(storeInfected)
maxRecovered=FindMaxIndex(storeRecovered)
maxVaccinated=FindMaxIndex(storeVaccinated)
maxMaternity=FindMaxIndex(storeMaternity)
iterations
%fixes
% set all initials to 0 ------check
% make easy initial conditions
% calculate
%
%iterations = time?

% TotalPop = M0 + S0 + I0 + R0 + V1 + S1 + I1 + R1 + V2 + S2 + I2 + R2 +...
%     V3 + S3 + I3 + R3 + V4 + S4 + I4 + R4

% zero or 1 parameter

% average age of infection under initial conditions
% add with oscillating betas
% calculate avg age under one beta scenario

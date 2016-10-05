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

iterations=5;
stages=4;

%Number of runs%
InitialTotalPop = 20000;




mu=5/InitialTotalPop; % 5/20000


m0(1)=1000/InitialTotalPop;
s0(1)=1000/InitialTotalPop;
i0(1)= 1000/InitialTotalPop;
r0(1)=1000/InitialTotalPop;
v1(1)=1000/InitialTotalPop;
s1(1)=1000/InitialTotalPop;
i1(1)=1000/InitialTotalPop;
r1(1)=1000/InitialTotalPop;
v2(1)=1000/InitialTotalPop;
s2(1)=1000/InitialTotalPop;
i2(1)=1000/InitialTotalPop;
r2(1)=1000/InitialTotalPop;
v3(1)=1000/InitialTotalPop;
s3(1)=1000/InitialTotalPop;
i3(1)=1000/InitialTotalPop;
r3(1)=1000/InitialTotalPop;
v4(1)=1000/InitialTotalPop;
s4(1)=1000/InitialTotalPop;
i4(1)=1000/InitialTotalPop;
r4(1)=1000/InitialTotalPop;

<<<<<<< .mine
storeMaternity=zeros(1,100);
for stage=1:stages
    storeSusceptible(stage,:)=zeros(1,100);
    storeInfected(stage,:)=zeros(1,100);
    storeRecovered(stage,:)=zeros(1,100);
    storeVaccinated(stage,:)=zeros(1,100);
end

=======




>>>>>>> .r136
Store_m0=zeros(1,100);
Store_s0=zeros(1,100);
Store_i0=zeros(1,100);
Store_r0=zeros(1,100);
Store_v1=zeros(1,100);
Store_s1=zeros(1,100);
Store_i1=zeros(1,100);
Store_r1=zeros(1,100);
Store_v2=zeros(1,100);
Store_s2=zeros(1,100);
Store_i2=zeros(1,100);
Store_r2=zeros(1,100);
Store_v3=zeros(1,100);
Store_s3=zeros(1,100);
Store_i3=zeros(1,100);
Store_r3=zeros(1,100);
Store_v4=zeros(1,100);
Store_s4=zeros(1,100);
Store_i4=zeros(1,100);
Store_r4=zeros(1,100);

debug_mode=1;


if(debug_mode==1)
    days_per_year=1;
    multiplier4=0;
    lambda_initial_expression= 0.02;
    mu= 0;
else
    days_per_year=365;
    multiplier4=1;
    lambda_initial_expression= 250/(45.552468-9.312496*sin(2*pi*(t/365.25))-23.16327*cos((2*pi*(t/365.25))));
    mu= 5/20000;
end

iterations=5*days_per_year;

%to do:
%Ij and sum of I vs time
%determine weighted average of each Ij and therefore average sum of I
%each lambda in separate file or separate with %% *check*
%set up everything for when initial conditions are accurate
%tic
<<<<<<< .mine

multiplierSwitch=0;
mu=0;

iterationsPerYear=365;
totalIterations=iterationsPerYear*5;
for t=1:totalIterations
=======
for t=1:iterations
>>>>>>> .r136

lambda=lambda_initial_expression; %.02
    
%dM/dt = x(1)
M0 = m0 + mu*eta - (1/183)*m0;

%dS0/dt = x(2)
S0= s0 + mu*(1-eta) -(1/183)*s0 - (1-(1/183))*kappa*lambda*s0*(i0+i1+i2+i3+i4)...
    - (1/183)*kappa*lambda*s0*(i0+i1+i2+i3+i4)+(1-(1/183))*(1-iota)*gamma*i0...
    + (1-(1/183))*kappa*(1-lambda)*omega_R*r0*(i0+i1+i2+i3+i4);

% susceptibleBuffer(1)= population.susceptiblePopulation(1) + mu*(1-eta) -firstDivisor*s0 - (1-2*firstDivisor)...
%     *kappaLambdaInfectedSusceptible + firstDivisorComplementary*((1-iota)*gamma*i0+ ...
%     kappa*(1-lambda)*omega_R*population.recoveredPopulation(1)*sum(population.infectedPopulation(:)));

%dI0/dt = x(3)
I0= i0  + (1-(1/183))*kappa*lambda*s0*(i0+i1+i2+i3+i4) - (1/183)*i0 -...
    (1-(1/183))*gamma*i0;

% infectedBuffer(1)= population.infectedPopulation(1)  + firstDivisorComplementary*...
%     (kappaLambdaInfectedSusceptible - gamma*population.infectedPopulation(1))...
%     - firstDivisor*population.infectedPopulation(1);

%dR0/dt = x(4)
R0= r0 + (1-(1/183))*iota*gamma*i0  - (1/183)*r0 ...
    -(1-(1/183))*kappa*omega_R*(1-lambda)*r0*(i0+i1+i2+i3+i4);

% R0= r0 + firstDivisorComplementary*iota*gamma*infectedPopulation(1)  - recoveredPopulation(1)*(firstDivisor ...
%     +firstDivisorComplementary*kappa*omega_R*(1-lambda))*sum(infectedPopulation(:));

%dV1/dt = x(5)
V1= v1  + nu*(1/183)*r0  + nu*(1/183)*s0  + nu*(1-(1/183))*s1  +...
    nu*(1-(1/183))*r1 - (1/183)*v1  - ...
    (1-(1/183))*kappa*(1-lambda)*omega_V*v1*(i0+i1+i2+i3+i4);

%DS1/dt = x(6)
S1 = s1  + (1-nu)*(s0/183) + m0/183 + (1-(1/183))*kappa*(1-lambda)*omega_V*v1*(i0+i1+i2+i3+i4)...
    + (1-(1/183))*(1-iota)*gamma*i1  + (1-(1/183))*kappa*(1-lambda)*omega_R*r1*(i0+i1+i2+i3+i4)...
    -(1-(1/183))*kappa*lambda*s1*(i0+i1+i2+i3+i4) -(s1/183) - (1-(1/183))*nu*s1 ...
    + (1/183)*(1-iota)*gamma*i0;

%DI1/dt = x(7)
I1 = i1  + (1-(1/183))*kappa*lambda*s1*(i0+i1+i2+i3+i4) +...
    (s0/183)*kappa*lambda*(i0+i1+i2+i3+i4) + (1/183)*(1-gamma)*i0 ...
    - (1/183)*i1  - (1-(1/183))*gamma*i1 ;

%DR1/dt = x(8)
R1= r1  + (1-(1/183))*iota*gamma*i1 + (1-nu)*(1/183)*r0 + (1/183)*iota*gamma*i0...
    - (1/183)*r1 - (1-(1/183))*kappa*omega_R*(1-lambda)*r1*(i0+i1+i2+i3+i4)...
    - (1-(1/183))*nu*r1 ;

%DV2/dt = x(9)
V2= v2 + nu*(1/183)*r1 + nu*(1-kappa*lambda*(i0+i1+i2+i3+i4))*(1/183)*s1 +...
    nu*(1-(1/365))*s2  + nu*(1-(1/365))*r2 - (1/365)*v2...
    -(1-(1/365))*kappa*(1-lambda)*omega_V*v2*(i0+i1+i2+i3+i4);

%DS2/dt = x(10)
S2= s2 + (1-nu)*(1-kappa*lambda*(i0+i1+i2+i3+i4))*s1/183 + v1/183 ...
    +(1-(1/365))*kappa*(1-lambda)*omega_V*v2*(i0+i1+i2+i3+i4) ...
    + (1-(1/365))*(1-iota)*gamma*i2  + (1-(1/365))*kappa*(1-lambda)*omega_R*r2*(i0+i1+i2+i3+i4) ...
    -(1-(1/365))*kappa*lambda*s2*(i0+i1+i2+i3+i4) -(s2/365) ...
    -(1-(1/365))*nu*s2 +(1/183)*(1-iota)*gamma*i1;

%DI2/dt = x(11)
I2 = i2 + (1-(1/365))*kappa*lambda*s2*(i0+i1+i2+i3+i4)+(s1/183)*kappa*lambda*(i0+i1+i2+i3+i4)...
    + (1/183)*(1-gamma)*i1 -(1/365)*i2  - (1-(1/365))*gamma*i2 ;

%DR2/dt = x(12)
R2= r2 + (1-(1/365))*iota*gamma*i2 + (1-nu)*(1/183)*r1 + (1/183)*iota*gamma*i1 - (1/365)*r2...
    - (1-(1/365))*kappa*omega_R*(1-lambda)*r2*(i0+i1+i2+i3+i4) - (1-(1/365))*nu*r2;

%DV3/dt = x(13)
V3= v3 + nu*(1/365)*r2 + nu*(1-kappa*lambda*(i0+i1+i2+i3+i4))*(1/365)*s2...
    + nu*(1-(1/1095))*s3  + nu*(1-(1/1095))*r3 -(1/1095)*v3 ...
    -(1-(1/1095))*kappa*(1-lambda)*omega_V*v3*(i0+i1+i2+i3+i4);

%DS3/dt = x(14)
S3= s3 + (1-nu)*(1-kappa*lambda*(i0+i1+i2+i3+i4))*s2/365 + v2/365 ...
    +(1-(1/1095))*kappa*(1-lambda)*omega_V*v3 *(i0+i1+i2+i3+i4) ...
    +(1-(1/1095))*(1-iota)*gamma*i3 +(1-(1/1095))*kappa*(1-lambda)*omega_R*r3*(i0+i1+i2+i3+i4)...
    -(1-(1/1095))*kappa*lambda*s3*(i0+i1+i2+i3+i4) -(s3/1095) ...
    -(1-(1/1095))*nu*s3 + (1/365)*(1-iota)*gamma*i2;

%DI3/dt = x(15)
I3 = i3 +(1-(1/1095))*kappa*lambda*s3*(i0+i1+i2+i3+i4)+(s2/365)*kappa*lambda*(i0+i1+i2+i3+i4)...
    + (1/365)*(1-gamma)*i2 -(1/1095)*i3  - (1-(1/1095))*gamma*i3 ;

%DR3/dt = x(16)
R3= r3  + (1-(1/1095))*iota*gamma*i3  + (1-nu)*(1/365)*r2  + (1/365)*iota*gamma*i2...
    - (1/1095)*r3  - (1-(1/1095))*kappa*omega_R*(1-lambda)*r3*(i0+i1+i2+i3+i4)...
    - (1-(1/1095))*nu*r3;

%DV4/dt = x(17)
V4= v4 + nu*(1/1095)*r3 + nu*(1-kappa*lambda*(i0+i1+i2+i3+i4))*(1/1095)*s3...
<<<<<<< .mine
    + nu*(1-(1/1095))*s4  + nu*(1-(1/1095))*r4 - multiplierSwitch*(1/1095)*v4...
=======
    + nu*(1-(1/1095))*s4  + nu*(1-(1/1095))*r4 - multiplier4*(1/1095)*v4...
>>>>>>> .r136
    -(1-(1/1095))*kappa*(1-lambda)*omega_V*v4*(i0+i1+i2+i3+i4);

%DS4/dt = x(18)
S4= s4 + (1-nu)*(1-kappa*lambda*(i0+i1+i2+i3+i4))*s3/1095 + v3/1095 ...
    +(1-(1/1095))*kappa*(1-lambda)*omega_V*v4*(i0+i1+i2+i3+i4) + (1-(1/1095))*(1-iota)*gamma*i4...
    + (1-(1/1095))*kappa*(1-lambda)*omega_R*r4*(i0+i1+i2+i3+i4)...
<<<<<<< .mine
    -(1-(1/1095))*kappa*lambda*s4*(i0+i1+i2+i3+i4) -multiplierSwitch*(s4/1095) - (1-(1/1095))*nu*s4 ...
=======
    -(1-(1/1095))*kappa*lambda*s4*(i0+i1+i2+i3+i4) -multiplier4*(s4/1095) - (1-(1/1095))*nu*s4 ...
>>>>>>> .r136
    +(1/1095)*(1-iota)*gamma*i3;

%DI4/dt = x(19)
I4 = i4 +(1-(1/1095))*kappa*lambda*s4*(i0+i1+i2+i3+i4)+(s3/1095)*kappa*lambda*(i0+i1+i2+i3+i4)...
<<<<<<< .mine
    + (1/1095)*(1-gamma)*i3 -multiplierSwitch*(1/1095)*i4  - (1-(1/1095))*gamma*i4 ;
=======
    + (1/1095)*(1-gamma)*i3 -multiplier4*(1/1095)*i4  - (1-(1/1095))*gamma*i4 ;
>>>>>>> .r136

%DR4/dt = x(20)
R4= r4  + (1-(1/1095))*iota*gamma*i4  + (1-nu)*(1/1095)*r3  + (1/1095)*iota*gamma*i3...
<<<<<<< .mine
    - multiplierSwitch*(1/1095)*r4 - (1-(1/1095))*kappa*omega_R*(1-lambda)*r4*(i0+i1+i2+i3+i4)...
=======
    - multiplier4*(1/1095)*r4 - (1-(1/1095))*kappa*omega_R*(1-lambda)*r4*(i0+i1+i2+i3+i4)...
>>>>>>> .r136
    - (1-(1/1095))*nu*r4;



m0=max(0,M0);
s0=max(0,S0);
i0=max(0,I0);
r0=max(0,R0);
v1=max(0,V1);
s1=max(0,S1);
i1=max(0,I1);
r1=max(0,R1);
v2=max(0,V2);
s2=max(0,S2);
i2=max(0,I2);
r2=max(0,R2);
v3=max(0,V3);
s3=max(0,S3);
i3=max(0,I3);
r3=max(0,R3);
v4=max(0,V4);
s4=max(0,S4);
i4=max(0,I4);
r4=max(0,R4);



Store_m0(:,t)=m0;
Store_s0(:,t)=s0;
Store_i0(:,t)=i0;
Store_r0(:,t)=r0;
Store_v1(:,t)=v1;
Store_s1(:,t)=s1;
Store_i1(:,t)=i1;
Store_r1(:,t)=r1;
Store_v2(:,t)=v2;
Store_s2(:,t)=s2;
Store_i2(:,t)=i2;
Store_r2(:,t)=r2;
Store_v3(:,t)=v3;
Store_s3(:,t)=s3;
Store_i3(:,t)=i3;
Store_r3(:,t)=r3;
Store_v4(:,t)=v4;
Store_s4(:,t)=s4;
Store_i4(:,t)=i4;
Store_r4(:,t)=r4;



end
%toc
%figure(1)
%plot(Store_i0)
I0=(Store_i0)
%figure(2)
%plot(Store_i1)
I1=(Store_i1)
%figure(3)
%plot(Store_i2)
I2=(Store_i2)
%figure(4)
%plot(Store_i3)
I3=(Store_i3)
%figure(5)
%plot(Store_i4)
I4=(Store_i4)

%no summations
%I0(1), I1(1) sum to have total of infection on given day. Daily Itotal 

Itotal=(I0+I1+I2+I3+I4)
%wrong - Iavg_total=(.0625*I0avg+.0625*I1avg+.125*I2avg+.375*I3avg+.375*I4avg)/4
Iavg=(I0*0.25 + I1*0.75 + I2*1.5 + I3*3.5 + I4*6.5)/Itotal

%midpoint of age time interval

%fixes
% set all initials to 0 ------check
% make easy initial conditions
% calculate
%
%iterations = time?

TotalPop = M0 + S0 + I0 + R0 + V1 + S1 + I1 + R1 + V2 + S2 + I2 + R2 +...
    V3 + S3 + I3 + R3 + V4 + S4 + I4 + R4

 Store_i0+ Store_i1+ Store_i2+ Store_i3+ Store_i4+ Store_m0+ Store_r0+ Store_r1+ Store_r2+ Store_r3+ Store_r4+ Store_s0+ Store_s1+ Store_s2+ Store_s3+ Store_s4+ Store_v1+ Store_v2+ Store_v3+ Store_v4
% zero or 1 parameter

% average age of infection under initial conditions
% add with oscillating betas
% calculate avg age under one beta scenario

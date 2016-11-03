

if(t==preparationIterations+1)
    tBuffer=0;
end
tBuffer=tBuffer+1;
% if((t<=preparationIterations)||(simType==BaselineType))
%     lambda=BaselineLambda(t);
% elseif(simType==WarmingType)
%     lambda=WarmingLambda(t, tBuffer);
% elseif(simType==ExternalType)
%     lambda=ExternalAndWarmingLambda(t);
% elseif(simType==ExaggerationType)
%     lambda=ExaggerationWarmingLambda(t, tBuffer);
% end
if(t<=preparationIterations)
   lambda=BaselineLambda(t, offset_value, t);
else
   nu=base_nu;
% %    nu=0;
%    nu=base_nu*2;
%    nu=base_nu*100;
   lambda=productionIterationFunction(t, offset_value, t);

   % lambda=productionIterationFunction(t, offset_value, tBuffer);
end

%dM/dt = x(1)
M0 = m0 + mu*eta - (1/183)*m0;

%dS0/dt = x(2)
S0= s0 + mu*(1-eta) -(1/183)*s0 - (1-(1/183))*kappa*lambda*s0*(i0+i1+i2+i3+i4)...
    - (1/183)*kappa*lambda*s0*(i0+i1+i2+i3+i4)+(1-(1/183))*(1-iota)*gamma*i0...
    + (1-(1/183))*kappa*(1-lambda)*omega_R*r0*(i0+i1+i2+i3+i4);

%dI0/dt = x(3)
I0= i0  + (1-(1/183))*kappa*lambda*s0*(i0+i1+i2+i3+i4) - (1/183)*i0 -...
    (1-(1/183))*gamma*i0;

%dR0/dt = x(4)
R0= r0 + (1-(1/183))*iota*gamma*i0  - (1/183)*r0 ...
    -(1-(1/183))*kappa*omega_R*(1-lambda)*r0*(i0+i1+i2+i3+i4);

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
    + nu*(1-(1/1095))*s4  + nu*(1-(1/1095))*r4 - multiplierSwitch*(1/1095)*v4...
    -(1-(1/1095))*kappa*(1-lambda)*omega_V*v4*(i0+i1+i2+i3+i4);

%DS4/dt = x(18)
S4= s4 + (1-nu)*(1-kappa*lambda*(i0+i1+i2+i3+i4))*s3/1095 + v3/1095 ...
    +(1-(1/1095))*kappa*(1-lambda)*omega_V*v4*(i0+i1+i2+i3+i4) + (1-(1/1095))*(1-iota)*gamma*i4...
    + (1-(1/1095))*kappa*(1-lambda)*omega_R*r4*(i0+i1+i2+i3+i4)...
    -(1-(1/1095))*kappa*lambda*s4*(i0+i1+i2+i3+i4) -multiplierSwitch*(s4/1095) - (1-(1/1095))*nu*s4 ...
    +(1/1095)*(1-iota)*gamma*i3;

%DI4/dt = x(19)
I4 = i4 +(1-(1/1095))*kappa*lambda*s4*(i0+i1+i2+i3+i4)+(s3/1095)*kappa*lambda*(i0+i1+i2+i3+i4)...
    + (1/1095)*(1-gamma)*i3 -multiplierSwitch*(1/1095)*i4  - (1-(1/1095))*gamma*i4 ;

%DR4/dt = x(20)
R4= r4  + (1-(1/1095))*iota*gamma*i4  + (1-nu)*(1/1095)*r3  + (1/1095)*iota*gamma*i3...
    - multiplierSwitch*(1/1095)*r4 - (1-(1/1095))*kappa*omega_R*(1-lambda)*r4*(i0+i1+i2+i3+i4)...
    - (1-(1/1095))*nu*r4;

V5 = multiplierSwitch*(1/1095)*v4;

S5 = multiplierSwitch*(s4/1095);

I5 = multiplierSwitch*(1/1095)*i4;

R5 = multiplierSwitch*(1/1095)*r4;

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
v5=max(0,V5);
s5=max(0,S5);
i5=max(0,I5);
r5=max(0,R5);


if(mod(t, iterationsPerYear)==0)
    waitbar(t/totalIterations, h,sprintf('Simulated year %d out of %d', t/iterationsPerYear, simulatedYears));
end

% SumStore
if(t>firstIndexStoredValues)
    Store_m0(:,t-firstIndexStoredValues)=m0;
    Store_s0(:,t-firstIndexStoredValues)=s0;
    Store_i0(:,t-firstIndexStoredValues)=i0;
    Store_r0(:,t-firstIndexStoredValues)=r0;
    Store_v1(:,t-firstIndexStoredValues)=v1;
    Store_s1(:,t-firstIndexStoredValues)=s1;
    Store_i1(:,t-firstIndexStoredValues)=i1;
    Store_r1(:,t-firstIndexStoredValues)=r1;
    Store_v2(:,t-firstIndexStoredValues)=v2;
    Store_s2(:,t-firstIndexStoredValues)=s2;
    Store_i2(:,t-firstIndexStoredValues)=i2;
    Store_r2(:,t-firstIndexStoredValues)=r2;
    Store_v3(:,t-firstIndexStoredValues)=v3;
    Store_s3(:,t-firstIndexStoredValues)=s3;
    Store_i3(:,t-firstIndexStoredValues)=i3;
    Store_r3(:,t-firstIndexStoredValues)=r3;
    Store_v4(:,t-firstIndexStoredValues)=v4;
    Store_s4(:,t-firstIndexStoredValues)=s4;
    Store_i4(:,t-firstIndexStoredValues)=i4;
    Store_r4(:,t-firstIndexStoredValues)=r4;
    Store_v5(:,t-firstIndexStoredValues)=v5;
    Store_s5(:,t-firstIndexStoredValues)=s5;
    Store_i5(:,t-firstIndexStoredValues)=i5;
    Store_r5(:,t-firstIndexStoredValues)=r5;
end

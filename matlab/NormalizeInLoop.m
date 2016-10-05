normalizerDenominator=0;
    normalizerDenominator=m0 + s0 +s1+s2+s3+s4 +...
        i0 +i1+i2+i3+i4 +...
        r0 +r1+r2+r3+r4 +...
        v1+v2 +v3 + v4;

Store_unnormalized_i0(:,t)=i0;
Store_unnormalized_i1(:,t)=i1;
Store_unnormalized_i2(:,t)=i2;
Store_unnormalized_i3(:,t)=i3;
Store_unnormalized_i4(:,t)=i4;

m0 = m0/normalizerDenominator;
s0 = s0/normalizerDenominator;
s1 = s1/normalizerDenominator;
s2 = s2/normalizerDenominator;
s3 = s3/normalizerDenominator;
s4 = s4/normalizerDenominator;
i0 = i0/normalizerDenominator;
i1 = i1/normalizerDenominator;
i2 = i2/normalizerDenominator;
i3 = i3/normalizerDenominator;
i4 = i4/normalizerDenominator;
r0 = r0/normalizerDenominator;
r1 = r1/normalizerDenominator;
r2 = r2/normalizerDenominator;
r3 = r3/normalizerDenominator;
r4 = r4/normalizerDenominator;
v1 = v1/normalizerDenominator;
v2 = v2/normalizerDenominator;
v3 = v3/normalizerDenominator;
v4 = v4/normalizerDenominator;
clear;
clc;

rho=0.1;

X = randn(1000,1);
Y = randn(1000,1);

Y = rho*X + sqrt(1-rho^2)*Y;
temp = corrcoef(Y,X);
while (  temp(1,2) < 0.09995 || temp(1,2)>0.10005 )
  Y = randn(1000,1);
  Y = rho*X + sqrt(1-rho^2)*Y;
  temp = corrcoef(Y,X) ;  
end

corrcoef(Y,X)


figure
plot(Y, normpdf(Y,0,1));

reg1 = regstats(Y,X)


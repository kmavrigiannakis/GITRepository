%xmin= -1;
%xmax =1;
%rho = xmin +rand(1)* (xmax-xmin);  %creation of a univariate uniform random variable, and normalize it at range -1 - 1
%while (abs(rho)<0.3)
%    rho = xmin +rand(1,1)* (xmax-xmin);
%end
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



% subplot(2,1,1) 
% plot(X, normpdf(X,0,1));
% title('X')
% 
% subplot(2,1,2) 
% plot(Y, normpdf(Y,0,1));
% title('Y')
% 
% subplot(2,1,3) 
% plot(Z, normpdf(Z,0,1));
% title('Z')


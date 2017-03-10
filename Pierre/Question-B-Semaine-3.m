F0=440;
A=1;
fe=8000;
Te = 1/fe;
t=0 : Te :0.1;
N = length(t);
s1 = A*sin(2*pi*F0*t);
M=2^11;
f = 0:fe/N:8000;
figure
plot(t,s1)

t1 = 0.05;
Fe = 8000;                          % Frequence d'echantillonnage
Te = 1/Fe;
N1 = t1/Te;
t = -0.1:1/Fe:0.1;                  % Vecteur de temps
y = zeros(size(t));                 
y(1:N1) = 1;                        




plot(t,y)
axis([-0.05 0.1 -1 2])
grid on

% Transformee de Fourier discrete
L=length(y);
N=ceil(log2(L));
fy=fft(y,2^N)/(L/2);
f=(Fe/2^N)*(0:2^(N-1)-1);
figure
plot(f,abs(fy(1:2^(N-1))));
axis([0 500 0 0.5])
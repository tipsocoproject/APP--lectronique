Fs=8000;                       % Frequence echantillonnage 
t=-1:1/Fs:1;                    % 
y=zeros(size(t));
% Rectangular pulse 
for n=1:length(t)
if t(n)>0 && t(n)<0.05
 y(n)=1;
end
end
figure
plot(t,y)
axis([-0.05 0.1 -1 2])
grid on

% Discrete Fourier  Transform 
 L=length(y);
 N=ceil(log2(L));
 fy=fft(y,2^N)/(L/2);
 f=(Fs/2^N)*(0:2^(N-1)-1);
 figure
 plot(f,abs(fy(1:2^(N-1))));
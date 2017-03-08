close all;
clear all;
clc;

[X,fs] = audioread('2notes.wav');
Te = 1/fs;

t=0:1/fs:(length(X)-1)/fs;

K = 1000;
T=(2*K+1)*Te;

N=length(X);
P=zeros(N,1);

for n=1+K:N-K
    S = X(n-K:n+K);
    P(n)= mean(S.^2);
end

Q = 10*log10(P/1e-3);

figure
subplot(3,1,1);
plot(t,X);
xlabel('temps en secondes');
ylabel('Signal dans le domaine temporel');

subplot(3,1,2);
plot(t,Q);
xlabel('Temps en secondes');
ylabel('Puissance (dBm)');
title('Puissance instantanée du signal échantilloné en dBm');

Y = zeros(N,1);

for n=1:N
    if Q(n)>3
        Y(n)=1;
    end
end

subplot(3,1,3);
plot(t,Y);
axis([0 4 -0.5 1.5]);
set(gca,'Ytick',0:1:1);
title('Pres/Abs du signal');
xlabel('temps en secondes');
ylabel('Etat');


deb = [];
fin = [];
cpt = 0;

for n=1:N-1
    M=Y(n+1)-Y(n);
    if M==1
        cpt=cpt+1;
        deb(cpt)=n;
    elseif M==-1
        fin(cpt)=n;
    end
end

D=0.03;
Nfft = 2048;
f=(0:Nfft-1)*fs/Nfft;
deb
fin
for i=1:length(deb)
    A = X(deb(i):fin(i));
    n1=D*fs;
    N(i)=floor(length(A)/n1);
    
    for j=1:N(i)
        z=A((j-1)*n1+1:j*n1);
        zfft=fft(z,Nfft);
        [a(i,j),b(i,j)]=max(zfft(1:Nfft/2));
        F(i,j)=b(i,j)*fs/Nfft;
    end
    
    fre(i)=mean(F(i,:));
end

fre
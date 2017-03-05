% Question E : calculer la puissance instantannée des signaux de paroles et
% de musiques
clear all
clc

K = 100;    %à partir duquel le son commence

%Fichier audio bonjour.wav
%0.987
[signal,ech_signal] = audioread('../Signaux/bonjour.wav'); %importation du fichier audio

somme = 0; %valeur moyenne du signal

for n = 1+K:1:length(signal)-K %on parcourt tout le long du signal
    somme=signal(n-K:n+K);  %valeur moyenne du signal à chaque instant n
    puissance_watt(n+K) = 1/(2*K+1)*mean(somme.^2);%puissance instantannée du signal à chaque instant n en watt
    puissance_dbm(n+K) = 10*log10(puissance_watt(n+K)*0.001);%puissance instantannée du signal à chaque instant n en dBm
end

d =0.987; %durée du signal déterminée sur audacity
c = length(signal)/d;%coefficient pour réajuster l'abscisse en une abscisse de temps en seconde

t=1/c:1/c:(n+K)/c;

figure(1)
subplot(3,1,1);
plot (t,signal,'b');
ylabel('Volts');
xlabel('Temps en seconde')
title('signal bonjour')

subplot(3,1,2);
plot(t,puissance_dbm,'g');
ylabel('dBm');
title('puissance instantannée du signal en dBm');

subplot(3,1,3);
plot(t,puissance_watt,'g');
ylabel('W');
title('puissance instantannée du signal en watt');

%Fichier audio HaydnL.wav

[signal1,ech_signal1] = audioread('../Signaux/Haydn.wav');%importation du fichier audio
somme1 = 0; %valeur moyenne du signal
for n = 1+K:1:length(signal1)-K %on parcourt tout le long du signal
    somme1=signal1(n-K:n+K);    %valeur moyenne du signal à chaque instant n
    puissance_watt1(n+K)=1/(2*K+1)*mean(somme1.^2);%puissance instantannée du signal à chaque instant n en watt
    puissance_dbm1(n+K)= 10*log10(puissance_watt1(n+K)*0.001);%puissance instantannée du signal à chaque instant n en dBm
end

d1=14.410;%durée du signal 1 déterminée sur audacity
c1= length(signal1)/d1;%coefficient pour réajuster l'abscisse en une abscisse de temps en seconde

t=1/c1:1/c1:(n+K)/c1;

figure(2)
subplot(3,1,1);
title('Signal')
plot (t,signal1,'b');
ylabel('Volts');
xlabel('Temps en seconde')
title('signal HaydnL')

subplot(3,1,2);
plot(t,puissance_dbm1,'g');
ylabel('dBm');
title('puissance instantannée du signal en dBm');

subplot(3,1,3);
plot(t,puissance_watt1,'g');
ylabel('W');
title('puissance instantannée du signal en watt');
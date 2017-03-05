%Groupe G4D : Problème 1
clear all
clc

K = 100;    %à partir duquel le son commence

%Fichier audio bonjour.wav
[signal,ech_signal] = audioread('../Signaux/bonjour.wav'); %importation du fichier audio

d =0.987; %durée du signal déterminée avec audacity
c = length(signal)/d;%coefficient pour réajuster l'abscisse en une abscisse de temps en seconde

%calcul pour obtenir une puissance seuil bruit
sommeseuilbruit = 0; %valeur moyenne du signal sur les 150 ms
nbechantillon150ms = (length(signal)*0.15)/d;%longueur du signal à parcourir

%on calcule la puissance seuil du bruit sur les 150 premiers ms car on
%considère qu'il n'y que du bruit ambiant
for n = 1+K:1:nbechantillon150ms-K
    sommeseuilbruit = signal(n-K:n+K);
    puissanceseuilbruit_watt(n) = 1/(2*K+1)*mean(sommeseuilbruit.^2); %puissance instantannée en watt du signal à chaque instant n jusqu'à la fin des 150 ms
    puissanceseuilbruit_dbm(n) = 10*log10(puissanceseuilbruit_watt(n)*0.001);%puissance instantannée en dbm du signal à chaque instant n jusqu'à la fin des 150 ms
end

%Nous avons une liste de puissance seuil bruit mais le 0 nous gène
%lorsqu'on veut appliquer la fonction max pour trouver la puissance seuil
%bruit.

%A la recherche de la bonne puissance seuil bruit
Pseuilbruit = -150; %supposons que la puissance seuil bruit est de -150 dBm au départ
for n = 1:1:length(puissanceseuilbruit_dbm)
    if puissanceseuilbruit_dbm(n)==(0)%on enlève le 0 qui nous gène
        Pseuilbruit = -150;
    else if puissanceseuilbruit_dbm(n)>Pseuilbruit%on prend le plus grand Pseuilbruit
        Pseuilbruit = puissanceseuilbruit_dbm(n);
    else if puissanceseuilbruit_dbm(n)<=Pseuilbruit%sinon le Pseuilbruit reste le même 
        Pseuilbruit = Pseuilbruit;
        end
        end
    end
end

Pseuilbruit

somme = 0; %valeur moyenne du signal

for n = 1+K:1:length(signal)-K %on parcourt tout le long du signal
    somme=signal(n-K:n+K);  %valeur moyenne du signal à chaque instant n
    puissance_watt(n+K) = 1/(2*K+1)*mean(somme.^2);%puissance instantannée du signal à chaque instant n en watt
    puissance_dbm(n+K) = 10*log10(puissance_watt(n+K)*0.001);%puissance instantannée du signal à chaque instant n en dBm
    %test de la présence du signal
    if puissance_dbm(n+K)<=Pseuilbruit%absent
        testpresabs(n+K)=0;
    else if puissance_dbm(n+K)>Pseuilbruit%présent
        testpresabs(n+K)=1;
    end
    end
end

t=1/c:1/c:length(signal)/c;%abscisse de temps

%Affichage du signal Bonjour.wav
figure(1)
subplot(3,1,1)
plot(t,signal,'b')
xlabel('temps en seconde')
ylabel('Volts')
title('signal bonjour')

subplot(3,1,2)
plot(t,puissance_dbm,'g')
xlabel('temps en seconde')
ylabel('dBm')
title('puissance du signal en dBm')

subplot(3,1,3)
plot(t,testpresabs,'r')
xlabel('temps en seconde')
ylabel('Présence/absence')
title('test de présence ou d absence')



%Fichier audio HaydnL.wav

[signal1,ech_signal1] = audioread('../Signaux/HaydnL.wav');%importation du fichier audio

d1=14.410;%durée du signal 1 déterminée avec audacity
c1= length(signal1)/d1;%coefficient pour réajuster l'abscisse en une abscisse de temps en seconde

%calcul pour obtenir une puissance seuil bruit
sommeseuilbruit1 = 0; %valeur moyenne du signal sur les 150 ms
nbechantillon150ms1 = (length(signal1)*0.15)/d1;%longueur du signal à parcourir

%on calcule la puissance seuil du bruit sur les 150 premiers ms car on
%considère qu'il n'y que du bruit ambiant
for n = 1+K:1:nbechantillon150ms1-K
    sommeseuilbruit1 = signal1(n-K:n+K);
    puissanceseuilbruit_watt1(n) = 1/(2*K+1)*mean(sommeseuilbruit1.^2); %puissance instantannée en watt du signal à chaque instant n jusqu'à la fin des 150 ms
    puissanceseuilbruit_dbm1(n) = 10*log10(puissanceseuilbruit_watt1(n)*0.001);%puissance instantannée en dbm du signal à chaque instant n jusqu'à la fin des 150 ms
end

%A la recherche de la bonne puissance seuil bruit
Pseuilbruit1 = -150; %supposons que la puissance seuil bruit est de -150 dBm au départ

for n = 1:1:length(puissanceseuilbruit_dbm1)
    if puissanceseuilbruit_dbm1(n)==(0)%on enlève le 0 qui nous gène
        Pseuilbruit1 = -150;
    else if puissanceseuilbruit_dbm1(n)>Pseuilbruit1%on prend le plus grand Pseuilbruit
        Pseuilbruit1 = puissanceseuilbruit_dbm1(n);
    else if puissanceseuilbruit_dbm1(n)<=Pseuilbruit1%sinon le Pseuilbruit reste le même
        Pseuilbruit1 = Pseuilbruit1;
        end
        end
    end
end

Pseuilbruit1

somme1 = 0; %valeur moyenne du signal

for n = 1+K:1:length(signal1)-K %on parcourt tout le long du signal
    somme1=signal1(n-K:n+K);    %valeur moyenne du signal à chaque instant n
    puissance_watt1(n+K)=1/(2*K+1)*mean(somme1.^2);%puissance instantannée du signal à chaque instant n en watt
    puissance_dbm1(n+K)= 10*log10(puissance_watt1(n+K)*0.001);%puissance instantannée du signal à chaque instant n en dBm
    if puissance_dbm1(n+K)<=Pseuilbruit1%absent
        testpresabs1(n+K)=0;
    else if puissance_dbm1(n+K)>Pseuilbruit1%présent
        testpresabs1(n+K)=1;
    end
    end
end

t=1/c1:1/c1:(n+K)/c1;%abcisse de temps

figure(2)
subplot(3,1,1)
plot(t,signal1,'b')
xlabel('temps en seconde')
ylabel('Volts')
title('signal HaydnL')

subplot(3,1,2)
plot(t,puissance_dbm1,'g')
xlabel('temps en seconde')
ylabel('dBm')
title('puissance du signal en dBm')

subplot(3,1,3)
plot(t,testpresabs1,'r')
xlabel('temps en seconde')
ylabel('Présence/absence')
title('test de présence ou d absence')





%Fichier audio chord1.wav

[signal2,ech_signal2] = audioread('../Signaux/chord1.wav');%importation du fichier audio

d2=4.000;%durée du signal 2 déterminée avec audacity
c2= length(signal2)/d2;%coefficient pour réajuster l'abscisse en une abscisse de temps en seconde

%calcul pour obtenir une puissance seuil bruit
sommeseuilbruit2 = 0; %valeur moyenne du signal sur les 150 ms
nbechantillon150ms2 = (length(signal2)*0.15)/d2;%longueur du signal à parcourir

%on calcule la puissance seuil du bruit sur les 150 premiers ms car on
%considère qu'il n'y que du bruit ambiant
for n = 1+K:1:nbechantillon150ms2-K
    sommeseuilbruit2 = signal2(n-K:n+K);
    puissanceseuilbruit_watt2(n) = 1/(2*K+1)*mean(sommeseuilbruit2.^2); %puissance instantannée en watt du signal à chaque instant n jusqu'à la fin des 150 ms
    puissanceseuilbruit_dbm2(n) = 10*log10(puissanceseuilbruit_watt2(n)*0.001);%puissance instantannée en dbm du signal à chaque instant n jusqu'à la fin des 150 ms
end

%A la recherche de la bonne puissance seuil bruit
Pseuilbruit2 = -150; %supposons que la puissance seuil bruit est de -150 dBm au départ

for n = 1:1:length(puissanceseuilbruit_dbm2)
    if puissanceseuilbruit_dbm2(n)==(0)%on enlève le 0 qui nous gène
        Pseuilbruit2 = -150;
    else if puissanceseuilbruit_dbm2(n)>Pseuilbruit2%on prend le plus grand Pseuilbruit
        Pseuilbruit2 = puissanceseuilbruit_dbm2(n);
    else if puissanceseuilbruit_dbm1(n)<=Pseuilbruit2%sinon le Pseuilbruit reste le même
        Pseuilbruit2 = Pseuilbruit2;
        end
        end
    end
end

Pseuilbruit2

somme2 = 0; %valeur moyenne du signal

for n = 1+K:1:length(signal2)-K %on parcourt tout le long du signal
    somme2=signal2(n-K:n+K);    %valeur moyenne du signal à chaque instant n
    puissance_watt2(n+K)=1/(2*K+1)*mean(somme2.^2);%puissance instantannée du signal à chaque instant n en watt
    puissance_dbm2(n+K)= 10*log10(puissance_watt2(n+K)*0.001);%puissance instantannée du signal à chaque instant n en dBm
    %test de la présence du signal
    if puissance_dbm2(n+K)<=Pseuilbruit2%absent
        testpresabs2(n+K)=0;
    else if puissance_dbm2(n+K)>Pseuilbruit2%présent
        testpresabs2(n+K)=1;
    end
    end
end

t=1/c2:1/c2:(n+K)/c2;%abscisse de temps

figure(3)
subplot(3,1,1)
plot(t,signal2,'b')
xlabel('temps en seconde')
ylabel('Volts')
title('signal chord1')

subplot(3,1,2)
plot(t,puissance_dbm2,'g')
xlabel('temps en seconde')
ylabel('dBm')
title('puissance du signal en dBm')

subplot(3,1,3)
plot(t,testpresabs2,'r')
xlabel('temps en seconde')
ylabel('Présence/absence')
title('test de présence ou d absence')
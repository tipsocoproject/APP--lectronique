% Question 1
% La fréquence d'échantillonnage choisie est 2*2205 = 4410 Hz car on veut
% respecter le critère de Shannon, ie Fe>= 2*fmax.

% Question 2
[x1,Fe1]=audioread('../Signaux/chord1.wav');
Te1 = 1/Fe1;
L1 = length(x1);
t1 = 0:Te1:(L1-1)*Te1;
pas1 = Fe1/(L1-1);
f1 = 0:pas1:Fe1;

X1 = fft(x1);
X1abs = abs(X1);
X1db = 20*log10(X1abs);

fd1 = 2000;  %fréquences fondamentales inférieures à 2.2 KHz
fse1 = 2*fd1; % fréquence sous échantilonné
k1 = floor(Fe1/fse1);

x1dec = decimate(x1,k1);
L1dec = length(x1dec);
pas1dec = fse1/(L1dec-1);
f1dec = 0:pas1dec:fse1;

X1dec = fft(x1dec);
X1decabs = abs(X1dec);
X1decdb = 20*log10(X1decabs);

figure(1)
subplot(3,1,1)
plot(t1,x1)
subplot(3,1,2)
plot(f1,X1db)
subplot(3,1,3)
plot(f1dec,X1decdb)

% Pour un facteur de décimation de 1, on a une bonne res


[x2,Fe2]=audioread('../Signaux/Chord2.wav');
Te2 = 1/Fe2;
L2 = length(x2);
t2 = 0:Te2:(L2-1)*Te2;
pas2 = Fe2/(L2-1);
f2 = 0:pas2:Fe2;

X2 = fft(x2);
X2abs = abs(X2);
X2db = 20*log10(X2abs);

fd2 = 2000;  %fréquences fondamentales inférieures à 2.2 KHz
fse2 = 2*fd2; % fréquence sous échantilonné
k2 = floor(Fe2/fse2);

x2dec = decimate(x2,k2);
L2dec = length(x2dec);
pas2dec = fse2/(L2dec-1);
f2dec = 0:pas2dec:fse2;

X2dec = fft(x2dec);
X2decabs = abs(X2dec);
X2decdb = 20*log10(X2decabs);

figure(2)
subplot(3,1,1)
plot(t2,x2)
subplot(3,1,2)
plot(f2,X2db)
subplot(3,1,3)
plot(f2dec,X2decdb)

% Elle permet de proposer une réduction de la fréquence d'échantillonnage
% optimale afin de réduire l'occupation spectrale du signal. Pour respecter
% le critère de Shannon et déviter les repliements de spectre, on choisit 
% de fixer F à 3*fmax


% Les échantillons étant codé sur 1 octet, cela correspond à 8 bits. Le
% débit noté D est égal à F x b, avec F=Fe/k, k étant le rapport de
% décimation.
% Nous avons donc D2 = D1 = 8*fse1 = 8*4000 = 32 000 bits/s = 32 kbits/s
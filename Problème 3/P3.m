% Question 1
% La fréquence d'échantillonnage choisie est 2*2205 = 4410 Hz car on veut
% respecter le critère de Shannon, ie Fe>= 2*fmax.

% Question 2
[x1,Fe1]=audioread('../Signaux/chord1.wav'); % importation du fichier audio
Te1 = 1/Fe1;                % période d'échantillonnage
L1 = length(x1);            % longueur du signal chord1
t1 = 0:Te1:(L1-1)*Te1;      % intervalle de temps d'étude
pas1 = Fe1/(L1-1);          % pas fréquentiel
f1 = 0:pas1:Fe1;            % intervalle de fréquences d'étude

X1 = fft(x1);               % transformée de Fourier de chord1
X1abs = abs(X1);            % abs de la fft de chord1
X1db = 20*log10(X1abs);     % gain en dB de chord1

fd1 = 2000;  % fréquence fondamentale inférieure à 2.2 KHz
fse1 = 2*fd1; % fréquence sous échantilonné
k1 = floor(Fe1/fse1); % facteur de décimation

x1dec = decimate(x1,k1);    % décimation de chord1
L1dec = length(x1dec);      % longueur de chord1 décimé
pas1dec = fse1/(L1dec-1);   % pas fréquentiel
f1dec = 0:pas1dec:fse1;     % intervalle de fréquences d'étude

X1dec = fft(x1dec);           % transformée de Fourier de chord1 décimé
X1decabs = abs(X1dec);        % abs de la fft de chord1 décimé
X1decdb = 20*log10(X1decabs); % gain en dB de chord1 décimé

% Affichage
figure(1)
subplot(3,1,1)
plot(t1,x1)
subplot(3,1,2)
plot(f1,X1db)
subplot(3,1,3)
plot(f1dec,X1decdb)

% Pour un facteur de décimation de 2, on a donc une bonne restitution des 
% fréquences fondamentales. On observe les pics fondamentaux qui se
% différencient des autres.


[x2,Fe2]=audioread('../Signaux/Chord2.wav'); % importation du fichier audio
Te2 = 1/Fe2;                % période d'échantillonnage
L2 = length(x2);            % longueur du signal chord1
t2 = 0:Te2:(L2-1)*Te2;      % intervalle de temps d'étude
pas2 = Fe2/(L2-1);          % pas fréquentiel
f2 = 0:pas2:Fe2;            % intervalle de fréquences d'étude

X2 = fft(x2);               % transformée de Fourier de chord2
X2abs = abs(X2);            % abs de la fft de chord2
X2db = 20*log10(X2abs);     % gain en dB de chord2

fd2 = 2000;  %fréquences fondamentales inférieures à 2.2 KHz
fse2 = 2*fd2; % fréquence sous échantilonné
k2 = floor(Fe2/fse2);

x2dec = decimate(x2,k2);        % décimation de chord2
L2dec = length(x2dec);          % longueur de chord2 décimé
pas2dec = fse2/(L2dec-1);       % pas fréquentiel
f2dec = 0:pas2dec:fse2;         % intervalle de fréquences d'étude

X2dec = fft(x2dec);             % transformée de Fourier de chord2 décimé
X2decabs = abs(X2dec);          % abs de la fft de chord2 décimé
X2decdb = 20*log10(X2decabs);   % gain en dB de chord2 décimé

% Affichage
figure(2)
subplot(3,1,1)
plot(t2,x2)
subplot(3,1,2)
plot(f2,X2db)
subplot(3,1,3)
plot(f2dec,X2decdb)

% Nous avons un facteur de décimation 4 pour le signal 2.
% On remarque que les pics fondamentaux sont confondus avec ceux des
% harmoniques et ils possèdent les mêmes amplitudes.


% Elle permet de proposer une réduction de la fréquence d'échantillonnage
% optimale afin de réduire l'occupation spectrale du signal. Pour respecter
% le critère de Shannon et déviter les repliements de spectre, on choisit 
% de fixer F à 2*fmax


% Les échantillons étant codé sur 1 octet, cela correspond à 8 bits. Le
% débit noté D est égal à F x b, avec F=Fe/k, k étant le rapport de
% décimation.
% Nous avons donc D2 = D1 = 8*fse1 = 8*4000 = 32 000 bits/s = 32 kbits/s
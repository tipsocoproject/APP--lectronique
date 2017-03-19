%Problème 4

% Fichier audio chord_LA_FA.wav
[xe1,Fe1]=audioread('../Signaux/chord_LA_FA.wav'); % importation du fichier

Te1 = 1/Fe1;                % période d'échantillonnage
Le1 = length(xe1);          % longueur du signal source
te1 = 0:Te1:(Le1-1)*Te1;    % intervalle de temps d'étude
pas1 = Fe1/(Le1-1);         % pas fréquentiel du signal source
f1 = 0:pas1:Fe1;            % intervalle de fréquences du signal source

% FA medium 349 Hz et LA medium 440 Hz
fd1 = 450;                  % fréquence fondamentale inférieure à 450 Hz
fse1 = 2*fd1;               % fréquence sous échantillonné
k1 = floor(Fe1/fse1);       % facteur de décimation

xedec1 = decimate(xe1,k1);  % signal sous échantillonné
Ledec1 = length(xedec1);    % longueur du signal décimé
pasdec1 = fse1/(Ledec1-1);  % pas fréquentiel du signal décimé   
fdec1 = 0:pasdec1:fse1;     % intervalle de fréquences du signal décimé
tdec1 = 0:pasdec1:fse1;

% Transformee de Fourier du signal durant les 150 premières ms
Xdec150 = fft(xedec1(1:0.5*fse1),Ledec1);
% valeur absolue de la transformée de Fourier du signal
Xdec150abs = abs(Xdec150);
% Puissance seuil bruit
Pseuil = max(Xdec150abs);

test = zeros(1,Ledec1);

K = 10;

for n = 1+K:Ledec1-K
    Xedecfen = xedec1(n-K:n+K);
    Xedec1 = fft(Xedecfen);     %transformée de Fourier de xe fenêtre
    Xedec1abs = abs(Xedec1);
    
    %test puissance
    if Xedec1abs<=Pseuil   %absent
        test(n-K)=0;
    else test(n-K)=1;   %présent
    end 
end

% Test de puissance / présence satisfaisant
if max(test)==1
    
end


figure(1)
subplot(2,1,1)
plot(te1,xe1)
xlabel('temps en seconde')
ylabel('Volts')
title('Signal source')

subplot(2,1,2)
plot(fdec1,xedec1,'b',fdec1,test,'r')
xlabel('fréquence en Hz')
ylabel('Gains en dB')
title('Transformée de Fourier du Signal décimé')

% Fichier audio 349.wav
[xe2,Fe2]=audioread('../Signaux/349.wav');   % importation du fichier


% Fichier audio 440.wav
[xe3,Fe3]=audioread('../Signaux/440.wav');   % importation du fichier
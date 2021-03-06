% Probl�me 4
% Fichier 440.wav et 349.wav
% Fichier audio chord_LA_FA.wav
[xe1,Fe1]=audioread('../Signaux/chord_LA_FA.wav'); % importation du fichier

Te1 = 1/Fe1;                % p�riode d'�chantillonnage
Le1 = length(xe1);          % longueur du signal source
te1 = 0:Te1:(Le1-1)*Te1;    % intervalle de temps d'�tude
pas1 = Fe1/(Le1-1);         % pas fr�quentiel du signal source
f1 = 0:pas1:Fe1;            % intervalle de fr�quences du signal source


% FA medium 349 Hz et LA medium 440 Hz
fd1 = 450;                  % fr�quence fondamentale inf�rieure � 450 Hz
fse1 = 2*fd1;               % fr�quence sous �chantillonn�
k1 = floor(Fe1/fse1);       % facteur de d�cimation


xedec1 = decimate(xe1,k1);  % signal sous �chantillonn�
Tdec1 = 1/fse1;             % p�riode de sous �chantillonnage
Ledec1 = length(xedec1);    % longueur du signal d�cim�
pasdec1 = fse1/(Ledec1-1);  % pas fr�quentiel du signal d�cim�   
fdec1 = 0:pasdec1:fse1;     % intervalle de fr�quences du signal d�cim�
tdec1 = 0:Tdec1:(Ledec1-1)*Tdec1;% intervalle de temps d'�tude du signal d�cim�


% Transformee de Fourier du signal durant les 500 premi�res ms
% Prendre 2s pour 349.wav et 440.wav
Xdec150 = fft(xedec1(1:0.5*fse1),Ledec1);
% valeur absolue de la transform�e de Fourier du signal
Xdec150abs = abs(Xdec150);
% Puissance seuil bruit
Pseuil1 = max(Xdec150abs);

test = zeros(1,Ledec1);

K = 10;

for n = 1+K:Ledec1-K
    Xedecfen = xedec1(n-K:n+K);
    Xedec1 = fft(Xedecfen);     %transform�e de Fourier de xe fen�tre
    Xedec1abs = abs(Xedec1);
    
    %test puissance
    if Xedec1abs<=Pseuil1   %absent
        test(n-K)=0;
    else test(n-K)=1;   %pr�sent
    end 
end



% filtrage du 349 Hz
load 'filtre349.mat';

xedec1filtre349 = zeros(1,Ledec1);
test349 = zeros(1,Ledec1);

% Test de puissance / pr�sence satisfaisant
for n=1+K:Ledec1-K
    if max(test)==1
        xedec1filtre349(n-K:n+K) = filter(F349,1,xedec1(n-K:n+K));
    else
        xedec1filtre349(n-K:n+K) = 0;
    end
end

% Transformee de Fourier du signal durant les 500 premi�res ms
% Prendre 2s pour 349.wav et 440.wav
xedec1filtre349bruit = fft(xedec1filtre349(1:0.5*fse1),Ledec1);
xedec1filtre349bruitabs = abs(xedec1filtre349bruit);
Pseuil2 = max(xedec1filtre349bruitabs);

for n=1+K:Ledec1-K
    xedec1filtre349fen = xedec1filtre349(n-K:n+K);
    Xedec1filtre349fen = fft(xedec1filtre349fen);
    Xedec1filtre349fenabs = abs(Xedec1filtre349fen);
    
    if Xedec1filtre349fenabs <= Pseuil2
        test349(n-K)=0;
    else test349(n-K)=1;
    end
end

% Filtrage du 440 Hz
load 'filtre440.mat';

xedec1filtre440 = zeros(1,Ledec1);
test440 = zeros(1,Ledec1);

% Test de puissance / pr�sence satisfaisant
for n=1+K:Ledec1-K
    if max(test)==1
        xedec1filtre440(n-K:n+K) = filter(F440,1,xedec1(n-K:n+K));
    else
        xedec1filtre440(n-K:n+K) = 0;
    end
end

% Transformee de Fourier du signal durant les 500 premi�res ms
% Prendre 2s pour 349.wav et 440.wav
xedec1filtre440bruit = fft(xedec1filtre440(1:0.5*fse1),Ledec1);
xedec1filtre440bruitabs = abs(xedec1filtre440bruit);
Pseuil3 = max(xedec1filtre440bruitabs);

for n=1+K:Ledec1-K
    xedec1filtre440fen = xedec1filtre440(n-K:n+K);
    Xedec1filtre440fen = fft(xedec1filtre440fen);
    Xedec1filtre440fenabs = abs(Xedec1filtre440fen);
    
    if Xedec1filtre440fenabs <= Pseuil3
        test440(n-K)=0;
    else test440(n-K)=1;
    end
end


% test si LA et FA sont simultan�ment d�tect�
testfinal = zeros(1,Ledec1);

for n=1:length(xedec1filtre349)
    if test349(n)==1 && test440(n)==1
        testfinal(n)=1;
    else testfinal(n)=0;
    end
end


% Affichage
figure(1)
subplot(3,1,1)
plot(te1,xe1)
xlabel('temps en seconde')
ylabel('Volts')
title('Signal source')

subplot(3,1,2)
plot(tdec1,xedec1)
xlabel('fr�quence en Hz')
ylabel('Gains en dB')
title('Signal d�cim�')

subplot(3,1,3)
plot(tdec1,testfinal)
xlabel('temps en seconde')
ylabel('Pr�sence/absence')
title('test pr�sence LA/FA')

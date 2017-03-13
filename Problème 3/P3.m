% Question 1
% La fr�quence d'�chantillonnage choisie est 2*2205 = 4410 Hz car on veut
% respecter le crit�re de Shannon, ie Fe>= 2*fmax.

% Question 2
[x1,Fe1]=audioread('../Signaux/chord1.wav'); % importation du fichier audio
Te1 = 1/Fe1;                % p�riode d'�chantillonnage
L1 = length(x1);            % longueur du signal chord1
t1 = 0:Te1:(L1-1)*Te1;      % intervalle de temps d'�tude
pas1 = Fe1/(L1-1);          % pas fr�quentiel
f1 = 0:pas1:Fe1;            % intervalle de fr�quences d'�tude

X1 = fft(x1);               % transform�e de Fourier de chord1
X1abs = abs(X1);            % abs de la fft de chord1
X1db = 20*log10(X1abs);     % gain en dB de chord1

fd1 = 2000;  % fr�quence fondamentale inf�rieure � 2.2 KHz
fse1 = 2*fd1; % fr�quence sous �chantilonn�
k1 = floor(Fe1/fse1); % facteur de d�cimation

x1dec = decimate(x1,k1);    % d�cimation de chord1
L1dec = length(x1dec);      % longueur de chord1 d�cim�
pas1dec = fse1/(L1dec-1);   % pas fr�quentiel
f1dec = 0:pas1dec:fse1;     % intervalle de fr�quences d'�tude

X1dec = fft(x1dec);           % transform�e de Fourier de chord1 d�cim�
X1decabs = abs(X1dec);        % abs de la fft de chord1 d�cim�
X1decdb = 20*log10(X1decabs); % gain en dB de chord1 d�cim�

% Affichage
figure(1)
subplot(3,1,1)
plot(t1,x1)
subplot(3,1,2)
plot(f1,X1db)
subplot(3,1,3)
plot(f1dec,X1decdb)

% Pour un facteur de d�cimation de 2, on a donc une bonne restitution des 
% fr�quences fondamentales. On observe les pics fondamentaux qui se
% diff�rencient des autres.


[x2,Fe2]=audioread('../Signaux/Chord2.wav'); % importation du fichier audio
Te2 = 1/Fe2;                % p�riode d'�chantillonnage
L2 = length(x2);            % longueur du signal chord1
t2 = 0:Te2:(L2-1)*Te2;      % intervalle de temps d'�tude
pas2 = Fe2/(L2-1);          % pas fr�quentiel
f2 = 0:pas2:Fe2;            % intervalle de fr�quences d'�tude

X2 = fft(x2);               % transform�e de Fourier de chord2
X2abs = abs(X2);            % abs de la fft de chord2
X2db = 20*log10(X2abs);     % gain en dB de chord2

fd2 = 2000;  %fr�quences fondamentales inf�rieures � 2.2 KHz
fse2 = 2*fd2; % fr�quence sous �chantilonn�
k2 = floor(Fe2/fse2);

x2dec = decimate(x2,k2);        % d�cimation de chord2
L2dec = length(x2dec);          % longueur de chord2 d�cim�
pas2dec = fse2/(L2dec-1);       % pas fr�quentiel
f2dec = 0:pas2dec:fse2;         % intervalle de fr�quences d'�tude

X2dec = fft(x2dec);             % transform�e de Fourier de chord2 d�cim�
X2decabs = abs(X2dec);          % abs de la fft de chord2 d�cim�
X2decdb = 20*log10(X2decabs);   % gain en dB de chord2 d�cim�

% Affichage
figure(2)
subplot(3,1,1)
plot(t2,x2)
subplot(3,1,2)
plot(f2,X2db)
subplot(3,1,3)
plot(f2dec,X2decdb)

% Nous avons un facteur de d�cimation 4 pour le signal 2.
% On remarque que les pics fondamentaux sont confondus avec ceux des
% harmoniques et ils poss�dent les m�mes amplitudes.


% Elle permet de proposer une r�duction de la fr�quence d'�chantillonnage
% optimale afin de r�duire l'occupation spectrale du signal. Pour respecter
% le crit�re de Shannon et d�viter les repliements de spectre, on choisit 
% de fixer F � 2*fmax


% Les �chantillons �tant cod� sur 1 octet, cela correspond � 8 bits. Le
% d�bit not� D est �gal � F x b, avec F=Fe/k, k �tant le rapport de
% d�cimation.
% Nous avons donc D2 = D1 = 8*fse1 = 8*4000 = 32 000 bits/s = 32 kbits/s
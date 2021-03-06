% Question B
load 'filtre1.mat';

[x,Fe]=audioread('../Signaux/3notesPiano.wav'); % lecture du fichier audio
L = length(x);          % longueur du signal
Te = 1/Fe;              % p�riode d'�chantillonnage
pas = Fe/(L-1);         % pas d'�chantillonnage
f = 0:pas:Fe;           % fr�quences d'�tude
t = 0:Te:(L-1)*Te;      % dur�e d'�chantillonnage


signalfiltre = filter(h,1,x);% application du filtre passe-bande


signalfiltrefft = fft(signalfiltre);      % fft du signal filtr�
signalfiltrefftabs = abs(signalfiltrefft);  % abs de la fft du signal filtr�
signalfiltredb = 20*log10(signalfiltrefftabs);  % module de la fft

% affichage
figure(1)
subplot(3,1,1)
plot(t,x) % signal source
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal source 3notespiano')
subplot(3,1,2)
plot(t,signalfiltre) % signal filtr�
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal filtr�')
subplot(3,1,3)
plot(f,signalfiltredb) % signal filtr� en dB
xlabel('fr�quences (Hz)')
ylabel('gains (dB)')
title('module de la fft du Signal filtr�')



% Question C
% audio accords
[x1,Fe1]=audioread('../Signaux/accords.wav'); % lecture du fichier
L1 = length(x1);        % longueur du signal
Te1 = 1/Fe1;            % p�riode d'�chantillonnage
pas1 = Fe1/(L1-1);      % pas d'�chantillonnage
f1 = 0:pas1:Fe1;        % fr�quences d'�tude
t1 = 0:Te1:(L1-1)*Te1;  % dur�e d'�chantillonnage

signalfiltre1 = filter(h,1,x1); % application du filtre passe-bande

signalfiltrefft1 = fft(signalfiltre1);  % fft du signal filtr�
signalfiltrefftabs1 = abs(signalfiltrefft1); % abs de la fft 
signalfiltredb1 = 20*log10(signalfiltrefftabs1);  % module de la fft

% affichage
figure(2)
subplot(3,1,1)
plot(t1,x1) % signal source
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal source accords')
subplot(3,1,2)
plot(t1,signalfiltre1) % signal filtr�
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal filtr�')
subplot(3,1,3)
plot(f1,signalfiltredb1) % signal filtr� en dB
xlabel('fr�quences (Hz)')
ylabel('gains (dB)')
title('module de la fft du Signal filtr�')



% audio 8accords
[x2,Fe2]=audioread('../Signaux/8accords.wav '); % lecture du fichier audio
L2 = length(x2);         % longueur du signal
Te2 = 1/Fe2;             % p�riode d'�chantillonnage
pas2 = Fe2/(L2-1);       % pas d'�chantillonnage
f2 = 0:pas2:Fe2;         % fr�quences d'�tude
t2 = 0:Te2:(L2-1)*Te2;   % dur�e d'�chantillonnage

signalfiltre2 = filter(h,1,x2); % application du filtre passe-bande

signalfiltrefft2 = fft(signalfiltre2);  % fft du signal filtr�
signalfiltrefftabs2 = abs(signalfiltrefft2); % abs de la fft 
signalfiltredb2 = 20*log10(signalfiltrefftabs2); % module de la fft en dB

% affichage
figure(3)
subplot(3,1,1)
plot(t2,x2) % signal source
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal source 8accords')
subplot(3,1,2)
plot(t2,signalfiltre2) % signal filtr�
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal filtr�')
subplot(3,1,3)
plot(f2,signalfiltredb2) % signal filtr� en dB
xlabel('fr�quences (Hz)')
ylabel('gains (dB)')
title('module de la fft du Signal filtr�')


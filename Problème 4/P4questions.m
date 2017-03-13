% Question B
load 'filtre1.mat';

[x,Fe]=audioread('../Signaux/3notesPiano.wav');
L = length(x);
Te = 1/Fe;
pas = Fe/(L-1);
f = 0:pas:Fe;
t = 0:Te:(L-1)*Te;

signalfiltre = filter(h,1,x);

signalfiltrefft = fft(signalfiltre);
signalfiltrefftabs = abs(signalfiltrefft);
signalfiltredb = 20*log10(signalfiltrefftabs);

figure(1)
subplot(3,1,1)
plot(t,x)
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal source 3notespiano')
subplot(3,1,2)
plot(t,signalfiltre)
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal filtré')
subplot(3,1,3)
plot(f,signalfiltredb)
xlabel('fréquences (Hz)')
ylabel('gains (dB)')
title('module de la fft du Signal filtré')


% Question C
% audio accords
[x1,Fe1]=audioread('../Signaux/accords.wav');
L1 = length(x1);
Te1 = 1/Fe1;
pas1 = Fe1/(L1-1);
f1 = 0:pas1:Fe1;
t1 = 0:Te1:(L1-1)*Te1;

signalfiltre1 = filter(h,1,x1);

signalfiltrefft1 = fft(signalfiltre1);
signalfiltrefftabs1 = abs(signalfiltrefft1);
signalfiltredb1 = 20*log10(signalfiltrefftabs1);

figure(2)
subplot(3,1,1)
plot(t1,x1)
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal source accords')
subplot(3,1,2)
plot(t1,signalfiltre1)
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal filtré')
subplot(3,1,3)
plot(f1,signalfiltredb1)
xlabel('fréquences (Hz)')
ylabel('gains (dB)')
title('module de la fft du Signal filtré')

% audio 8accords
[x2,Fe2]=audioread('../Signaux/8accords.wav ');
L2 = length(x2);
Te2 = 1/Fe2;
pas2 = Fe2/(L2-1);
f2 = 0:pas2:Fe2;
t2 = 0:Te2:(L2-1)*Te2;

signalfiltre2 = filter(h,1,x2);

signalfiltrefft2 = fft(signalfiltre2);
signalfiltrefftabs2 = abs(signalfiltrefft2);
signalfiltredb2 = 20*log10(signalfiltrefftabs2);

figure(3)
subplot(3,1,1)
plot(t2,x2)
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal source 8accords')
subplot(3,1,2)
plot(t2,signalfiltre2)
xlabel('temps en secondes')
ylabel('amplitudes en volts')
title('Signal filtré')
subplot(3,1,3)
plot(f2,signalfiltredb2)
xlabel('fréquences (Hz)')
ylabel('gains (dB)')
title('module de la fft du Signal filtré')


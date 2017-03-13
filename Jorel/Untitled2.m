[x,Fe] = audioread('bonjour.wav');
% sound(x);
N = length(x);
Te = 1/Fe;
f = 0:Fe/(N-1):Fe;
X = fft(x);
XdB = 20*log10(abs(X));
figure
plot(f,XdB);
% Occupation spectrale de 6000 Hz
y = decimate(x,7);
M = length(y);
t = 0:Te:(M-1)*Te;
f1 = 0:Fe/(M-1):Fe;
Y = fft(y);
YdB = 20*log10(abs(Y));
figure
plot(t,y)
figure
plot(f1,YdB)
sound(y);

%P = x.^2;
%b = 16;
% b1 = 8;
% q = 2^b;
% q1 = 2^b1;
% D = Fe*b;
% D1 = Fe*b1;
% SNR = 10*log10(P)-10*log10(q^2/12);
% SNR1 = 10*log10(P)-10*log10(q^2/12);

% figure
% plot(b,SNR)
% figure
% plot(b1,SNR1)
% 
% figure
% plot(D,SNR)

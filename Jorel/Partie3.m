A = 1;                      % Amplitude du signal
F0 = 440;                   % Frequence du fondamental
Fe = 8000;                  % Frequence d'echantillonnage
Te = 1/Fe;                  % Periode d'echantillonnage
t = 0:Te:0.1;               % Temps d'étude
x = A*sin(2*pi*F0*t);       % Signal etudie

figure
plot(t,x)
xlabel('Temps (s)')
ylabel('Volt (V)')
title('Signal')
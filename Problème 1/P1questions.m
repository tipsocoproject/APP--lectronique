clear all
clc

%Données du signal
Fe = 16000;            %fq d'échantillonnage
A = 2;                 %amplitude en Volt
F0 = 1000;             %fq du signal en Hz
T0 = 1/F0;             %période du signal
P = 5;                 %nb de périodes
S = 5*T0;              %5 fois la période
Te = 1/Fe;             %le pas d'échantillonnage
t = 0:Te:S;            %intervalle de temps avec 1/Fe le pas d'échantillonnage


Y1 = A*sin(2*pi*F0*t); %signal continu

%QUESTION A
figure(1)
plot(t,Y1);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');


%QUESTION C partie 1
n = Fe/F0;             %nb d'échantillons sur une période du signal
syms k;                %déclarer la variable k
C = 1/((n+1)-1);         %facteur dans l'approximation de Riemann

Y2 = A*sin(2*pi*F0*k*Te); %Signal sinusoïdal discret

%Calcul valeur moyenne
ValMoyY2 = C*symsum(Y2, k, 1, n) %valeur moyenne estimée du signal Y2 sur 1 période

%Calcul énergetique moyenne
EY2 = Te*symsum((Y2.^2), k, 1, n) %Energie estimée du signal Y2 sur 1 periode

%Calcul puissance moyenne
PowerY2 = C*symsum((Y2.^2), k, 1, n) %Puissance moyenne estimée du signal Y2 sur 1 période


%Question C partie 2
Fe1 = 20000;                %nouvelle fréquence d'échantillonnage
Te1 = 1/Fe1;                %nouveau pas d'échantillonnage
n1 = Fe1/F0;                %nb d'échantillons sur une période du signal
Y3 = A*sin(2*pi*F0*k*Te1);  %Signal sinusoïdal discret

%Calcul valeur moyenne
ValMoyY3 = C*symsum(Y3, k, 1, n)     %valeur moyenne estimée du signal Y3 sur une période

%Calcul énergetique moyenne
EY3 = Te*symsum((Y3)^2, k, 1, n1)    %Energie estimée du signal Y3 sur 1 periode

%Calcul puissance moyenne
PowerY3 = C*symsum((Y3)^2, k, 1, n1) %Puissance moyenne estimée du signal Y3 sur une période

%Malgré une augmentation de la fréquence d'échantillonnage, la valeur moyenne et la puissance
%moyenne du signal restent globalement les mêmes



%Question D partie 1 : fonction max
%Affichage
figure(2)
Y1t=max(Y1,0);
plot(t,Y1t);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');

%Calcul valeur moyenne

ValMoyY1t = C*symsum(Y1t, k, 1, n);  %valeur moyenne estinée du signal Y1t à chaque k
ResultValMoyY1t = mean(ValMoyY1t)    %valeur moyenne estimée du signal Y1t sur une période

%Calcul énergetique moyenne
Y1tbis = Y1t.*Y1t;                    %Y1t au carré
EY1t = Te*symsum(Y1tbis, k, 1, n);    %Energie estimée du signal Y1t à chaque k
ResultEY1t = mean(EY1t)                 %Energie estimée du signal Y1t sur 1 periode

%Calcul puissance moyenne
PowerY1t = C*symsum(Y1tbis, k, 1, n); %Puissance moyenne estimée du signal Y1t à chaque k
ResultPowerY1t = mean(PowerY1t)       %Puissance moyenne estimée du signal Y1t sur une période




%Question D partie 2 : fonction abs
%Affichage
figure(3)
Y4 = abs(Y1);
plot(t,Y4);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');

%Calcul valeur moyenne
ValMoyY4 = C*symsum(Y4, k, 1, n);    %valeur moyenne estimée du signal Y4 à chaque k
ResultValMoyY4 = mean(ValMoyY4)      %valeur moyenne estimée du signal Y4 sur une période

%Calcul énergetique moyenne
Y4bis = Y4.*Y4;                     %Y4 au carré
EY4 = Te*symsum(Y4bis, k, 1, n);    %Energie estimée du signal Y4 à chaque k
ResultEY4 = mean(EY4)               %Energie estimée du signal Y4 sur 1 periode

%Calcul puissance moyenne
PowerY4 = C*symsum(Y4bis, k, 1, n); %Puissance moyenne estimée du signal Y4 à chaque k
ResultPowerY4 = mean(PowerY4)       %Puissance moyenne estimée du signal Y4 sur une période


%Question D partie 3 : fonction square
%Affichage
figure(4)
Y5t = 2*square(2*pi*F0*t);
Y5 = max(Y5t,0.5);
plot(t,Y5);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');

%Calcul valeur moyenne
ValMoyY5 = C*symsum(Y5, k, 0, n);    %valeur moyenne estimée du signal Y5 à chaque k
ResultValMoyY5 = mean(ValMoyY5)      %valeur moyenne estimée du signal Y5 sur une période

%Calcul énergetique moyenne
Y5bis = Y5.*Y5;                     %Y5 au carré
EY5 = Te*symsum(Y5bis, k, 0, n);    %Energie estimée du signal Y5 à chaque k 
ResultEY5 = mean(EY5)               %Energie estimée du signal Y5 sur 1 periode

%Calcul puissance moyenne
PowerY5 = C*symsum(Y5bis, k, 0, n); %Puissance moyenne estimée du signal Y5 à chaque k
ResultPowerY5 = mean(PowerY5)       %Puissance moyenne estimée du signal Y5 sur une période



clear all
clc

%Donn�es du signal
Fe = 16000;            %fq d'�chantillonnage
A = 2;                 %amplitude en Volt
F0 = 1000;             %fq du signal en Hz
T0 = 1/F0;             %p�riode du signal
P = 5;                 %nb de p�riodes
S = 5*T0;              %5 fois la p�riode
Te = 1/Fe;             %le pas d'�chantillonnage
t = 0:Te:S;            %intervalle de temps avec 1/Fe le pas d'�chantillonnage


Y1 = A*sin(2*pi*F0*t); %signal continu

%QUESTION A
figure(1)
plot(t,Y1);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');


%QUESTION C partie 1
n = Fe/F0;             %nb d'�chantillons sur une p�riode du signal
syms k;                %d�clarer la variable k
C = 1/((n+1)-1);         %facteur dans l'approximation de Riemann

Y2 = A*sin(2*pi*F0*k*Te); %Signal sinuso�dal discret

%Calcul valeur moyenne
ValMoyY2 = C*symsum(Y2, k, 1, n) %valeur moyenne estim�e du signal Y2 sur 1 p�riode

%Calcul �nergetique moyenne
EY2 = Te*symsum((Y2.^2), k, 1, n) %Energie estim�e du signal Y2 sur 1 periode

%Calcul puissance moyenne
PowerY2 = C*symsum((Y2.^2), k, 1, n) %Puissance moyenne estim�e du signal Y2 sur 1 p�riode


%Question C partie 2
Fe1 = 20000;                %nouvelle fr�quence d'�chantillonnage
Te1 = 1/Fe1;                %nouveau pas d'�chantillonnage
n1 = Fe1/F0;                %nb d'�chantillons sur une p�riode du signal
Y3 = A*sin(2*pi*F0*k*Te1);  %Signal sinuso�dal discret

%Calcul valeur moyenne
ValMoyY3 = C*symsum(Y3, k, 1, n)     %valeur moyenne estim�e du signal Y3 sur une p�riode

%Calcul �nergetique moyenne
EY3 = Te*symsum((Y3)^2, k, 1, n1)    %Energie estim�e du signal Y3 sur 1 periode

%Calcul puissance moyenne
PowerY3 = C*symsum((Y3)^2, k, 1, n1) %Puissance moyenne estim�e du signal Y3 sur une p�riode

%Malgr� une augmentation de la fr�quence d'�chantillonnage, la valeur moyenne et la puissance
%moyenne du signal restent globalement les m�mes



%Question D partie 1 : fonction max
%Affichage
figure(2)
Y1t=max(Y1,0);
plot(t,Y1t);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');

%Calcul valeur moyenne

ValMoyY1t = C*symsum(Y1t, k, 1, n);  %valeur moyenne estin�e du signal Y1t � chaque k
ResultValMoyY1t = mean(ValMoyY1t)    %valeur moyenne estim�e du signal Y1t sur une p�riode

%Calcul �nergetique moyenne
Y1tbis = Y1t.*Y1t;                    %Y1t au carr�
EY1t = Te*symsum(Y1tbis, k, 1, n);    %Energie estim�e du signal Y1t � chaque k
ResultEY1t = mean(EY1t)                 %Energie estim�e du signal Y1t sur 1 periode

%Calcul puissance moyenne
PowerY1t = C*symsum(Y1tbis, k, 1, n); %Puissance moyenne estim�e du signal Y1t � chaque k
ResultPowerY1t = mean(PowerY1t)       %Puissance moyenne estim�e du signal Y1t sur une p�riode




%Question D partie 2 : fonction abs
%Affichage
figure(3)
Y4 = abs(Y1);
plot(t,Y4);
xlabel('seconds');
ylabel('Volts');
title('Signal in the domain - 5 periods');

%Calcul valeur moyenne
ValMoyY4 = C*symsum(Y4, k, 1, n);    %valeur moyenne estim�e du signal Y4 � chaque k
ResultValMoyY4 = mean(ValMoyY4)      %valeur moyenne estim�e du signal Y4 sur une p�riode

%Calcul �nergetique moyenne
Y4bis = Y4.*Y4;                     %Y4 au carr�
EY4 = Te*symsum(Y4bis, k, 1, n);    %Energie estim�e du signal Y4 � chaque k
ResultEY4 = mean(EY4)               %Energie estim�e du signal Y4 sur 1 periode

%Calcul puissance moyenne
PowerY4 = C*symsum(Y4bis, k, 1, n); %Puissance moyenne estim�e du signal Y4 � chaque k
ResultPowerY4 = mean(PowerY4)       %Puissance moyenne estim�e du signal Y4 sur une p�riode


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
ValMoyY5 = C*symsum(Y5, k, 0, n);    %valeur moyenne estim�e du signal Y5 � chaque k
ResultValMoyY5 = mean(ValMoyY5)      %valeur moyenne estim�e du signal Y5 sur une p�riode

%Calcul �nergetique moyenne
Y5bis = Y5.*Y5;                     %Y5 au carr�
EY5 = Te*symsum(Y5bis, k, 0, n);    %Energie estim�e du signal Y5 � chaque k 
ResultEY5 = mean(EY5)               %Energie estim�e du signal Y5 sur 1 periode

%Calcul puissance moyenne
PowerY5 = C*symsum(Y5bis, k, 0, n); %Puissance moyenne estim�e du signal Y5 � chaque k
ResultPowerY5 = mean(PowerY5)       %Puissance moyenne estim�e du signal Y5 sur une p�riode



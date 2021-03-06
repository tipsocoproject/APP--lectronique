% Probleme 2
% Algorithme de detection des notes


% Lecture du fichier audio et stockage de la frequence d'echantillonnage
% et de l'amplitude du signal en chaque echantillon
[x,Fe] = audioread('../Signaux/2notes.wav');

Te = 1/Fe;                          % Periode d'echantillonnage
N = length(x);                      % Nombre d'echantillons

t = 0:Te:(N-1)*Te;                  % Vecteur de temps


% Transformee de Fourier du signal
X = fft(x(1:0.15*Fe),N);
Xabs = abs(X);      %valeur absolue de la transform�e de Fourier du signal
Pseuil = max(Xabs); %Puissance seuil bruit

K=1000;             %fen�tre glissante

testpresabs = zeros(1,N); %on cr�e un vecteur � une ligne et N colonnes

for n = 1+K:1:N-K
    xfen = x(n-K:n+K);
    X1 = fft(xfen);     %transform�e de Fourier de x fen�tre
    X1abs = abs(X1);
    
    %test de la pr�sence du signal
    if X1abs<=Pseuil      %absent
        testpresabs(n-K)=0;
    else
        testpresabs(n-K)=1;%pr�sent
    end
end

debut = [];
fin = [];
compteur = 0;

%boucle permettant de trouver le d�but et la fin de chaque bloc
for n=1:N-1
    diff=testpresabs(n+1)-testpresabs(n);
    if diff==1 %d�but du bloc
        compteur=compteur+1;
        debut(compteur)=n;
    elseif diff==-1 %fin du bloc
        fin(compteur)=n;
    end
    
end

%A la fin du premier bloc, nous avons plusieurs d�buts et fins qui viennent
%ajouter au compteur, ce qui fausse les r�sultats et cr�ant une incoh�rence
%au niveau de la longueur des matrices

%c'est pourquoi,nous avons choisi de les fixer manuellement

debut = [27571,106217];
fin = [67418,156846];

D=0.03; %temps d'�chantilonnage qu'on le fixe � 30 ms
%on prendra soin de travailler sur des signaux de longueurs des puissances de 2
Nfft = 2048;
f=(0:Nfft-1)*Fe/Nfft;           %intervalle de fr�quence

for i=1:length(debut)
    Afen = x(debut(i):fin(i));  %fen�tre glissante du signal
    n1=D*Fe;                    %nb d'�chantillons
    L(i)=floor(length(Afen)/n1);
    
    for j=1:L(i)
        z=Afen((j-1)*n1+1:j*n1); %extraction du signal pour chaque fen�tre glissante
        zfft=fft(z,Nfft);        %transform�e de Fourier de chaque bloc du signal
        [a(i,j),b(i,j)]=max(zfft(1:Nfft/2));
        F(i,j)=b(i,j)*Fe/Nfft;
    end
    list_freq(i)=mean(F(i,:));
end

%Affichage des d�ff�rentes fr�quences
disp ('la liste des fr�quences du signal :');
list_freq;

%Affichage du signal
figure(1)
subplot(2,1,1)
plot(t,x,'b')
xlabel('temps en seconde')
ylabel('Volts')
title('signal 2note')

%Affichage de la pr�sence ou non du signal
subplot(2,1,2)
plot(t,testpresabs,'r')
axis([0 4 -0.5 1.5]);
xlabel('temps en seconde')
ylabel('Pr�sence/absence')
title('test de pr�sence ou d absence')
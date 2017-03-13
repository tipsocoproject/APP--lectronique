%Question B

F0=440;
A=1;
fe1=8000;
Te1=1/fe1;
duree = 0.1;
t=0 :Te1:duree;
s1 = A*sin(2*pi*F0*t);
N=length(s1);
M=2^11;
ff1=fft(s1,M); %transformée de fourier de s1
f= 0: fe1/M : fe1;

figure
plot(t,s1)
xlabel('temps');
ylabel('signal s1');
title('Signal s1');


x1=20*log10(abs(ff1));

xlabel('fréquence');
ylabel('signal ff1');
title('transformée de fourier de s1');


%Question C

fe2=500;
Te2=1/fe2;
t2= 0 : Te2 : duree;
s2= A*sin(2*pi*F0*t2);
ff2=fft(s2,M);

xlabel('temps');
ylabel('signal s2');

title('Signal s2');

x2=20*log10(abs(ff2));

xlabel('fréquence');
ylabel('signal ff2');
title('transformée de fourrier de s2');

%Question D

figure(1)
hold on
plot(t2,s2,'mo')
xlabel('temps');
ylabel('signal s1 et s2');
title('Signaux s1 et s2');

%Le signal n'est pas assez échantilloné
%Il faudrait un signal s3 de fréquence environ égale f3=F0/7

%Question E 

% Si l'on déséchantillonne à la fréquence fe2/2, on retrouverait un signal 
% non lissé et pas fidèle au signal s2 initial.
% Le signal n'est pas correctement reconstitué. 
% Pour cause, la fréquence d'échantillonage fe2=0,5 KHz ne respecte pas le
% critère de Shannon. 

%Question F
% Le théorème de Shannon permet d'échantillonné correctement un signal. 
%On sélectionne toutes les valeurs du signal à une fréquence au moins 2 
%fois supérieure à la fréquence maximum de ce signal.  


%Qestion L









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
ff1=fft(s1,M); %transform�e de fourier de s1
f= 0: fe1/M : fe1;

figure
plot(t,s1)
xlabel('temps');
ylabel('signal s1');
title('Signal s1');


x1=20*log10(abs(ff1));

xlabel('fr�quence');
ylabel('signal ff1');
title('transform�e de fourier de s1');


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

xlabel('fr�quence');
ylabel('signal ff2');
title('transform�e de fourrier de s2');

%Question D

figure(1)
hold on
plot(t2,s2,'mo')
xlabel('temps');
ylabel('signal s1 et s2');
title('Signaux s1 et s2');

%Le signal n'est pas assez �chantillon�
%Il faudrait un signal s3 de fr�quence environ �gale f3=F0/7

%Question E 

% Si l'on d�s�chantillonne � la fr�quence fe2/2, on retrouverait un signal 
% non liss� et pas fid�le au signal s2 initial.
% Le signal n'est pas correctement reconstitu�. 
% Pour cause, la fr�quence d'�chantillonage fe2=0,5 KHz ne respecte pas le
% crit�re de Shannon. 

%Question F
% Le th�or�me de Shannon permet d'�chantillonn� correctement un signal. 
%On s�lectionne toutes les valeurs du signal � une fr�quence au moins 2 
%fois sup�rieure � la fr�quence maximum de ce signal.  


%Qestion L









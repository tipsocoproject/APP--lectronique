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

%figure
%plot(f,x1)
xlabel('fréquence');
ylabel('signal ff1');
title('transformée de fourier de s1');


%Question C

fe2=500;
Te2=1/fe2;
t2= 0 : Te2 : duree;
s2= A*sin(2*pi*F0*t2);
ff2=fft(s2,M);

%figure
%plot(t,s2)
xlabel('temps');
ylabel('signal s2');

title('Signal s2');

x2=20*log10(abs(ff2));

%figure
%plot(f,x2)
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
%Il faudrait un signal s3 de fréquence environ égale f3=f1/7

%Question E 


%Question F











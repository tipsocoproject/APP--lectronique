clear all
clc

[y,Fe]=audioread('../Signaux/2notes.wav');
N=length(y);
Te=1/Fe;
duree=N*Te;

diviseur =300;
fen = duree/diviseur;

N=length(y);
absc=(1/Fe:1/Fe:N/Fe);

Y = 20*log10(abs(fft(y)));

list_freq = [];
list_bool = [];
vect_val = [];
list_moyennes = [];

fftbruit = 20*log10(abs(fft(y(1:0.150*Fe),N)));
seuil = max(fftbruit);
fen_signal=zeros(1,round(fen*Fe)+1);

for i = Te*Fe:round(fen*Fe):round((duree-fen)*Fe)
    fen_signal=y(abs(i:round(i+fen*Fe-1)));
    fftfen_signal=20*log10(abs(fft(fen_signal,N)));
    
    if max(fftfen_signal)> seuil*1.5
        [max_fft_fen,ind]=max(fftfen_signal);
        list_freq=[list_freq [ind*Fe/N]];
        list_bool = [list_bool [1]];
    else list_freq=[list_freq [0]];
         list_bool = [list_bool [0]];
    end
    
    if (length(list_freq)==1 && list_freq(end)>0)
        vect_val = [vect_val [list_freq(end)]];
    end
    
    if (length(list_freq)>1 && list_freq(end-1)>0 && list_freq(end)>0)
        vect_val = [vect_val [list_freq(end)]];
    end
    
    if (length(list_freq)>1 && list_freq(end-1)==0 && list_freq(end)>0)
        vect_val = [vect_val [list_freq(end)]];
    end
    
    if (length(list_freq)>1 && list_freq(end-1)>0 && list_freq(end)==0)
        list_moyennes = [list_moyennes [mean(vect_val)]];
        vect_val=[];
    end
end

if length(vect_val)>0
    list_moyennes = [list_moyennes [mean(vect_val)]];
    vect_val=[];
end

disp('les freqs des notes sont :')
list_moyennes

figure
subplot(2,1,1)
plot(absc,y,'g')
xlabel('temps en secondes')
ylabel('amplitude')
grid on

subplot(2,1,2)
plot(Te:duree/length(list_bool):duree-Te,list_bool,'g')
xlabel('temps en seconde')
ylabel('presence signal')
ylim([-1 2])
grid on
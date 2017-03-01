[x,Fe] = audioread('bonjour.wav');
% x = Mat(m,n)
% nombre d'�chantillons m = 43250 
% nombre de canaux audio n = 2 (stereo)
% fs = 44100 Hz : fr�quence d'�chantillonnage
% LE FICHIER DOIT SE TROUVER DANS LE CURRENT FOLDER AFIN DE LE LIRE

Te = 1/Fe;
% P�riode d'�chantillonnage

channelB1 = x(:,1); % Extraction des �chantillons du canal 1
channelB2 = x(:,2); % Extraction des �chantillons du canal 2

sampleNumberB = length(channelB1); 
% Pour obtenir le nombre d'�chantillons (le m�me qqsoit le canal choisi), au cas o�...

audioFileTimeB = sampleNumberB/Fe
% Pour obtenir le temps (s) du fichier audio, ici bonjour.wav

syms k
% k : indice de sommation

K = (audioFileTimeB/Te - 1)/2
% NOTION A DEFINIR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

channelB1Bis = channelB1.*channelB1;
% channel1 �lev� au carr�

D = 1/(2*K+1)
% Facteur dans l'approximation de Riemann

PowerCB1Bis = D*symsum(channelB1Bis, k, 21760, 65280);
% Puissance instantan�e calcul� pour chaque �chantillon d'un canal

sound(x,Fe); % Pour �couter une douce voix eff�min�e susurrer "bonjour"




[y,Fe2] = audioread('Haydn.wav');
Te2 = 1/Fe2;
channelH1 = y(:,1);
channelH2 = y(:,2);
sampleNumberH = length(channelH1);
audioFileTimeH = sampleNumberH/Fe2;

syms i
I = (audioFileTimeB/Te2 - 1)/2;
channelH1Bis = channelH1.*channelH1;
E = 1/(2*I+1);
PowerCH1Bis = E*symsum(channelH1Bis, i, 226490, 250173);
% Puissance instantan�e calcul� pour chaque �chantillon d'un canal

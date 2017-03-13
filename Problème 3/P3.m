% Elle permet de proposer une réduction de la fréquence d'échantillonnage
% optimale afin de réduire l'occupation spectrale du signal. Pour respecter
% le critère de Shannon et déviter les repliements de spectre, on choisit 
% de fixer F à 3*maxF


% Les échantillons étant codé sur 1 octet, cela correspond à 8 bits. Le
% débit noté D est égal à F x b, avec F=Fe/k, k étant le rapport de
% décimation.
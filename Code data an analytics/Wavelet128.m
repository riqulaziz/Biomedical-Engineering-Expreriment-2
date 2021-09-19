%uNTUK fs 128

function [Gamma,Beta,Alpha,Theta,Delta] = Wavelet(mySignal,waveletFunction)

[C,L] = wavedec(mySignal,5,waveletFunction);

%Calculation The Coificients Vectors of every Band 
cD1 = detcoef(C,L,1); %Gamma 
cD2 = detcoef(C,L,2); %Beta 
cD3 = detcoef(C,L,3); %Alpha 
cD4 = detcoef(C,L,4); %Theta 
cA4 = appcoef(C,L,waveletFunction,4); %Delta

%Calculation the Details Vectors of every Band : 
D1 = wrcoef('d',C,L,waveletFunction,1); %Gamma 
D2 = wrcoef('d',C,L,waveletFunction,2); %Beta  
D3 = wrcoef('d',C,L,waveletFunction,3); %Alpha
D4 = wrcoef('d',C,L,waveletFunction,4); %Theta 
A4 = wrcoef('a',C,L,waveletFunction,4); %Delta 


Gamma = D1; %figure, plot(1:1:length(Gamma),Gamma); 
Beta = D2; %figure, plot(1:1:length(Beta), Beta); 
Alpha = D3; %figure, plot(1:1:length(Alpha),Alpha); 
Theta = D4; %figure, plot(1:1:length(Theta),Theta); 
Delta = A4; %figure, plot(1:1:length(Delta),Delta);
PowerDelta= abs(Delta.^2);
PowerTheta= abs(Theta.^2);
PowerAlpha= abs(Alpha.^2);
PowerBeta= abs(sum(Beta.^2));
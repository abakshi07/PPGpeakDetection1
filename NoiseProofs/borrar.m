%% PROOF 2: ECG peaks detection

%% Add Datasets
addpath('/Users/alejandralandinez/Documents/MATLAB/mcode/tesis/Training_data/db');
%% Get Noise from Savitzky method
% Random sample signal: 
%[mediamuestral,TamRealizaciones]=GetAveragedNoise();
ecg = load('DATA_12_TYPE02.mat');
ecgSig = ecg.sig;
ecgFullSignal = ecgSig(1,(1:length(mediamuestral)));% match sizes 
% Normalize with min-max method
ecgFullSignal = (ecgFullSignal-128)./255;
ecgFullSignal = (ecgFullSignal-min(ecgFullSignal))./(max(ecgFullSignal)-min(ecgFullSignal));
% Squared signal to 
seccion1 = ecgFullSignal(33751:end);
seccion1a = seccion1.^2;
p = Detrending(seccion1,10);
h = seccion1-p;
seccion1b = h.^2;
t = (0:length(seccion1)-1)/125;   
figure(2), plot(t,seccion1b,t,seccion1,b,a,'o'),grid on, axis tight
%%
close all
%[ECG5Peaks,ECG5Locs] = GetECGPeakPoints(seccion1a,0.5, 0.3);

[a,b] = GetECGPeakPoints(seccion1b,0.014,0.3,0.04);

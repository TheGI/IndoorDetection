close all;
clear all;
clc;
pkg load signal;

% Load Sensor Data
filename = "Log_1425879251518(1).csv";

temp = real(csvread(filename));
trim = 1:length(temp);
L = temp(trim,1);
t = temp(trim,2);
dt = diff(t)/1e9;
Fs = mean(1./dt);

num = length(t)+1;
X = fft(L,num);
Pxx = (X.*conj(X)/num)(2:end);
nPxx = Pxx./norm(Pxx);
f = Fs/num*(1:floor(num/2));
figure;
plot(f,nPxx(1:floor(num/2)));
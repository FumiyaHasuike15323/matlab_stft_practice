clear; close all; clc;

% 信号をロード
[sampleVec, samplingFreq] = audioread('audacity.wav');
time = size(sampleVec, 1) / samplingFreq;

% STFT関数の呼び出し
winLen = 2048;
shiftLen = winLen / 2;
stftMat = stftForward(sampleVec, winLen, shiftLen, "hann");

% パワースペクトログラム表示関数の呼び出し
showSpectrogram(stftMat, time, samplingFreq);
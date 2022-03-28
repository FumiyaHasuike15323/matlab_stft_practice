% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
time = 10;
samplingFreq = 16000;
samplingInter = 1 / samplingFreq;
sampleCount = samplingFreq * time;

tVec = linspace(samplingInter, time, sampleCount)';
sampleVec = zeros(sampleCount, 1);

freqBase = 440;
amp = 0.4;
mpr = 2;

for i = 1:mpr
    omega = 2 * pi * i * freqBase;
    sampleVec = sampleVec + amp * sin(omega * tVec);
end

% STFT関数の呼び出し
winLen = 2048;
shiftLen = winLen / 2;
stftMat = stftForward(sampleVec, winLen, shiftLen, "hann");

% パワースペクトログラム表示関数の呼び出し
showSpectrogram(stftMat, time, samplingFreq);

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!
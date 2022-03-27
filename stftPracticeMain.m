% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
second = 10;
samplingFreq = 16000;
samplingInter = 1 / samplingFreq;
sampleCount = samplingFreq * second;

tVec = linspace(samplingInter, second, sampleCount);
sampleVec = zeros(sampleCount, 1)';

freqBase = 440;
amp = 0.4;
for i = 1:2
    omega = 2 * pi * i * freqBase;
    sampleVec = sampleVec + amp * sin(omega * tVec);
end

%チェック
%audiowrite("test.wav", sample_vec, sampling_freq);


% STFT実装

% パワースペクトログラムの表示

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!
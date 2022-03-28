% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
second = 10;
samplingFreq = 16000;
samplingInter = 1 / samplingFreq;
sampleCount = samplingFreq * second;

tVec = linspace(samplingInter, second, sampleCount)';
sampleVec = zeros(sampleCount, 1);

freqBase = 440;
amp = 0.4;
for i = 1:2
    omega = 2 * pi * i * freqBase;
    sampleVec = sampleVec + amp * sin(omega * tVec);
end

% STFT実装
winLen = 2048;
shiftLen = winLen / 2;
winCount = ceil((sampleCount - winLen) / shiftLen) + 1;
sampleZFillCount = winLen + (winCount - 1) * shiftLen;

winFnVec = 0.5 - 0.5 * cos(linspace(0, 2 * pi, winLen)');
sampleZFillVec = cat(1, sampleVec, zeros(sampleZFillCount - sampleCount, 1));
stftMat = zeros(winLen, winCount);

for i = 1:winCount
    startIdx = (i - 1) * shiftLen + 1;
    endIdx = startIdx + winLen - 1;
    winSampleVec = sampleZFillVec(startIdx:endIdx);
    stftMat(:,i) = fft(winSampleVec .* winFnVec);
end

% パワースペクトログラムの表示

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!
% 5年生の短時間Fourier変換（short-time Fourier transform: STFT）実習
clear; close all; clc;

% 440Hz＋880Hzの信号（10秒，サンプリング周波数16kHz）を生成
second = 10;
sampling_freq = 16000;
sampling_inter = 1 / sampling_freq;
sample_count = sampling_freq * second;

t_vec = linspace(sampling_inter, second, sample_count);
sample_vec = zeros(sample_count, 1)';

freq_base = 440;
amp = 0.4;
for i = 1:2
    omega = 2 * pi * i * freq_base;
    sample_vec = sample_vec + amp * sin(omega * t_vec);
end

%チェック
%audiowrite("test.wav", sample_vec, sampling_freq);


% STFT実装

% パワースペクトログラムの表示

% 上記ができたら自分の声をaudacityで録音してwavファイルを用意し，パワースペクトログラムで見てみる

% Good luck!
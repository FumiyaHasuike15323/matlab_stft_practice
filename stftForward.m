function s = stftForward(sampleVec, winLen, shiftLen, windowFunction)

% [syntax]
%   s = stftForward(sampleVec, winLen, shiftLen, windowFunction)
%
% [inputs]
%   sampleVec: samples of input signal
%      winLen: length of window
%    shiftLen: length of shift
%      window: analysis window function used in STFT (fftSize x 1) or choose used analysis window function from below:
%               "hann"       : Hann window
%               "rectangular": rectangular window
%
% [outputs]
%           s: spectrogram of input vector
%

    sampleCount = size(sampleVec, 1);
    winCount = ceil((sampleCount - winLen) / shiftLen) + 1;
    sampleZFillCount = winLen + (winCount - 1) * shiftLen;

    switch windowFunction
        case "hann"
            winFnVec = 0.5 - 0.5 * cos(linspace(0, 2 * pi, winLen)');
        case "rectangular"
            winFnVec = ones(winLen, 1);
        otherwise
            error("input(windowfunction) is not exits");
    end

    sampleZFillVec = cat(1, sampleVec, zeros(sampleZFillCount - sampleCount, 1));
    s = zeros(winLen, winCount);

    for i = 1:winCount
        startIdx = (i - 1) * shiftLen + 1;
        endIdx = startIdx + winLen - 1;
        winSampleVec = sampleZFillVec(startIdx:endIdx);
        s(:,i) = fft(winSampleVec .* winFnVec);
    end
end
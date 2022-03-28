function showSpectrogram(spectrogramMat, time, samplingFreq)

% [syntax]
%   showSpectrogram(spectrogramMat, time, samplingFreq)
%
% [inputs]
%   spectrogramMat: complex matrix of spectrogram
%             time: length of signal
%     samplingFreq: frequency of sampling
%

    xLen = size(spectrogramMat, 2);
    yLen = size(spectrogramMat, 1) / 2 + 1;
    axisXVec = linspace(0, time, xLen);
    axisYVec = linspace(0, samplingFreq / 2, yLen)';
    axisXMat = repmat(axisXVec, yLen, 1);
    axisYMat = repmat(axisYVec, 1, xLen);

    surface(axisXMat, axisYMat, 20 * log10(abs(spectrogramMat(1:yLen, :))), EdgeColor="none");
    xlabel("Time [s]")
    ylabel("Frequency [Hz]")
    xlim([0, time])
    ylim([0, samplingFreq / 2])
end
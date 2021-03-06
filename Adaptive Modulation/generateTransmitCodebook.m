function [ codebook, capacity ] = generateTransmitCodebook( DoF, signalPower, errorProbExp)
%GENERATECODEBOOK Creates a complex Gaussian codebook of length N
%   Calculate the SNR of the link to be coded for and the desired DoF to be
%   achieved, then create a codebook of that size and return it.

if DoF > 0;

    errorProb = 10^(-errorProbExp);
    noisePower = signalPower^(1-DoF);
    SNR =  signalPower / noisePower;
    SNRdB = 10*log10(SNR);

    % Create the table to perform SNR lookups from in dB
    SNRtable = 0:0.1:100;

    % Calculate the maximum constellation sizes for square and cross
    % constellations (diamond constellations can be added as a separate line at
    % a later date if required)

    squareConstellationSizes = 2:2:100;
    crossConstellationSizes = 1:2:99;
    
    errorSNR = 2 * qfuncinv(errorProb);

    squareConstellationSNRs = 10*log10((((2.^squareConstellationSizes)-1)*23.4423)/3);
    crossConstellationSNRs = 10*log10((((2.^crossConstellationSizes)-1)*23.4423)/3);

    squareQAMChannelCapacity = zeros(1,length(SNR));
    crossQAMChannelCapacity = zeros(1,length(SNR));

    for snr = 1:length(SNRtable)
        squareQAMChannelCapacity(snr) = findLargestConstellation(SNRtable(snr),squareConstellationSNRs,squareConstellationSizes);
        crossQAMChannelCapacity(snr) = findLargestConstellation(SNRtable(snr),crossConstellationSNRs,crossConstellationSizes);
    end

    % Combine the channel capacity curves to find supremum
    adaptiveQAMChannelCapacity = max(squareQAMChannelCapacity,crossQAMChannelCapacity);

    for n = 1:length(SNRtable)
        if ((SNRtable(n) < SNRdB && SNRtable(n+1) > SNRdB) || (SNRtable(n) == SNRdB))
            display(['Creating QAM constellation for SNR = ' num2str(SNRtable(n)) ' dB, with DoF = ' num2str(DoF)])
            break
        end
    end

    M = 2^(floor(adaptiveQAMChannelCapacity(n)));
    capacity = floor(adaptiveQAMChannelCapacity(n));

    if M >=2
        alphabet = 0:(M-1);

        codebook = qammod(alphabet,M);
        energy = mean((real(codebook).^2)+(imag(codebook).^2));
        codebook = codebook * (1/sqrt(energy));

        display(['Created QAM constellation M = ' num2str(M) '.']);

    %    scatterplot(codebook);
    else
        display(['Unable to create codebook: M < 2.']);
        codebook = 0;
        capacity  = 0;
    end
else
    display(['Unable to create codebook: no DoF assigned']);
    codebook = [0];
    capacity = [0];
end
end


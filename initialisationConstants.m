% Initialise the channel model and pre-set some constants that define it.
% Version 0.1 Chris Waters

% Change History
%
%   Version     Date                Comments
%   0.1         18/11/14            Initial version

M = 2;                                                                      % M = number of transmit antennas
N = 2;                                                                      % N = number of receive antennas

K = 2;                                                                      % K = number of users in network

fading = zeros(K);

symmetricChannel = true;
    crossChannelFade = 1.6;
    directChannelFade = 2.0;
    
if (symmetricChannel == true)                                               % If the channel is symmetric (i.e. the cross-user links are all equal)
    fading = ones(K) * crossChannelFade;                                    % then generate the fading channel matrix. Otherwise explicitly define it
    for i = 1:K
        fading(i,i) = directChannelFade;
    end
else                                                                        % Explicit definition of the channel fade matrix.
end


transmitPower = ones(1,K);                                                  % Set all transmitters to equal, unity power output.




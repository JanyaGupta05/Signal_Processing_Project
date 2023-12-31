function F = echo_cancelation(desiredSignal, echoedSignal)
    
    % Parameters
    mu = 0.01;           % Step size (adjust as needed)
    filterLength = 128;  % Length of the adaptive filter
    
    % Initialize variables
    w = zeros(filterLength, 1); % Filter weights
    F = zeros(size(echoedSignal));
    
    % LMS adaptive filter
    for n = filterLength:length(echoedSignal)
        x1 = echoedSignal(n:-1:n-filterLength+1);   % Input vector
        d = desiredSignal(n);                       % Desired signal
        
        F(n) = w.' * x1;   % Filter output
        e = d - F(n);      % Error signal
        
        % Update filter weights
        w = w + mu * e * x1;    
    end
    
    % Normalize the output signal
    % y1 = y1 / max(abs(y1)) * max(abs(desiredSignal));
    
end
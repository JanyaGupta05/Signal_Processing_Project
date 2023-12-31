function noiseType = classifyNoise(audio)
    [fan,fs1] = audioread("C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\music_ceiling-fan.wav");
    
    [traffic,fs2] = audioread("C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\music_city-traffic.wav");
    
    [cooker,fs3] = audioread("C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\music_pressure-cooker.wav");
    
    [pump,fs4] = audioread("C:\Users\bhask\Desktop\Signal Processing\SP Project\Final Project\Codes\music_water-pump.wav");
    
    fan_pump = fan-pump;
    fan_traffic = fan-traffic;
    fan_cooker = fan-cooker;
    pump_traffic = pump-traffic;
    pump_cooker = pump-cooker;
    traffic_cooker = traffic-cooker;
    
    input = audio;
    %sound(input,fs);
    
    
    fan_pump_cor = xcorr(input,fan_pump);
    fan_traffic_cor = xcorr(input,fan_traffic);
    fan_cooker_cor = xcorr(input,fan_cooker);
    pump_traffic_cor = xcorr(input,pump_traffic);
    pump_cooker_cor = xcorr(input,pump_cooker);
    traffic_cooker_cor = xcorr(input,traffic_cooker);
    
    
    max_array = zeros(6,1);
    
    max_array(1) = max(abs(fan_pump_cor));
    max_array(2) = max(abs(fan_traffic_cor));
    max_array(3) = max(abs(fan_cooker_cor));
    max_array(4) = max(abs(pump_traffic_cor));
    max_array(5) = max(abs(pump_cooker_cor));
    max_array(6) = max(abs(traffic_cooker_cor));
    
    
    % Finding the three Max value of all Correlation plots
    
    index_array = zeros(3,1);
    maximum_value = max(max_array);
    for i = 1:3
        val = max(max_array);
        % disp('Before Iteration max value');
        % disp(val);
        for k = 1:6
            if (max_array(k) == val)
                index_array(i) = k;
                % disp(k);
            end
        end
        max_array(index_array(i)) = 0;
        % disp('Assigning zero');
        % disp(max_array(index_array(i)));
        % disp('After Iteration max value');
        % disp(max(max_array));
    end
    
    % Displaying the 3-index corresponding to max correlation
    % disp(index_array);
    
    if (maximum_value<500)
        noiseType = 'Unknown';
    else
        if (index_array(1)==1 && index_array(2)==2 && index_array(3)==3 || index_array(1)==1 && index_array(2)==3 && index_array(3)==2 || index_array(1)==2 && index_array(2)==1 && index_array(3)==3 || index_array(1)==2 && index_array(2)==3 && index_array(3)==1 || index_array(1)==3 && index_array(2)==1 && index_array(3)==2 || index_array(1)==3 && index_array(2)==2 && index_array(3)==1 )
            % disp('Ceiling fan detected')
            noiseType = 'Fan';    
        
    
        elseif(index_array(1)==1 && index_array(2)==4 && index_array(3)==5 || index_array(1)==1 && index_array(2)==5 && index_array(3)==4 || index_array(1)==4 && index_array(2)==1 && index_array(3)==5 || index_array(1)==4 && index_array(2)==5 && index_array(3)==1 || index_array(1)==5 && index_array(2)==1 && index_array(3)==4 || index_array(1)==5 && index_array(2)==4 && index_array(3)==1 )
            % disp("Water pump detected")
            noiseType = 'Water Pump';
            
        
        elseif(index_array(1)==3 && index_array(2)==5 && index_array(3)==6 || index_array(1)==3 && index_array(2)==6 && index_array(3)==5 || index_array(1)==5 && index_array(2)==3 && index_array(3)==6 || index_array(1)==5 && index_array(2)==6 && index_array(3)==3 || index_array(1)==6 && index_array(2)==3 && index_array(3)==5 || index_array(1)==6 && index_array(2)==5 && index_array(3)==3 )
            % disp("Pressure Cooker detected")
            noiseType = 'Pressure cooker';
        
        
        elseif(index_array(1)==2 && index_array(2)==4 && index_array(3)==6 || index_array(1)==2 && index_array(2)==6 && index_array(3)==4 || index_array(1)==4 && index_array(2)==2 && index_array(3)==6 || index_array(1)==4 && index_array(2)==6 && index_array(3)==2 || index_array(1)==6 && index_array(2)==2 && index_array(3)==4 || index_array(1)==6 && index_array(2)==4 && index_array(3)==2 )
            % disp("Traffic Noise detected")
            noiseType = 'Traffic';
        
        else
            noiseType = 'Unknown';
        
        end
        
        % subplot(2,3,1);
        % plot(1:length(fan_pump_cor),abs(fan_pump_cor));
        % title("Fan-Pump Correlation");
        % 
        % subplot(2,3,2);
        % plot(1:length(fan_traffic_cor),abs(fan_traffic_cor));
        % title("Fan-Traffic Correlation");
        % 
        % subplot(2,3,3);
        % plot(1:length(fan_cooker_cor),abs(fan_cooker_cor));
        % title("Fan-Cooker Correlation");
        % 
        % subplot(2,3,4);
        % plot(1:length(pump_traffic_cor),abs(pump_traffic_cor));
        % title("Pump-Traffic Correlation");
        % 
        % subplot(2,3,5);
        % plot(1:length(pump_cooker_cor),abs(pump_cooker_cor));
        % title("Pump-Cooker Correlation");
        % 
        % subplot(2,3,6);
        % plot(1:length(traffic_cooker_cor),abs(traffic_cooker_cor));
        % title("Traffic-Cooker Correlation");

    end
end
function [ Temp, Tburntime ] = simulateFireNoFight( IC )
    global M, global N, global dt, global T;
    
    WindX = IC.WindX;
    WindY = IC.WindY;
    EReleaseRate = IC.EReleaseRate; 
    Tignite = IC.Tignite;
    avgIgnitTemp = mean2( IC.Tignite );
    Tburntime = IC.Tburntime;
    Tinitial = IC.Tinitial;
    avgInitTemp = mean2( IC.Tinitial );
    Tmax = IC.Tmax;
    Yog = IC.Yog;
    k = IC.k;
    
    Tcurrent = Tinitial;
    Temp = zeros( M, N, Tmax );
    for h = 1:Tmax
        Temp(:, :, h) = Tcurrent;
        Tnew = zeros( size( Tcurrent ) );
        for i = 2:M-1
            for j = 2:N-1
                % Changes due to burning
                [ dT_fire, Tburntime(i, j) ] = compute_burning( ...
                                                    Tburntime(i, j), ...
                                                    Tcurrent(i, j), ...
                                                    Tignite(i, j), ... 
                                                    EReleaseRate(i, j), ...
                                                    dt );

                % Changes due to neighboring nodes
                dT_Newton = compute_Newton( Tcurrent, i, j, k, dt );
                % Changes due to wind
                dT_wind = compute_convection( Tcurrent(i-1:i+1, j-1:j+1), ...
                                              WindX(i, j), WindY(i, j), dt );            

                % Changes due to average initial/ambient temperature
                dT_avg = Yog*(avgInitTemp - Tcurrent(i,j));

                % Update the temperature to reflect changes 
                Tnew(i, j) = Tcurrent(i, j) + dT_fire + dT_Newton + dT_wind + ...
                             dT_avg;
            end
        end
%%%%%%% BOUNDARY HANDLING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Tnew(1, 2:end-1) = Tnew(2, 2:end-1);
        Tnew(end, 2:end-1) = Tnew(end-1, 2:end-1);
        Tnew(:, 1) = Tnew(:, 2);
        Tnew(:, end) = Tnew(:, end-1);
        Temp(:, :, h) = Tnew;
        Tcurrent = Tnew;
        if( Tcurrent( Tcurrent > avgIgnitTemp ) )
            continue;
        else
            return;
        end
    end
end
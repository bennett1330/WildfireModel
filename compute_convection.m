% Computes how much "heat" came to the current from neighboring nodes
% after the wind blows.
function dT = compute_convection( Tc, windX, windY, dt )

    % T_subset contains the temperature for neighboring nodes
    %[windEW, windNS] = [east/west wind speed, north/south wind speed]
    windEW = windX * dt;
    windNS = windY * dt;
    windMagEW = abs( windEW );
    windMagNS = abs( windNS );
    windDiag = sqrt( windEW^2 + windNS^2 );
    
    Tnew = 0;

    %Transpose for Matlab reason: matrix --> vector
    Tc = Tc';
    if (windEW >= 0) && (windNS >= 0)
        Tnew = Tc(4) * windMagEW/windDiag + ...
               Tc(7) + ...
               Tc(8) * windMagNS/windDiag;

    elseif (windEW >= 0) && (windNS < 0)
        Tnew = Tc(1) + ...
               Tc(2) * windMagNS/windDiag + ...
               Tc(4) * windMagEW/windDiag;

    elseif (windEW < 0) && (windNS >= 0)
        Tnew = Tc(6) * windMagEW/windDiag + ...
               Tc(8) * windMagNS/windDiag + ...
               Tc(9);

    elseif (windEW < 0) && (windNS < 0)
        Tnew = Tc(2) * windMagNS/windDiag + ...
               Tc(3) + ...
               Tc(6) * windMagEW/windDiag;
    end
    
    if Tnew/3 > Tc(5)
        dT = 0.70 * (Tnew/3 - Tc(5));
    else
        dT = 0;
    end
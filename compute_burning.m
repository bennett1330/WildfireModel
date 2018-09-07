function [dT_fire, Tburntime] = compute_burning( Tburntime, Tcurrent, ...
                                                 Tignite, EReleaseRate, dt)
    if( Tburntime > 0 && Tcurrent > Tignite )
        dT_fire = dt * EReleaseRate * exp( Tburntime/10 );
        Tburntime = Tburntime - dt; 
    else
        dT_fire = 0;
    end
end 
     

function [ tempChange, Tignite ] = compute_fight( fightTimeBool, i, j, Tcurrent, ...
                                     avgInitTemp, Tignite, avgIgnitTemp ) 
    curNode = Tcurrent( i, j );
    
    curMax = max( max( Tcurrent ) );
    [ im, jm ] = find( Tcurrent == curMax );
    im = im(1);
    jm = jm(1);
    igniteRange = 5;
    fightTempDropMax = 1500;
    tempChange=0; % amount to modify temp by default
    if( fightTimeBool == 1 && ...
        (abs(im - i) < 2) && ...
        (abs(jm - j) < 2) && ...
        (avgIgnitTemp-igniteRange < curNode) )
            Tignite( i, j ) = Tignite( i, j ) + 200;
            if( curNode - avgInitTemp > fightTempDropMax )
                % can't fulling extinguish the fire
                tempChange = -fightTempDropMax;
            else
                tempChange = avgInitTemp - curNode;
            end
    end
end

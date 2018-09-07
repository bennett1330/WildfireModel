function [ WX, WY ] = generatewind( maxspeed, mpb, M, N )

% maxspeed is the maximum wind speed allowed by the model.
% mpb is the most probable bearing of the wind speed at nw corner.

% Generate the bearing of the nw corner wind vector, assuming that the
% distribution function is piecewise linear between
% (0, 0.15/pi), (pi, 0.85/pi), and (2*pi, 0.15/pi).  

% This was an arbitrary choice, and could be improved with more information
% about wind flow distribution.
    %global M, global N;
    ynw = rand();
    if ynw < 1/2  % (-0.1416) to (3)
        bnw = 2*pi * ( -0.3 + sqrt( 0.09 + 5.6 * ynw) )/2.8 - pi + mpb;
    else          % (3) to (6.1416)
        bnw = 2*pi * ( -3.1 + sqrt( 9.61 - 5.6 * ( 0.7 + ynw ) ) )/-2.8 - pi + mpb;
    end

    % Generate the speed of the wind at nw corner, assuming that the 
    % distribution function is piecewise linear between
    % (0, 0.25*maxspeed), (maxspeed/2, 1.75*maxspeed),  and (maxspeed, 0.25*maxspeed).

    xnw = rand();
    if xnw < 1/2 % 0 to 5
        snw = maxspeed * ( -0.3 + sqrt( 0.09 + 5.6 * xnw ) )/2.8;
    else         % 5 to 10
        snw = maxspeed * ( -3.1 + sqrt( 9.61 - 5.6 * ( 0.7 + xnw ) ) )/-2.8;
    end

    % NE, SE, and SW bearings/speeds are pretty close to those at NW, but vary
    % via a small normal deviation.  This can be improved.
    bne = randn * pi/12 + bnw;
    sne = randn * snw/6 + snw;
    bsw = randn * pi/12 + bnw;
    ssw = randn * snw/6 + snw;
    bse = randn * pi/12 + bnw;
    sse = randn * snw/6 + snw;

    % Once those values have been simulated, we can provide wind vectors
    % for all corners:
    nw = [ snw * cos( bnw ), snw * sin( bnw ) ];
    ne = [ sne * cos( bne ), sne * sin( bne ) ];
    sw = [ ssw * cos( bsw ), ssw * sin( bsw ) ];
    se = [ sse * cos( bse ), sse * sin( bse ) ];

    % Now we linearly interpolate to get wind vectors for the rest of the
    % nodes.  This can be improved.

    % Initialize wind vectors (X and Y components) at each point.
    WX = zeros( M, N );
    WY = zeros( M, N );

    % Substitute the simulated values at the corners:
    WX( 1, 1 ) = nw( 1 );
    WY( 1, 1 ) = nw( 2 );
    WX( 1, N ) = ne( 1 );
    WY( 1, N ) = ne( 2 );
    WX( M, 1 ) = sw( 1 );
    WY( M, 1 ) = sw( 2 );
    WX( M, N ) = se( 1 );
    WY( M, N ) = se( 2 );

    for i = 1:N
        WX( 1, i ) = (i - 1) * ( WX(1, N) - WX(1, 1) )/(N - 1) + WX(1, 1);
        WY( 1, i ) = (i - 1) * ( WY(1, N) - WY(1, 1) )/(N - 1) + WY(1, 1);
        WX( M, i ) = (i - 1) * ( WX(M, N) - WX(M, 1) )/(N - 1) + WX(M, 1);
        WY( M, i ) = (i - 1) * ( WY(M, N) - WY(M, 1) )/(N - 1) + WY(M, 1);
        for j = 2:M-1
            WX( j, i ) = (j - 1) * ( WX(M, i) - WX(1, i) )/(M - 1) + WX(1, i);
            WY( j, i ) = (j - 1) * ( WY(M, i) - WY(1, i) )/(M - 1) + WY(1, i);
        end
    end
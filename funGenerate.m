function IC = funGenerate( M, N, dt, T )
    %global M, global N, global dt, global T, global Tmax;
    
    Tmax = floor( T/dt );
    k = 0.05;
    dT = 0;
    Yog = 0.05;
    
    % Material Index
    MaterialIndex = getMaterialIndex( 'RegionRisk.png' );

    % Wind: direction of the wind
    maxspeed = 0.35;
    mpb = 3;
    [ WindX(1:M, 1:N), WindY(1:M, 1:N) ] = generatewind( maxspeed, mpb, M, N );

    % Tinitial: initial temperature
    Tinitial = randi( [ 1, 10 ], M, N ) + 40;
    Tinitial( 48:53, 48:53 ) = 400;

    % EReleaseRate: the rate at which energy is released
    EReleaseRate = (-MaterialIndex+8)/4 + randi( [ 0, 1 ], M, N );

    % Tignite: temperature at which the material ignites
    Tignite = (20 * MaterialIndex) + 200;
    Tburntime = (3 * MaterialIndex) + 30;
    
    % FightTime:
    FightInitTime = 15;
    FightFreq = 10;
    
    %%% RETURN STRUCTURING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    IC.Tinitial = Tinitial;
    IC.EReleaseRate = EReleaseRate;
    IC.Tignite = Tignite;
    IC.Tburntime = Tburntime;
    IC.FightInitTime = FightInitTime;
    IC.FightFreq = FightFreq;
    IC.WindX = WindX;
    IC.WindY = WindY;
    IC.Tmax = Tmax;
    IC.Yog = Yog;
    IC.k = k;
    IC.MaterialIndex = MaterialIndex;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

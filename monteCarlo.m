clear;
M = 100;
N = 100;
dt = 1;
T = 200;

Store.Temp = zeros( M, N, 2 );
Store.Burn = zeros( M, N, 2);

parfor( c = 1:2 )
    IC(c) = funGenerate( M, N, dt, T );
    [ Store( c ).Temp, Store( c ).Burn ] = simulateFire( IC(c), M, N, dt, T );
end
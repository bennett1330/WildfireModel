%%% Blakes two vectors %%%

x1 = 17;
y1 = 36;
initBurn1 = IC(1).Tburntime( x1, y1 );
x2 = 60;
y2 = 60;
initBurn2 = IC(1).Tburntime( x2, y2 );
exposure1 = zeros( 1, 500 );
exposure2 = zeros( 1, 500 );
for simNum = 1:500
    exposure1( simNum ) = (initBurn1 - Store( simNum ).Burn( x1, y1 )) ...
                           * 100 / initBurn1;
    exposure2( simNum ) = (initBurn2 - Store( simNum ).Burn( x2, y2 )) ...
                           * 100 / initBurn2;
end
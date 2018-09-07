function plotWind( WindX, WindY )
    global M, global N;
    windFig = figure();
    set( windFig, 'Units', 'normalized', 'Position', [0, 0, 1, 1] );
    WX = WindX( 1:5:M, 1:5:N );
    WY = WindY( 1:5:M, 1:5:N );
    [ x, y ] = meshgrid( 1:5:M, 1:5:N );
    quiver( x, y, WX, WY );
    axis( [ 1, M, 1, N ] );
    axis ij;
    grid on;
    hold on;
end


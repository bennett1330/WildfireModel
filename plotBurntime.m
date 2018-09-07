function plotBurntime( Tburntime, IC )
    global M, global N;
    fig2 = figure(2);
    set( fig2, 'Units', 'normalized', 'Position', [0, 0, 1, 1] );
    map = [ 0, 0.05, 0; 0, 0.1, 0; 0.1, 0.1, 0.05; 0.2, 0.2, 0.1; 0.4, 0.4, 0.2 ];
    Tburnt = Tburntime - IC.Tburntime;
    surf( 1:M, 1:N, Tburnt(:, :), 'CDataMapping', 'scaled' );
    colormap( map );
    view( 0, 90 );
    %legend
    hold on;
end


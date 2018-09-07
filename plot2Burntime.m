function plot2Burntime( Tburntime, Tburntime2, IC )
    global M, global N;
    imgFile = 'burnImg.png';
    fig2 = figure(2);
    subplot( 1, 2, 1 );
    set( fig2, 'Units', 'normalized', 'Position', [0, 0, 1, 1] );
    map = [ 0, 0.05, 0; 0, 0.1, 0; 0.1, 0.1, 0.05; 0.2, 0.2, 0.1; 0.4, 0.4, 0.2 ];
    Tburnt = Tburntime - IC.Tburntime;
    surf( 1:M, 1:N, Tburnt(:, :), 'CDataMapping', 'scaled' );
    colormap( map );
    view( 0, 90 );
    
    subplot( 1, 2, 2 );
    map = [ 0, 0.05, 0; 0, 0.1, 0; 0.1, 0.1, 0.05; 0.2, 0.2, 0.1; 0.4, 0.4, 0.2 ];
    Tburnt2 = Tburntime2 - IC.Tburntime;
    surf( 1:M, 1:N, Tburnt2(:, :), 'CDataMapping', 'scaled' );
    colormap( map );
    view( 0, 90 );
    %legend
    hold on;
    f = getframe(gcf);
    [ im, map ] = rgb2ind( f.cdata, 32, 'nodither' );
    imwrite( im, map, imgFile, ...
             'WriteMode', 'overwrite' ...
    );
end


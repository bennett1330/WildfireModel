function pngTempVisual( Temp, delayTime, pngFile )
    global M, global N, global Tmax;
    tempFig = figure();
    set( tempFig, 'Units', 'normalized', 'Position', [0, 0, 1, 1] );
    for h = 1:Tmax
        subplot( 1, 2, 1 );
        surf( 1:M, 1:N, Temp(:, :, h), ...
            'CDataMapping', 'scaled', ...
            'clipping', 'off' ...
        );
        colorbar( 'Location', 'westoutside', ...
                  'Limits', [ 20, 1020 ] ...
        );
        caxis([-900, 700]);
        axis([1, M, 1, N, 0, 1500]);
        view( 0, 90 );
        
        subplot( 1, 2, 2 );
        surf( 1:M, 1:N, Temp(:, :, h), ...
            'CDataMapping', 'scaled', ...
            'clipping', 'off' ...
        );
        caxis([-900, 700]);
        axis([1, M, 1, N, 0, 1500]);
        view( 45, 30 );
        
        f = getframe(gcf);
        [ im, map ] = rgb2ind( f.cdata, 32, 'nodither' );
        imwrite( im, map, [ pngFile, '-', int2str( h-1 ), '.png' ], ...
                 'WriteMode', 'overwrite' ...
        );
        pause( 1/1000 );
    end
    close all;
end
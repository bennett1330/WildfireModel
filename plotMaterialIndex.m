function plotMaterialIndex( MaterialIndex )
    global M, global N;
    matFig = figure();
    set( matFig, 'Units', 'normalized', 'Position', [0, 0, 1, 1] );
    map = [ 1,0,0; 1,0.4,0; 1,1,0 ];
    surf( 1:M, 1:N, MaterialIndex(:,:) );
    colormap( map );
    view( 0, 90 );
    % legend
    axis ij;
    hold on;
end


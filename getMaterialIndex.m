function MaterialIndex = getMaterialIndex( imageFile, riverFile )
    global M, global N;
    colorImage = imread( imageFile );
    greyImage = rgb2gray( colorImage );   
    greyVal = greyImage - min( greyImage(:) );
    greyVal( greyVal <= 35 ) = 4;
    greyVal( (greyVal > 35) & (greyVal <= 95) ) = 5;
    greyVal( greyVal > 95 ) = 6; % yellow
    MaterialIndex = cast( greyVal, 'double' );
    
    %riverImage = imread( riverFile ); 
end

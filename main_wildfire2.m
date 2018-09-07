
% 
% Wildfire Simulation
% main_wildfire.m
%
% Authors: Blake Allgood, Matt Bennett, Julia Kobe, James Petrillo, 
%          Kristian Roca, Mami Wentworth
%          
% MATH3800: Catastrophe Modeling
% Wentworth Institute of Technology          
%          
% 11/28/16  updated
% 11/02/16 (MW) updated
% 09/18/16 (MW) created
% Simulate wildfire by modeling the temperature at specified nodes
% 
% Additional Required files (Must be in working directory)
%   compute_burning.m
%   compute_Newton.m
%   compute_convection.m
%   compute_fight.m
%   isFightTime.m
%   funGenerate.m
%   generatewind.m
%   simulateFire.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
M = 100;
N = 100;
dt = 1;
T = 200;

% Initial condition generation function
IC = funGenerate( M, N, dt, T);

% Numerical temperature simulation from initial conditions
[ Temp, Tburntime ] = simulateFire( IC, M, N, dt, T );
%[ Temp2, Tburntime2 ] = simulateFireNoFight( IC );

% Visualization and gifification of numerical temperature across region
%gifFile = '/Frames3/Test-';
%gifTempVisual( Temp, 1/50, gifFile );
%gif2TempVisual( Temp, Temp2, 1/50, gifFile );

%plotBurntime( Tburntime, IC );
%plot2Burntime( Tburntime, Tburntime2, IC );

% plotMaterialIndex( IC.MaterialIndex );
% plotWind( IC.WindX, IC.WindY );

return;
%%% END PROGRAM %%%
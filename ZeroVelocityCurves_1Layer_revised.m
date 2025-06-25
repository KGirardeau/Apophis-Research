
% Define mascon layers
layers_1 = load('Data_Apophis/points_tetrahedron_center.dat');

% calculate the spin rate
T = 30.4; %hrs
w = (2*pi)/(T*3600); %rad/s

% Constants
R_max = 0.254; % in km
side_length = 7 * R_max;
N = 101; % Use an odd number to guarantee that x = 0 is in your grid

% Create grid from -side_length to +side_length
x = linspace(-side_length, side_length, N);
y = linspace(-side_length, side_length, N);
z = linspace(-side_length, side_length, N);
[X, Y, Z] = meshgrid(x, y, z);

% Compute distance from origin

[potential, pseudo] = pot(X, Y, Z, layers_1, w);

% Reshape data for table export
x_flat = reshape(X, [], 1);
y_flat = reshape(Y, [], 1);
z_flat = reshape(Z, [], 1);

potential_flat = reshape(potential, [], 1);
pseudo_flat = reshape(pseudo, [], 1);

% Combine into a matrix
data = [x_flat, y_flat, z_flat, potential_flat, pseudo_flat];

% Write header manually
fid = fopen('pseudo_potential_z0.csv', 'w');
fprintf(fid, 'x_km,y_km,z_km,potential,pseudo_potential\n');

% Write data
fclose(fid); % Close to reset for append
dlmwrite('pseudo_potential_z0.csv', data, '-append', ...
         'delimiter', ',', 'precision', 9);

disp('Saved to pseudo_potential_z0.csv');



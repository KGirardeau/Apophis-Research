function [potential, pseudo] = pot(x, y, z, layers, w)
    % POT Calculates the gravitational potential, pseudo-potential, and distance
    %
    % Inputs:
    %   x, y, z - Coordinates of evaluation points (scalars or arrays of the same size)
    %   layers  - Nx4 matrix: [x0, y0, z0, mu] for each mascon
    %   w       - Angular velocity (rad/s)
    %
    % Outputs:
    %   potential - Gravitational potential at each point
    %   pseudo    - Pseudo-potential
    %   r         - Distance from each mass point to each (x,y,z) location

    % Initialize outputs
    potential = zeros(size(x));

    n = size(layers,1);

    % parpool;  % or parpool('local', 4) to use 4 workers

    % Loop over each mascon
    % parfor i = 1:n
    for i = 1:n
        x0 = layers(i,1);
        y0 = layers(i,2);
        z0 = layers(i,3);
        mu = layers(i,4);

        ri = sqrt((x - x0).^2 + (y - y0).^2 + (z - z0).^2);

        potential = potential + mu ./ ri;

    end

    % Compute pseudo-potential
    pseudo = -0.5 * w^2 .* (x.^2 + y.^2) - potential;

end

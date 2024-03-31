% Load the case data
mpc = loadcase('case9');

% Set the maximum voltage limit for all buses to 1.05 pu
mpc.bus(:, 13) = 1.05;
% Update the bus matrix
mpc.bus(3, 17) = 3;
mpc.bus(4, 17) = 4;
results_new = runpf(mpc);
disp(results.bus(1:3, [8, 9])); % Results from Part (a)
disp(results_new.bus(1:3, [8, 9])); % Results from Part (c)
% Define the new line parameters
from_bus = 3; % Bus number of the sending end
to_bus = 4; % Bus number of the receiving end
r = 0; % Resistance of the line in pu
x = 0.05; % Reactance of the line in pu
b = 0; % Charging of the line in pu
tap_ratio = 1; % Tap ratio of the transformer
phase_shift = 2; % Phase shift angle of the transformer in degrees

% Add the new line to the branch matrix
mpc.branch(end+1, :) = [from_bus, to_bus, r, x, b, tap_ratio, phase_shift, 0, 0, 0, 0, 1, 1];


% Update the bus matrix to reflect the change in the number of branches
mpc.bus(4, 17) = 3;
mpc.bus(4, 17) = 3;


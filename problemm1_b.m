%% Change the load at Bus 3 from 270 + j170 MVA to 330 + j220 MVA. Run the power flow again
% Load the case data
mpc = loadcase('case9');

% Set the maximum voltage limit for all buses to 1.05 pu
mpc.bus(:, 13) = 1.05;
mpc.bus(3, 3) = 330;
mpc.bus(3, 4) = 220;
results_new = runpf(mpc);
disp(results.bus(1:3, [8, 9])); % Results from Part (a)
disp(results_new.bus(1:3, [8, 9])); % Results from Part (b)

%% a) Run a Newton-Raphson power flow and copy and paste the results in your report. Use this as the
%base case for the subsequent parts.
% Load the case data
mpc = loadcase('case9');

% Set the maximum voltage limit for all buses to 1.05 pu
mpc.bus(:, 13) = 1.05;

% Run the power flow analysis
results = runpf(mpc);

% Check the convergence status
if results.success
    disp('Newton rapson power flow.');
else
    disp('Newton rapshon method.');
end

% Display the bus voltages and angles
disp(results.bus(:, [8, 9]));

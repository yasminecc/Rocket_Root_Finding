% Exercise 1%

x = 3;                         
f = @(x) x * exp(x);            % Function definition f(x)
f_prime = (1 + x) * exp(x);     % Exact derivative of f(x)

et = []; % Relative absolute true error
ea = []; % Relative absolute approximate error
hk_values = []; % hk values for plotting

% Loop through each step size
for k = 1:15
    hk = 10^(-k); % Calculate hk for this iteration
    hk_values = [hk_values, hk]; % Append hk to hk_values for plotting

    % Calculate the central difference approximation
    central_diff_approx = (f(x + hk) - f(x - hk)) / (2 * hk);
    
    % Calculate relative absolute true error
    et = [et, (abs(central_diff_approx - f_prime) / abs(f_prime)) * 100];

    % Calculate the central difference approximation for hk+1
    hk_next = 10^(-(k + 1)); % Define hk+1
    central_diff_approx_2 = (f(x + hk_next) - f(x - hk_next)) / (2 * hk_next);

    % Calculate relative absolute approximate error 
    ea = [ea, (abs(central_diff_approx_2 - central_diff_approx) / abs(central_diff_approx)) * 100];
end

% Plot the results on a log-log scale
figure;
loglog(hk_values, et, '-s', 'DisplayName', 'Relative True Error'); % True error with square markers
hold on;
loglog(hk_values, ea, '-o', 'DisplayName', 'Relative Approximate Error'); % Approximate error with circle markers
hold off;

% Plot settings
legend('Location', 'best');
xlabel('Step Size (h)');
ylabel('Error (%)');
title('Relative Absolute True and Approximate Errors in Central Finite Difference');
grid on;

% most accurate step size 
[~, min_error] = min(et);
fprintf('Most accurate step size (h) is: %.e\n', hk_values(min_error));
fprintf('Corresponding true error: %.2e%%\n', et(min_error));

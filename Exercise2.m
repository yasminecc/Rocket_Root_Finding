% Exercise 2

u = 2510;           
M0 = 2.8e6;         
m_dot = 13300;      
g = 9.81;           
v = 335;            
conv_tol = 1e-8;    

% Speed v of Saturn V rocket is approximated by
v_func = @(t) u * log(M0 / (M0 - m_dot * t)) - g * t - v;

%% (a) Bisection Method
fprintf('Bisection Method:\n');
t_lower = 0;  % Initial lower bound
t_upper = 100;  % Initial upper bound
i = 0;
error_bisection = abs(t_upper - t_lower);

while error_bisection > conv_tol
    t_mid = (t_lower + t_upper) / 2;
    if v_func(t_lower) * v_func(t_mid) < 0
        t_upper = t_mid;
    else
        t_lower = t_mid;
    end
    error_bisection = abs(t_upper - t_lower);
    i = i + 1;
end

t_bisection = (t_lower + t_upper) / 2;
fprintf('Initial guesses: t_lower = %.2f, t_upper = %.2f\n', 0, 100);
fprintf('Time (t) = %.8f s\n', t_bisection);
fprintf('Iterations = %d\n', i);
fprintf('Error = %.8e\n\n', error_bisection);

%% (b) Newton-Raphson Method
fprintf('Newton-Raphson Method:\n');
t_newton = 21;  % Initial guess
i = 0;
error_newton = inf;

% Derivative of v_func with respect to t
v_prime = @(t) (u * m_dot / (M0 - m_dot * t)) - g;

while error_newton > conv_tol
    t_new = t_newton - v_func(t_newton) / v_prime(t_newton);
    error_newton = abs(t_new - t_newton);
    t_newton = t_new;
    i = i + 1;
end

fprintf('Initial guess: t = %.2f\n', 10);
fprintf('Time (t) = %.8f s\n', t_newton);
fprintf('Iterations = %d\n', i);
fprintf('Error = %.8e\n\n', error_newton);

%% (c) Secant Method
fprintf('Secant Method:\n');
t0 = 40;  % First initial guess
t1 = 60;  % Second initial guess
i = 0;
error_secant = abs(t1 - t0);

while error_secant > conv_tol
    v0 = v_func(t0);
    v1 = v_func(t1);
    t_next = t1 - v1 * (t1 - t0) / (v1 - v0);
    error_secant = abs(t_next - t1);
    t0 = t1;
    t1 = t_next;
    i = i + 1;
end

t_secant = t1;
fprintf('Initial guesses: t0 = %.2f, t1 = %.2f\n', 40, 60);
fprintf('Time (t) = %.8f s\n', t_secant);
fprintf('Iterations = %d\n', i);
fprintf('Error = %.8e\n\n', error_secant);

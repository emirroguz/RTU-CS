function main()
    lambda_val = 0.1;
    error = 0.01;
    min_value_wolfram_alpha = -2.5;
    starting_point1 = 2.0;
    starting_point2 = 3.0;
 
    i = 0;
    optimality_gap = 0.0;
    x1 = 0.0;
    x2 = 0.0;
    iterations = [];
    gaps = [];
 
    while abs(starting_point1 - x1) > error || abs(starting_point2 - x2) > error
        starting_point1 = x1;
        starting_point2 = x2;
 
        partial_derivative_x1 = 2 * x1 + 2 * x2 + 1;
        partial_derivative_x2 = 2 * x1 + 4 * x2 - 2;
 
        x1 = x1 - lambda_val * partial_derivative_x1;
        x2 = x2 - lambda_val * partial_derivative_x2;
 
        optimality_gap = return_value(x1, x2) - min_value_wolfram_alpha;
        i = i + 1;
 
        iterations(i) = i;
        gaps(i) = optimality_gap;
    end
 
    plot(iterations, gaps, 'o-', 'LineWidth', 1.5);
    xlabel('Number of Iterations');
    ylabel('Optimality Gap');
    title('Optimality Gap vs. Number of Iterations');
end
 
function value = return_value(x1, x2)
    value = x1 - 2 * x2 + 1 * x1^2 + 2 * x1 * x2 + 2 * x2^2;
end

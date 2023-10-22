function main()
    lambda_vals = [0.1, 0.2, 0.3];
    error = 0.01;
    min_value_wolfram_alpha = -2.5;
    starting_point1 = 2.0;
    starting_point2 = 3.0;
 
    for lambda_idx = 1:numel(lambda_vals)
        lambda_val = lambda_vals(lambda_idx);
        i = 0;
        optimality_gap = 0.0;
        x1 = 0.0;
        x2 = 0.0;
        iterations = [];
        lambdas = [];
 
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
            lambdas(i) = lambda_val;
        end
 
        plot(iterations, lambdas, 'o-', 'LineWidth', 1.5);
        hold on;
    end
 
    hold off;
    xlabel('Number of Iterations');
    ylabel('Lambda');
    legend('Lambda = 0.1', 'Lambda = 0.2', 'Lambda = 0.3');
    title('Lambda vs. Number of Iterations');
end
 
function value = return_value(x1, x2)
    value = x1 - 2 * x2 + 1 * x1^2 + 2 * x1 * x2 + 2 * x2^2;
end

def main():
    lambda_val = 0.1
    error = 0.01
    min_value_wolfram_alpha = -2.5
    starting_points = [(2.0, 3.0), (1.0, -2.0), (-5.0, 1.0)]
 
    for idx, (starting_point1, starting_point2) in enumerate(starting_points):
        i = 0
        optimality_gap = 0.0
        x1 = 0
        x2 = 0
 
        print(f"\nStarting Point {idx+1}")
 
        while abs(starting_point1 - x1) > error or abs(starting_point2 - x2) > error:
            starting_point1 = x1
            starting_point2 = x2
 
            partial_derivative_x1 = 2 * x1 + 2 * x2 + 1
            partial_derivative_x2 = 2 * x1 + 4 * x2 - 2
 
            x1 = x1 - lambda_val * partial_derivative_x1
            x2 = x2 - lambda_val * partial_derivative_x2
 
            optimality_gap = return_value(x1, x2) - min_value_wolfram_alpha
            i += 1
 
            print(f"ITERATION {i}: x1 = {x1:.5f}, x2 = {x2:.5f}, "
                  f"Total = {return_value(x1, x2):.5f}, Optimality Gap = {optimality_gap:.5f}")
 
def return_value(x1, x2):
    return x1 - 2 * x2 + 1 * x1 ** 2 + 2 * x1 * x2 + 2 * x2 ** 2
 
if __name__ == '__main__':
    main()

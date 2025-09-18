import powerlaw
import sys
import csv

# when to use command line arguments 
if len(sys.argv) > 1:
    input_file = sys.argv[1]  
else:
    input_file = "degree_list.csv"

# create degree distribution list from the CSV file
degrees = []
with open(input_file, "r") as csv_file:
    reader = csv.reader(csv_file)
    for row in reader:
        for value in row:
            try:
                degrees.append(int(value))  # convert to integer
            except ValueError:
                continue  # skip if conversion failed 

# calculate power law exponent using powerlaw library
if len(degrees) > 0:
    results = powerlaw.Fit(degrees)

    alpha = results.alpha
    k_min = results.xmin
    ks_statistic = results.D  # KS statistics 

    print(f"Estimated alpha: {alpha}")
    print(f"Estimated k_min: {k_min}")
    print(f"KS Statistic: {ks_statistic}")

    # comparison with other distributions 
    R_exp, p_exp = results.distribution_compare('power_law', 'exponential')  # powerlaw vs exp
    R_log, p_log = results.distribution_compare('power_law', 'lognormal')  # powerlaw vs lognormal

    print("\nComparison with other distributions:")
    print(f"Power Law vs Exponential: R = {R_exp:.4f}, p = {p_exp:.4f}")
    print(f"Power Law vs Lognormal: R = {R_log:.4f}, p = {p_log:.4f}")

    # Judgement
    # Power law vs Exponential
    if p_exp < 0.05:
        if R_exp > 0:
            print("--> Power law is significantly better than Exponential")
        else:
            print("--> Exponential is significantly better than Power law")
    else:
        print("--> No significant difference between Power law and Exponential")

    # Power law vs Lognormal
    if p_log < 0.05:
        if R_log > 0:
            print("--> Power law is significantly better than Lognormal")
        else:
            print("--> Lognormal is significantly better than Power law")
    else:
        print("--> No significant difference between Power law and Lognormal")

    if R_exp > 0 and p_exp < 0.05:
        print("--> Powerlaw significantly better than Exponential")
    if R_log > 0 and p_log < 0.05:
        print("--> Powerlaw significantly better than Lognormal")

    # total judgement
    score = {
        'powerlaw': 0,
        'exponential': 0,
        'lognormal': 0
    }

    if p_exp < 0.05:
        if R_exp > 0:
            score['powerlaw'] += 1
        else:
            score['exponential'] += 1

    if p_log < 0.05:
        if R_log > 0:
            score['powerlaw'] += 1
        else:
            score['lognormal'] += 1

    best_fit = max(score, key=score.get)
    print(f"\n==> Overall best-fitting model may be: {best_fit}")



else:
    print("Error: No valid degree data found in the file.")

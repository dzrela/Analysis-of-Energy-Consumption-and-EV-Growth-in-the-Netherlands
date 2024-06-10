import numpy as np
from scipy.stats import pearsonr, t
import matplotlib.pyplot as plt

evs_sold = np.array([276410, 393634, 541336])
energy_supplied = np.array([8.13, 10.72, 15.84])

r, p_value = pearsonr(evs_sold, energy_supplied)

n = len(evs_sold)
t_statistic = r * np.sqrt((n - 2) / (1 - r**2))
degrees_of_freedom = n - 2

critical_value = t.ppf(1 - 0.025, degrees_of_freedom)

print(f"Pearson Correlation Coefficient (r): {r}")
print(f"t-Statistic: {t_statistic}")
print(f"Critical t-Value for 95% Confidence Level: {critical_value}")
print(f"p-Value: {p_value}")

plt.scatter(evs_sold, energy_supplied, color='blue', label='Data points')
plt.plot(evs_sold, np.poly1d(np.polyfit(evs_sold, energy_supplied, 1))(evs_sold), color='red', label='Regression line')
plt.xlabel('EVs Sold')
plt.ylabel('% Energy Supplied Back to Grid')
plt.title('Correlation between % Energy Supplied Back to Grid and Electric Vehicle Sales')
plt.legend()
plt.grid(True)
plt.show()

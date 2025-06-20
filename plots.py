import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

tsoulis = np.loadtxt(f'Data_Apophis/pot_tsulis.dat')
potential_tsoulis = tsoulis[:,3]
pseudo_tsoulis = tsoulis[:,4]


output_potential_1 = pd.read_csv('output_potential_1.csv', header=None)
output_potential_30 = pd.read_csv('output_potential_30.csv', header=None)

x = output_potential_1[0]
y = output_potential_1[1]
z = output_potential_1[2]
potential_1 = output_potential_1[3]
pseudo_1 = output_potential_1[4]

potential_30 = output_potential_30[3]
pseudo_30 = output_potential_30[4]

r = np.sqrt(x**2 + y**2 + z**2)

error_1 = (potential_tsoulis - potential_1)*100/potential_tsoulis
error_30 = (potential_tsoulis - potential_30)*100/potential_tsoulis

r_body = 0.387



plt.plot(r, error_1, color='green')
plt.plot(r,error_30, color='blue')
plt.axvline(x=r_body, color='red', label='axvline - full height')
plt.xlabel('Distance Radius (km)')
plt.ylabel('Relative Error (%)')
plt.legend(['1 layer','30 layer'])
plt.title('Relative Error Between Mascon and Tsoulis Gravity Potentials')
plt.savefig('relative_error_pot.png', dpi=300)


error_1 = (pseudo_tsoulis - pseudo_1)*100/pseudo_tsoulis
error_30 = (pseudo_tsoulis - pseudo_30)*100/pseudo_tsoulis

plt.plot(r, error_1, color='green')
plt.plot(r,error_30, color='blue')
plt.axvline(x=r_body, color='red', label='axvline - full height')
plt.xlabel('Distance Radius (km)')
plt.ylabel('Relative Error (%)')
plt.legend(['1 layer','30 layer'])
plt.title('Relative Error Between Mascon and Tsoulis pseudo Potentials')
plt.savefig('relative_error_pseudo.png', dpi=300)

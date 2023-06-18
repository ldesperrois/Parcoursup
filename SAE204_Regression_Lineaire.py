
"""----------Import des Bibilothèques nécessaires--------------------------"""


import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression

"""------------------------------------------------------------------------"""

"""----------Programme de la Régéression Linéaire sur sur 7 variables------"""
"""----------SAE204_Regression_Lineaire.py---------------------------------"""
"""----------Ponthou Yanis  et Desperrois Lucas----------------------------"""



""" Etape de création de la dataFrame Parcoursup """


Parcoursup = pd.read_csv("Regression.csv");

"""-------------------------------------------"""

""" Transformation des cases vides et transformation en Array"""

Parcoursup = Parcoursup.dropna();
ParcoursupArray = Parcoursup.to_numpy();

"""-------------------------------------------"""

""" Définition de la fonction Centre_Reduire et creation de la matrice centré réduire """


def centre_reduire(T):
     T=np.array(T,dtype=np.float64);
     moyennes = np.mean(T, axis=0);
     ecarts_types = np.std(T, axis=0);
     Res = (T - moyennes) / ecarts_types;
     return Res;
 
    
 
ParcoursupArrayCR = centre_reduire(ParcoursupArray);
"""-------------------------------------------"""

""" Obtention de la Matrice de CO-Variance """

MatriceCov = np.cov(ParcoursupArrayCR,rowvar=False);


"""-------------------------------------------"""

""" Regression Linéaire des 3 variables et Coeeficient de Correlation_multiple """

Y = ParcoursupArrayCR[:,0]       #variable endogene
X = ParcoursupArrayCR[:,[4,5,3]] #3 Variables Explicatives

linear_regression = LinearRegression();
linear_regression.fit(X, Y)


a=linear_regression.coef_


Coefficient_correlation_mutltiple = linear_regression.score(X,Y);


"""-------------------------------------"""














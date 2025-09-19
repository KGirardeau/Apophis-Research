# This respository is a collaboration between Dr. Safwan Aljbaae and Katie Girardeau. The data found under Data_Apophis has been provided by Dr. Aljbaae.

The code can be applied to any body if the x, y, and z locations and respective gravitational constants of mass points modeling the body are known. For Apophis, this data is found under the Data_Apophis folder. 

To model Apophis as a polyhedral, the codes in the Modeling_Files folder can be run. One is provided to run in MATLAB, and the other runs a Python code.

To run the rest of the code, the main.m code must be run using the pot.m function in MATLAB. This will calculate the gravity potential, gravity gradient, and pseudo-potential points specified outside the body. A contour of the pseudo-potential can then be created in a chosen plane with the codes in the Zero_Velocity_Curves folder. On this plot, there will be white regions where the equilibrium points lie. These regions can be analyzed for the pseudo-potential of least magnitude (the Jacobi constant); these points are the equilibrium points. 

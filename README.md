# DAQ
Run demoSH.m
The dataset can be downloaded from the website and should be stored in exp_data.m.
exp_data.m should contain base data, train data, test data and Xground.
As for base data, train data and test data. the first dimension of them denotes dimensionality, the second dimension denotes the number of data.
As for Xground, the first dimension of them denotes the number of test data, thhe second dimension denotes the number of true neighbors of test data.
Xground contains indices. For example, Xground(i,j) denotes the index of the j-th nearest neighbor of i-th test point.

# DAQ - Quick Start
Run demoSH.m
The dataset can be downloaded from the website and should be stored in exp_data.m.
exp_data.m should contain base data, train data, test data and Xground.
As for base data, train data and test data. The first dimension of them denotes dimensionality, the second dimension denotes the number of data.
As for Xground, the first dimension of them denotes the number of test data, thhe second dimension denotes the number of true neighbors of test data.
Xground contains indices. For example, Xground(i,j) denotes the index of the j-th nearest neighbor of i-th test point.


# DAQ - Data Analysis and Query

## Introduction

DAQ is a MATLAB-based project designed for efficient data analysis and query operations. This repository provides a framework for handling datasets, performing similarity searches, and evaluating query performance using nearest neighbor metrics.

## Getting Started

### Prerequisites

- MATLAB installed on your system
- Basic understanding of MATLAB scripting and data structures

### Installation

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/Tarasom123/DAQ.git
   ```
2. Open MATLAB and navigate to the project directory.

## Data Preparation

The project requires a specific data file format. You need to prepare an `exp_data.m` file containing the following variables:

- **base_data**: The reference dataset used for queries. The first dimension represents the data dimensionality, and the second dimension represents the number of data points.
- **train_data**: Training dataset for model development (if applicable). Follows the same dimension structure as `base_data`.
- **test_data**: Test dataset used for query operations. Structure matches `base_data`.
- **Xground**: Ground truth matrix containing indices of true nearest neighbors for test data. The first dimension represents the number of test data points, and the second dimension represents the number of true neighbors for each test point.

## Usage

1. Place your prepared `exp_data.m` file in the project directory.
2. Run the main script:
   ```
   run demoSH.m
   ```
   This script will execute the data analysis and query operations based on your dataset.

## File Structure

- `demoSH.m`: Main script to run the DAQ demonstration.
- `exp_data.m`: Data file containing base, train, test data, and ground truth neighbors.
- Other supporting files for data processing and analysis.


## Acknowledgments

- Special thanks to the open-source community for providing valuable tools and inspiration for this project.
- Acknowledgment to contributors and collaborators who helped in developing and testing DAQ.




FAQ:


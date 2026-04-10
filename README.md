# Data Analysis for London Crime and Weather (2014–2016)
This project is a data analysis that explores the relationship between crime and weather in London.  

The work includes:
- SQL queries to extract and prepare data
- Data analysis in R
- A linear regression model using R
- A Deep Neural Network (DNN) model using tensorflow

## Installation
### Requirements
- Google BigQuery Account  
- Google Colab Notebook For R and Python

### Steps
1. Download the projects files
2. Open BigQuery and run the SQL Queues
3. Open the notebooks in Google Colab
4. Import the ipynb files to colab
5. Run the notebooks

## How to Run

### Step 1: Run SQL (Data Preparation)
1. Open BigQuery  
2. Run all queries in `Queues.sql`  
3. This will:
   - extract London crime data (2014–2016)  
   - extract weather data (Heathrow station)  
   - create monthly aggregated datasets  
  
### Step 2: Run Analysis Notebook
1. Open `Analysis Using R.ipynb`  
2. Run all cells  

This will:
- clean the dataset  
- generate correlations  
- create visualisations  
- export:
  - `monthly_totals.csv`  
  - `category_monthly.csv`  

### Step 3: Run Linear Regression Model
1. Open `Linear_Regression_Using_R.ipynb`  
2. Ensure `monthly_totals.csv` is available  
3. Run all cells  

This will:
- train the regression model  
- test predictions  
- output RMSE, MAE, and R²  

### Step 4: Run DNN Model
1. Open `DNN_Using_Tensorflow.ipynb`  
2. Ensure `monthly_totals.csv` is available  
3. Run all cells

This will:
- train the DNN model  
- test predictions  
- output RMSE, MAE, and R²

## How to Test Models
The dataset (monthly_totals.csv) is automatically split:
- 80% training
- 20% testing
Models are trained on training data and evaluated on test data

## To test models:
1. Upload monthly_totals.csv
2. Run the notebook
3. Check:
   - RMSE 
   - MAE  
   - R²
   - prediction graphs

## Credits 
Author: Ben Collins  
Module: Data Analytics on the Web     
Version: 1.0.0  
Date: 10/04/2026
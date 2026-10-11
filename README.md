# Movie-Recommendation-System-SQL-Python
A content-based movie recommendation system using SQL and Python, featuring data cleaning, TF-IDF vectorization, and cosine similarity to recommend movies based on their content and metadata.

## Project Overview

This project focuses on building a **content-based movie recommendation system** using SQL and Python. The system recommends movies based on similarities in their content and metadata, helping users discover films related to their interests.

The project covers the data preparation process, from cleaning and validating a movie dataset in SQL to processing movie features and calculating similarities in Python.

## Objectives

- Clean and prepare movie data using SQL.
- Identify and address duplicate values, missing values, inconsistent formatting, and numerical range issues.
- Explore and process relevant movie metadata.
- Build a content-based recommendation system using feature extraction and similarity measurement.
- Recommend movies based on similarities in their content.

## Technologies Used

- **SQL (MySQL):** Data cleaning, transformation, and validation.
- **Python:** Data processing and recommendation logic.
- **Pandas:** Data manipulation and preprocessing.
- **Scikit-learn:** Text vectorization and similarity calculations.
- **TF-IDF Vectorization:** Tokenization of data
- **Cosine Similarity:** Measuring similarity between movies depending on their metadata.

## Project Workflow

### 1. Data Collection
Obtained a movie dataset from Kaggle containing movie metadata and descriptive features.

### 2. Data Cleaning Using SQL
Prepared the dataset for analysis by:
- Investigating and handling missing values.
- Checking for duplicate records.
- Standardizing inconsistent text values where necessary.
- Converting date fields into appropriate date types.
- Separating movie runtimes and TV show season counts into distinct columns.
- Validating data types and checking data quality.

### 3. Data Preprocessing Using Python
Loaded the cleaned dataset into Python and prepared the relevant movie features for recommendation. Textual metadata was processed to create meaningful representations of each movie.

### 4. Feature Extraction
Used TF-IDF vectorization to break down the text into smaller units and then convert textual information into numerical feature vectors that can be compared mathematically.

### 5. Similarity Calculation
Applied cosine similarity to measure the similarity between movie feature vectors.

### 6. Movie Recommendations
Used the calculated similarity scores to identify and recommend movies with similar content to a selected movie.

## Recommendation Approach

This project uses **content-based filtering**, which recommends items based on their characteristics rather than relying on ratings or preferences from other users.

The general process is:

1. Select a movie.
2. Represent its relevant content features numerically.
3. Compare its feature vector with those of other movies.
4. Rank movies by similarity.
5. Return the most similar movies as recommendations.

## Key Learning Outcomes

- Practical application of SQL in data cleaning and validation.
- Improved understanding of data preprocessing and feature engineering.
- Application of text vectorization techniques to recommendation problems.
- Understanding how cosine similarity supports content-based filtering.
- Integration of SQL and Python into a complete data science workflow.

## Future Improvements

- Incorporate additional movie features to improve recommendation quality.
- Experiment with different text-processing and feature-weighting techniques.
- Evaluate recommendation relevance using suitable evaluation methods.
- Develop an interactive interface using Streamlit.
- Explore hybrid recommendation approaches combining content features and user ratings.

## Repository Contents

The repository contains the SQL scripts and Python implementation used to prepare the dataset and build the recommendation system.

## Author

**Faith Chepngeno**

Aspiring Data Scientist | Data Analytics | Machine Learning

GitHub: [Imani-hub-pixel]()

---

*This project was developed as part of my practical learning journey in data analytics, data science, and machine learning.*

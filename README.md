
---

# **Heart Attack Risk Prediction**

## **Project Overview**

This project aims to predict the likelihood of a heart attack using a variety of health and lifestyle features. We use machine learning models, including Linear Regression, Decision Trees, and Random Forest, to predict the risk of a heart attack based on various factors such as cholesterol, heart rate, family history, smoking habits, and more.

The objective is to develop a model that can accurately predict heart attack risk, which can be used to assist healthcare professionals in identifying individuals at high risk and enabling preventive measures.

## **Dataset Description**

The dataset used for this project contains various health-related features that can influence the likelihood of a heart attack. The features include:

- **Age**: Age of the individual.
- **Cholesterol**: Cholesterol levels in the blood.
- **Heart rate**: The individual's resting heart rate.
- **Diabetes**: Whether the individual has diabetes.
- **Family History**: A history of heart disease in the family.
- **Smoking**: Whether the individual is a smoker.
- **Obesity**: Body Mass Index (BMI) indicating obesity.
- **Alcohol Consumption**: The individual's alcohol consumption habits.
- **Exercise Hours Per Week**: Amount of physical activity the individual engages in weekly.
- **Diet**: The individual's eating habits.
- **Previous Heart Problems**: Whether the individual has had prior heart-related issues.
- **Medication Use**: Whether the individual is taking heart-related medications.
- **Stress Level**: The individual's stress levels.
- **Sedentary Hours Per Day**: The number of hours spent being sedentary per day.
- **Income**: The individual's income level.
- **BMI**: Body Mass Index of the individual.
- **Triglycerides**: Levels of triglycerides in the blood.
- **Physical Activity Days Per Week**: Number of days the individual engages in physical activity weekly.
- **Sleep Hours Per Day**: The individual's average sleep hours per day.
- **Heart Attack Risk (Binary)**: The target variable (1 = heart attack risk, 0 = no risk).
- **Blood Sugar**: The individual's blood sugar level.
- **CK-MB**: An enzyme marker for heart damage.
- **Troponin**: A protein involved in heart muscle contraction.
- **Heart Attack Risk (Text)**: A textual description of the individual's risk.
- **Gender**: The individual's gender.
- **Systolic Blood Pressure**: The top number in blood pressure readings.
- **Diastolic Blood Pressure**: The bottom number in blood pressure readings.

## **Data Source**

The dataset used for this project is sourced from the **UCI Machine Learning Repository**. It contains data collected from various medical records and health surveys, making it a rich source for training predictive models. 

Link to dataset: [Kaggle Data Set](https://www.kaggle.com/datasets/alikalwar/heart-attack-risk-prediction-cleaned-dataset)

## **Project Files**

- **heart-attack-risk.ipynb**: Jupyter notebook containing data preprocessing, model training, and evaluation.
- **best_model.pkl**: The saved model with the lowest loss (based on MSE).
- **visualizations.py**: Python file containing code for generating visualizations (e.g., correlation heatmap, feature distributions).
- **requirements.txt**: The Python dependencies needed to run the project.

## **Setup Instructions**

To run the project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/heart-attack-risk-prediction.git
   ```

2. Install the necessary dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Open the **heart-attack-risk.ipynb** file in Jupyter Notebook or JupyterLab.

4. Run the notebook to start the analysis and model training.

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README includes a **brief description of the dataset** and its **source**, along with instructions for **setting up** and **using** the project. It’s well-suited for providing context and getting others up and running with your code.

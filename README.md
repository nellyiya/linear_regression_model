
---

# **🩺 Heart Attack Risk Prediction API**

## **🏥 Project Overview and Mission**
Mission: Predict heart attack risk using a rich dataset with varied features Using FastAPI and a Flutter app.(Healthcare GCGOS)

Heart disease remains one of the leading causes of death worldwide. This project leverages **machine learning** to predict the likelihood of a heart attack based on various health and lifestyle factors.  

Using models like **Linear Regression, Decision Trees, and Random Forest**, this tool helps **identify high-risk individuals**—enabling **early intervention and prevention**.  

🔗 **Try the API:** [`http://127.0.0.1:8000/docs`](http://127.0.0.1:8000/docs) _(Swagger UI)_  

---

## **📊 Dataset Description**  

The dataset contains key **health indicators** that influence the risk of a heart attack:  

| **Feature**               | **Description** |
|---------------------------|---------------|
| **Age**                   | Age of the individual. |
| **Cholesterol**           | Cholesterol levels in the blood. |
| **Heart rate**            | Resting heart rate. |
| **Diabetes**              | Presence of diabetes (Yes/No). |
| **Family History**        | History of heart disease in the family. |
| **Smoking**               | Whether the individual is a smoker. |
| **Obesity (BMI)**         | Body Mass Index (BMI) indicator. |
| **Alcohol Consumption**   | Individual’s alcohol intake. |
| **Exercise Hours/Week**   | Weekly physical activity. |
| **Diet**                  | Eating habits. |
| **Previous Heart Issues** | Past heart-related problems. |
| **Medication Use**        | Whether taking heart-related medications. |
| **Stress Level**          | High/Moderate/Low stress. |
| **Sedentary Hours/Day**   | Time spent inactive. |
| **Income Level**          | Financial background. |
| **Triglycerides**         | Blood fat levels. |
| **Physical Activity Days**| Number of active days per week. |
| **Sleep Hours/Day**       | Average sleep per night. |
| **Systolic Blood Pressure** | Top number in BP readings. |
| **Diastolic Blood Pressure** | Bottom number in BP readings. |
| **Heart Attack Risk (Binary)** | Target variable: 1 = High risk, 0 = Low risk. |

📌 **Data Source:**  
🔗 **Dataset Link:** [Kaggle Heart Attack Risk prediction Dataset](https://www.kaggle.com/datasets/iamsouravbanerjee/heart-attack-prediction-dataset)  

---

## **📂 Project Files**  

## 📂 Project Structure

📂 linear_regression_model/
│
├── 📁 summative/
│   ├── 📁 linear_regression/
│   │   ├── 📓 heart-attack-risk.ipynb
        ├── 📑 heart_attack_prediction_dataset.csv

│   ├── 📁 API/
│   │   ├── 📝 prediction.py
│   │   ├── 📄 requirements.txt
│   ├── 📁 heart_attackapp/

---

## 🚀 Setup Instructions**  

⚡ Run the project locally in just 3 steps!**  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/nellyiya/linear_regression_model.git
cd heart-attack-risk.ipynb
```

### 2️⃣ Install Dependencies  
```bash
pip install -r requirements.txt
```

### 3️⃣ Run Jupyter Notebook  
```bash
jupyter notebook
```
Now, open `heart-attack-risk.ipynb` and **execute the cells** to start training and predictions!  

---

## **Publicly  API Endpoint**  

You can test predictions via **Postman, cURL, or Python requests**.  
🔹 **
🔹 **Url:** `https://linear-regression-model-summative-fkb9.onrender.com/predict`  
 🔹 **Swagger UI:**  https://linear-regression-model-summative-fkb9.onrender.com/docs
🔹 **Request Format:**  
```json
{
  "AGE": 45,
  "SYSTOLIC": 130,
  "DIASTOLIC": 85,
  "CHOLESTEROL": 220,
  "HEART_RATE": 75,
  "DIABETES": 0
}
 ```The prediction will be
	
Response body
{
  "prediction": "High Risk"
}

```

🔹 **My video** 



print(response.json())  # {'prediction': [0.78]}
```

🔹 **Mobile App **  

---
![home](https://github.com/user-attachments/assets/81549ecf-78bc-4721-b37b-f2b1dad3552b)


![prediction](https://github.com/user-attachments/assets/6fa53bfe-731f-48c4-989a-3440f70e86af)


---

### **🚀 Let’s Predict & Prevent!**  

Take control of **heart health** with **AI-powered predictions**. Start using this model today! 🩺❤️  

---


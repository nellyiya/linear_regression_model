from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import joblib
import numpy as np
import pandas as pd
import uvicorn

# Initialize FastAPI app
app = FastAPI()

# Load the saved model
def load_model(model_path='best_heart_attack_model.pkl'):
    try:
        model = joblib.load(model_path)
        print("Model loaded successfully!")
        return model
    except Exception as e:
        print(f"Error loading the model: {e}")
        return None

# Load the model
model = load_model()

# Check if the model is loaded
if model is None:
    raise Exception("Model could not be loaded. Check the model file and dependencies.")

# Define the input data schema using Pydantic
class PredictionInput(BaseModel):
    AGE: int
    SYSTOLIC: int
    DIASTOLIC: int
    CHOLESTEROL: int
    HEART_RATE: int
    DIABETES: int

# Add CORS middleware
origins = ["*"]  # Allows all origins (for development)
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Define the prediction endpoint
@app.post('/predict')
def predict(input: PredictionInput):
    try:
        # Convert input data to a pandas DataFrame with feature names
        feature_names = [
            'AGE', 'SYSTOLIC', 'DIASTOLIC', 'CHOLESTEROL', 'HEART_RATE', 'DIABETES'
        ]
        input_data = pd.DataFrame([input.dict()], columns=feature_names)

        # Make prediction
        prediction = model.predict(input_data)

        # Print raw prediction for debugging purposes
        print(f"Model raw prediction: {prediction}")  # For debugging

        # Round the prediction to 0 or 1 (binary classification)
        prediction = round(prediction[0])

        # Map prediction to "Low Risk" or "High Risk"
        risk = "Low Risk" if prediction == 0 else "High Risk"

        # Return the prediction as "Low Risk" or "High Risk"
        return {"prediction": risk}

    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

# Run the FastAPI app
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

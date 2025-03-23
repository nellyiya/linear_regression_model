from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, validator
from typing import List
import pickle
import numpy as np
import uvicorn
from fastapi.middleware.cors import CORSMiddleware
import os

#  Ensure the model file exists before loading
MODEL_FILE = "model.pkl"
if not os.path.exists(MODEL_FILE):
    raise FileNotFoundError("Model file not found! Ensure 'model.pkl' is in the same directory as this script.")

#  Load the trained model
with open(MODEL_FILE, "rb") as model_file:
    model = pickle.load(model_file)

#  Initialize FastAPI app
app = FastAPI(title="Prediction API", description="A simple API for making predictions using a trained model.")

#  Enable CORS (Allow all origins for testing, modify in production)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Change this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Root endpoint
@app.get("/", tags=["General"])
def home():
    """
    Returns a simple message confirming the API is running.
    """
    return {"message": "API is running. Go to /docs for Swagger UI."}

#Define the request body schema
class PredictionInput(BaseModel):
    features: List[float]  # List of floats

    @validator("features")
    def check_minimum_features(cls, v):
        if len(v) < 1:
            raise ValueError("At least one feature must be provided")
        return v

# Prediction endpoint
@app.post("/predict", tags=["Prediction"])
def predict(input_data: PredictionInput):
    """
    Takes a list of numerical features and returns a model prediction.
    """
    try:
        # Convert input to NumPy array
        data_array = np.array(input_data.features).reshape(1, -1)

        # Make prediction
        prediction = model.predict(data_array)
        
        return {"prediction": prediction.tolist()}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Prediction error: {str(e)}")

# Run the API if executed directly
if __name__ == "__main__":
    uvicorn.run("prediction:app", host="127.0.0.1", port=8000, reload=True)

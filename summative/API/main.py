from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, confloat
from typing import List
import pickle
import numpy as np
import uvicorn
from fastapi.middleware.cors import CORSMiddleware

# Load the trained model
try:
    with open("model.pkl", "rb") as model_file:
        model = pickle.load(model_file)
except FileNotFoundError:
    raise Exception("Model file not found! Ensure model.pkl is in the API directory.")

# Initialize FastAPI app
app = FastAPI()

# Enable CORS (Allow all origins for testing purposes)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
  # Adjust this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Root endpoint
@app.get("/")
def home():
    return {"message": "API is running. Go to /docs for Swagger UI."}

# Define the request body schema
class PredictionInput(BaseModel):
    features: List[confloat(ge=0, le=100)]  # Example constraint: values between 0 and 100

# Prediction endpoint
@app.post("/predict")
def predict(input_data: PredictionInput):
    try:
        # Convert input to NumPy array
        data_array = np.array(input_data.features).reshape(1, -1)

        # Make prediction
        prediction = model.predict(data_array)
        return {"prediction": prediction.tolist()}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# Run the app if executed directly
if __name__ == "__main__":
    uvicorn.run("prediction:app", host="0.0.0.0", port=8000, reload=True)

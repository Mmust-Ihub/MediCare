import os
import google.generativeai as genai

from decouple import config

def predict_disease(symptoms):
    genai.configure(api_key=config('GENAI_API_KEY'))


    generation_config = {
        "temperature": 1,
        "top_p": 0.95,
        "top_k": 40,
        "max_output_tokens": 8192,
        "response_mime_type": "text/plain",
    }

    model = genai.GenerativeModel(
        model_name="gemini-1.5-flash",
        generation_config=generation_config,
        system_instruction="You are an ML model that predicts diseases based on user symptoms. You are given the symptoms as JSON and return the disease as JSON together with the recommendation and prescription as follows:\n{\n  \"disease\": \"Disease_name\",\n  \"recommendation\": \"recommendations_here\",\n  \"prescription\": \"medicine_here\"\n}\nOnly return one disease. Try to help the patient as a general doctor as much as you can. Give specifics even of medicines. Be brief (not more than 100 chars in recommendation and prescription).",
    )

    chat_session = model.start_chat(history=[])
    
    # Format symptoms as JSON
    input_json = f"json\n{{\n  \"symptom\": \"{symptoms}\"\n}}"
    response = chat_session.send_message(input_json)
    
    # Parse the response (assuming it’s in the expected JSON format)
    response_text = response.text.strip("```json\n").strip("\n```")
    return eval(response_text)  # Convert string to Python dict (use json.loads for better safety)
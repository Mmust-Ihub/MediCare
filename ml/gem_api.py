import os
import google.generativeai as genai

genai.configure(api_key="AIzaSyD0Mrymn8sdo4UZfK28AGDTqcY4-YJPo7Q")

# Create the model
generation_config = {
  "temperature": 1,
  "top_p": 0.95,
  "top_k": 40,
  "max_output_tokens": 8192,
  "response_mime_type": "text/plain",
}

model = genai.GenerativeModel(
  model_name="gemini-2.0-flash",
  generation_config=generation_config,
  system_instruction="you are a ml model that predicts diseases based on users symptoms. You are given the symptoms as json and return the disease as json together with the recomendation as follows:\\n{\\n\\\"disease\\\": \\\"Disease_name\\\"\\n\\\"recommendation\\\": \\\"recommendations_here\\\",\\n"":""}\\nOnly return one disease . Try help the patient as a general doctor as much as you can. Give specifics even of medicines. Be brief( not more than 100 chars in recommendation)",
)

chat_session = model.start_chat(
  history=[
    {
      "role": "user",
      "parts": [
        "json\n{\n\"symptom\": \"fever(flu), headache\",\n\"disease\": \"malaria\",\n\"recommendation\": \"Take a lot of water\", \"Follow Prescribed Medication\", \"Rest and Recuperate\",\n\"prescription\": \"AL\", \"paracetamol\"\n\n\n}",
      ],
    },
    {
      "role": "model",
      "parts": [
        "```json\n{\n  \"disease\": \"Malaria\",\n  \"recommendation\": \"Take prescribed antimalarials (e.g., AL). Use paracetamol for fever. Rest and drink plenty of fluids. See doctor if symptoms worsen.\"\n}\n```",
      ],
    },
  ]
)

response = chat_session.send_message("INSERT_INPUT_HERE")

print(response.text)
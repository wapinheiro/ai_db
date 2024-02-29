import requests
import os
import json
import google.generativeai as genai

class OpenaiInterface():
    def __init__(self) -> None:
        pass
    def get_api_key(self, file_path):
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"JSON file not found at: {file_path}")
        
        with open(file_path, "r") as f:
            data = json.load(f)

        return data["gpt4_key"]
    
    def send_message(self, message):
        url = "https://api.openai.com/v1/completions"
        model = "gpt-3.5-turbo"
        headers = {
            "Authorization": f"Bearer {self.get_api_key("resources/openai_api_key.json")}",
            "Content-Type": "application/jason"
        }

        data = {
            "model": model, # Replace with the desired ChatGPT model if needed
            "messages": [{"role": "user", "content": message}]
        }

        response = requests.post(url, headers=headers, json=data)
        response.raise_for_status() # Raise an error if the request fails

        return response.json()["choices"][0]["message"]["content"]
class GeminiInterface():
    def __init__(self,key, model_name) -> None:
        self.key = key
        self.model_name = model_name

    def get_prompt(self,prompt):
        genai.configure(api_key=self.key)

        #setup model
        generation_config = {
            "temperature": 0.9,
            "top_p": 1,
            "top_k": 1,
            "max_output_tokens": 2048
        }

        safety_settings = [
        {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        ]

        model = genai.GenerativeModel(
            model_name= self.model_name,
            generation_config=generation_config,
            safety_settings=safety_settings
        )

        convo = model.start_chat()
        convo.send_message(prompt)                
        return convo.last.text
    
        #return model.generate_content(prompt)
    



        

    
        

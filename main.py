from llm_interface import *

if __name__ == "__main__":

    # Get API key
    key_file_path = "resources/gemini_api_key.json"
    if not os.path.exists(key_file_path):
        raise FileNotFoundError(f"JSON file not found at: {key_file_path}")
        
    with open(key_file_path, "r") as f:
        data = json.load(f)

    api_key =  data["key"]
    gem_model_name = "gemini-1.0-pro"
    prompt = "What's the capital of Brazil"
    
    gem_interface = GeminiInterface(key=api_key, model_name=gem_model_name)
    print(gem_interface.get_prompt(prompt=prompt))


    
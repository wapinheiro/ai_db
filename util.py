import json
import os


def get_json_file(path):
    if not os.path.exists(path):
        raise FileNotFoundError(f"JSON file not found at: {path}")
        
    with open(path, "r") as f:
        return json.load(f)
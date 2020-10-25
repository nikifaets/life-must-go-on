import requests
import json

DATA_SERVICE_URL = "http://127.0.0.1:2704/"

def get_categories_list():

    return requests.get(DATA_SERVICE_URL + "\categories")

def get_category(category):

    response = requests.get(DATA_SERVICE_URL + category)
    response = json.loads(response.text)
    print(response, type(response))
    return response
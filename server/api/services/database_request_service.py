import requests

DATA_SERVICE_URL = "localhost:2704"

def get_categories_list():

    return requests.get(DATA_SERVICE_URL + "\categories")

def get_category(category):

    pass
    return requests.get(DATA_SERVICE_URL + "\\" + category)
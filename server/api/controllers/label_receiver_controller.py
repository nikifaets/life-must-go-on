from flask_restx import Resource, Api, reqparse
from flask import Flask

import sys
sys.path.insert(1, "../services")

from database_request_service import get_category

app = Flask("LabelReceiverController")
api = Api(app)

class LabelReceiverController:

    @api.route("/label")

    class LabelReceiver(Resource):
       
        def get(self):

            parser = reqparse.RequestParser()
            parser.add_argument('name', type=str)

            category_name = parser.parse_args()['name']

            ##send request to database
            return get_category(category_name.lower())


    if __name__ == '__main__':

        app.run(host="localhost", port=8080, debug=True)
            

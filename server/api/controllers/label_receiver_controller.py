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

            category_name = parser.parse_args()[0]
            print("LABEL IS ", parser.parse_args()[0])#, label)
            ##send request to database
            return get_category(category_name)


    if __name__ == '__main__':

        app.run(host="localhost", port=8080, debug=True)
            

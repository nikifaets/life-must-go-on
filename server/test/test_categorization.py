import sys
sys.path.insert(1, "../nlu")
from rasa.nlu.training_data import load_data
from rasa.nlu.model import Trainer, Interpreter


from categorizer import Categorizer

def categorize(categorizer, interpreter, txt):

    parsed = interpreter.parse(txt)
    print("intent", parsed['intent']['name'])
    entities_dict = parsed['entities']

    txt_from_entities = ""

    for entity in entities_dict:

        print("entity ", entity['entity'])

    categorizer.list_entities(txt)

    print(txt_from_entities)
    print("mapped to categories ", categorizer.map_to_categories(txt))

    



if __name__ == '__main__':

    
    model_directory = "../nlu/rasa_core/models/best_model/model/nlu"

    interpreter = Interpreter.load(model_directory)

    inp = '''On March 25h, Sofia becomes the place to give. Hundreds of people are expected around the National Palace of Culture
                                with their old clothes, giving them to those in need. Follow the new around the event on the following url:
                                    www.sofiagives.bg'''

    inp1 = '''The people in this group are positive, willing to help each other and bring joy to the other person. They are not socially weak, 
                they are not to be ridiculed and everyone is equal! If you think that you are like that - WELCOME'''

    categorizer = Categorizer()
    categorizer.load_model()
    categorizer.set_categories(("clothes", "food", "toys", "household"))

    categorize(categorizer, interpreter, inp)
    categorize(categorizer, interpreter, inp1)


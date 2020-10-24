import spacy

class Categorizer:

    def __init__(self):

        self.DESIRED_ENTITIES = {"ORG", "PROD", "EVENT", "MISC"}

    def load_model(self):

        self.nlp = spacy.load("en_core_web_lg")

        print("Model loaded")

    def set_categories(self, categories):

        self.categories = categories

    def map_to_categories(self, text, threshold = 0.55):

        doc = self.nlp(text)

        res = list()

        print("entities len ", len(doc.ents))
        for token in doc:

            print(token)
            for cat in self.categories:
                
                t_cat = self.nlp(cat)

                similarity = t_cat.similarity(token)

                print("entity ", token.text)
                print("similarity to %s: %f" % (cat, similarity) )
                if similarity > threshold:

                    res.append(cat)

    def list_entities(self, text):

        doc = self.nlp(text)
        for ent in doc.ents:

            print("Entity, %s: %s" % (ent.label_, ent.text))




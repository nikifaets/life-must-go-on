
import spacy

class SynonymFinder():

    def load_model(self):

        self.nlp = spacy.load("en_core_web_lg")
        print("model loaded")

    def print_vectors(self, txt):

        tokens = self.nlp(txt)

        for token in tokens:

            print(token.text, token.vector_norm, token.vector)
    
    def get_word_vector(self, word):

        token = self.nlp(word)
        token = token[0]

        return token.vector

    def get_similarity(self, w1, w2):

        t1 = self.nlp(w1)
        t2 = self.nlp(w2)
        return t1.similarity(t2)

    def get_closest_words(self, w, words, threshold = 0.6):

        w_token = self.nlp(w)
        res = list()
        for word in words:

            token = self.nlp(word)
            similarity = w_token.similarity(token)
            if similarity > threshold:
                
                res.append(token.text)

        return res
                

             
        

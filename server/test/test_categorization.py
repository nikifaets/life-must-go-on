import sys
sys.path.insert(1, "../nlu")

from categorizer import Categorizer

if __name__ == '__main__':

    categorizer = Categorizer()
    categorizer.load_model()
    categorizer.set_categories(("clothes", "food", "toys", "household"))

    #categorizer.map_to_categories("Apple is organizing Food For The Poor (FFP)-Jamaica is the largest charity organization in Jamaica that provides relief in the areas of housing, food, medical, water, sa 
    categorizer.list_entities("Apple is organizing Food For The Poor (FFP)-Jamaica is the largest charity organization in Jamaica that provides relief in the areas of housing, food, medical, water, soap")
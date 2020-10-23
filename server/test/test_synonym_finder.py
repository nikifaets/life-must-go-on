import sys
sys.path.insert(1, "../nlu")
from synonym_finder import SynonymFinder
import numpy as np

if __name__ == "__main__":

    finder = SynonymFinder()
    finder.load_model()
    
    banana_vector = finder.get_word_vector("banana")
    apple_vector = finder.get_word_vector("apple")
    fruit_vector = finder.get_word_vector("fruit")
    horse_vector = finder.get_word_vector("horse")
    cow_vector = finder.get_word_vector("cow")
    moon_vector = finder.get_word_vector("moon")
    human_vector = finder.get_word_vector("human")
    machine_vector = finder.get_word_vector("machine")
    helicopter_vector = finder.get_word_vector("helicopter")
    tank_vector = finder.get_word_vector("tank")
    computer_vector = finder.get_word_vector("computer")
    plane_vector = finder.get_word_vector("plane")
    bird_vector = finder.get_word_vector("bird")
    sweater_vector = finder.get_word_vector("sweater")
    pullover_vector = finder.get_word_vector("pullover")
    pants_vector = finder.get_word_vector("pants")
    clothes_vector = finder.get_word_vector("clothes")

    vectors_list = (banana_vector, apple_vector, fruit_vector, 
                    horse_vector, cow_vector, moon_vector, human_vector, 
                    machine_vector, tank_vector, helicopter_vector, computer_vector, plane_vector,
                    bird_vector)

    clothes_list = (sweater_vector, pullover_vector, pants_vector, clothes_vector)
    clothes_list = np.array(clothes_list)
    clothes_matrix = np.broadcast_to(clothes_list, (len(clothes_list),len(clothes_list), clothes_list.shape[-1]))
    print("clothes matrix", clothes_matrix.shape)

    clothes_list = np.reshape(clothes_list, (len(clothes_list), 1, clothes_list.shape[-1]))
    print("clothes list", clothes_list.shape)
    clothes_distance_matrix = np.linalg.norm(clothes_matrix - clothes_list, axis=2)

    vectors_np_arr = np.array(vectors_list)
    distances_banana = np.linalg.norm(vectors_list - fruit_vector, axis=1)
    distances_machine = np.linalg.norm(vectors_list - machine_vector, axis=1)
    distances_plane = np.linalg.norm(vectors_list - plane_vector, axis=1)
    distances_bird = np.linalg.norm(vectors_list - bird_vector, axis=1)

    print("distance matrix", clothes_distance_matrix)

    print(finder.get_similarity("eagle", "falcon"))

    print(finder.get_closest_words("banana", ("cow", "fruit", "apple", "yoghurt", "coconut")))
    print(finder.get_closest_words("tree", ("tree", "plant", "forest", "pine")))
    #print("from banana",  distances_banana)
    #print("from machine", distances_machine)
    #print("from plane", distances_plane)
    #print("fomr bird", distances_bird)

    
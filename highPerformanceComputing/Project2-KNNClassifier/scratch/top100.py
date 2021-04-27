# What is the goal
## The goal is to find the top 100 unique words in a text and store it in a csv file

# Step 1: Get rid of "frivolous" words
# Step 2: Find unique words and insert them into a dictionary { word : count }
# Step 3: Reduce the dictionary to the top 100

import os
import nltk
from collections import Counter

def print_tokens(tokens):
	for token in tokens:
		print(token)

def create_top_words(list):
	sorted_by_length = sorted(list, key = len)
	return sorted_by_length
#	return dic

if __name__ == "__main__":
	# open book and read it
	book = "hamlet"
	file_name = "./books/" + book + ".txt"
	file = open(file_name, "r")
	raw = file.read()

	# tokenize book
	tokens = nltk.word_tokenize(raw)
	
	top_100 = create_top_words(tokens)
	print(top_100)

#	for key, value in top_100.items():
#		print(key, value)

	file.close()

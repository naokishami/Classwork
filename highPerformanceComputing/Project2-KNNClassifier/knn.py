import pandas as pd

matrix = pd.read_csv("./data/matrix.csv")

query_book = matrix['Count_Hamlet']

print(query_book)

headers = []

for col in matrix:
	headers.append(col)


print(headers[2:])

print(matrix.shape)


romeo = matrix.iloc[:, 2]
print(romeo)

moby = matrix.iloc[:, 3]
print(moby)

gatsby = matrix.iloc[:, 4]
print(gatsby)


hamlet = matrix.iloc[:, 5]
print(hamlet)


print(romeo.shape)

#inv_cos_rom_mob = romeo.T * moby
#print(inv_cos_rom_mob)






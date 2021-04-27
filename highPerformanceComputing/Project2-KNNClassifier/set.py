import pandas as pd


file_romeo = open("./data/romeoandjuliet.csv", "r")
file_moby = open("./data/mobydick.csv", "r")
file_gatsby = open("./data/greatgatsby.csv", "r")
file_hamlet = open("./data/hamlet.csv", "r")

romeo = file_romeo.read()
moby = file_moby.read()
gatsby = file_gatsby.read()
hamlet = file_hamlet.read()

print(type(romeo))

print(romeo)

the_set = []


df_romeo = pd.read_csv("./data/romeoandjuliet.csv", sep=",")
print(df_romeo)


df_moby = pd.read_csv("./data/mobydick.csv", sep=",")
print(df_moby)

df_gatsby = pd.read_csv("./data/greatgatsby.csv", sep=",")
print(df_gatsby)
df_hamlet = pd.read_csv("./data/hamlet.csv", sep=",")
print(df_hamlet)

romeo_moby = pd.merge(df_romeo, df_moby, how="outer", on=["Word"], suffixes=('_Romeo', '_Moby'))
print(romeo_moby)


gatsby_hamlet = pd.merge(df_gatsby, df_hamlet, how="outer", on=["Word"], suffixes=('_Gatsby', '_Hamlet'))
print(gatsby_hamlet)

full = pd.merge(romeo_moby, gatsby_hamlet, how="outer", on=["Word"])
print(full)


pd.set_option("display.max_rows", None, "display.max_columns", None)
full = full.fillna(0)

print(full)

full.to_csv(path_or_buf="./data/matrix.csv")
#the_set = romeo.union(moby, gatsby, hamlet)



file_romeo.close()
file_moby.close()
file_gatsby.close()
file_hamlet.close()

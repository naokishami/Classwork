import pandas as pd


file_unitedstates = open("./data/unitedstates.csv", "r")
file_russia = open("./data/russia.csv", "r")
file_japan = open("./data/japan.csv", "r")

unitedstates = file_unitedstates.read()
russia = file_russia.read()
japan = file_japan.read()

the_set = []

df_us = pd.read_csv("./data/unitedstates.csv", sep=",")
print(df_us)


df_russia = pd.read_csv("./data/russia.csv", sep=",")
print(df_russia)

df_japan = pd.read_csv("./data/japan.csv", sep=",")
print(df_japan)

us_rus = pd.merge(df_us, df_russia, how="outer", on=["Word"], suffixes=('_US', '_Rus'))
print(us_rus)

us_rus_japan = pd.merge(us_rus, df_japan, how="outer", on=["Word"], suffixes=('_Japan'))
print(us_rus_japan)

pd.set_option("display.max_rows", None, "display.max_columns", None)
full = us_rus_japan.fillna(0)

print(full)

full.to_csv(path_or_buf="./data/matrixCountries.csv")
#the_set = romeo.union(moby, gatsby, hamlet)



file_unitedstates.close()
file_russia.close()
file_japan.close()

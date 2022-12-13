# Read and transform the data into 8 vhse values

library(Peptides) # package Peptides c.f.: https://github.com/dosorio/Peptides

data <- read.csv("data/c_train.csv", encoding="UTF-8")

data[, 'vhse1'] = NA
data[, 'vhse2'] = NA
data[, 'vhse3'] = NA
data[, 'vhse4'] = NA
data[, 'vhse5'] = NA
data[, 'vhse6'] = NA
data[, 'vhse7'] = NA
data[, 'vhse8'] = NA


data_range <- 1:length(data[[1]])

for (i in data_range){
  i_vhse <- vhseScales(seq = data[[1]][i])
  for (j in 1:8){
    data[[2+j]][i]=i_vhse[[1]][j]
  }
}

write.csv(data, file ='data/vhse/c_train_vhse.csv')


install.packages("./ahp-master", repos=NULL)

library(ahp)

ahpFile <- 'task2.ahp.yaml'
smartfonyYaml <- ahp::Load(ahpFile)

library(data.tree)
print(smartfonyYaml, filterFun = isNotLeaf)

tree <- ahp::Calculate(smartfonyYaml)

smartfonyDf <- ahp::Analyze(smartfonyYaml)

View(smartfonyDf)

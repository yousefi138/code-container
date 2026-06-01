cran_packages = c(
  "BiocManager",
  "coin",
  "cowplot",
  "data.table",
  "devtools",
  "dplyr",
  "e1071",
  "Cairo",
  "easyPubMed",
  "ess",
  "GGally",
  "ggplot2",
  "glmnet",
  "haven",
  "igraph",
  "kableExtra",
  "kknn",
  "knitr",
  "lgr",
  "MASS",
  "mclust",
  "mlr3verse",
  "neuralnet",
  "partykit",
  "precrec",
  "pROC",
  "quarto",
  "ranger",
  "readr",
  "remotes",
  "reshape",
  "rmarkdown",
  "roxygen2",
  "rpart",
  "tableone",
  "testthat",
  "tidyverse",
  "xgboost")

bioc_packages = c(
  "biomaRt",
  "IlluminaHumanMethylation450kanno.ilmn12.hg19",
  "IlluminaHumanMethylationEPICanno.ilm10b4.hg19",
  "IlluminaHumanMethylationEPICv2anno.20a1.hg38")

git_packages = c(
  "mlr-org/mlr3extralearners@*release",
  "yousefi138/geograbi",
  "perishky/eval.save",
  "perishky/r_jive",
  "perishky/meffonym",
  "perishky/ewaff",
  "perishky/dmrff",
  "perishky/meffil",
  "jhrcook/mustashe")

installed_packages = rownames(installed.packages())

for (pkg in c(cran_packages,"remotes")) {
  if (!pkg %in% installed_packages) {
    install.packages(pkg)
    installed_packages = rownames(installed.packages())
  }
}

for (pkg in bioc_packages) {
  if (!pkg %in% installed_packages) {
    BiocManager::install(pkg)
    installed_packages = rownames(installed.packages())
  }
}

for (repo in git_packages) {
  pkg = remotes::github_remote(repo)$repo
  if (!pkg %in% installed_packages) {
    remotes::install_github(repo)
    installed_packages = rownames(installed.packages())
  }
}





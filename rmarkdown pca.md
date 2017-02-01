---
title: "PCA GARTNER"
author: "pmtempone"
date: "20 de julio de 2016"
output: html_document
---


```r
knitr::opts_chunk$set(echo = TRUE)
```

## PCA Gartner

Se muestra el análisis de los PCA de gartner critical capabilities:


```r
 library(plotly)
library(caret)
```

```
## Loading required package: lattice
```

```r
A <- as.data.frame(pr.gartner_critical)
```

```
## Error in as.data.frame.default(pr.gartner_critical): cannot coerce class ""prcomp"" to a data.frame
```

```r
A
```

```
##                                              PC1          PC2         PC3
## Security and User Administration     0.241431672 -0.247104039 -0.06307290
## Data Source Connectivity             0.287234365 -0.252993073 -0.08939824
## Cloud BI                            -0.007933089 -0.469045378  0.15170266
## BI Plataform Administration          0.146159639 -0.371056434 -0.38226686
## Self-Contained ETL and Data Storage  0.304314473  0.072345836 -0.41697207
## Self-Service Data Preparation        0.284852283  0.009985126 -0.11120580
## Governance and Metadata Management   0.359873266 -0.185623553  0.09621805
## Embedded Advanced Analytics          0.024205395 -0.205470248 -0.28044021
## Interactive Visual Exploration       0.291303698  0.414690836  0.15547630
## Analytic Dashboard                   0.377001395  0.256363272  0.20461446
## Mobile Exploration and Authoring     0.257628989 -0.087780574  0.20105714
## Embed Analytic Content               0.344776010  0.216908326 -0.13594377
## Publish Analytic  Content            0.285900303 -0.259584919  0.30184300
## Collaboration and Social BI          0.097691108 -0.102949201  0.53267679
## Ease of Use                         -0.174428145 -0.254581559  0.21202038
##                                              PC4         PC5          PC6
## Security and User Administration     0.330557148 -0.38638710 -0.007864696
## Data Source Connectivity            -0.187420247  0.16825562 -0.051666791
## Cloud BI                            -0.309166650  0.24819813  0.282556752
## BI Plataform Administration          0.257583733 -0.17235634  0.180902477
## Self-Contained ETL and Data Storage -0.262037474 -0.15047022  0.160609970
## Self-Service Data Preparation       -0.497452521 -0.19482636 -0.271518489
## Governance and Metadata Management   0.079613214 -0.06459247 -0.032053191
## Embedded Advanced Analytics          0.016360682  0.46161711 -0.589704480
## Interactive Visual Exploration      -0.040431271  0.14444578 -0.069744104
## Analytic Dashboard                  -0.033617617  0.20525776  0.024542033
## Mobile Exploration and Authoring     0.210871758  0.41284076  0.477765731
## Embed Analytic Content              -0.118419941 -0.10994205  0.205371864
## Publish Analytic  Content            0.150262146  0.09068131 -0.328673030
## Collaboration and Social BI          0.008844811 -0.43882380 -0.182002689
## Ease of Use                         -0.535753381 -0.08315880  0.139114500
##                                             PC7          PC8         PC9
## Security and User Administration    -0.11960371 -0.592728113  0.10207807
## Data Source Connectivity             0.55256165 -0.248871792 -0.25651631
## Cloud BI                             0.07829506  0.042686054  0.40602239
## BI Plataform Administration         -0.14965832  0.078677652 -0.05406309
## Self-Contained ETL and Data Storage -0.17840251 -0.055115024  0.13709043
## Self-Service Data Preparation       -0.14577090  0.151865835 -0.39630105
## Governance and Metadata Management  -0.29096140  0.553730661 -0.03552828
## Embedded Advanced Analytics         -0.24400732 -0.040334948  0.40132148
## Interactive Visual Exploration      -0.18832494 -0.308393491  0.07941310
## Analytic Dashboard                  -0.16744387 -0.144489093  0.07816144
## Mobile Exploration and Authoring    -0.22003205  0.013579649 -0.21208357
## Embed Analytic Content               0.43217411  0.169647688  0.45005057
## Publish Analytic  Content            0.25964805 -0.003907794 -0.20836122
## Collaboration and Social BI         -0.01335020  0.104029500  0.33514372
## Ease of Use                         -0.29712034 -0.297645253 -0.04643958
##                                            PC10        PC11        PC12
## Security and User Administration    -0.16387787  0.17178082  0.25521536
## Data Source Connectivity            -0.43713922 -0.10490402 -0.30265422
## Cloud BI                             0.21077416  0.40548430  0.12658352
## BI Plataform Administration          0.39526870 -0.06328003 -0.53287398
## Self-Contained ETL and Data Storage  0.02954316 -0.16779868  0.33201434
## Self-Service Data Preparation        0.15162760  0.02877380  0.21212955
## Governance and Metadata Management  -0.42939614  0.31202615 -0.15071759
## Embedded Advanced Analytics         -0.12267891 -0.21349481  0.02915112
## Interactive Visual Exploration      -0.01436571  0.51366968 -0.22748664
## Analytic Dashboard                   0.29702959 -0.28519957 -0.32543611
## Mobile Exploration and Authoring    -0.14793315 -0.32373166  0.31421268
## Embed Analytic Content               0.02290173 -0.08414332  0.01270565
## Publish Analytic  Content            0.48372233  0.06343258  0.23301629
## Collaboration and Social BI         -0.10401847 -0.37033221 -0.05913691
## Ease of Use                         -0.04946286 -0.14454299 -0.22393256
##                                            PC13        PC14          PC15
## Security and User Administration     0.06729612  0.13486628  0.3126955580
## Data Source Connectivity            -0.14208909  0.10105946 -0.1491090468
## Cloud BI                            -0.11873401  0.32565884 -0.0455045124
## BI Plataform Administration          0.19128089  0.02686923 -0.2302768115
## Self-Contained ETL and Data Storage -0.49364448 -0.25397973 -0.3317836423
## Self-Service Data Preparation        0.33178947  0.40563220  0.0494740765
## Governance and Metadata Management  -0.17268368 -0.19240976  0.2267214053
## Embedded Advanced Analytics          0.18190190 -0.02540809  0.0008629457
## Interactive Visual Exploration       0.20211817 -0.09814730 -0.4341201185
## Analytic Dashboard                  -0.36156804  0.25227884  0.4260794309
## Mobile Exploration and Authoring     0.31086714  0.04066769 -0.1582631213
## Embed Analytic Content               0.45154133 -0.22402946  0.2595502339
## Publish Analytic  Content           -0.06893367 -0.46120857 -0.0178930845
## Collaboration and Social BI          0.01188680  0.17763522 -0.4048006893
## Ease of Use                          0.17582491 -0.47825096  0.1853570636
```

## Including Plots

Plot de ploty:


```
## Error in html_screenshot(x): Please install the webshot package (if not on CRAN, try devtools::install_github("wch/webshot"))
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

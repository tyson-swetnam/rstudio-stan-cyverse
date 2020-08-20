FROM cyversevice/rstudio-geospatial:3.6.3

MAINTAINER "Tyson Lee Swetnam tswetnam@cyverse.org"
# based on https://hub.docker.com/r/asachet/rocker-stan

# ggplot2 extensions
RUN install2.r -s --error \
GGally \
ggridges \
RColorBrewer \
scales \
viridis

# Misc utilities
RUN install2.r -s --error \
aws.s3 \
beepr \
config \
doParallel \
DT \
foreach \
formattable \
glue \
here \
Hmisc \
httr \
jsonlite \
kableExtra \
logging \
MASS \
microbenchmark \
openxlsx \
pkgdown \
rlang \
RPushbullet \
roxygen2 \
stringr \
styler \
testthat \
usethis 


# Caret and some ML packages
RUN install2.r -s --error \
# ML framework
caret \
car \
ensembleR \
# metrics
MLmetrics \
pROC \
# Models
arm \
C50 \
e1071 \
elasticnet \ 
fitdistrplus \
gam \
gamlss \
glmnet \
kernlab \
lme4 \
ltm \
mboost \
randomForest \ 
ranger \
rpart \
survival \
# graph analysis
igraph

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
clang

# install_stan.R creates a makevars file and installs rstan from source
# following the instructions at https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Linux
COPY install_stan.R install_stan.R
RUN ["r", "install_stan.R"]

# Installing the rest 
RUN install2.r -s --error \
bayesplot \
brms \
coda \
loo \
projpred \
rstanarm \
rstantools \ 
shinystan \
tidybayes


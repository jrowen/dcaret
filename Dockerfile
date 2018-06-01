FROM rocker/tidyverse
MAINTAINER "Jonathan Owen" jonathanro@gmail.com

RUN add-apt-repository ppa:marutter/rrutter \
    && apt-get update -qq && apt-get -y --no-install-recommends install \ 
    r-cran-rcppeigen

# install caret
RUN install2.r --error \
    minqa \
    nloptr \ 
    #RcppEigen \
    profileModel \
    pbkrtest \
    lme4 \
    brglm \
    gtools \
    car \
    BradleyTerry2 \
    caret \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# install related packages
RUN install2.r \
    caretEnsemble \
    ada \
    adabag \
    adaptDA \
    arm \
    bartMachine \
    binda \
    bnclassify \
    brnn \
    bst \
    C50 \
    caTools \
    CHAID \
    class \
    Cubist \
    deepboost \
    deepnet \
    dplyr \
    e1071 \
    earth \
    elasticnet \
    elmNN \
    evtree \
    extraTrees \
    fastAdaboost \
    fastICA \
    FCNN4R \
    foba \
    foreach \
    frbs \
    gam \
    gbm \
    glmnet \
    gpls \
    h2o \
    hda \
    HDclassif \
    HiDimDA \
    import \
    inTrees \
    ipred \
    keras \
    kerndwd \
    kernlab \
    kknn \
    klaR \
    kohonen \
    KRLS \
    lars \
    leaps \
    LiblineaR \
    logicFS \
    LogicReg \
    MASS \
    Matrix \
    mboost \
    mda \
    mgcv \
    monmlp \
    monomvn \
    msaenet \
    mxnet \
    naivebayes \
    neuralnet \
    nnet \
    nnls \
    nodeHarvest \
    obliqueRF \
    ordinalNet \
    pamr \
    partDSA \
    party \
    penalized \
    penalizedLDA \
    pls \
    plsRglm \
    plyr \
    protoclass \
    proxy \
    qrnn \
    quantregForest \
    randomForest \
    randomGLM \
    ranger \
    Rborist \
    relaxo \
    rFerns \
    robustDA \
    rocc \
    rotationForest \
    rpart \
    rpartScore \
    rqPen \
    rrcov \
    rrcovHD \
    RRF \
    rrlda \
    RSNNS \
    RWeka \
    sda \
    sdwd \
    snn \
    sparsediscrim \
    sparseLDA \
    spikeslab \
    spls \
    stepPlr \
    superpc \
    supervisedPRIM \
    vbmp \
    VGAM \
    wsrf \
    xgboost \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

VOLUME /workspace
WORKDIR /workspace

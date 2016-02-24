FROM rocker/hadleyverse
MAINTAINER "Jonathan Owen" jonathanro@gmail.com

# install caret related packages
RUN install2.r --error \
    minqa \
    nloptr \ 
    RcppEigen \
    profileModel \
    pbkrtest \
    iterators \ 
    lme4 \
    brglm \
    gtools \
    car \
    foreach \ 
    BradleyTerry2 \
    caret
    
RUN install2.r --error \
    Cubist \
    e1071 \
    earth \
    fastICA \
    gam \
    ipred \
    kernlab \ 
    klaR \ 
    ellipse \
    mda \
    mgcv \
    mlbench \
    nnet \
    party \
    pamr \
    pls \
    pROC \
    proxy \
    randomForest \
    RANN \
    spls \
    subselect \
    superpc

# install caretEnsemble related packages
RUN install2.r --error \
    caretEnsemble

RUN install2.r --error \
    caTools \
    digest \
    gbm \
    pbapply \
    rpart
    
# add all model libs
RUN install2.r --error \
    Boruta \
    C50 \
    Cubist \
    HDclassif \
    HiDimDA \
    KRLS \
    LogicReg \
    MASS \
    RRF \
    RSNNS \
    RWeka \
    SDDA \
    ada \
    adabag \
    adaptDA \
    arm \
    binda \
    brnn \
    bst \
    caTools \
    caret \
    class \
    deepnet \
    earth \
    elasticnet \
    elmNN \
    enpls \
    evtree \
    extraTrees \
    fastICA \
    foba \
    frbs \
    gam \
    gbm \
    glmnet \
    gpls \
    hda \
    ipred \
    kernlab \
    kknn \
    klaR \
    kohonen \
    lars \
    leaps \
    logicFS \
    mboost \
    mda \
    mgcv \
    neuralnet \
    nnet \
    nodeHarvest \
    oblique.tree \
    obliqueRF \
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
    rFerns \
    randomForest \
    relaxo \
    rknn \
    robustDA \
    rocc \
    rpart \
    rrcov \
    rrcovHD \
    rrlda \
    sda \
    sparseLDA \
    spls \
    stepPlr \
    superpc \
    vbmp \
    wsrf
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

VOLUME /workspace
WORKDIR /workspace

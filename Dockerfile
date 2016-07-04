FROM rocker/hadleyverse
MAINTAINER "Jonathan Owen" jonathanro@gmail.com

# install caret
RUN install2.r --deps \
    caret \
    caretEnsemble \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# install related packages
RUN install2.r --deps \
    caret \
    caretEnsemble \
    ada \
    adabag \
    adaptDA \
    arm \
    bartMachine \
    binda \
    bnclassify \
    Boruta \
    brnn \
    bst \
    C50 \
    caTools \
    CHAID \
    class \
    Cubist \
    deepboost \
    deepnet \
    e1071 \
    earth \
    elasticnet \
    elmNN \
    enpls \
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
    hda \
    HDclassif \
    HiDimDA \
    inTrees \
    ipred \
    kerndwd \
    kernlab \
    kknn \
    klaR \
    kohonen \
    KRLS \
    lars \
    leaps \
    logicFS \
    LogicReg \
    MASS \
    mboost \
    mda \
    mgcv \
    monomvn \
    neuralnet \
    nnet \
    nnls \
    nodeHarvest \
    oblique.tree \
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
    rPython \
    rqPen \
    rrcov \
    rrcovHD \
    RRF \
    rrlda \
    RSNNS \
    RWeka \
    sda \
    SDDA \
    sdwd \
    snn \
    sparsediscrim \
    sparseLDA \
    spikeslab \
    spls \
    stepPlr \
    superpc \
    vbmp \
    VGAM \
    wsrf \
    xgboost \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

VOLUME /workspace
WORKDIR /workspace

FROM rocker/hadleyverse
MAINTAINER "Jonathan Owen" jonathanro@gmail.com

# python from https://github.com/docker-library/python/blob/master/3.4/Dockerfile

RUN apt-get update \
  && apt-get install -y --no-install-recommends -t unstable \
    curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# gpg: key F73C700D: public key "Larry Hastings <larry@hastings.org>" imported
ENV GPG_KEY 97FC712E4C024BBEA48A61ED3A5CA953F73C700D

ENV PYTHON_VERSION 3.4.5

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 8.1.2

RUN set -ex \
	&& curl -fSL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" -o python.tar.xz \
	&& curl -fSL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" -o python.tar.xz.asc \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEY" \
	&& gpg --batch --verify python.tar.xz.asc python.tar.xz \
	&& rm -r "$GNUPGHOME" python.tar.xz.asc \
	&& mkdir -p /usr/src/python \
	&& tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
	&& rm python.tar.xz \
	\
	&& cd /usr/src/python \
	&& ./configure --enable-shared --enable-unicode=ucs4 \
	&& make -j$(nproc) \
	&& make install \
	&& ldconfig \
	&& pip3 install --no-cache-dir --upgrade pip==$PYTHON_PIP_VERSION \
	&& [ "$(pip list | awk -F '[ ()]+' '$1 == "pip" { print $2; exit }')" = "$PYTHON_PIP_VERSION" ] \
	&& find /usr/local -depth \
		\( \
		    \( -type d -a -name test -o -name tests \) \
		    -o \
		    \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
		\) -exec rm -rf '{}' + \
	&& rm -rf /usr/src/python ~/.cache

# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s easy_install-3.4 easy_install \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config
  
# install caret
RUN install2.r --error \
    minqa \
    nloptr \ 
    RcppEigen \
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
	pROC \
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

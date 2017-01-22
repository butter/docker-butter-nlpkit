FROM butter/python:2.7.13
MAINTAINER Adam Walz <adam@butter.ai>

# Install numpy/scipy dependencies
RUN apt-get update && apt-get install -y \
    libatlas-dev \
    libatlas3gf-base \
    gfortran \
 && update-alternatives --set libblas.so.3 \
      /usr/lib/atlas-base/atlas/libblas.so.3 \
 && update-alternatives --set liblapack.so.3 \
      /usr/lib/atlas-base/atlas/liblapack.so.3 \
 && rm -rf /var/lib/apt/lists/*

# Optionally copy your own spacy data into this build instead of downloading
# it at build time.
# This should be done before installing python packages because ideally the data
# here will change less frequently than package versions and we would like to
# reuse it across builds as much as possible.
COPY data/spacy/en-1.1.0 \
  /usr/local/lib/python2.7/site-packages/spacy/data/en-1.1.0
COPY data/spacy/en_glove_cc_300_1m_vectors-1.0.0 \
  /usr/local/lib/python2.7/site-packages/spacy/data/en_glove_cc_300_1m_vectors-1.0.0

# Install nlp python tools
RUN pip install --no-cache-dir \
    numpy==1.11.3 \
    scipy==0.18.1 \
    spacy==1.6.0 \
    scikit-learn==0.18.1

# Download spacy English language model if it was not copied in manually
RUN python -m spacy.en.download

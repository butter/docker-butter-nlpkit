FROM python:2.7.12
MAINTAINER Adam Walz <adam@butter.ai>

# Optionally copy your own spacy data into this build instead of downloading
# it at build time.
# Do this before setting env SPACY_VERSION becuase the spacy version changes
# more often than the language model, which is very large and should be cached.
COPY data /usr/local/lib/python2.7/site-packages/spacy/data

ENV \
  SPACY_VERSION=1.3.0 \
  NUMPY_VERSION=1.11.3

# Install spacy and download language models early in the build process
# This will give the best cache-ability beacuase these language modesl are very
# large and we don't want to be downloading them on every container restart
RUN apt-get update && apt-get install -y \
    bc \
 && rm -rf /var/lib/apt/lists/* \
 && pip install \
      numpy==${NUMPY_VERSION} \
      spacy==${SPACY_VERSION} \
 && START=$(date +%s.%N) \
 &&   python -m spacy.en.download \
 && END=$(date +%s.%N) \
 && DIFF=$(echo "$END - $START" | bc) \
 && echo Downloading Spacy language models took "$DIFF" seconds

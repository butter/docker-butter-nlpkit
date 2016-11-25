FROM python:2.7.12
MAINTAINER Adam Walz <adam@butter.ai>

# Optionally copy your own spacy data into this build instead of downloading
# it at build time
COPY data /usr/local/lib/python2.7/site-packages/spacy/data

# Install spacy and download language models early in the build process
# This will give the best cache-ability beacuase these language modesl are very
# large and we don't want to be downloading them on every container restart
RUN apt-get update && apt-get install -y \
    bc \
 && rm -rf /var/lib/apt/lists/* \
 && START=$(date +%s.%N) \
 &&   pip install spacy==1.1.0 \
 &&   python -m spacy.en.download \
 && END=$(date +%s.%N) \
 && DIFF=$(echo "$END - $START" | bc) \
 && echo Installing spacy and downloading English language model took "$DIFF" seconds

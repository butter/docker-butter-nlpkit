FROM butter/python:2.7.14
LABEL maintainer="Butter.ai <dev@butter.ai>"

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

# Copy Spacy language moodels. These are large archives (>1GB) so they are copied
# early in the build process. These files should not be modified very often.
# Using ADD instead of COPY to automatically untar the archives
ADD data/spacy/en_core_web_lg-2.0.0.tar.gz /data/
ADD data/spacy/en_vectors_web_lg-2.0.0.tar.gz /data/
ADD data/spacy/en_core_web_md-2.0.0.tar.gz /data/
ADD data/spacy/en_core_web_sm-2.0.0.tar.gz /data/

# Install python nlp / machine learning dependencies
RUN pip install --no-cache-dir \
    numpy==1.14.1 \
    scipy==1.0.0 \
    scikit-learn==0.19.1

# Install Spacy NLP and link language model files into python PATH
RUN pip install --no-cache-dir spacy==2.0.7 \
 && python -m spacy link /data/en_core_web_lg-2.0.0/en_core_web_lg/en_core_web_lg-2.0.0 en_default \
 && python -m spacy link /data/en_core_web_lg-2.0.0/en_core_web_lg/en_core_web_lg-2.0.0 en_lg \
 && python -m spacy link /data/en_core_web_md-2.0.0/en_core_web_md/en_core_web_md-2.0.0 en_md \
 && python -m spacy link /data/en_core_web_sm-2.0.0/en_core_web_sm/en_core_web_sm-2.0.0 en_sm \
 && python -m spacy link /data/en_vectors_web_lg-2.0.0/en_vectors_web_lg/en_vectors_web_lg-2.0.0 en_vectors

FROM butter/python:3.6.1
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
ADD data/spacy/en_core_web_md-1.2.1.tar.gz /data/
ADD data/spacy/en_vectors_glove_md-1.0.0.tar.gz /data/

# Install nlp python tools
RUN pip install --no-cache-dir \
    numpy==1.12.1 \
    scipy==0.19.0 \
    spacy==1.8.0 \
    scikit-learn==0.18.1

# Link Spacy language model files into python PATH
RUN python -m spacy link /data/en_core_web_md-1.2.1/en_core_web_md/en_core_web_md-1.2.1 en_default \
 && python -m spacy link /data/en_vectors_glove_md-1.0.0/en_vectors_glove_md/en_vectors_glove_md-1.0.0 en_vectors

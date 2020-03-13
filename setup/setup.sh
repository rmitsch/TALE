#!/bin/sh

## Manual setup steps. ##

# Note: All Numba decorators in umap_.py have to be set to @numba.njit(parallel=False, fastmath=True)!
# Otherwise external thread-level parallelism leads to deadlocking threads due to Numba parallelization.
# Note: Does this problem still exist with conda base? Adapt setup.sh accordingly.
#sed -i 's/numba.njit(parallel=True/numba.njit(parallel=False/g' /usr/local/lib/python3.5/site-packages/umap/umap_.py

# Download repository and install package for multi-threaded t-SNE.
pip install --no-cache-dir git+https://github.com/samueljackson92/coranking.git

# Download language data.
python -m spacy download en
# Download NLTK's default stopwords and tokenizers.
python -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')"

# Install fastText with Python bindings for classification of VIS documents.
git clone https://github.com/facebookresearch/fastText.git
cd fastText
pip install .
cd ..
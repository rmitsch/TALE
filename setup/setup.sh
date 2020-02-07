#!/bin/sh

## Manual setup steps. ##

# Note: All Numba decorators in umap_.py have to be set to @numba.njit(parallel=False, fastmath=True)!
# Otherwise external thread-level parallelism leads to deadlocking threads due to Numba parallelization.
# Note: Does this problem still exist with conda base? Adapt setup.sh accordingly.
#sed -i 's/numba.njit(parallel=True/numba.njit(parallel=False/g' /usr/local/lib/python3.5/site-packages/umap/umap_.py

# Replace sklearn's base.py to avoid error for popping non-existent indices when computing random forests.
# Fixed by manually applying
# https://github.com/amueller/scikit-learn/blob/8d640b9a7cab93cde925431948297814d32b31f4/sklearn/base.py.
# Path in docker container is /usr/local/lib/python3.5/site-packages/sklearn/base.py.
# Note: Does this problem still exist with conda base? Adapt setup.sh accordingly.
#cp -f /tmp/base.py /usr/local/lib/python3.5/site-packages/sklearn/base.py

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
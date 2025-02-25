# Install R

sudo apt update sudo apt install -y r-base

# Install Quarto

wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb sudo dpkg -i quarto-1.3.450-linux-amd64.deb rm quarto-1.3.450-linux-amd64.deb quarto --version \# Verify installation

# Install R Packages in a User-Writable Directory

mkdir -p \~/R/library echo 'R_LIBS_USER=\~/R/library' \>\> \~/.Renviron Rscript -e 'install.packages(c(rmarkdown, knitr), repos=http://cran.rstudio.com/, lib=\~/R/library)'

# Render Quarto document to docs/

export R_LIBS_USER=\~/R/library \# Ensure R finds the installed packages mkdir -p docs \# Ensure docs/ exists before rendering quarto render notes.qmd --to html --output-dir docs

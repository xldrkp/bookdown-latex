## Start from my alpine-pandoc image

FROM conoria/alpine-pandoc

MAINTAINER Conor I. Anderson <conor@conr.ca>

## Install R and a few build tools, install bookdown and clean-up

RUN apk add --no-cache texlive-full gmp libffi zlib pcre cmark@testing R R-dev curl openssl-dev curl-dev gcc g++ git coreutils libxml2-dev openssh ghostscript graphviz perl<5.22 gnuplot &&\
  R -q -e 'install.packages("bookdown", repo="https://cran.rstudio.com/")' &&\
  rm -rf /tmp/*

#
CMD ["R"]

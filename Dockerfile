FROM debian:bookworm-slim
MAINTAINER ku0hn@ku0hn.radio

RUN apt-get update && apt-get install -yq wget unzip libcap2-bin lib32z1 && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN mkdir /opt/linbpq
RUN mkdir /opt/linbpq-install
WORKDIR /opt/linbpq-install
ADD start.sh /opt/linbpq-install

# Add the linbpq file
ADD http://www.cantab.net/users/john.wiseman/Downloads/Beta/linbpq /opt/linbpq-install
RUN chmod +x /opt/linbpq-install

# Add the HTML pages
RUN mkdir /opt/linbpq-install/HTML
RUN cd HTML; wget http://www.cantab.net/users/john.wiseman/Downloads/Beta/HTMLPages.zip; unzip HTMLPages.zip; rm HTMLPages.zip

# Add BPQAPR Pages
RUN mkdir /opt/linbpq-install/BPQAPRS
RUN cd BPQAPRS; wget http://www.cantab.net/users/john.wiseman/Documents/Samples/APRSHTML.zip; unzip APRSHTML.zip; rm APRSHTML.zip

# allrf parsing has a buffer size bug. We're overloading the one that comes from John
ADD overwrite/allrf.html /opt/linbpq/BPQAPRS/HTML/allrf.html

ENTRYPOINT ./start.sh

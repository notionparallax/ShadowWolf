FROM ubuntu
ADD . /beowulf
RUN apt-get update && apt-get install -y python3.4 python3-pip unixodbc \
  unixodbc-dev freetds-dev tdsodbc --no-install-recommends
RUN cd beowulf && pip3 install -r requirements.txt
ADD odbcinst.ini /etc/odbcinst.ini

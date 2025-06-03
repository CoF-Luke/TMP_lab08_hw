FROM ubuntu:24.04

RUN apt update
RUN apt install -yy gcc g++ cmake

WORKDIR /app

#VOLUME /app/src
#VOLUME /app/build

# RUN cmake -H. -B build -DCMAKE_BUILD_TYPE=Release
# RUN cmake --build build

ENV LOG_PATH /app/logs/log.txt

RUN mkdir -p /app/logs


ENTRYPOINT ["/bin/bash", "-c"]
CMD ["cmake -H/app/src -B build -DCMAKE_BUILD_TYPE=Release >> $LOG_PATH && cmake --build build >> $LOG_PATH && cp $LOG_PATH /artifacts/log.txt"]

FROM python:3.9.7-slim-buster

RUN apt-get update -y && apt-get upgrade -y \

    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \

    && apt-get clean \

    && rm -rf /var/lib/apt/lists/*



COPY . /app/

WORKDIR /app/

RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD ["sh", "start.sh"]

#!git clone https://github.com/axiomatic-systems/Bento4.git && cd Bento4 && apt-get -y install cmake && mkdir cmakebuild && cd cmakebuild/ && cmake -DCMAKE_BUILD_TYPE=Release .. && make && make install

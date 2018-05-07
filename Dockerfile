FROM python:3.6

WORKDIR /usr/src/app

#reading from the location of the current working directory of the local machine
COPY ./requirements.txt ./

RUN apt-get -y update  && apt-get install -y \
  libpng-dev \
  apt-utils \
&& rm -rf /var/lib/apt/lists/*

#notice that requirements.txt here is in the root directory
RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

RUN git clone https://github.com/calleja/ass3_production.git /usr/src/app/PROJECT_FOLDER #static folder name... cloning directly into the container

#may or may not need to add the listening port


CMD [ "python3", "/usr/src/app/PROJECT_FOLDER/run_cryptoApp.py" ]

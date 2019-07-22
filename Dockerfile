FROM paulopperman/sumo-docker

RUN apt-get install -y python3-pip curl

WORKDIR /

# RUN git clone --depth 1 https://github.com/sidewalklabs/sumo-web3d.git

COPY . /sumo-web3d

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN pip3 install sumo-web3d


WORKDIR /sumo-web3d

# RUN pip3 install -r requirements.txt
# RUN pip3 install aiohttp chardet lxml websockets xmltodict asyncio

RUN yarn

WORKDIR /

EXPOSE 5000
EXPOSE 5678

CMD ["python3", "/sumo-web3d/sumo_web3d/sumo_web3d.py"]
# CMD ["sumo-web3d"]
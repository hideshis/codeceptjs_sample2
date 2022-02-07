FROM node:16.13

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Node.jsのインストール
# CodeceptJS, Puppeteerのインストール
# Chromeのインストール
#RUN apt update \
#     && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#     && apt install ./google-chrome-stable_current_amd64.deb
#    && sudo apt install -y nodejs npm \
#    && sudo npm install n -g \
#    && sudo n stable \
#    && sudo apt purge -y nodejs npm \
#    && exec $SHELL -l \
#    && npx create-codeceptjs . --puppeteer \

RUN apt-get update && apt-get install -y unzip wget vim

# google-chrome 変更部分①
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
#wget http://dl.google.com/linux/deb/pool/main/g/google-chrome-unstable/google-chrome-unstable_93.0.4577.18-1_amd64.deb && \
#apt-get install -y -f ./google-chrome-unstable_93.0.4577.18-1_amd64.deb

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chrome

#COPY package.json package-lock.json ./
COPY *.json *.ts *.js tests/ ./

RUN npm install

CMD [ "npx", "codeceptjs", "run", "--steps" ]

FROM ruby:2.7.3

WORKDIR /app

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

#yarnをインストール
RUN npm install -g yarn

# 必要なファイルをコンテナにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

# Rubyの依存関係をインストール
RUN bundle install

# Node.jsの依存関係をインストール
RUN yarn install

CMD ["rails", "server", "-b", "0.0.0.0"]
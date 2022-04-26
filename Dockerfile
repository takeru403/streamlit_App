#全てのライブラリを補完しているver3.7をインストール
FROM python:3.7
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN mkdir -p /root/opt
COPY requirements.txt /root/opt
WORKDIR /root/opt

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
#versionの指定を行った、requirements.txtのダウンロード
RUN pip install -r requirements.txt
RUN python -m pip install jupyterlab



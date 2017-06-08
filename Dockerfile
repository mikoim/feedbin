FROM fedora:25

WORKDIR /feedbin

RUN dnf upgrade -y && \
dnf install -y gcc gcc-c++ git ImageMagick-devel libcurl-devel libxml2-devel libxslt-devel  nodejs opencv-devel postgresql-devel redhat-rpm-config ruby-devel rubygems which && \
gem install bundler

COPY Gemfile Gemfile.lock /feedbin/

RUN bundle

VOLUME ["/feedbin/public"]

COPY . /feedbin

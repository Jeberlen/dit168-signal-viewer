# Copyright (C) 2018  Christian Berger
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM alpine:3.7
MAINTAINER Christian Berger "christian.berger@gu.se"

RUN apk add libcluon --no-cache --repository https://chrberger.github.io/libcluon/alpine/v3.7 --allow-untrusted
RUN mkdir -p /opt/bin && wget -O /opt/bin/websocketd https://github.com/se-research/websocketd-alpine/raw/master/x86_64/websocketd && chmod 755 /opt/bin/websocketd
RUN mkdir /opt/signal-viewer
ADD . /opt/signal-viewer
ENTRYPOINT ["/opt/bin/websocketd", "--staticdir=/opt/signal-viewer", "--port=8080", "--binary=true", "/bin/cluon-OD4toStdout"]

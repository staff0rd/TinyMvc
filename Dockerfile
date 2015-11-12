FROM microsoft/aspnet:1.0.0-beta8

RUN bash -c "source $DNX_USER_HOME/dnvm/dnvm.sh \
	&& dnvm install 1.0.0-rc1-16048 -u -alias default \
	&& rm $DNX_USER_HOME/runtimes/default \
	&& dnvm alias default | xargs -i ln -s $DNX_USER_HOME/runtimes/{} $DNX_USER_HOME/runtimes/default \
	&& dnvm list"

# Not being read from global.json anymore
ENV DNX_PACKAGES=/app/approot/packages

ADD . /app

WORKDIR /app

ENTRYPOINT ["./approot/web"]
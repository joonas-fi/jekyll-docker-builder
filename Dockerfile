FROM ubuntu:latest

# the user is supposed to mount the Jekyll static site at /src in this container
VOLUME ["/src"]

RUN \
	apt-get update && \
	apt-get install -y make nodejs ruby1.9.3 && \
	gem install --no-ri --no-rdoc jekyll jekyll-tagging && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	mkdir /build

# having apt-get clean and rm -rf ... saves about 21 MB

# WTF: ubuntu image has locale set to "POSIX" (whatever that is)
ENV LC_ALL C.UTF-8

CMD jekyll build --source /src/ --destination /build/

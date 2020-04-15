FROM kennethreitz/httpbin

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp/

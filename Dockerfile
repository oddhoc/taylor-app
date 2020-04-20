FROM kennethreitz/httpbin

RUN echo hello

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp/

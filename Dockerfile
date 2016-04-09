FROM centos:7

#Install dependencies
RUN yum install -y ruby ruby-dev gem && \
    yum install -y rubygem-bundler && \
    yum install -y ruby-devel && \
    yum install -y gcc-c++ && \
    yum install -y make

#Install dashing and nodejs    
RUN gem install dashing && \    
    curl --silent --location https://rpm.nodesource.com/setup | bash - && \
    yum install -y nodejs

#Exposing dashing service port on the container
EXPOSE 3030

#Create dashing run directory
RUN mkdir /opt/dashing && \
    cd /opt/dashing/ && \
    dashing new sweet_dashboard_project && \
    cd /opt/dashing/sweet_dashboard_project/ && \
    bundle

#CMD [ "node" ]

#OR add your own dashing directory
#ADD ./dashing /opt/

#WORKDIR /opt/dashing
#RUN bundle && \
#  dashing start

#Creating entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]


   

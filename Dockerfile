FROM centos

#Install dependencies
RUN yum install -y ruby ruby-dev gem && \
    yum install -y rubygem-bundler && \
    yum install ruby-devel && \
    yum install -y gcc-c++ && \
    yum install -y make && \
    gem install dashing && \
    curl --silent --location https://rpm.nodesource.com/setup | bash -
    yum install -y nodejs



#Create dashing run directory
RUN mkdir /opt/dashing && \
    cd /opt/dashing/ && \
    dashing new sweet_dashboard_project && \
    cd /opt/dashing/sweet_dashboard_project/ && \
    bundle && \
    dashing start

#OR add your own dashing directory
#ADD ./dashing /opt/

#WORKDIR /opt/dashing
#RUN bundle && \
#  dashing start


   

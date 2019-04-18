FROM ubuntu:16.04
# Install python 36
COPY install_python36.sh .
RUN chmod +x install_python36.sh
RUN ./install_python36.sh
RUN apt-get -y install vim
RUN echo "alias pip=pip3" >> ~/.bashrc
RUN pip3 install --upgrade pip

WORKDIR demo/
COPY .bash_profile .
COPY .jupyter_command .
RUN cat .jupyter_command >> ~/.bashrc
COPY requirements.txt .
EXPOSE 8888

# Install (globally) virtualenv & jupyter
RUN pip3 install virtualenv && pip3 install jupyter
RUN virtualenv venv



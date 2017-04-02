FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  git \
  wget \
  bzip2

ADD .bash_profile $HOME
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
RUN source ~/.bashrc
RUN pyenv install anaconda3-4.3.1
RUN pyenv global anaconda3-4.3.1
RUN source ~/.bashrc

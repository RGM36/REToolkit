FROM kalilinux/kali-rolling

RUN apt -y update
RUN apt -y install python3 python3-pip gdb rizin apktool jadx locales wget git zsh

RUN useradd re -m

WORKDIR /opt

# Setup tools
RUN pip install setuptools --upgrade --break-system-packages

# LIEF
RUN pip install lief --break-system-packages

# Angr
RUN pip install angr --break-system-packages

# PwnTools
RUN pip install pwntools --break-system-packages

# distorm
RUN pip install distorm3 --break-system-packages

# Pyelftools
RUN pip install pyelftools --break-system-packages

# Volatility
RUN git clone https://github.com/volatilityfoundation/volatility3
RUN pip install -r ./volatility3/requirements.txt --break-system-packages
WORKDIR /opt/volatility3
RUN python3 setup.py build
RUN python3 setup.py install
WORKDIR /opt

# PwnDbg
ENV LANG en_US.utf8
ENV TZ=America/New_York
ENV ZIGPATH=/opt/zig

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get update

WORKDIR /tmp
RUN wget https://github.com/pwndbg/pwndbg/releases/download/2024.02.14/pwndbg_2024.02.14_amd64.deb
RUN apt -y install ./pwndbg_2024.02.14_amd64.deb

RUN echo "source /pwndbg/gdbinit.py" >> ~/.gdbinit.py && \
    echo "PYTHON_MINOR=$(python3 -c "import sys;print(sys.version_info.minor)")" >> /home/re/.zshrc && \
    echo "PYTHON_PATH=\"/usr/local/lib/python3.${PYTHON_MINOR}/dist-packages/bin\"" >> /home/re/.zshrc && \
    echo "export PATH=$PATH:$PYTHON_PATH" >> /home/re/.zshrc

WORKDIR /sandbox
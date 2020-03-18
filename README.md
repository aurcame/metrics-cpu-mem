# CPU and memory metrics script and Dockerfile


# About
---
This repository contains:
  - python script "**metrics**" that collect metrics about your linux server and prints basic information about your OS' cpu and memory  to console.
  - Dockerfile for building [aurcame/metrics](https://hub.docker.com/repository/docker/aurcame/metrics) image.

# Metrics script
# Prerequisites
---
  This requried platform with insatlled [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
  and [Pyhon3](https://www.python.org/downloads/).

# Plugins
---
metrics script uses:
- [psutil](https://psutil.readthedocs.io/en/latest/) - cross-platform library for retrieving information on running processes and system utilization
- [colorama](https://pypi.org/project/colorama/) - cross-platform library for producing colored terminal text and cursor positioning
    
# Using "metrics" script
---

:


**cpu** - prints CPU metrics
**mem** - prints RAM metrics

and it accept second (optional) parameter:

**col** - prints information colorized 

# Running script
---
Examples:

CPU Metrics
```sh
$ ./metrics cpu
```
*Sample output:*
```sh
  system.cpu.idle 78.8
  system.cpu.user 17.3
  system.cpu.guest 0.0
  system.cpu.iowait 1.3
  system.cpu.stolen 0.0
  system.cpu.system 2.5
```

Memory Metrics
```sh
$ ./metrics mem 
```
*Sample output:*
```sh
  virtual total 16712351744
  virtual used 9190146048
  virtual free 1391624192
  virtual shared 287655116
  swap total 0
  swap used 0
  swap free 0
```

Colorized output:
```sh
$ ./metrics cpu col
```

# Plugins
---

metrics script uses:
- [psutil](https://psutil.readthedocs.io/en/latest/) - cross-platform library for retrieving information on running processes and system utilization
- [colorama](https://pypi.org/project/colorama/) - cross-platform library for producing colored terminal text and cursor positioning

# Install
---

First you need to clone repository to your local destination:
```sh
git clone git@github.com:aurcame/metrics-cpu-mem.git

```



# Metrics image
# Building docker image with Dockerfile
--- 
This Dockerfile builds an image based on [Ubuntu](https://hub.docker.com/_/ubuntu) [18.04](https://hub.docker.com/layers/ubuntu/library/ubuntu/18.04/images/sha256-4d07b5b0cd47c06a3ca847536a3e05901c6bf9d9f52dbb0e6a7fff9141453f11?context=explore) with [Pyhon3](https://www.python.org/downloads/) that starts the "**metrics**" script.

# Prerequisites
---
  This requried platform with insatlled [Docker](https://docs.docker.com/install/).
  To install Docker, please follow instructions according to your platform:
- [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
- [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
- [Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/)
- [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [MacOS desktop](https://docs.docker.com/docker-for-mac/install/)
- [Windows 10 desktop](https://docs.docker.com/docker-for-windows/install/)

# Running image
build and run the image with "**metrics**" script parameters
```sh
docker build -t metrics .
docker run -it --rm --name metrics aurcame/metrics mem col
```
*Output:*
```sh
  virtual total 16712351744
  virtual used 9190146048
  virtual free 1391624192
  virtual shared 287655116
  swap total 0
  swap used 0
  swap free 0
```

To be able to display information about processes running on the host machine from within the container environment you should run container with --pid=host parameter.
*example:*
```sh
  docker run -it --rm --entrypoint /bin/bash --pid=host aurcame/metrics
  ps aux
```

To display usernames for processes running on the host machine from within the container environment you should mount /etc/passwd as volume.
*example:*
```sh
  docker run -it --rm --entrypoint /bin/bash --pid=host -v /etc/passwd:/etc/passwd aurcame/metrics
  cat /etc/passwd
```

# Dockerhub repository
---
Please find resulted image in my DockerHub [repository](https://github.com/aurcame/metrics-cpu-mem)

# Contacts
---
If you have any questions please message me aurcame@gmail.com



##### License #####
---
##### Copyright (C) 2020 Free Software Foundation, Inc. #####
This file is part of GNU Make.

GNU Make is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation; either version 3 of the License, or (at your option) any later
version.

GNU Make is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.


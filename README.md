# CPU and memory metrics


# About
---
This repository contains Dockerimage for building [aurcame/metrics](https://hub.docker.com/repository/docker/aurcame/metrics) image.

And a python script "**metrics**" that collect metrics about your linux server and prints basic information about your OS' cpu and memory  to console.

# Prerequisites
---
  This requried platform with insatlled [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
  and [Pyhon3](https://www.python.org/downloads/).

# Plugins
---
metrics script uses:
- [psutil](https://psutil.readthedocs.io/en/latest/) - cross-platform library for retrieving information on running processes and system utilization
- [colorama](https://pypi.org/project/colorama/) - cross-platform library for producing colored terminal text and cursor positioning
    
# Using script
---
The script requred single parameter to specify which metrics set to print:


**cpu** - prints CPU metrics
**mem** - prints RAM metrics

and it accept second (optional) parameter:

**col** - prints information colorized 

# Running
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

# Building image
---
You can also build an image based on Ubuntu 18.04 and Python3 that starts the "**metrics**" script
First you need to clone repository to your local destination:
```sh
git clone git@github.com:aurcame/metrics-cpu-mem.git
```
then buid and run the image with "**metrics**" script parameters
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

# Dockerhub image 
---
Please find resulted image in my  [DockerHub repository](https://github.com/aurcame/metrics-cpu-mem)

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

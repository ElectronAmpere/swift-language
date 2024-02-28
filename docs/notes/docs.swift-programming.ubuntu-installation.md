---
id: 8p8n78se7yo8z162un5c5am
title: Ubuntu Installation
desc: ''
updated: 1689496430487
created: 1686993261698
---
## Installation Process

To install swift do the following mentioned below,

### Download

Download the swift release package from [Swift Download](https://www.swift.org/download/)

### Pre-requisities

Do run the following command before installing the swift package

```terminal
sudo apt-get install binutils\
                     git\
                     gnupg2\
                     libc6-dev\
                     libcurl4-openssl-dev\
                     libedit2\
                     libgcc-9-dev\
                     libpython3.8\
                     libsqlite3-0\
                     libstdc++-9-dev\
                     libxml2-dev\
                     libz3-dev\
                     pkg-config\
                     tzdata\
                     unzip\
                     zlib1g-dev
```

### Terminal Commands

Swift can be download either from the [[#download]] or using the `wget` command

#### Downloading via `wget`

The tarball is download using the following command

```terminal
wget https://download.swift.org/swift-5.8.1-release/ubuntu2004/swift-5.8.1-RELEASE/swift-5.8.1-RELEASE-ubuntu20.04.tar.gz
```

 The signature for the tarball is downloaded by the following command

```terminal
wget https://download.swift.org/swift-5.8.1-release/ubuntu2004/swift-5.8.1-RELEASE/swift-5.8.1-RELEASE-ubuntu20.04.tar.gz.sig
```

#### Verify Signature

```terminal
wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
```

```terminal
gpg --keyserver hkp://keyserver.ubuntu.com --refresh-keys Swift
```

```terminal
gpg --verify swift-5.8.1-RELEASE-ubuntu20.04.tar.gz.sig
```

#### Extract Package

The tarball is extracted by

```terminal
tar -xvzf swift-5.8.1-RELEASE-ubuntu20.04.tar.gz
```

The package is moved to the `/opt/` directory to manage all the similarily installed packages

```terminal
sudo mv swift-5.8.1-RELEASE-ubuntu20.04 /opt/swift
```

#### Setting Up Environment Path

Moving to `opt/swift/bin` directory

```terminal
cd /opt/swift/
cd usr/bin
pwd
```

Copying the path to source file

```terminal
echo "export PATH=/opt/swift/usr/bin:$PATH" >>~/.bashrc
source ~/.bashrc
```

## Links

[Swift Installation by itsfoss](https://itsfoss.com/use-swift-linux/#installing-swift-on-ubuntu-linux)

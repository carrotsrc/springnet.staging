#!/bin/bash

scp -P [PORT] $1 [USERNAME]@[IPADDRESS]:/releases/$1

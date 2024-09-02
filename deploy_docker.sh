#!/bin/bash

apt update -y
apt install -y docker.io
docker run devops45of/app:test

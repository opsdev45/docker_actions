#!/bin/bash

sudo apt update -y
sudo apt install -y docker 
sudo docker run devops45of/app:test

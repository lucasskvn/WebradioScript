#!/bin/bash

systemctl restart icecast2

export $(grep -v '^#' .env | xargs)

liquidsoap radio.liq 

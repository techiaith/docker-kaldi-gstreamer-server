#!/bin/bash

arecord -f S16_LE -r 16000 | python ../client.py -u ws://localhost:8080/client/ws/speech -r 32000 - 


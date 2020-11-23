#!/bin/bash

gpio write 28 1
sleep $1
gpio write 28 0
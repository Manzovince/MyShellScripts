#!/bin/sh

WORD=$1

grep -Ril "${WORD}" *

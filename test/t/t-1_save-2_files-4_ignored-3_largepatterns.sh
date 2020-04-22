#!/bin/bash
source ./lib.bash

# Test that multiple long ignore paths don't cause us to hit the
# command line argument length limit (MAX_ARG_STRLEN on Linux)

TestPhase_Setup ###############################################################
TestAddFile /lostfile1.txt 'Lost file contents'
TestAddFile /lostfile2.txt 'Lost file contents'
TestAddFile /lostfile3.txt 'Lost file contents'

TestAddConfig IgnorePath /lostfile1.txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile2.txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile"$(printf '%0.sa' {1..50000})".txt
TestAddConfig IgnorePath /lostfile3.txt

TestPhase_Run #################################################################
AconfSave

TestPhase_Check ###############################################################
TestExpectConfig <<EOF
EOF

TestDone ######################################################################

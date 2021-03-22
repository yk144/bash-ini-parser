#!/bin/bash
set -e
# cfg parse example

TOOL_HOME="$(cd $(dirname $0)/.. && pwd)"

. $TOOL_HOME/lib/cfg-parse.func

echo "cfg-parse demo"

cfg.parse $TOOL_HOME/cfg/cfg-parse.ini   # parse config

cfg.section.global                       # activate global variables section

for SECTION in $CFG_SECTIONS; do         # walk through all sections (except "global". "global" section should be activated only once)
  echo
  cfg.section.$SECTION                   # activate section variables
  echo "section: $SECTION"
  echo "foo=$foo"
  echo "bar=$bar"
  echo "baz=$baz"
  echo "quz=$quz"
  echo "quuuuuuz=$quuuuuuz"
  cfg.section.unset.$SECTION             # deactivate session variables
done

echo


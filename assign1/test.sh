#!/bin/sh

scam -r task1.scm preliminary/task1.0 > preliminary/task1.0.real
diff preliminary/task1.0.real preliminary/task1.0.expected

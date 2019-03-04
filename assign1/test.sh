#!/bin/sh

TESTS=preliminary

echo "Task 1 - Working and Tested\n"
scam -r task1.scm preliminary/task1.0 > preliminary/task1.0.mine
diff -s $TESTS/task1.0.mine $TESTS/task1.0.expected
 
echo "\nTask 2 - Working\n"
scam -r task2.scm preliminary/task2.0 > preliminary/task2.0.mine
diff -s $TESTS/task2.0.mine $TESTS/task2.0.expected

echo "\nTask 3 - Working and tested\n"
scam -r task3.scm preliminary/task3.0 > preliminary/task3.0.mine
diff -s $TESTS/task3.0.mine $TESTS/task3.0.expected

echo "\nTask 4 - Working and tested\n"
scam -r task4.scm preliminary/task4.0 > preliminary/task4.0.mine
diff -s $TESTS/task4.0.mine $TESTS/task4.0.expected

echo "\nTask 5 - Working and tested\n"
scam -r task5.scm preliminary/task5.0 > preliminary/task5.0.mine
diff -s $TESTS/task5.0.mine $TESTS/task5.0.expected

echo "\nTask 6 - Workign and tested\n"
scam -r task6.scm preliminary/task6.0 > preliminary/task6.0.mine
diff -s $TESTS/task6.0.mine $TESTS/task6.0.expected

echo "\nTask 7 - Working and tested. Fails on server though\n"
scam -r task7.scm preliminary/task7.0 > preliminary/task7.0.mine
diff -s $TESTS/task7.0.mine $TESTS/task7.0.expected

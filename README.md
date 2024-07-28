# hexadecimal-number-processor

This is my implementation of a project from Computer Computer Architecture course on the 1nd semester of 1st year of Software Engineering studies at Faculty of Technical Sciences in Novi Sad.

Overview

This repository contains an assembly subroutine that takes two hexadecimal numbers as input. The subroutine checks the number of zeros in each number and performs a bitwise AND or OR operation based on the results. The program demonstrates how to implement this logic using assembly language and includes a main.c file for testing.
Files

    main.c: The main C program that tests the assembly subroutine.
    testiraj.sh: A script for running tests.
    resenje: The solution to the given task.

Assembly Subroutine: poredjenjeBrojeva

The subroutine poredjenjeBrojeva takes two unsigned integers as input parameters and performs the following logic:

    Counts the number of zeros in each number.
    If both numbers have an even (or odd) number of zeros, returns the bitwise AND of the two numbers.
    If one number has an even number of zeros and the other an odd number (or vice versa), returns the bitwise OR of the two numbers.

Testing

The main.c file includes a simple test program to demonstrate the functionality of the poredjenjeBrojeva subroutine. The program prompts the user to input two hexadecimal numbers, displays their binary representation, and prints the result of the subroutine.
Usage

To compile and run the program, use the following commands:

    gcc -o main main.c

Note

This project was created for educational purposes as part of the Computer Architecture course and does not represent a real product or real organizations. All rights reserved.

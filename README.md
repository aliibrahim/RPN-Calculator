# RPN-Calculator

A Ruby module that implements a simple RPN calculator, without using 'eval'. The implementation evaluates expressions provided in Reverse Polish (Postfix) Notation. For example:
11 + 3 * 2 ­ 3 * = 12

The module should at a minimum implement addition, subtraction, multiplication and division and should
round answers to three decimal places using the following rule:

If the value of the digit in the fourth decimal place is less than 5, then truncate the result after the third decimal place. If the digit in the fourth decimal place is 5 or greater, then round up.

A client for the implementation that solicits multi­line user input at a prompt and uses the implementation to evaluate expressions. The user should be able to split the expression over a number of lines, with the final result displayed only when the user enters a line ending with ‘=’.
￼￼
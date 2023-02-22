import sys
from collections import deque
def prior(c):
    if c == '*' or c =='/':
        return 3
    if c == '+' or c =='-':
        return 4
    if c == '&':
        return 8
    if c == '^':
        return 9
    if c == '|':
        return 10
    return sys.maxsize
def operand(c):
    return('a'<= c <= 'z') or ('A' <= c <= 'Z') or ('0' <= c <= '9')
def infixpostfix(inf):
    s = deque()
    postfix = ''
    for c in inf:
        if c == '(':
            s.append(c)
        elif c == ')':
            while s[-1] != '(':
                postfix += s.pop()
            s.pop()
        elif operand(c):
            postfix += c
        else:
            while s and prior(c) >= prior(s[-1]):
                postfix += s.pop()
            s.append(c)
    while s:
        postfix += s.pop()
    return postfix
infix = '(A+B)*(A-B)+C'
postfix = infixpostfix(infix)
print(postfix)

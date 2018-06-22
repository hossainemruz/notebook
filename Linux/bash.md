> Bash Ref:
> https://tiswww.case.edu/php/chet/bash/bashref.html

### `if [ "${1:0:1}" = '-' ]; then`

This is going to take a substring of **$1** from the **0th** to the **1st** character. So you're going to get the first character and only the first character of the string.

```ini
  ${parameter:offset}
  ${parameter:offset:length}
          Substring  Expansion.   Expands  to  up to length characters of
          parameter starting at the character specified  by  offset.   If
          length is omitted, expands to the substring of parameter start-
          ing at the character specified by offset.   length  and  offset
          are  arithmetic  expressions (see ARITHMETIC EVALUATION below).
          length must evaluate to a number greater than or equal to zero.
          If  offset  evaluates  to a number less than zero, the value is
          used as an offset from the end of the value of  parameter.   If
          parameter  is  @,  the  result  is length positional parameters
          beginning at offset.  If parameter is an array name indexed  by
          @ or *, the result is the length members of the array beginning
          with ${parameter[offset]}.  A negative offset is taken relative
          to  one  greater than the maximum index of the specified array.
          Note that a negative offset must be separated from the colon by
          at  least  one space to avoid being confused with the :- expan-
          sion.  Substring indexing is zero-based unless  the  positional
          parameters are used, in which case the indexing starts at 1.
```

Ref: https://unix.stackexchange.com/questions/249869/meaning-of-101/249870

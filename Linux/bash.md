- [Bash Basic](#bash-basic)
  - [Some tricks](#some-tricks)
    - [Check if a file exist](#check-if-a-file-exist)
    - [Check first character of a string](#check-first-character-of-a-string)
    - [Remove `space` from a string](#remove-space-from-a-string)
    - [find all find with specific extension of directory and its subdirectory](#find-all-find-with-specific-extension-of-directory-and-its-subdirectory)

# Bash Basic

## Some tricks

### Check if a file exist

```bash
if [ ! -f /tmp/foo.txt ]; then
    echo "File not found!"
fi
```

> Bash Ref:
> https://tiswww.case.edu/php/chet/bash/bashref.html

### Check first character of a string

**Wildcard:**

```bash
str="/some/directory/file"
if [[ $str == /* ]]; then
  echo 1;
else
  echo 0;
fi
```

**Substring expansion:**

```bash
if [[ ${str:0:1} == "/" ]] ; then
  echo 1;
else
  echo 0;
fi
```

This is going to take a substring of **str** starting at the **0th** character with length **1**.

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

**Regex:**

```bash
if [[ $str =~ ^/ ]];then
  echo 1;
else
  echo 0;
fi
```

`^` indicates starting with.

Ref: https://medium.com/factory-mind/regex-tutorial-a-simple-cheatsheet-by-examples-649dc1c3f285

### Remove `space` from a string

```bash
str=" This sentence contains leading trailing and intermediate whitespaces "

## Remove leading whitespaces
lstr="$( echo "${str}" | sed -e 's/^[[:space:]]*//')"
echo "$lstr"

## Remove trailing whitespaces
tstr="$( echo "${str}" | sed -e 's/[[:space:]]*$//')"
echo "$tstr"

## Remove all white spaces
astr="$( echo "${str}" | tr -d '[:space:]')"
echo "$astr"
```

Ref: https://unix.stackexchange.com/questions/249869/meaning-of-101/249870

### find all find with specific extension of directory and its subdirectory

```console
find . -type f -name "*.conf"
```
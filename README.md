# tocgen
Produce a Table of Contents from a Markdown (.md) document.

## Table of Contents
  + [Introduction](#introduction)
  + [Dependencies](#dependencies)
  + [Files](#files)
  + [Usage](#usage)
  + [Example](#example)
    + [Stuff A](#stuff-a)
    + [Stuff B](#stuff-b)
      + [B.1](#b1)
      + [B.2](#b2)
      + [B.3](#b3)
    + [Stuff C](#stuff-c)
  + [History](#history)
  + [Author](#author)

## Introduction
This simple shell script reads a file that is in markdown format
and extracts all the headers. From this it produces a small
snippet of markdown which constitutes a table of contents of links.

## Dependencies
This is a shell script. Uses `sed` and `awk` and of course `/bin/sh`.
Oh and it uses `grep`. No other dependencies.

## Files
+ `tocgen.sh` - this is the shell script to run
+ `SAMPLE.md` - this is a sample file
+ `SAMPLE_TOC.md` - this is the output of the script.

## Usage
```
Standard Usage:
	$ ./tocgen.sh README.md > toc.md

Split Usage:
	$ ./tocgen.sh pass1 README.md > tmp.txt

Review the file tmp.txt for errors:
	$ ./tocgen.sh pass2 tmp.txt > toc.md

```

## Example
This is just made up stuff. The table of
contents for the README.md file was produced using
this script.

### Stuff A
Stuff A goes here.

### Stuff B
Stuff B goes here.
Now we have more sub stuff:

#### B.1
Here is the first subdivision of Stuff B

#### B.2
Here is the second subdivision of Stuff B

#### B.3
Here is the third subdivision of Stuff B

### Stuff C
Stuff C goes here.

## History
In 2023 I was writting a large README.md file. I wanted to
have a nice table of contents for it. I searched github for a solution.
The solutions all were convoluted pieces of crap. Over designed junk.
They didn't work! Standard crappy software by standard crappy developers.

## Author
Ken Stauffer

#!/bin/sh
#
# This script produces a markdown table of contents.
# The input to this shell script is a README.md file.
# However, Any suitable markdown document can be used.
#
# The simplest use case is this:
#
#	$ ./tocgen.sh README.md > toc.md
#
# However you may wish to manually review/edit the intermediate file
# to fix any incorrectly deduced headers. That is why the pass1
# and pass2 modes exist:
#
# Usage:
#
#	$ ./tocgen.sh pass1 README.md > tmp.txt
#
# Review the file tmp.txt. Fix any incorrectly deduces headers, then run:
#
#	$ ./tocgen.psh pass2 tmp.txt > toc.md
#
# The file toc.md will contain the table of contents in markdown format, which
# can then be cut and pasted back into README.md
#

#
# pass1 is simple, just find the markdown headers.
#
pass1()
{
	grep '^#' $1
}

#
# pass2 does the bulk of the work. Transforms the headers into
# the appropriate markdown links
#
pass2()
{
	sed -e 's/^####/      +/g'		\
		-e 's/^###/    +/g'			\
		-e 's/^##/  +/g'			\
		-e 's/^#/+/g'				\
		-e 's/^\([ ]*[+]\)\([ ]*\)\(.*\)$/\1\2[\3](URL)/'		\
		$1 | awk '{
			split($0, aa, "[")
			prefix = aa[1]
			split(aa[2], ab, "]")
			heading = ab[1]
			url = ab[2]

			x = tolower(heading)
			gsub("[^a-zA-Z0-9\\- _]+", "", x)

			gsub("[ ]", "-", x)

			if( x in linkdb ) {
				val = linkdb[x]
				x = x "-" (val)
				linkdb[x] = val+1
			} else {
				linkdb[x] = 1
			}

			print prefix "[" heading "](#" x ")"
		}'
}

usage()
{
	echo Usage:
	echo '1) tocgen.sh README.md > toc.md'
	echo '2) tocgen.sh pass1 README.md > tmp.txt'
	echo '3) tocgen.sh pass2 tmp.txt > toc.md'
	echo toc.md will contain a simple table of contents in markdown format.
	echo 'Perform the entire operation by using (1).'
	echo 'Split operation into two passes by using (2) and (3).'
	echo 'Review/Edit the file tmp.txt to fix any bad headers.'
}

if [ $# -eq 0 ]; then
	usage()
	exit 1
fi

if [ $# -eq 2 -a $1 = pass1 ]; then
	pass1 $2
elif [ $# -eq 2 -a $1 = pass2 ]; then
	pass2 $2
elif [ $# -eq 1 ]; then
	pass1 $1 | pass2
else
	usage()
	exit 1
fi

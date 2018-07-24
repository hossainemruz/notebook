#!/bin/bash
declare -a prefixArray

while IFS= read -r line; do
	#remove trailling space from line
	withoutTWS=$(sed -e 's/[[:space:]]*$//' <<<"$line")
	#remove leading spaces from line
	withoutLTWS=$(sed -e 's/^[[:space:]]*//' <<<"$withoutTWS")
	if ((${#withoutLTWS} > 0)); then #non empty line
		echo "$line"
		case $line in
		\#*) # commented line nothing todo
			;;
		*)
			#separate key value pair
			key=$(echo "$withoutLTWS" | awk -F: '{print $1}')
			value=$(echo "$withoutLTWS" | awk -F: '{print $2}')
			#remove leading spaces from value
			value=$(sed -e 's/^[[:space:]]*//' <<<"$value")

			leadingSpaces=$((${#withoutTWS} - ${#withoutLTWS}))
			level=$((leadingSpaces / 2))

			if ((${#value} > 0)); then #value field not empty. line to print.
				if ((level > 0)); then
					prefix=""
					for ((i = 0; i < level; i++)); do
						if ((i > 0)); then
							prefix=$(echo "$prefix.")
						fi
						prefix=$(echo "${prefix}${prefixArray[i]}")
					done
					echo "$prefix.$key: $value"
				else
					echo "$key: $value"
				fi
			else #value field empty. increase depth.
				prefixArray[level]=$key
			fi
			;;
		esac
	fi

done <file1.yaml

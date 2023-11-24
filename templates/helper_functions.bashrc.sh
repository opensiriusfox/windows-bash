#!/bin/bash
function qff() {
	printf "searching for files named '*"$*"*'\n" >&2
	find -type f -iname '*'$*'*'
}

function rv() {
	RV=$?
	if [[ $RV -eq 0 ]]; then
		COLOR='2'
	elif [[ $RV -eq 1 ]]; then
		COLOR='3'
	else
		COLOR='1'
	fi
	printf '\e[4%dm' $COLOR
	printf ' RV=%d \e[0m\n' $RV >&2
}


# When notepad++ is available, use it
function kate() {
    export IFS=$'\n'
    NOTEPADPP_EXE='/c/Program Files/Notepad++/notepad++.exe'
	if [[ -e "${NOTEPADPP_EXE}" ]]; then
		echo 'notepad++.exe '$*' &'
	    "${NOTEPADPP_EXE}" $* &
    	return 0
    else
    	echo "notepad++ not found."
    	return 1
    fi
}



# Function to proceed script if a command ran successfully.
checkStat () {
	if [ "$1" -eq "0" ];
	then
    echo "SUCCESSFUL TRANSFER"
	else
    echo "ERROR: FAILED TRANSFER. EXITING SCRIPT"
    exit 0
fi
}



# Edited some code? just type 'gitCommitAll yourcommitmessagehere'
gitCommitAll() {
   git add --all
   git commit -m $1
   git push -u origin master
} 

# Git Shortcut Commands
alias gs="git status"
alias gall="git add --all"
alias ga="git add"
alias gcm="git commit -m"
alias gpm="git push -u origin master"

# download file from server
dwnKM() {
 scp usermame@serverAddress:$1 $2 	
}

# upload file to server
upKM() {
 scp $1 usermame@serverAddress:$2
}

# find a file under a sub dir real quick
showme() {
	sudo find . -print | grep -i '.*[.]$1'
}

# Delete Annoying Mac .DS_STORE file
delfile() {
 find . -name "*$1" -type f -delete
}

# nohup process save pid
npsh() {
nohup sh $1 > my.log 2>&1&
echo $! > save_pid.txt
cat save_pid.txt
echo "To Terminate Nohup Job Type 'kill -9 \`cat save_pid.txt\`'"
}

# Function to check if the generated HDFS directory exists
checkHDFSFileExists () {
	if hdfs dfs -test -e $1
	then
	echo "'$1' DIRECTORY EXISTS"
	else
	echo "ERROR: '$1' DIRECTORY DOES NOT EXIST! SCRIPT TERMINATED!"
	exit 0
	fi
}

# check file size u
checkSize() {
  hdfs dfs -du -h "$1"
}

# Hadoop Shortcuts
alias hdls="hdfs dfs -ls"
alias hdput="hdfs dfs -put $1 dir/" # Only Put Sample Data
alias hdmkdir="hdfs dfs -mkdir"
alias hdtext="hdfs dfs -text"
alias hdput="hdfs dfs -put"
alias hdcat="hdfs dfs -cat"
alias hdcsv="hdfs dfs -getmerge"
alias hdrmr="hdfs dfs -rmr"
alias hdsize="hdfs dfs -du -h"
alias hdnm="hdfs dfs -stat \"%n\""
alias yarnstats="yarn application -list | grep userid"
alias yarnkill="yarn application -kill"
alias hdfsck="hdfs fsck"


# Command to compile and upload Spark Jar file
fireSpark() {	
	sbt assembly || exit 1
    scp -r ./target/scala-2.10/*.jar username@serveraddress:$1
}



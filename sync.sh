#!/bin/bash
while true; do
	git fetch demo
	git fetch mirror

	if [ ! -z "$(git rev-list demo/master..mirror/master)" ]; then
		echo "Updating demo/master to new commits in mirror.";
		git push demo mirror/master:master
	fi

	if [ ! -z "$(git rev-list mirror/master..demo/master)" ]; then
		echo "Updating mirror/master to new commits in mirror.";
		git push mirror demo/master:master
	fi

	# Wait 60 seconds
	sleep 60;
done

#cool, but how would this work with a 4-way cloner? And can I set the frequency higher? Like every 3 seconds? :P or why not make it use a python script that exits when it recieves any data

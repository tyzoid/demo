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

function remove-docker-containers
	echo "Stop running shit"
	docker stop (docker ps -q)
	echo "Remove the whale shit"
	docker rm (docker ps -a -q)
end

function remove-docker-images
	remove-docker-containers

	echo "Remove pictures of whale shit"
	docker rmi (docker images -f "dangling=true" -q)
end

function captain-ahab
	remove-docker-images
	echo "Fucking shit, those silly fucking whales eating my fucking disk. I'll show them."
	docker volume rm (docker volume ls -qf dangling=true)
	echo "done m8"
end

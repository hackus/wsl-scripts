$DOCKER_DISTRO="Ubuntu-22.04"
$DOCKER_DIR="/mnt/wsl/shared-docker"
$DOCKER_SOCK="$DOCKER_DIR/docker.sock"
$DOCKER_HOST="unix://$DOCKER_SOCK"
function docker {
	echo $DOCKER_DISTRO
    wsl -d $DOCKER_DISTRO docker -H unix:///mnt/wsl/shared-docker/docker.sock @Args
}
function docker-compose {
	echo $DOCKER_DISTRO
    wsl -d $DOCKER_DISTRO docker-compose @Args
}
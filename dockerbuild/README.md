# Docker Build Script

Below are some examples command for building a docker image.   You need to create a file in your repo with docker repo name in it.   The file you need to create is 'docker_repo_name' in the root directory of your repo.


# Build and image from the main/master repo
EG
./make_docker_image.sh <git repo>

./make_docker_image.sh https://github.com/dbca-wa/boranga.git

# Build and image from another branch
EG    
./make_docker_image.sh <git repo> <git branch>

./make_docker_image.sh https://github.com/dbca-wa/boranga.git dev

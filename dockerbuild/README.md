# Docker Build Script

# Build and image from the main/master repo
EG
./make_docker_image.sh <git repo>

./make_docker_image.sh https://github.com/dbca-wa/boranga.git

# Build and image from another branch
EG    
./make_docker_image.sh <git repo> <git branch>

./make_docker_image.sh https://github.com/dbca-wa/boranga.git dev

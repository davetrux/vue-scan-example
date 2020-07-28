#!/bin/bash

echo 'Clean up build directory'
# BE CAREFUL!!!
# Running this command locally can accidentally delete any files you've added to the project but not to git
git clean -fdx

echo 'npm tasks'
# Install dependencies
npm install

# Run unit tests
npm run test:unit

npm run build

# Create a Docker image
echo 'Docker tasks'
imageName="demo-web:1.0."

if [ -z ${BUILD_NUMBER+x} ];
	then
		echo "var is unset"
		imageName="${imageName}1"
		echo "build set to one";
	else
		echo "var is set to '$var'"
		imageName="${imageName}${BUILD_NUMBER}"
		repoName="${repoName}${BUILD_NUMBER}"
fi

docker build -t "${imageName}" .

# Remove running instances
echo 'Stop running container'
docker stop demo_web || true

echo 'Remove existing container'
docker rm demo_web || true

echo 'Start a new container'
# Start a container with this image
docker run --name demo_web --restart=always -v /data/log/demo-web:/var/log/nginx/log:rw -p 80:80 -p 443:443 -d "${imageName}"

# Clean up unused images
echo 'Remove old images'
# docker image prune -f

# Scan with dependency-check
echo 'Scan dependencies'
mkdir reports || true
dependency-check --scan ./ -f JSON -f HTML -f XML -o reports

echo 'SonarQube analysis'
# Run SonarQube scanner
./node_modules/sonarqube-scanner/dist/bin/sonar-scanner

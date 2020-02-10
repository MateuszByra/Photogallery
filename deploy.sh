echo $(docker inspect registry.heroku.com/${HEROKU_APP_NAME}/web --format={{.Id}})
WEB_DOCKER_IMAGE_ID=$(docker inspect registry.heroku.com/${HEROKU_APP_NAME}/web --format={{.Id}})
echo "WEB_DOCKER_IMAGE_ID=$WEB_DOCKER_IMAGE_ID"

curl -n -X PATCH https://api.heroku.com/apps/${HEROKU_APP_NAME}/formation \
  -d '{
  "updates": [
    {
      "type": "web",
      "docker_image": "'"$WEB_DOCKER_IMAGE_ID"'"
    }
  ]
}' \
-H "Content-Type: application/json" \
-H "Accept: application/vnd.heroku+json; version=3.docker-releases" \
-H "Authorization: Bearer ${HEROKU_API_KEY}"
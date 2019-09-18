# curl (REST API)
# User
JENKINS_USER=anandraman

# Api key from "/me/configure" on my Jenkins instance
JENKINS_USER_KEY=11e9f9c645d93a941e38d5d95c552008f3

# Url for my local Jenkins instance.
JENKINS_URL=http://$JENKINS_USER:$JENKINS_USER_KEY@localhost:8080

# JENKINS_CRUMB is needed if your Jenkins master has CRSF protection enabled (which it should)
JENKINS_CRUMB=`curl "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)"`
curl -X POST -H $JENKINS_CRUMB -F "jenkinsfile=<Jenkinsfile" $JENKINS_URL/pipeline-model-converter/validate

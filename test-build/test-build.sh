#!/bin/sh

#cd ${WORKSPACE}/src
#docker build -t 172.31.7.232:5000/python-redis-demo:b${BUILD_NUMBER} .
#docker push 172.31.7.232:5000/python-redis-demo:b${BUILD_NUMBER}
#cd ${WORKSPACE}/test-build

sed -i 's/\$\$BUILD_NUMBER\$\$/'${BUILD_NUMBER}'/g' docker-compose.yml
sed -i 's/\$\$PORT_NUMBER\$\$/'`expr 5000 + ${BUILD_NUMBER}`'/g' docker-compose.yml
chmod 777 ./rancher-compose
./rancher-compose --url http://52.78.73.245:8080/v1/projects/1a5 --access-key 991E0C04928D36A1394A --secret-key t5XMFcGQdZgDrZPwxqpoZVRQtUxgHWpuEn4MJN66 -p python-redis-demo-build${BUILD_NUMBER} up -d
#./rancher-compose --url http://10.0.0.5:8080 --access-key CA23527D9BE1E5855619 --secret-key GF6Q1vMsimqY8MHp6t17eqoZXcbQ8VEBcjU11z7H -p python-redis-demo-build27 up --pull -d --upgrade pyapp
# --confirm-upgrade

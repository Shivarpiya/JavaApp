echo "starting....."
aws_access_key=`cat credentials | grep -i "aws_access_key_id" | awk '{print $3}'`
aws_secret_access_key=`cat credentials | grep -i "aws_secret_access_key" | awk '{print $3}'`
pwd
cd /root/aevolume
docker-compose up -d
docker-compose ps
export PATH="$PATH:/root/.local/bin"
echo $PATH
python -m site --user-base
docker-compose exec engine-api system status
pip install --user --upgrade anchorecli
docker-compose exec engine-api anchore-cli system status
docker-compose exec engine-api anchore-cli system feeds list
anchore-cli image list
#anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image add openjdk:11-jdk
#anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image vuln openjdk:11-jdk all
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 registry add 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample $aws_access_key $aws_secret_access_key --registry-type=awsecr
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image add 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample:latest
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image vuln 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample:latest all

echo "starting....."
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
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image add openjdk:11-jdk
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image vuln openjdk:11-jdk all

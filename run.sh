docker-cokpose up -d

docker cp games_may2024_cleaned.csv namenode:/

docker exec -it namenode bash
hdfs dfs -mkdir -p /user/root/input
hdfs dfs -put games_may2024_cleaned.csv /user/root/input
exit

docker exec -it spark-worker-1 bash
apk add --update make automake gcc g++
apk add --update python-dev
apk add linux-headers
pip install pyspark
exit

docker cp spark_app.py spark_master:/
docker exec -it master bash
apk add --update make automake gcc g++
apk add --update python-dev
apk add linux-headers
pip install pyspark

spark/bin/spark-submit spark_app.py

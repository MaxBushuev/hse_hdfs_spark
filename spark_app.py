import pyspark 
from pyspark.sql import SparkSession
from pyspark.sql.types import StructType

spark = (
    SparkSession
    .builder
    .appName('game_stats')
    .getOrCreate()
)

data = spark.read.csv("hdfs://namenode:9001:input/games_may2024_cleaned.csv", inferSchema=True, header=True)
data.show(5)
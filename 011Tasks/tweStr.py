#PUBLIC IMPORTS
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
from kafka import KafkaProducer,KafkaClient
import time
import json

#LOCAL IMPORTS
import cred as myCred

#kafka settings
server="localhost:9092"
topicName="corona"
producer = KafkaProducer(bootstrap_servers=[server])

class StdOutListener(StreamListener):
	def __init__(self,limit=5):
		self.startTime =time.time()
		self.limit=limit
	def on_data (self,data):
		if(time.time()-self.startTime)<self.limit:
			producer.send(topicName, data.encode('utf-8'))
			print(json.loads(data))
			return True
		else:
			return False
	def on_error(self,status):
		if status==420:
			return False
	def getData(self,data):
		return json.loads(data)

if __name__=="__main__":
	#server="localhost:9092"
	#topicName="corona"
	#producer = KafkaProducer(bootstrap_servers=[server])


	listener=StdOutListener()
	auth=OAuthHandler(myCred.API_KEY,myCred.API_SECRET_KEY)
	auth.set_access_token(myCred.ACCESS_TOKEN,myCred.ACCESS_TOKEN_SECRET)
	stream = Stream(auth,listener)
	stream.filter(track=[topicName])

	#producer = KafkaProducer(bootstrap_servers=[server],
	#			 value_serializer=lambda v: json.dumps(v).encode('utf-8'))

	
	#producer.send(topicName,data)
	#producer.flush()
	#for e in range(1000):
	#	data = {'number' : e}
	#	producer.send(topicName, value=stream.filter(track=[topicName]).encode())
	#	time.sleep(5)

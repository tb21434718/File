package KafkaUtil;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.util.*;

public class KafkaProducerAction{
	String servers="192.168.133.135:9092,192.168.133.130:9092,192.168.133.132:9092";
    
	public static void send(String s[]) {
		//ArrayList a= new ArrayList(123,134,7,20180310);//用户编号，电影标号，评分，时间
		String a[]= {"1124","26611804","8.7","20182018"};
		String topic="test3";
		Properties props = new Properties();
	    props.put("bootstrap.servers", "192.168.133.130:9092");
	    props.put("acks", "all");
	    props.put("retries", 0);
	    props.put("batch.size", 16384);
	    props.put("linger.ms", 1);
	    props.put("buffer.memory", 33554432);
	    props.put("producer.type","async");
	    props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	    props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	 
	    Producer<String, String> producer = new KafkaProducer<String, String>(props);
	   // for(int i=0;i<1;i++)
	    System.out.println(s[0]+","+s[1]+","+s[2]+","+s[3]);
	    producer.send(new ProducerRecord<String, String>(topic,s[0]+","+s[1],s[0]+","+s[1]+","+s[2]+","+s[3]));
	   // for(int i = 98; i < 100; i++)
	   //   producer.send(new ProducerRecord<String, String>("test", Integer.toString(i)+"key", Integer.toString(i)+"value"));
	 
	    producer.close();

	}
	/*
	 * 参数是电影具体信息： id,name,...
	 */
	
	public static void movieadd(String movieid) {
		Properties props = new Properties();
		String topic="movieadd";	
	    props.put("bootstrap.servers", "192.168.133.130:9092");
	    props.put("acks", "all");
	    props.put("retries", 0);
	    props.put("batch.size", 16384);
	    props.put("linger.ms", 1);
	    props.put("buffer.memory", 33554432);
	    props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	    props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	 
	    Producer<String, String> producer = new KafkaProducer<String, String>(props);
	    for(int i=0;i<1;i++)
	    producer.send(new ProducerRecord<String, String>(topic,movieid,movieid));
	   // for(int i = 98; i < 100; i++)
	   //   producer.send(new ProducerRecord<String, String>("test", Integer.toString(i)+"key", Integer.toString(i)+"value"));
	 
	    producer.close();
		
	}
	//parameter:movieid
	public static void movieupdate(String movieid)
	{
		Properties props = new Properties();
		String topic="movieupdate";	
	    props.put("bootstrap.servers", "192.168.133.130:9092");
	    props.put("acks", "all");
	    props.put("retries", 0);
	    props.put("batch.size", 16384);
	    props.put("linger.ms", 1);
	    props.put("buffer.memory", 33554432);
	    props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	    props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
	 
	    Producer<String, String> producer = new KafkaProducer<String, String>(props);
	    for(int i=0;i<1;i++)
	    producer.send(new ProducerRecord<String, String>(topic,movieid,movieid));
	    producer.close();
	}
	
	/*public static void main( String[] args ) {
		KafkaProducerExample k=new KafkaProducerExample();
		k.send();
		
	}*/

}


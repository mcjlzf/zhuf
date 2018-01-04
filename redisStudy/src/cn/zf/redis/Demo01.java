package cn.zf.redis;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import redis.clients.jedis.Jedis;

public class Demo01 {

	public static void main(String[] args) {
		
		Jedis jedis = new Jedis("localhost");
		
		System.out.println(jedis.ping());
		
//		testString(jedis);
		
//		testList(jedis);
		
//		delKey("tag", jedis);
		
		Map<String, String> map = jedis.hgetAll("user:1");
		
		System.out.println(map.get("points"));
		
		getAllKsys(jedis);
		
		jedis.close();
		
	}
	
	public static void testString(Jedis jedis) {
		
		jedis.set("moon", "earth");
		
		System.out.println(jedis.get("moon"));
		
	}
	
	
	public static void testList(Jedis jedis) {
		
		jedis.lpush("testList", "ls1", "ls2");
		jedis.lpush("testList", "ls3", "ls4");
		
		List<String> list = jedis.lrange("list", 0, 3);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
		}
		
	}
	
	
	public static void getAllKsys(Jedis jedis) {
		
		Set<String> keys = jedis.keys("*");
		
		Iterator<String> iterator = keys.iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(key);
		}
		
	}
	
	
	public static void delKey(String key, Jedis jedis) {
		
		Long result = jedis.del(key);
		
		if (result == 1) {
			
			System.out.println("delete success!");
		}
	}
	
}













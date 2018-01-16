package com.board.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;

public class NotificationService{

	
	private SocketChannel socket = null;
	//private static Selector selector;
	private static ByteBuffer buf = ByteBuffer.allocate(256);
	
	public NotificationService() throws IOException {
		
			//SocketAddress addr = new InetSocketAddress("59.27.177.110", 7777);
			//this.socket = SocketChannel.open();
			//socket.connect(addr);
		
		
			//this.selector = Selector.open();
			//socket.register(selector, SelectionKey.OP_ACCEPT);
	}

	public void send(String msg) throws IOException{
		Charset charset = Charset.forName("UTF-8");
		buf = charset.encode(msg);
		socket.write(buf);
		
	}
	
	public JsonNode test() throws Exception{
		URL url = new URL("https://kapi.kakao.com/v1/push/register");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setDoOutput(true);
		conn.setDoInput(true);
		conn.setRequestProperty("Content-Type", "apllication/json");
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Accept", "*/*");
		conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
		conn.setRequestProperty("Authorization", "KakaoAK "+"Ig3fiiVc703Gdgt6C8IgH5YU1gXBUt1TyQBghQo8BkMAAAFggc5kRA");
		
		JSONObject data = new JSONObject();
		data.put("uuid","680190381");
		data.put("push_type", "gcm");
		data.put("push_token", "AAAAz2vP82A:APA91bHrqCD0B6pgt4RGz8xsHBauPSV1fX3vkSxXBVepThtSiyTvhsPF0_uDDFAf-1fqThtp13zMOb5kFzstwZmED0Lb1XnoFRaXttr206ZmSAh6B2bGYvEppWhfw8cmNnB7jjcX-Ezp");
		data.put("device_id", "123456");
		
		OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
		
		JsonNode returnNode = null;
		
		try{
			osw.write(data.toString());
			osw.flush();
			
			BufferedReader br = null;
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			
			String line = null;
			
			ObjectMapper mapper = new ObjectMapper();
			while((line = br.readLine()) != null){
				System.out.println(line);
			}
			osw.close();
			br.close();
		}catch(MalformedURLException e){
			e.printStackTrace();
		}
		
		return returnNode;
	}
	
}

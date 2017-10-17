package com.board.service;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;

public class NotificationService {

	
	public static SocketChannel socket = null;

	public static void start() throws IOException {

		
		try {
			SocketAddress addr = new InetSocketAddress("192.168.0.6", 7777);
			socket = SocketChannel.open();
			socket.connect(addr);
			while(true){
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(socket.isConnected()==false)
			socket.close();
		}
	}
	
	public static void send(String msg) throws IOException{

		Charset charset = Charset.forName("UTF-8");
		ByteBuffer buffer = charset.encode(msg);
		while(true){
			socket.write(buffer);
		}
	}


}

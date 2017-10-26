package com.board.service;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;

public class NotificationService{

	
	private SocketChannel socket = null;
	//private static Selector selector;
	private static ByteBuffer buf = ByteBuffer.allocate(256);
	
	public NotificationService() throws IOException {
		
			SocketAddress addr = new InetSocketAddress("59.27.177.110", 7777);
			this.socket = SocketChannel.open();
			socket.connect(addr);
			//this.selector = Selector.open();
			//socket.register(selector, SelectionKey.OP_ACCEPT);
	}

	public void send(String msg) throws IOException{
		Charset charset = Charset.forName("UTF-8");
		buf = charset.encode(msg);
		socket.write(buf);
		
	}
	

}

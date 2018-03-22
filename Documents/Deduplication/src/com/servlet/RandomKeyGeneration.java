package com.servlet;

import java.util.Random;

public class RandomKeyGeneration {
	
	static String publickey;
	
	public static void main(String[] args) {
        String ran[]={"1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		String r1=(ran[new Random().nextInt(ran.length)]);
		String r2=(ran[new Random().nextInt(ran.length)]);
		String r3=(ran[new Random().nextInt(ran.length)]);
		String r4=(ran[new Random().nextInt(ran.length)]);
		String r5=(ran[new Random().nextInt(ran.length)]);
		publickey=r1+r2+r3+r4+r5;
		
		
		
	}

}

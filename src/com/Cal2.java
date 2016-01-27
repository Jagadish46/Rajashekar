package com;

import java.io.BufferedReader;
import java.io.InputStreamReader;
public class Cal2 {
	public static void main(String[] args){
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    int bill = 0;               
	try{
		System.out.println("enter number of products");
		int r=Integer.parseInt(br.readLine());
		System.out.println("enter"+r+" prices");
		for(int i=0;i<r;i++){
	        int read = Integer.parseInt(br.readLine());
	        bill=bill+read;
		}

	    System.out.println("total bill=" + bill);
	}
	catch(Exception e){
	e.getMessage();
	}
	}
}

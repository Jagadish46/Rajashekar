package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Cal1 {
	public static void main(String[] args){
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		String a,b,d[] = null;
		int in[] = null, in1 = 0;
		int c=0,d=0;
		try{
			System.out.println("enter number of products");
			a=br.readLine();
			int a1=Integer.parseInt(a);
			System.out.println("enter"+a1+"prices");
			for(int i=0;i<=a1;i++){
				d[i]=br.readLine();
			}
			for(int ii=0;ii<a1;ii++){
			System.out.println("the prices are"+d[ii]);
			}
			for(int k=0;k<a1;k++){
				in[k]=Integer.parseInt(d[k]);
			}
			for(int j=0;j<=a1;j++){
				in1=in1+in[j];
			}
			System.out.println("total bill="+in1);
		}
		catch(Exception e){
			e.getMessage();
		}
		
	}

}

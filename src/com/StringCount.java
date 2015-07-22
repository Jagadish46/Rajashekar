package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ArrayIndexOutOfBoundsException;

public class StringCount {

	public static void main(String[] args) throws IOException, ArrayIndexOutOfBoundsException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String str = br.readLine();
		int count = 0;
		String s[] = str.split(" ");
		int length = str.length();
		for (int i = 0; i < length; i++) {
			try {
				String a = s[i];
				count++;
				// System.out.println(a);
			} catch (ArrayIndexOutOfBoundsException e) {
				e.getMessage();
			}
		}
		System.out.println("the number of words in the given String are:" + count);
	}

}

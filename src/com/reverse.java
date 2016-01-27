package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ArrayIndexOutOfBoundsException;

public class reverse {

	public static void main(String[] args) throws IOException, ArrayIndexOutOfBoundsException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String str = br.readLine();
		String s[] = str.split(" ");
		String reverse = "";
		int count = str.length();
		for (int i = count - 1; i >= 0; i--) {
			try {
				reverse += s[i] + " ";
				// System.out.println(reverse);
			} catch (Exception ex) {
				ex.getMessage();
			}
		}
		System.out.println(reverse);
	}

}

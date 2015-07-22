package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class prime {

	public static void main(String[] args) throws IOException {
		int a = 0;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String number = br.readLine();
		a = Integer.parseInt(number);
		if ((a % 1 == 0) && (a % a == 0)) {
			if (a == 2 || a == 3 || a == 5) {
				System.out.println("the given number is a prime number");
			} else if ((a % 2 == 0) || (a % 3 == 0) || (a % 4 == 0) || (a % 5 == 0)) {
				System.out.println("the number is not a prime number");

			} else {
				System.out.println("the given number is a prime number");
			}
		}
	}
}

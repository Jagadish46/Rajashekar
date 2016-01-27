package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class Wordcount {

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String str = br.readLine();
		String[] splitStr = str.split(" ");
		int count = 0;
		List<String> list = new ArrayList<>();
		for (String s : splitStr) {
			if (!list.contains(s)) {
				list.add(s);
			}
		}
		for (int i = 0; i < (splitStr.length) - 1; i++) {
			for (int j = 0; j < splitStr.length; j++) {
				if (list.get(i).equals(splitStr[j])) {
					count++;
				}
			}
			System.out.println(list.get(i) + " - " + count);
			count = 0;
		}
	}

}

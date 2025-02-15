package com.mystudy.io4_filecopy;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileCopy {

	public static void main(String[] args) {
		// 파일복사 : 원본 파일에서 읽고, 대상 파일에 쓰기
		// 복사할 원본 파일(source file : AS-IS)
		// File file = new File("src/com/mystudy/io4_filecopy/FileCopy.java");
		File file = new File("바이트_InputStream.png");

		// 쓰기 위한 대상 파일(target file : TO-BE)
		// File fileOut = new File("file/FileCopy.java_backup");
		File fileOut = new File("file/바이트_InputStream_backup.png");

		// 파일을 읽고 쓰기 위한 객체 저장할 변수 선언
		FileInputStream fis = null;
		FileOutputStream fos = null;

		try {
			// 1. 파일에 읽고, 쓸 객체 생성
			fis = new FileInputStream(file); // byte 단위로 파일에서 읽기
			fos = new FileOutputStream(fileOut); // byte 단위로 파일에 출력

			// 2. 1 byte 읽고, 1 byte 쓰기
			int value = 0;
			while (true) {
				value = fis.read();
				if (value == -1)
					break; // EOF 이면 반복 종료
				fos.write(value);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		System.out.println("---- main() 끝 ------");
	}

}

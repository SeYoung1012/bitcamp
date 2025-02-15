package com.mystudy.extends2;

class PhoneTset {

	public static void main(String[] args) {
		//Phone 객체 생성 후 기능 테스트
		System.out.println("=====Phone======");
		Phone ph1 = new Phone("010-000-0000");
		ph1.view();
		ph1.call();
		ph1.receiveCall();
		
		
		Phone ph2 = new Phone("삼성갤럭시" , "010-2222-2222");
		ph2.view();
		ph2.call();
		ph2.receiveCall();
		
		String str = ph2.toString(); //Object 클래스의 to String() 메소드 사용
		System.out.println(str);
		System.out.println(ph2.toString());
		System.out.println(ph2);
		
		
		System.out.println("=====Mp3Phone======");
		Mp3Phone mp3ph = new Mp3Phone("010-3333-3333");
		mp3ph.view();
		mp3ph.call();
		mp3ph.receiveCall();
		System.out.println("전화번호 : " + mp3ph.getPhoneNo()); //부모클래스 폰넘버를 상속받아서 엠피쓰리 폰 넘버 나옴
		mp3ph.playMusic();
		
		
		System.out.println("=====WebPhone======");
		WebPhone webph = new WebPhone("010-4444-4444");
		webph.view();
		webph.call();
		webph.receiveCall();
		webph.webSearch();
		webph.playMusic();
		webph.webSearch("코로나19");
		
		WebPhone webph2 = new WebPhone("크롬브라우저폰" , "010-5555-5555");
		webph2.view();
		
		
	}

}

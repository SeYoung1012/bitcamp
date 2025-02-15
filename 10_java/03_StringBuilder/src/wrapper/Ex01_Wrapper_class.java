package wrapper;

public class Ex01_Wrapper_class {

	public static void main(String[] args) {
		//Wrapper class : 기본 데이터 타입의 기능을 확장한 클래스 총칭
		//기본 데이터 타입: 전체 소문자(char, int, ...)
		// boolean, char, byte, short, int , long, float, double
		//Wrapper class : 기본 데이터 타입의 첫 글자를 대문자.
		//예외 : Char -> Character int -> Integer 
		//Boolean,  Char, Byte, Short, Int , Long, Float, Double
		
		//-----------------------------------------------------
		int num = 100;
		
	//	Integer intNum = new Integer(100); 권장하지 않음
		Integer intNum = 100; //자동 형변환 Integer <- int 
		//intNum = new Integer("100");
		intNum = Integer.valueOf("100"); //Integer  <- String 
		
		num = Integer.parseInt("100"); //int <- String 
		
		intNum = 900; //Integer <- int  : 자동형변환
		
		num = intNum; //int <- Integer : 자동형변환
		
		System.out.println("정수형 int 최대값 : " + Integer.MAX_VALUE);
		System.out.println("정수형 int 최소값 : " + Integer.MIN_VALUE);
		
		System.out.println("--------Boolean ------");
		Boolean bool = true;
		
		bool = new Boolean("true"); //true " true, TRUE 
		System.out.println("bool :" + bool);
		
		System.out.println(Boolean.TRUE);
		System.out.println(Boolean.FALSE);
		
		System.out.println("String -> Boolean ---");
		bool = Boolean.valueOf("true");
		System.out.println("Boolean.valoeOf (\"true\") : "  + bool);
		bool = Boolean.valueOf("TRUE");
		System.out.println("Boolean.valoeOf (\"TRUE\") : "  + bool);
		bool = Boolean.valueOf("true1");
		System.out.println("Boolean.valoeOf (\"true1\") : "  + bool);
		
		
		System.out.println("----Float , Double -----");
		Float f = 10.5f; //Float <- float
		f = new Float(12.5f);
		f = new Float("12.5f");
		
		//Float <- String 
		f = Float.valueOf("12.5f");
		System.out.println("f : " + f );
		
		// String <- Float
		String str = String.valueOf(f);
		System.out.println("str : " + str);
		//----------------------------------------
		
		Double d = 10.5; //Double <- double
		d = new Double (12.5d);
		d = new Double (12.5d);
		
		//String <- Double
		str = String.valueOf(d);
		System.out.println("str : " + str);
		
		//Double <- String
		d = Double.valueOf("12.5d");
		d = Double.valueOf(str);
		System.out.println("d : "  + d);
		
		
	}

}

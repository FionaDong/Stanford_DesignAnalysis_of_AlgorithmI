import java.util.Arrays;
public class Algorithm{
  public static void main(String[] args){
    // System.out.println((0 + 15)/2);
    // System.out.println(2.0e-6 * 100000000.1);
    // System.out.println(1 + 2 + 3 +4.0);
    // System.out.println(4.1 > 4);
    // System.out.println((1 + 2.356)/2);
    // System.out.println(1 + 2 + "3");
    // System.out.println(args[0]);
    // System.out.println(args[1]);
    // if(args[0].equals(args[1]) && args[1].equals(args[2])){
    //   System.out.println("equal");
    // }else{
    //   System.out.println("not equal");
    // }
    // System.out.println("2" == "2");
    // System.out.println((char)('a' + 4));
    // Integer in = new Integer(Integer.parseInt("3"));
    // System.out.println(in.toString());
    // Integer N = new Integer(2);
    // System.out.println(Integer.toBinaryString(N));
    // String s = "";
    // for(int n = N; n > 0; n /= 2){
    //   s = (n % 2) + s;
    // }
    // System.out.println(35/2);
    // Array[][] twoDimen = new Array(new Array(3));
    int[] oneDimen = new int[args.length];
    for(int i = 0; i < oneDimen.length; i++){
      oneDimen[i] = args[i];
    }
    for(int i = 0; i < oneDimen.length; i++){
      System.out.println(oneDimen[i]);
    }

  }  
}

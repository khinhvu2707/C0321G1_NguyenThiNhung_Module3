public class Mi {
    public static void main(String[] args) {
        String test = "asdsadsadsad   dhg";
        String[] test1 = test.split("");
        int count =0;
        for (String string: test1){
            count++;
        }
        System.out.println(count);
    }
}

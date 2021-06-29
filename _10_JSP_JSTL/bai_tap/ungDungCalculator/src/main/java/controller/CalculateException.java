package controller;

public class CalculateException {
    public static void Calculate(float second) throws Exception {
        if (second == 0) {
            throw new Exception("Can't divide by zero");
        }
    }
}

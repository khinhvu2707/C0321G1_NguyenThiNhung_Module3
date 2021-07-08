package model.service.common;

public class Validate {
    public static String validateName(String name) {
        String message = null;
        String regex = "([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        if (!name.matches(regex)) {
            message = "Tên phải viết hoa kí tự đầu tiên!";
        }
        return message;
    }
    public static String validateCustomerCode(String name) {
        String message = null;
        String regex = "^KH-\\d{4}$";
        if (!name.matches(regex)) {
            message = "Mã khách hàng phải đúng định dạng KH-XXXX (X là số từ 0-9)";
        }
        return message;
    }
    public static String validateServiceCode(String name) {
        String message = null;
        String regex = "^DV-\\d{4}$";
        if (!name.matches(regex)) {
            message = "Mã dịch vụ phải đúng định dạng DV-XXXX (X là số từ 0-9)";
        }
        return message;
    }
    public static String validateTelephone(String name) {
        String message = null;
        String regex = "^090\\d{7}|\\(84\\)\\+90\\d{7}|091\\d{7}|\\(84\\)\\+91\\d{7}$";
        if (!name.matches(regex)) {
            message = "Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx";
        }
        return message;
    }
    public static String validateEmail(String name) {
        String message = null;
        String regex = "^\\w+@\\w+\\.[a-z]+$";
        if (!name.matches(regex)) {
            message = "Email phải đúng định dạng x@x.x";
        }
        return message;
    }
    public static String validateDate(String name) {
        String message = null;
        String regex = "^[0-9]{4}-(1[0-2]|0[1-9])-(3[01]|[12][0-9]|0[1-9])$";
        if (!name.matches(regex)) {
            message = "Năm-tháng-ngày phải đúng định dạng xxxx-yy-zz";
        }
        return message;
    }
    public static String validateIdCard(String name) {
        String message = null;
        String regex = "^\\d{9}|\\d{12}$";
        if (!name.matches(regex)) {
            message = "Số cmnd phải có 9 hoặc 12 chữ số";
        }
        return message;
    }

    public static String validateNumber1(String num) {
        String message = null;
        String regex = "^([1-9]|\\d{2,})$";
        if (!num.matches(regex)) {
            message = "Phải là số nguyên dương";
        }
        return message;
    }
    public static String validateNumber2(String num) {
        String message = null;
        String regex = "^([1-9]+\\.?\\d*|0.\\d*[1-9]+)$";
        if (!num.matches(regex)) {
            message = "Phải là số lớn hơn 0";
        }
        return message;
    }
    public static boolean validateNumber3(String num) {
        String regex = "^\\d$";
        return num.matches(regex);
    }
}

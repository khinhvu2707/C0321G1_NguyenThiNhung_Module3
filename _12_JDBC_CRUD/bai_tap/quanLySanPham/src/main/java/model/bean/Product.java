package model.bean;

public class Product {
    private int id;
    private String tenSanPham;
    private int giaSanPham;
    private String moTaSanPham;
    private String nhaSanXuat;
    private String ngaySanXuat;
    private String hanSuDung;
    public Product(){

    }
    public Product(String tenSanPham, int giaSanPham, String moTaSanPham, String nhaSanXuat, String ngaySanXuat, String hanSuDung) {
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
        this.ngaySanXuat = ngaySanXuat;
        this.hanSuDung = hanSuDung;
    }
    public Product(int id, String tenSanPham, int giaSanPham, String moTaSanPham, String nhaSanXuat, String ngaySanXuat, String hanSuDung) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
        this.ngaySanXuat = ngaySanXuat;
        this.hanSuDung = hanSuDung;
    }
    public Product(String tenSanPham, int giaSanPham, String moTaSanPham, String nhaSanXuat) {
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.moTaSanPham = moTaSanPham;
        this.nhaSanXuat = nhaSanXuat;
    }

    public String getNgaySanXuat() {
        return ngaySanXuat;
    }

    public void setNgaySanXuat(String ngaySanXuat) {
        this.ngaySanXuat = ngaySanXuat;
    }

    public String getHanSuDung() {
        return hanSuDung;
    }

    public void setHanSuDung(String hanSuDung) {
        this.hanSuDung = hanSuDung;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public int getGiaSanPham() {
        return giaSanPham;
    }

    public void setGiaSanPham(int giaSanPham) {
        this.giaSanPham = giaSanPham;
    }

    public String getMoTaSanPham() {
        return moTaSanPham;
    }

    public void setMoTaSanPham(String moTaSanPham) {
        this.moTaSanPham = moTaSanPham;
    }

    public String getNhaSanXuat() {
        return nhaSanXuat;
    }

    public void setNhaSanXuat(String nhaSanXuat) {
        this.nhaSanXuat = nhaSanXuat;
    }
}

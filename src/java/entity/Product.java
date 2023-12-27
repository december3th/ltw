
package entity;

public class Product {
    /*
       ID varchar(10)  primary key,
       [name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[releaseDate] [date] NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
       [cid] [int] references Categories(ID),
    */
    private int product_id;
    private String name;
    private int quantityM , quantityL , quantityXL , quantity2XL;
    private double price;
    private String describe,image1 , image2 , image3 , image4;

    public Product() {
    }

    public Product(int product_id, String name, int quantityM, int quantityL, int quantityXL, int quantity2XL, double price, String describe, String image1, String image2, String image3, String image4) {
        this.product_id = product_id;
        this.name = name;
        this.quantityM = quantityM;
        this.quantityL = quantityL;
        this.quantityXL = quantityXL;
        this.quantity2XL = quantity2XL;
        this.price = price;
        this.describe = describe;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantityM() {
        return quantityM;
    }

    public void setQuantityM(int quantityM) {
        this.quantityM = quantityM;
    }

    public int getQuantityL() {
        return quantityL;
    }

    public void setQuantityL(int quantityL) {
        this.quantityL = quantityL;
    }

    public int getQuantityXL() {
        return quantityXL;
    }

    public void setQuantityXL(int quantityXL) {
        this.quantityXL = quantityXL;
    }

    public int getQuantity2XL() {
        return quantity2XL;
    }

    public void setQuantity2XL(int quantity2XL) {
        this.quantity2XL = quantity2XL;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }
    
}
    
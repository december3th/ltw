
package entity;

public class Item {
    private Product product;
    private int quantity; 
    private String sizeProduct;
    private double price;

    public Item() {
    }

    public Item(Product product, int quantity, String sizeProduct, double price) {
        this.product = product;
        this.quantity = quantity;
        this.sizeProduct = sizeProduct;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSizeProduct() {
        return sizeProduct;
    }

    public void setSizeProduct(String sizeProduct) {
        this.sizeProduct = sizeProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + ", sizeProduct=" + sizeProduct + ", price=" + price + '}';
    }
    
}
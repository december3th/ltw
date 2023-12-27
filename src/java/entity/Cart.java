package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart extends Item {

    private List<Item> items;

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItem() {
        return items;
    }

    //Tra ve item trong gio hang theo id
    public Item getItemById(int id, String size) {
        for (Item i : items) {
            if (i.getSizeProduct().equals(size) && id == i.getProduct().getProduct_id()) {
                return i;
            }
        }
        return null;
    }

    // Tra ve so luong của sanpham trong kho
    public int getQuantityById(int id, String size) {
        return getItemById(id, size).getQuantity();
    }

    //Them sanpham
    public void addItem(Item t) {
        //SanPham da ton tai trong gio hàng
        if (getItemById(t.getProduct().getProduct_id(), t.getSizeProduct()) != null) {
            // m-San pham da co trong gio hang
            Item m = getItemById(t.getProduct().getProduct_id(), t.getSizeProduct());
            //Tang so luong
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    //Xoa sanpham khoi gio hang
    public void removeItem(int id, String size) {
        if (getItemById(id, size) != null) {
            items.remove(getItemById(id, size));
        }
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getProduct_id() == id) {
                return i;
            }
        }
        return null;
    }

    //Tong tien
    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                txt = txt.trim();
                String[] s = txt.split("&");
                for (String i : s) {
                    i = i.trim();
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    String sizeProduct = n[2];
                    Product p = getProductById(id, list);
                    Item t = new Item(p, quantity, sizeProduct, p.getPrice());
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        String txt = " 1:1          ,2:2,3:3";
        txt = txt.trim();
        if (txt != null && txt.length() != 0) {
            String[] s = txt.split(",");
            for (String i : s) {
                i = i.trim();
                String kq[] = i.split(":");
                int id = Integer.parseInt(kq[0]);
                int quantity = Integer.parseInt(kq[1]);
                System.out.println(id + " " + quantity);
            }
        }

    }
}

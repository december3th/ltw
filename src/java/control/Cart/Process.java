package control.Cart;

import dao.DAO;
import entity.Cart;
import entity.Item;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "ProcessControl", urlPatterns = {"/process"})
public class Process extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        List<Product> listP = dao.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        System.out.println("Process.java: " + txt);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        String size = request.getParameter("size");
        Cart cart = new Cart(txt, listP);
        int id;
        int numStore;
        try {
            id = Integer.parseInt(id_raw);
            Product p = dao.getProductByID(id + "");
            switch (size) {
                case "M":
                    numStore = p.getQuantityM();
                    break;
                case "L":
                    numStore = p.getQuantityL();
                    break;
                case "XL":
                    numStore = p.getQuantityXL();
                    break;
                default:
                    numStore = p.getQuantity2XL();
                    break;
            }
            int num = 0;
            if (num_raw.equals("down")) {
                num = -1;
                if ((cart.getQuantityById(id, size)) <= 1) {
                    num = 0;
                }
                Item item = new Item(p, num, size, p.getPrice());
                cart.addItem(item);
            } else if (num_raw.equals("up")) {
                num = 1;
                if (cart.getQuantityById(id, size) >= numStore) {
                    num = 0;
                }
                Item item = new Item(p, num, size, p.getPrice());
                cart.addItem(item);
            } else {
                try {
                    num = Integer.parseInt(num_raw);
                    num = Math.max(0, num);
                    System.out.println("Process.java:" + numStore + " " + num);
                    Item item = new Item(p, (num <= numStore ? num : numStore), size, p.getPrice());
                    cart.addItem(item);
                    cart.updateQuantity(id, size, (num <= numStore ? num : numStore));
                } catch (NumberFormatException e) {
                }
            }

        } catch (NumberFormatException e) {

        }
        List<Item> items = cart.getItem();
        txt = "";

        if (!items.isEmpty()) {
            txt = txt + items.get(0).getProduct().getProduct_id() + ":" + items.get(0).getQuantity() + ":" + items.get(0).getSizeProduct();
            for (int i = 1; i < items.size(); i++) {
                txt = txt + "&" + items.get(i).getProduct().getProduct_id() + ":" + items.get(i).getQuantity() + ":" + items.get(i).getSizeProduct();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        response.sendRedirect("showcart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        String id = request.getParameter("id");
        String size = request.getParameter("size");
        String[] ids = txt.split("&");
        String out = "";
        for (String id1 : ids) {
            String[] s = id1.split(":");
            if (!s[0].equals(id) || !s[2].equals(size)) {
                if (out.isEmpty()) {
                    out += s[0] + ":" + s[1] + ":" + s[2];
                } else {
                    out += "&" + s[0] + ":" + s[1] + ":" + s[2];
                }

            }
        }
        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(30 * 24 * 60 * 60);
            response.addCookie(c);
        }
        response.sendRedirect("showcart");
    }
}

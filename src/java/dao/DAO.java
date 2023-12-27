
package dao;

import context.DBContext;
import entity.Cart;
import entity.Category;
import entity.Item;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trinh
 */
public class DAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String query = "select top 10 * from Products";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getNext10Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM\n"
                + "    products\n"
                + "ORDER BY product_id\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT 10 ROWS ONLY;";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("describe"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCID(String category_id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products where category_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(String product_id) {
        String query = "select * from Products where product_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getLast() {
        String query = "select top 1 * from products\n"
                + "order by product_id desc";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Products where [product_name] like ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User login(String email, String pass) {
        String query = "select * from Users where [user_email] = ? and [user_password] = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                User x = new User(rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("user_email"),
                        rs.getString("user_password"),
                        rs.getString("address"),
                        rs.getInt("isAdmin"));
                return x;
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return null;
    }

    public User checkUserExist(String email) {
        String query = "select * from users where user_email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User x = new User(rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("user_email"),
                        rs.getString("user_password"),
                        rs.getString("address"),
                        rs.getInt("isAdmin"));
                return x;
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return null;
    }

    public void signUp(String user_name, String email, String pass, String address) {
        String query = "INSERT INTO [dbo].[Users]\n"
                + "           ([user_name]\n"
                + "           ,[user_email]\n"
                + "           ,[user_password]\n"
                + "           ,[address]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (? , ? , ? , ? , ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user_name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, address);
            ps.setInt(5, 0);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void deleteProductByID(String product_id) {
        String query = "delete from Products where product_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addProductByID(String cid, String name, String quantityM, String quantityL, String quantityXL, String quantity2XL, String price, String describe, String image1, String image2, String image3, String image4) {
        String query = "INSERT INTO [dbo].[Products]\n"
                + "           ([category_id]\n"
                + "           ,[product_name]\n"
                + "           ,[quantityM]\n"
                + "           ,[quantityL]\n"
                + "           ,[quantityXL]\n"
                + "           ,[quantity2XL]\n"
                + "           ,[price]\n"
                + "           ,[describe]\n"
                + "           ,[image1]\n"
                + "           ,[image2]\n"
                + "           ,[image3]\n"
                + "           ,[image4])\n"
                + "     VALUES\n"
                + "           (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, cid);
            ps.setString(2, name);
            ps.setString(3, quantityM);
            ps.setString(4, quantityL);
            ps.setString(5, quantityXL);
            ps.setString(6, quantity2XL);
            ps.setString(7, price);
            ps.setString(8, describe);
            ps.setString(9, image1);
            ps.setString(10, image2);
            ps.setString(11, image3);
            ps.setString(12, image4);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProductByID(String cid, String name, String quantityM, String quantityL, String quantityXL, String quantity2XL, String price, String describe, String image1, String image2, String image3, String image4, String pid) {
        String query = "UPDATE [dbo].[Products]\n"
                + "   SET [category_id] = ?\n"
                + "      ,[product_name] = ?\n"
                + "      ,[quantityM] = ?\n"
                + "      ,[quantityL] = ?\n"
                + "      ,[quantityXL] = ?\n"
                + "      ,[quantity2XL] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[describe] = ? \n"
                + "      ,[image1] = ?\n"
                + "      ,[image2] = ?\n"
                + "      ,[image3] = ?\n"
                + "      ,[image4] = ?\n"
                + " WHERE product_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, cid);
            ps.setString(2, name);
            ps.setString(3, quantityM);
            ps.setString(4, quantityL);
            ps.setString(5, quantityXL);
            ps.setString(6, quantity2XL);
            ps.setString(7, price);
            ps.setString(8, describe);
            ps.setString(9, image1);
            ps.setString(10, image2);
            ps.setString(11, image3);
            ps.setString(12, image4);
            ps.setString(13, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String query = "select * from Users";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("user_email"),
                        rs.getString("user_password"),
                        rs.getString("address"),
                        rs.getInt("isAdmin")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteUserByID(String uid) {
        String query = "delete from Users where user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, uid);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserByID(String uid) {
        String query = "select * from Users where user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, uid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return (new User(rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("user_email"),
                        rs.getString("user_password"),
                        rs.getString("address"),
                        rs.getInt("isAdmin")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User EditUserByID(String uid, String user_name, String user_email, String user_password, String user_address, String isAdmin) {
        String query = "UPDATE [dbo].[Users]\n"
                + "   SET [user_name] = ?\n"
                + "      ,[user_email] = ?\n"
                + "      ,[user_password] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[isAdmin] = ?\n"
                + " WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user_name);
            ps.setString(2, user_email);
            ps.setString(3, user_password);
            ps.setString(4, user_address);
            ps.setString(5, isAdmin);
            ps.setString(6, uid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteCategoryByID(String cid) {
        String query = "delete from Categories where category_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, cid);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addCategory(String name, String describe) {
        String query = "INSERT INTO [dbo].[Categories]\n"
                + "           ([category_name]\n"
                + "           ,[describe])\n"
                + "     VALUES\n"
                + "           (? , ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, describe);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Category getCategoryByID(String cid) {
        String sql = "select * from Categories where category_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("describe"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editCategory(String cid, String name, String describe) {
        String query = "UPDATE [dbo].[Categories]\n"
                + "   SET [category_name] = ?,\n"
                + "      [describe] = ?\n"
                + " WHERE category_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, describe);
            ps.setString(3, cid);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addOrder(User user, Cart cart, String address, String phoneNumber) {
        String query = "INSERT INTO [dbo].[Orders]\n"
                + "           ([user_id]\n"
                + "           ,[order_date]\n"
                + "           ,[total_price]\n"
                + "           ,[address]\n"
                + "           ,[phone_number]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (? , ? , ? , ?, ?, ?)";
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            // add order
            ps = connection.prepareStatement(query);
            ps.setInt(1, user.getUser_id());
            ps.setString(2, date);
            ps.setDouble(3, cart.getTotalMoney());
            ps.setString(4, address);
            ps.setString(5, phoneNumber);
            ps.setString(6, "Pending Approval");
            ps.executeUpdate();
            //lay id cua order vua add
            String query2 = "select top 1 order_id from [Orders] order by order_id desc";
            PreparedStatement ps2 = connection.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();
//            //add orderDetails;
            if (rs2.next()) {
                int order_id = rs2.getInt("order_id");
                for (Item i : cart.getItem()) {
                    String query3 = "INSERT INTO [dbo].[Order_Details]\n"
                            + "           ([order_id]\n"
                            + "           ,[product_id]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[size])\n"
                            + "     VALUES\n"
                            + "           (? , ? , ? , ? , ?)";
                    ps2 = connection.prepareStatement(query3);
                    ps2.setInt(1, order_id);
                    ps2.setInt(2, i.getProduct().getProduct_id());
                    ps2.setInt(3, i.getQuantity());
                    ps2.setDouble(4, i.getPrice());
                    ps2.setString(5, i.getSizeProduct());
                    ps2.executeUpdate();
                }
            }
            //update quantity product
            for (Item i : cart.getItem()) {
                String query4;
                if (i.getSizeProduct().equals("M")) {
                    query4 = "update products set quantityM = quantityM-? where product_id=?";
                } else if (i.getSizeProduct().equals("L")) {
                    query4 = "update products set quantityL = quantityL-? where product_id=?";
                } else if (i.getSizeProduct().equals("XL")) {
                    query4 = "update products set quantityXL = quantityXL-? where product_id=?";
                } else {
                    query4 = "update products set quantity2XL = quantity2XL-? where product_id=?";
                }
                PreparedStatement ps4 = connection.prepareStatement(query4);
                ps4.setInt(1, i.getQuantity());
                ps4.setInt(2, i.getProduct().getProduct_id());
                ps4.executeUpdate();

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getProductByFilter(String queryCategory, String queryPrice) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.product_id, p.category_id, p.product_name, p.quantityM ,p.quantityL,p.quantityXL,p.quantity2XL, p.price , p.describe , p.image1,\n"
                + "p.image2, p.image3 , p.image4\n"
                + "FROM products p INNER JOIN categories c ON p.category_id = c.category_id\n"
                + "WHERE 1=1";
        try {
            if (queryCategory.length() > 0 && queryPrice.length() > 0) {
                query += "AND (" + queryCategory + ") " + "AND" + " (" + queryPrice + ")";
            } else if (queryPrice.length() > 0) {
                query += "AND (" + queryPrice + ")";
            } else if (queryCategory.length() > 0) {
                query += "AND (" + queryCategory + ")";
            }
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getInt("quantityM"),
                        rs.getInt("quantityL"),
                        rs.getInt("quantityXL"),
                        rs.getInt("quantity2XL"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderByUserID(int user_id) {
        List<Order> list = new ArrayList<>();
        String query = "select * from [orders] where user_id = ? order by order_id desc";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getString("order_date"),
                        rs.getDouble("total_price"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("status")
                );
                list.add(order);

            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select * from [orders]  order by order_id desc";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getString("order_date"),
                        rs.getDouble("total_price"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("status")
                );
                list.add(order);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from [order_details]";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                //lay product_id
                int product_id = rs.getInt("product_id");
                DAO dao = new DAO();
                Product product = dao.getProductByID(product_id + "");

                OrderDetail orderdetail = new OrderDetail(rs.getInt("order_detail_id"),
                        rs.getInt("order_id"),
                        product_id,
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("size"),
                        product
                );
                list.add(orderdetail);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void editStatusOrderPendingApproval(int order_id) {
        String query = "UPDATE orders SET status = 'Pending Approval' WHERE order_id = ?;";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, order_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editStatusOrderApproved(int order_id) {
        String query = "UPDATE orders SET status = 'Approved' WHERE order_id = ?;";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, order_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        Category a = dao.getCategoryByID("1");
        System.out.println(a);
    }

}

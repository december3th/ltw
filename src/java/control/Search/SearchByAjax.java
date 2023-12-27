

package control.Search;

import dao.DAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name="SearchByAjax", urlPatterns={"/searchbyajax"})
public class SearchByAjax extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        //b1 get date from dao
        DAO dao = new DAO();       
        String txtSearch = request.getParameter("txt");
        List<Product> listP = dao.searchByName(txtSearch);
        request.setAttribute("txtS", txtSearch);
        PrintWriter out = response.getWriter();
        for (Product o : listP) {
            out.println("<div class=\"col l-2-4 m-4 c-6\" onclick=\"showModalDetail("+o.getProduct_id()+")\">\n"
                    + "                                        <div href=\"\" class=\"home-product-item\">\n"
                    + "                                            <div class=\"home-product--img\">\n"
                    + "                                                <div class=\"home-product--add\">\n"
                    + "                                                    <!--style=\"pointer-events: none;\"--> \n"
                    + "                                                    <div class=\"home-product--cart\">\n"
                    + "                                                        <i class=\"fa-solid fa-cart-plus\"></i>\n"
                    + "                                                        Thêm vào giỏ hàng\n"
                    + "                                                    </div>\n"
                    + "\n"
                    + "                                                </div>\n"
                    + "                                                <img\n"
                    + "                                                    class=\"img1\"\n"
                    + "                                                    src=\""+o.getImage1()+"\"\n"
                    + "                                                    alt=\"\"\n"
                    + "                                                    />\n"
                    + "\n"
                    + "\n"
                    + "                                            </div>\n"
                    + "                                            <div class=\"home-product--info\">\n"
                    + "                                                <div class=\"home-product--title\">"+o.getName()+"\n"
                    + "\n"
                    + "                                                </div>\n"
                    + "\n"
                    + "                                                <div class=\"home-product--price\">\n"
                    + "\n"
                    + "                                                    <div class=\"home-product__sale\"> \n"
                    + "                                                       "+o.getPrice()+" ₫ </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "                                    <div class=\"modal-detail modal-detail-"+o.getProduct_id()+" hidden\">\n"
                    + "                                        <!-- Them hidden-->\n"
                    + "                                        <div class=\"overlay\"></div>\n"
                    + "                                        <div class=\"modal-content\">\n"
                    + "                                            <div class=\"modal-header\">\n"
                    + "                                                <h4 class=\"modal-title\">Sản phẩm</h4>\n"
                    + "                                                <button class=\"modal-close modal-close-"+o.getProduct_id()+"\" onclick=\"closeDetail("+o.getProduct_id()+")\">\n"
                    + "                                                    <i class=\"fa-solid fa-xmark\"></i>\n"
                    + "                                                </button>\n"
                    + "                                            </div>\n"
                    + "                                            <div class=\"modal-body\">\n"
                    + "                                                <div class=\"row\">\n"
                    + "                                                    <div class=\"col c-12 m-5 l-5\">\n"
                    + "                                                        <div class=\"modal-body-wapper\">\n"
                    + "                                                            <div class=\"modal-body--slider\">\n"
                    + "                                                                <div class=\"modal-body--slide-show modal-body--slide-show--active\">\n"
                    + "                                                                    <img \n"
                    + "                                                                        src=\""+o.getImage1()+"\"\n"
                    + "                                                                        alt=\"\"\n"
                    + "                                                                        class=\"modal-body--slide-show--1\"\n"
                    + "                                                                        />\n"
                    + "\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"modal-body--slide-button modal-body--slide-button--prev\">\n"
                    + "                                                                    <i class=\"fa-solid fa-chevron-left\"></i>\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"modal-body--slide-button modal-body--slide-button--next\">\n"
                    + "                                                                    <i class=\"fa-solid fa-chevron-right\"></i>\n"
                    + "                                                                </div>\n"
                    + "                                                            </div>\n"
                    + "                                                            <div class=\"modal-body--pagination\">\n"
                    + "                                                                <span class=\"modal-body--pagination-bullet modal-body--pagination-0 active\">\n"
                    + "                                                                    <img \n"
                    + "                                                                        src=\""+o.getImage1()+"\"\n"
                    + "                                                                        alt=\"\"\n"
                    + "                                                                        srcset=\"\"\n"
                    + "                                                                        class=\"modal-body--slide-show--11\"\n"
                    + "                                                                        />\n"
                    + "                                                                </span>\n"
                    + "                                                                <span class=\"modal-body--pagination-bullet modal-body--pagination-1\">\n"
                    + "                                                                    <img\n"
                    + "                                                                        src=\""+o.getImage2()+"\"\n"
                    + "                                                                        alt=\"\"\n"
                    + "                                                                        srcset=\"\"\n"
                    + "                                                                        class=\"modal-body--slide-show--2\"\n"
                    + "                                                                        />\n"
                    + "                                                                </span>\n"
                    + "                                                                <span class=\"modal-body--pagination-bullet modal-body--pagination-2\">\n"
                    + "                                                                    <img\n"
                    + "                                                                        src=\""+o.getImage3()+"\"\n"
                    + "                                                                        alt=\"\"\n"
                    + "                                                                        srcset=\"\"\n"
                    + "                                                                        class=\"modal-body--slide-show--3\"\n"
                    + "                                                                        />\n"
                    + "                                                                </span>\n"
                    + "                                                                <span class=\"modal-body--pagination-bullet modal-body--pagination-3\">\n"
                    + "                                                                    <img\n"
                    + "                                                                        src=\""+o.getImage4()+"\"\n"
                    + "                                                                        alt=\"\"\n"
                    + "                                                                        srcset=\"\"\n"
                    + "                                                                        class=\"modal-body--slide-show--4\"\n"
                    + "                                                                        />\n"
                    + "                                                                </span>\n"
                    + "                                                            </div>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <!-- edit tiếp -->\n"
                    + "                                                    <div class=\"col c-12 m-7 l-7\">\n"
                    + "                                                        <div class=\"modal-body--content\">\n"
                    + "                                                            <div class=\"modal-body--content__header\">\n"
                    + "                                                                "+o.getName()+"\n"
                    + "                                                            </div>\n"
                    + "                                                            <div class=\"modal-body--price_ads\">\n"
                    + "                                                                <div class=\"modal-body--price\">\n"
                    + "\n"
                    + "                                                                    <div class=\"modal-body--price__sale\">₫"+o.getPrice()+"</div>\n"
                    + "\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"modal-body--ads\">\n"
                    + "                                                                    Giá tốt nhất so với các sản phẩm cùng loại trên thị trường\n"
                    + "                                                                    !                                        </div>\n"
                    + "                                                            </div>\n"
                    + "                                                            <section class=\"modal-body--promo-section\">\n"
                    + "                                                                <!-- <div class=\"modal-body--deal-container\">\n"
                    + "                                                                    <div class=\"deal-container-title\">Ưu đãi</div>\n"
                    + "                                                                    <div class=\"deal-container-content\"></div>\n"
                    + "                                                                </div> -->\n"
                    + "\n"
                    + "                                                                <div class=\"modal-body--shipping-container\">\n"
                    + "                                                                    <div class=\"shipping-container-title\">Vận Chuyển</div>\n"
                    + "                                                                    <div class=\"shipping-container-content\">\n"
                    + "                                                                        <div class=\"shipping-container-content-1\">\n"
                    + "                                                                            <img\n"
                    + "                                                                                src=\"https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/74f3e9ac01da8565c3baead996ed6e2a.png\"\n"
                    + "                                                                                alt=\"\"\n"
                    + "                                                                                />\n"
                    + "                                                                            <span>Miễn phí vận chuyển cho đơn hàng </span>\n"
                    + "                                                                        </div>\n"
                    + "                                                                        <!--                                                <div class=\"shipping-container-content-2\">\n"
                    + "                                                                                                                            <i class=\"fa-solid fa-car-side\"></i>\n"
                    + "                                                                                                                            <span>Từ km thứ 5 10000đ/Km</span>\n"
                    + "                                                                                                                        </div>-->\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Mô tả</span>\n"
                    + "                                                                    <div class=\"count-order--content\">\n"
                    + "                                                                        <h3 class=\"describeDetail\">"+o.getDescribe()+"</h3>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Size</span>\n"
                    + "                                                                    <div class=\"size-order--content size-order--content-"+o.getProduct_id()+"\">                                                  \n"
                    + "                                                                        <label>\n"
                    + "                                                                            M <input name=\"option\" type=\"radio\"  value=\"M\">\n"
                    + "                                                                        </label>                                     \n"
                    + "\n"
                    + "                                                                        <label>\n"
                    + "                                                                            L <input name=\"option\" type=\"radio\" value=\"L\"> \n"
                    + "                                                                        </label>  \n"
                    + "\n"
                    + "                                                                        <label>\n"
                    + "                                                                            XL <input name=\"option\" type=\"radio\" value=\"XL\">\n"
                    + "                                                                        </label>  \n"
                    + "\n"
                    + "                                                                        <label>\n"
                    + "                                                                            2XL <input name=\"option\" type=\"radio\" value=\"2XL\"> \n"
                    + "                                                                        </label>  \n"
                    + "\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "                                                                <!--                                        <input name=\"trung\" value=\"vvv\" type=\"text\">-->\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Sản phẩm có sẵn</span>\n"
                    + "                                                                    <div class=\"quantity-order--content quantity-order--content-"+o.getProduct_id()+"\">\n"
                    + "                                                                        <label>\n"
                    + "                                                                            "+o.getQuantityM()+"\n"
                    + "                                                                        </label>      \n"
                    + "                                                                        \n"
                    + "                                                                        <label>\n"
                    + "                                                                            "+o.getQuantityL()+"\n"
                    + "                                                                        </label>  \n"
                    + "                                                                            \n"
                    + "                                                                        <label>\n"
                    + "                                                                            "+o.getQuantityXL()+"\n"
                    + "                                                                        </label>  \n"
                    + "\n"
                    + "                                                                        <label>\n"
                    + "                                                                            "+o.getQuantity2XL()+"\n"
                    + "                                                                        </label>  \n"
                    + "\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "\n"
                    + "                                                            </section>\n"
                    + "                                                            <form onclick=\"Cart("+o.getProduct_id()+")\"  class=\"modal-body--buy__form modal-body--buy__form-"+o.getProduct_id()+"\"  action=\"\" method=\"post\">\n"
                    + "                                                                <div class=\"product__id\">\n"
                    + "                                                                    <input name=\"product_id\" type=\"text\"  value=\""+o.getProduct_id()+"\" hidden=\"\">\n"
                    + "                                                                    <input name=\"num\" type=\"text\"  value=\"1\" hidden=\"\">\n"
                    + "                                                                    <input class=\"sizeProduct-"+o.getProduct_id()+"\" name=\"sizeProduct\" type=\"text\"  value=\"M\" hidden=\"\">\n"
                    + "                                                                </div>\n"
                    + "                                                                <section class=\"modal-body--buy modal-body--buy-"+o.getProduct_id()+"\">\n"
                    + "\n"
                    + "                                                                    <button class=\"add-to-cart\" type=\"button\">\n"
                    + "                                                                        <i class=\"fa-solid fa-cart-plus\"></i>\n"
                    + "                                                                        Thêm Vào Giỏ Hàng\n"
                    + "                                                                    </button>\n"
                    + "\n"
                    + "                                                                </section>\n"
                    + "                                                            </form>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <!-- edit tiếp -->\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>");

        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

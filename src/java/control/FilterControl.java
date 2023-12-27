package control;

import dao.DAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "FilterControl", urlPatterns = {"/filter"})
public class FilterControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String queryCategory = request.getParameter("filtercategory");
        String queryPrice = request.getParameter("filterprice");
        DAO dao = new DAO();
        List<Product> listP = dao.getProductByFilter(queryCategory, queryPrice);
        PrintWriter out = response.getWriter();
        DecimalFormat decimalFormat = new DecimalFormat("###,##0");
        for (Product o : listP) {
            System.out.println("FilterControl.java: " + o.getPrice());
            out.println("<div class=\"col l-2-4 m-4 c-6\" onclick=\"showModalDetail(" + o.getProduct_id() + ")\">\n"
                    + "                                            <div href=\"\" class=\"home-product-item\">\n"
                    + "                                                <div class=\"home-product--img\">\n"
                    + "                                                    <div class=\"home-product--add\">\n"
                    + "                                                        <div class=\"home-product--cart\"><i class=\"fa-solid fa-cart-plus\"></i>Thêm vào giỏ hàng</div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <img class=\"img1\" src=\"" + o.getImage1() + "\" alt=\"\" />\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"home-product--info\">\n"
                    + "                                                    <div class=\"home-product--title\">" + o.getName() + "</div>\n"
                    + "                                                    <div class=\"home-product--price\">\n"
                    + "                                                        <div class=\"home-product__sale\">" + decimalFormat.format(o.getPrice()) + " ₫</div>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                        <div class=\"modal-detail-" + o.getProduct_id() + " hidden\">\n"
                    + "                                            <!-- Them hidden-->\n"
                    + "                                            <div class=\"overlay\" onclick=\"closeDetail(" + o.getProduct_id() + ")\"></div>\n"
                    + "                                            <div class=\"modal-content\">\n"
                    + "                                                <div class=\"modal-header\">\n"
                    + "                                                    <h4 class=\"modal-title\">Sản phẩm</h4>\n"
                    + "                                                    <button class=\"modal-close modal-close-" + o.getProduct_id() + "\" onclick=\"closeDetail(" + o.getProduct_id() + ")\">\n"
                    + "                                                        <i class=\"fa-solid fa-xmark\"></i>\n"
                    + "                                                    </button>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"modal-body\">\n"
                    + "                                                    <div class=\"img-product\">\n"
                    + "                                                        <div class=\"modal-body-wapper\">\n"
                    + "                                                            <div class=\"modal-body--slider\">\n"
                    + "                                                                <div class=\"modal-body--slide-show modal-body--slide-show--active\" ><img src=\"" + o.getImage1() + "\" alt=\"1\" class=\"main-img-slide main-img-" + o.getProduct_id() + "\"  style=\"width: 430px;height: 430px;object-fit: fit;\"/></div>\n"
                    + "                                                                <div class=\"modal-body--slide-button modal-body--slide-button--prev\"  onclick=\"chevronClick(this, " + o.getProduct_id() + ")\"><i class=\"fa-solid fa-chevron-left\"></i></div>\n"
                    + "                                                                <div class=\"modal-body--slide-button modal-body--slide-button--next\"  onclick=\"chevronClick(this, " + o.getProduct_id() + ")\"><i class=\"fa-solid fa-chevron-right\"></i></div>\n"
                    + "                                                            </div>\n"
                    + "                                                            <div class=\"modal-body--pagination slide-img-" + o.getProduct_id() + "\">\n"
                    + "                                                                <span onclick=\"slideImgClick(this, " + o.getProduct_id() + ")\"><img src=\"" + o.getImage1() + "\" alt=\"1\" srcset=\"\" class=\"side-img-slide slide-img-" + o.getProduct_id() + "\"/></span>\n"
                    + "                                                                <span onclick=\"slideImgClick(this, " + o.getProduct_id() + ")\"><img src=\"" + o.getImage2() + "\" alt=\"2\" srcset=\"\" class=\"side-img-slide slide-img-" + o.getProduct_id() + "\"/></span>\n"
                    + "                                                                <span onclick=\"slideImgClick(this, " + o.getProduct_id() + ")\"><img src=\"" + o.getImage3() + "\" alt=\"3\" srcset=\"\" class=\"side-img-slide slide-img-" + o.getProduct_id() + "\"/></span>\n"
                    + "                                                                <span onclick=\"slideImgClick(this, " + o.getProduct_id() + ")\"><img src=\"" + o.getImage4() + "\" alt=\"4\" srcset=\"\" class=\"side-img-slide slide-img-" + o.getProduct_id() + "\"/></span>\n"
                    + "                                                            </div>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "\n"
                    + "                                                    <!-- edit tiếp -->\n"
                    + "                                                    <div class=\"detail-product\">\n"
                    + "                                                        <div class=\"modal-body--content\">\n"
                    + "                                                            <div class=\"modal-body--content__header\">" + o.getName() + "</div>\n"
                    + "                                                            <div class=\"modal-body--price_ads\">\n"
                    + "                                                                <div class=\"modal-body--price\">\n"
                    + "                                                                    <div class=\"modal-body--price__sale\"><fmt:formatNumber pattern=\"###,##0\" value=\"" + o.getPrice() + "\"/>₫</div>\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"modal-body--ads\">Giá tốt nhất so với các sản phẩm cùng loại trên thị trường!</div>\n"
                    + "                                                            </div>\n"
                    + "                                                            <section\n"
                    + "                                                                class=\"modal-body--promo-section\">\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Vận Chuyển</span>\n"
                    + "                                                                    <div style=\"display: flex; align-items: center;\">\n"
                    + "                                                                        <div class=\"shipping-container-content-1\">\n"
                    + "                                                                            <img src=\"https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/74f3e9ac01da8565c3baead996ed6e2a.png\" alt=\"\" />\n"
                    + "                                                                            <div>Miễn phí vận chuyển cho đơn hàng </div>\n"
                    + "                                                                        </div>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Mô tả</span>\n"
                    + "                                                                    <div class=\"count-order--content\">&nbsp;&nbsp;<h3 class=\"describeDetail\">" + o.getDescribe() + "</h3></div>\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Size</span>\n"
                    + "                                                                    <div\n"
                    + "                                                                        class=\"size-order--content size-order--content-" + o.getProduct_id() + "\">\n"
                    + "                                                                        <label>M <input name=\"option\" type=\"radio\" value=\"M\"></label>\n"
                    + "                                                                        <label>L <input name=\"option\" type=\"radio\" value=\"L\"></label>\n"
                    + "                                                                        <label>XL <input name=\"option\" type=\"radio\" value=\"XL\"></label>\n"
                    + "                                                                        <label>2XL <input name=\"option\" type=\"radio\" value=\"2XL\"></label>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "                                                                <div class=\"order-count\">\n"
                    + "                                                                    <span>Sẵn có</span>\n"
                    + "                                                                    <div\n"
                    + "                                                                        class=\"quantity-order--content quantity-order--content-" + o.getProduct_id() + "\">\n"
                    + "                                                                        <label>" + o.getQuantityM() + "</label>\n"
                    + "                                                                        <label>" + o.getQuantityL() + "</label>\n"
                    + "                                                                        <label>" + o.getQuantityXL() + "</label>\n"
                    + "                                                                        <label>" + o.getQuantity2XL() + "</label>\n"
                    + "                                                                    </div>\n"
                    + "                                                                </div>\n"
                    + "\n"
                    + "                                                            </section>\n"
                    + "                                                            <form onclick=\"Cart(" + o.getProduct_id() + ")\"\n"
                    + "                                                                  class=\"modal-body--buy__form modal-body--buy__form-" + o.getProduct_id() + "\"\n"
                    + "                                                                  action=\"\" method=\"post\">\n"
                    + "                                                                <div class=\"product__id\">\n"
                    + "                                                                    <input name=\"product_id\"\n"
                    + "                                                                           type=\"text\"\n"
                    + "                                                                           value=\"" + o.getProduct_id() + "\"\n"
                    + "                                                                           hidden=\"\">\n"
                    + "                                                                    <input name=\"num\" type=\"text\"\n"
                    + "                                                                           value=\"1\" hidden=\"\">\n"
                    + "                                                                    <input\n"
                    + "                                                                        class=\"sizeProduct-" + o.getProduct_id() + "\"\n"
                    + "                                                                        name=\"sizeProduct\"\n"
                    + "                                                                        type=\"text\" value=\"M\"\n"
                    + "                                                                        hidden=\"\">\n"
                    + "                                                                </div>\n"
                    + "                                                                <section class=\"modal-body--buy modal-body--buy-" + o.getProduct_id() + "\">\n"
                    + "                                                                    <button class=\"add-to-cart\" type=\"button\"><i class=\"fa-solid fa-cart-plus\"></i>Thêm Vào Giỏ Hàng</button>\n"
                    + "                                                                </section>\n"
                    + "                                                            </form>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <!-- edit tiếp -->\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

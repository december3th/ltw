
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <link rel="stylesheet" href="./assest/css/cart.css">
        <!--        <style>
                    table td , table th {
                        text-align: center; 
                    }
                </style>-->
        <style>
            .modal-header {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .modal-footer{
                margin-right: 200px;
                cursor: pointer;
            }
            button {
                cursor: pointer;
            }
            .buttonBuy{
                margin: 0 0 35px 35px;
            }
            .buttonBuy button{
                background-color: green;
                color: white;
            }
            .cart-table td ,.cart-table th {
                text-align: center;
            }
            .process{
                display: flex;
                justify-content: space-evenly;
            }
            .process-center{
                margin-top: 20px;
            }
            
        </style>
    </head>
    <body>
        <div class="modal-dialog" style="background-color: #ccc">
            <div class="modal-content" style="box-shadow: 5px 10px #ccc">
                <h2 style="color: red;">${ms}</h2>
                <div class="modal-header">
                    <div style="display:flex">
                        <img style="height:30px; margin-right: 5px" src="https://png.pngtree.com/png-vector/20230225/ourmid/pngtree-shopping-cart-line-icon-png-image_6620874.png" alt="alt"/>
                        <h4>GIỎ HÀNG</h4>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="cart-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Kích cỡ</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set value="${requestScope.cart}" var="c"></c:set>
                                <c:forEach var="o" items="${c.items}">
                                    <tr>
                                        <td>
                                            <img src="${o.product.image1}" alt="">
                                        </td>
                                        <td> 
                                            <p class="product-name">${o.product.name}</p>
                                        </td>
                                        <td> 
                                            <p class="product-name">${o.sizeProduct}</p>
                                        </td>
                                        <td class="process">
                                            <div class="process-center">
                                                <a href="process?num=-1&id=${o.product.product_id}&size=${o.sizeProduct}"><button style="padding: 6px 12px" class="btn product-down" onclick="">-</button></a>
                                                <div class="product-value">${o.quantity}</div>
                                                <a href="process?num=1&id=${o.product.product_id}&size=${o.sizeProduct}"><button style="padding: 6px 10px" class="btn product-up" onclick="">+</button></a>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product-price">
                                                <fmt:formatNumber pattern="##.#" value="${o.price}"/>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product-total-price">
                                                <fmt:formatNumber pattern="##.#" value="${o.price*o.quantity}"/>
                                            </div>
                                        </td>
                                        <td>
                                            <form action="process" method="post">
                                                <input type="hidden" name="id" value="${o.product.product_id}">
                                                <input type="hidden" name="size" value="${o.sizeProduct}">
                                                <button type="submit" class="btn product-delete" onclick="">XÓA</button>
                                            </form>

                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>                            
                    </div>

                    <table class="table">
                        <tr>
                            <td style="width: 33%; font-size: 14px"><strong>Tổng giá sản phẩm:</strong></td>
                            <td>
                                <h5>
                                    <strong style="color: #7D7C7C"><fmt:formatNumber pattern="##.#" value="${c.totalMoney}"/></strong>
                                </h5
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 33%; font-size: 14px"><strong>Chi phí vận chuyển:</strong></td>
                            <td>
                                <h5>
                                    <strong style="color: #7D7C7C">Miễn phí vận chuyển</strong>
                                </h5
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 33%;font-size: 14px"><strong>TỔNG CỘNG:</strong></td>
                            <td>
                                <h5>
                                      
                                    <strong style="color: #7D7C7C"><fmt:formatNumber pattern="##.#" value="${c.totalMoney}"/></strong>
                                </h5
                            </td>
                        </tr>
                    </table>                        
                </div>

                <a class="buttonBuy" href="order">
                    <button  class="btn btn-danger"  " >
                         Thanh toán
                    </button></a>

            </div>
        </div>
        <div class="modal-footer">
            <a href="home"><button  class="btn btn-danger">Đóng</button></a>
        </div>
    </body>
</html>
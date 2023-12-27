<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <link rel="stylesheet" href="./assest/css/cart.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="./assest/css/root.css" />
        <link rel="stylesheet" href="./assest/css/reset.css" />
        <link rel="stylesheet" href="./assest/css/header.css" />
        <link rel="stylesheet" href="./assest/css/footer.css" />
        <link rel="stylesheet" href="./assest/css/grid.css" />
    </head>
    <body >
        <jsp:include page="HeaderHome.jsp"></jsp:include>
            <div class="modal-content">
                <div class="modal-header">
                    <div class="img-logo">
                        <img  src="https://png.pngtree.com/png-vector/20230225/ourmid/pngtree-shopping-cart-line-icon-png-image_6620874.png" alt="alt"/>
                        <h4>GIỎ HÀNG</h4>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="cart-contain">
                        <table>
                            <thead>
                                <tr>
                                    <th style="border-top-left-radius: 10px;">Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Kích cỡ</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                    <th style="border-top-right-radius: 10px;">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty ms}">
                                <tr>
                                    <td colspan="7">
                                        <h2 style="color: red;">${ms}</h2>
                                    </td>
                                </tr>
                            </c:if>


                            <c:set value="${requestScope.cart}" var="c"></c:set>
                            <c:forEach var="o" items="${c.items}">
                                <tr>
                                    <td style="width: 10%">
                                        <img src="${o.product.image1}" alt="">
                                    </td>
                                    <td style="width: 30%"> 
                                        <p class="product-name">${o.product.name}</p>
                                    </td>
                                    <td style="width: 10%"> 
                                        <p class="product-name">${o.sizeProduct}</p>
                                    </td>
                                    <td class="process" style="width: 10%">
                                        <div class="process-center">
                                            <div class="process-center-child">
                                                <a href="process?num=down&id=${o.product.product_id}&size=${o.sizeProduct}" onclick="saveScrollPosition()">
                                                    <button class="product-down">-</button>
                                                </a>
                                                <input type="text" class="product-value" oninput="formatNumberInput(this)" value="${o.quantity}"   onkeydown="handleEnterKey(event, ${o.product.product_id}, '${o.sizeProduct}')">
                                                <a href="process?num=up&id=${o.product.product_id}&size=${o.sizeProduct}"  onclick="saveScrollPosition()">
                                                    <button class="btn product-up" onclick="">+</button>
                                                </a>

                                            </div>
                                        </div>
                                    </td>
                                    <td  style="width: 15%">
                                        <div class="product-price">
                                            <fmt:formatNumber pattern="###,##0"  value="${o.price}"/>
                                        </div>
                                    </td>
                                    <td style="width: 15%">
                                        <div class="product-total-price">
                                            <fmt:formatNumber pattern="###,##0" value="${o.price*o.quantity}"/>
                                        </div>
                                    </td>
                                    <td style="width: 8%">
                                        <form action="process" method="post">
                                            <input type="hidden" name="id" value="${o.product.product_id}">
                                            <input type="hidden" name="size" value="${o.sizeProduct}">
                                            <button class="product-delete">
                                                <i class="fa-solid fa-trash fa-xl" style="color: #bd4747;"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>                            
                </div>
                <c:if test="${empty ms}">                            
                    <div class="payment-contain">
                        <div style="display: flex; flex-direction:  column;">
                            <div style="display: flex; margin-bottom: 30px;">
                                <div class="title">Chi phí vận chuyển:</div>
                                <div>
                                    <h5>Miễn phí vận chuyển</h5>
                                </div>
                            </div>
                            <div style="display: flex; margin-bottom: 30px;">
                                <div class="title">Tổng số sản phẩm:</div>
                                <div>
                                    <h5 style="font-size: 30px;">${fn:length(c.items)}</h5>
                                </div>
                            </div>
                            <div style="display: flex;">
                                <div class="title" >Tổng Tiền:</div>
                                <div>
                                    <h5 style="font-size: 30px;">
                                        <fmt:formatNumber pattern="###,##0" value="${c.totalMoney>0?c.totalMoney:0}" />
                                    </h5>
                                </div>
                            </div>
                        </div>
                        <div style="height: 100%; display: flex; justify-content: center; align-items: center;">
                            <a href="order" class="btn btn-pay">Tiếp Tục</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <script>
            function formatNumberInput(input) {
                input.value = input.value.replace(/[^0-9]/g, '');
            }
            function saveScrollPosition() {
                sessionStorage.setItem("scrollPosition", window.scrollY + 1 || window.pageYOffset + 1);
            }
            var scrollPosition = sessionStorage.getItem("scrollPosition");
            if (scrollPosition) {
                window.scrollTo(0, parseInt(scrollPosition));
            }


            function handleEnterKey(event, productId, size) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    var url = 'process?num=' + event.target.value + '&id=' + productId + '&size=' + size;
                    window.location.href = url;
                }
            }
        </script>
    </body>
</html>
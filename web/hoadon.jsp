<%-- 
    Document   : hoadon
    Created on : Dec 21, 2023, 6:25:10 PM
    Author     : Han2na
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hóa Đơn</title>
        <link rel="stylesheet" href="./assest/css/hoadon.css">
    </head>
    <body>
        <div class="container-thanhtoan">
            <div class="content">
                <div style="font-size: 40px; text-align: center; padding: 20px;"> Hóa Đơn Bán Hàng</div>
                <div class="thanhtoan-info">
                    <table class="table1">
                        <tbody>
                            <tr>
                                <td>Tên khách hàng</td>
                                <td>:</td>
                                <td>${acc.user_name}</td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td>:</td>
                                <td>${order.getAddress()}</td>
                            </tr>
                            <tr>
                                <td>Số điện thoại</td>
                                <td>:</td>
                                <td>${order.getPhone_number()}</td>
                            </tr>
                            <tr>
                                <td>Ngày đặt hàng</td>
                                <td>:</td>
                                <td>${order.getOrder_date()}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <table class="table2">
                    <thead>
                    <th style="width: 8%;">STT</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Đơn Giá</th>
                    <th>Kích Cỡ</th>
                    <th>Số Lượng</th>
                    <th>Tổng Tiền</th>
                    </thead>
                    <tbody>
                        <c:set value="${sessionScope.cart}" var="c"></c:set>
                        <c:forEach var="o" items="${c.items}">
                            <tr>
                                <td>1</td>
                                <td>${o.product.name}</td>
                                <td>${o.sizeProduct}</td>
                                <td><fmt:formatNumber pattern="###,##0" value="${o.price}"/></td>
                                <td>${o.quantity}</td>
                                <td><fmt:formatNumber pattern="###,##0" value="${o.price*o.quantity}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5">Tổng tiền</td>
                            <td> <fmt:formatNumber pattern="###,##0" value="${c.totalMoney>0?c.totalMoney:0}" /></td>
                        </tr>
                    </tfoot>
                </table>
                <c:if test="${empty ms}">
                    <div class="back-button">
                        <form action="invoicing" method="POST">
                            <button class="btn btn-pay" style="border: none;">Đặt Hàng</button>          
                        </form>
                    </div>
                </c:if>
                <c:if test="${ms}=='show'">
                    <div class="modal-detail">
                        <div class="overlay" onclick="closeDetail()"></div>
                        <div class="modal-content">
                            <div class="modal-title">Quý Khách Vui Lòng Thanh Toán</div>
                            <div class="container-taikhoan">
                                <div style="text-align: center;">
                                    <div>Mã QR</div>
                                    <img src="https://baohothuonghieu.com/wp-content/uploads/2021/10/1536893974-QR-CODE-LA-GI-sblaw.jpeg"
                                         alt="">
                                </div>
                                <div class="div-stk">
                                    <div style="padding-bottom: 10px;">Số Tài Khoản</div>
                                    <div>Techcombank</div>
                                    <div>Ngo Anh Ngoc Anh</div>
                                    <div>19036389580010</div>
                                </div>
                            </div> 
                            <div class="back-button">
                                <a href="home" class="btn btn-pay" >Trang Chủ</a>
                            </div>
                        </div>
                    </div>  
                </c:if>
                <div class="back-button" style="margin: 20px;">
                    <a href="home" class="btn btn-pay" >Trang Chủ</a>
                </div>
            </div>
        </div>
        <script>
            function closeDetail() {
                var tmp = '.modal-detail';
                let modalDetail = document.querySelector(tmp);
                modalDetail.classList.add('hidden');
            }
        </script>
    </body>
</html>

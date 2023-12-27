
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="./assest/css/manager-product.css">

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("bạn chắc chắn muốn xóa sản phẩm này")) {
                    window.location = "deleteproduct?pid=" + id;
                }
            }
        </script>

    <body>
        <jsp:include page="HeaderManage.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="left">
                                <h2>Quản lý <b>Sản phẩm</b></h2>
                            </div>
                        </div>
                    </div>
                    <!--category-->
                    <div class="row">
                        <div class="row-category">
                            <div class="category-title"><i class="fa fa-list"></i>Loại sản phẩm</div>
                            <div style="height: 40px;">
                                <div class="category-show">
                                    <ul class="list-group category_block">
                                        <li class="list-group-item text-white ${tag == "0" ? "active" : ""}"><a href="manageproductcategory?cid=${0}">Tất cả</a></li>

                                    <c:forEach items="${listC}" var="o">
                                        <li class="list-group-item text-white ${tag == o.category_id ? "active" : ""}"><a href="manageproductcategory?cid=${o.category_id}">${o.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-add">
                    <a href="loadaddproduct"><i class="fa-solid fa-plus"></i><span>Thêm sản phẩm</span></a>					
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Gía</th>
                            <th>M</th>
                            <th>L</th>
                            <th>XL</th>
                            <th>2XL</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>${o.product_id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img height="150px" width="100px" src="${o.image1}">
                                </td>
                                <td>${o.price}</td>
                                <td>${o.quantityM}</td>
                                <td>${o.quantityL}</td>
                                <td>${o.quantityXL}</td>
                                <td>${o.quantity2XL}</td>
                                <td>
                                    <div class="button-table">
                                        <a href="loadproduct?pid=${o.product_id}"><i class="fa-regular fa-pen-to-square fa-2x" title="Sửa"></i></a>
                                        <a href="#" onclick="doDelete(${o.product_id})"  ><i class="fa-solid fa-trash fa-2x" title="Xóa"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
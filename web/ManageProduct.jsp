
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
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("bạn chắc chắn muốn xóa sản phẩm này")) {
                    window.location = "deleteproduct?pid=" + id;
                }
            }
        </script>
        <style>
            .product {
                text-decoration: underline;
            }
        </style>
    <body>
        <jsp:include page="HeaderManage.jsp"></jsp:include>

            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="left">
                                <h2>Quản lý <b>Sản phẩm</b></h2>
                            </div>
                            <div class="right">
                                <a href="loadaddproduct"><i class="fa-solid fa-plus"></i><span>Thêm sản phẩm</span></a>					
                            </div>
                        </div>
                    </div>

                    <!--category-->

                    <div class="row">
                        <div class="row-category">
                            <div class="category-title"><i class="fa fa-list"></i>Loại sản phẩm</div>
                            <ul class="list-group category_block">
                                <li class="list-group-item text-white ${tag == "0" ? "active" : ""}"><a href="manageproductcategory?cid=${0}">Tất cả</a></li>

                            <c:forEach items="${listC}" var="o">
                                <li class="list-group-item text-white ${tag == o.category_id ? "active" : ""}"><a href="manageproductcategory?cid=${o.category_id}">${o.name}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Gía</th>
                            <th>
                                <div>Số lượng</div> 
                            </th>
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
                                <td>
                                    <div>M: ${o.quantityM} </div>
                                    <div>L: ${o.quantityL}  </div>
                                    <div>XL: ${o.quantityXL}</div>
                                    <div>2XL: ${o.quantity2XL}</div>
                                </td>
                                <td>
                                    <a href="loadproduct?pid=${o.product_id}"><i class="fa-regular fa-pen-to-square" title="Sửa"></i></a>
                                    <a href="#" onclick="doDelete(${o.product_id})"  ><i class="fa-solid fa-trash" title="Xóa"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!--            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>-->

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Category</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="./assest/css/manager-category.css">

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("bạn chắc chắn muốn xóa")) {
                    window.location = "deletecategory?cid=" + id;
                }
            }

        </script>
    </head>
    <body>
        <jsp:include page="HeaderManage.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="left">
                                <h2>Quản lý <b>loại sản phẩm</b></h2>
                            </div>

                        </div>
                    </div>
                    <div class="button-add">
                        <a href="AddCategory.jsp"><i class="fa-solid fa-plus"></i><span>Thêm loại sản phẩm</span></a>			
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Mô tả</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listC}" var="o">
                            <tr>
                                <td>${o.category_id}</td>
                                <td>${o.name}</td>
                                <td>${o.describe}</td>
                                <td>
                                    <div class="button-table">
                                        <a href="loadcategory?cid=${o.category_id}"><i class="fa-regular fa-pen-to-square fa-2x" title="Sửa"></i></a>
                                        <a href="#" onclick="doDelete(${o.category_id})"  ><i class="fa-solid fa-trash fa-2x" title="Xóa"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!--            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>-->

        </div>
    </body>
</html>

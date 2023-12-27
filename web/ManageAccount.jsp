
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Account</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("bạn chắc chắn muốn xóa")) {
                    window.location = "deleteaccount?uid=" + id;
                }
            }
        </script>
        <style>
            .account {
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
                                <h2>Quản lý <b>tài khoản</b></h2>
                            </div>
                            <div class="right">
                                <a href="AddAccount.jsp"><i class="fa-solid fa-plus"></i><span>Thêm tài khoản</span></a>					
                            </div>
                        </div>
                    </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Gmail</th>
                            <th>Mật khẩu</th>
                            <th>Địa chỉ</th>
                            <th>isAdmin</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listU}" var="o">
                            <tr>
                                <td>${o.user_id}</td>
                                <td>${o.user_name}</td>
                                <td>${o.user_email}</td>
                                <td>${o.user_password}</td>
                                <td>${o.address}</td>
                                <td>${o.isAdmin}</td>
                                <td>
                                    <a href="loaduser?uid=${o.user_id}"><i class="fa-regular fa-pen-to-square" title="Sửa"></i></a>
                                    <a href="#" onclick="doDelete(${o.user_id})"  ><i class="fa-solid fa-trash" title="Xóa"></i></a>
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
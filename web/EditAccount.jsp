
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
        <link rel="stylesheet" href="./css/manageForm.css">
    </head> 
    <body>
        <div id="addEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-detail">
                    <div class="modal-content">
                        <form action="editaccount" method="post" class="form-user">
                            <div class="modal-header">						
                                <h4 class="modal-title">Sửa Thông Tin Tài Khoản</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="title-form">ID</div>
                                    <input name="user_id" type="text" class="form-control" value="${user.user_id}" readonly="" required>
                                </div>
                                <div class="form-group">
                                    <div class="title-form">Tên</div>
                                    <input name="user_name" type="text" class="form-control" value="${user.user_name}" required>
                                </div>
                                <div class="form-group">
                                    <div class="title-form">Gmail</div>
                                    <input name="user_email" type="text" class="form-control" value="${user.user_email}" required>
                                </div>
                                <div class="form-group">
                                    <div class="title-form">Mật khẩu</div>
                                    <input name="user_password" type="password" class="form-control" value="${user.user_password}" required>
                                </div>
                                <div class="form-group">
                                    <div class="title-form">Địa chỉ</div>
                                    <input name="address" type="text" class="form-control" value="${user.address}" required>
                                </div>
                                <div class="form-group">
                                    <div class="title-form">Vai Trò</div>
                                    <div class="form-group form-select">
                                        <select id="isAdmin" name="isAdmin" class="form-select" >
                                            <option value="1" ${user.isAdmin == 1 ? 'selected' : ''}>Admin</option>
                                            <option value="0" ${user.isAdmin == 0 ? 'selected' : ''}>Khách Hàng</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button onclick="closeDetail()" class="back">Trở về</button>
                                <input type="submit" class="submit" value="Sửa">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function closeDetail() {
                window.location.href = "manageaccount";
            }
        </script>
    </body>
</html>


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
                <div class="modal-content">
                    <form action="editaccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Sửa Thông tin tài khoản</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID</label>
                                <br>       
                                <input name="user_id" type="text" class="form-control" value="${user.user_id}" readonly="" required>
                            </div>
                            <div class="form-group">
                                <label>Tên</label>
                                <br>       
                                <input name="user_name" type="text" class="form-control" value="${user.user_name}" required>
                            </div>
                            <div class="form-group">
                                <label>Gmail</label>
                                <br>       
                                <input name="user_email" type="text" class="form-control" value="${user.user_email}" required>
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <br>       
                                <input name="user_password" utype="text" class="form-control" value="${user.user_password}" required>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <br>       
                                <input name="address" type="text" class="form-control" value="${user.address}" required>
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <br>       
                                <input name="isAdmin" type="text" class="form-control" value="${user.isAdmin}" readonly="" required>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <a href="manageaccount" class="back">Trở về</a>
                            <input type="submit" class="submit" value="Sửa">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

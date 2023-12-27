<%-- 
    Document   : AddAccount
    Created on : Nov 15, 2023, 10:24:51 AM
    Author     : Hieu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Account</title>
        <link rel="stylesheet" href="./css/manageForm.css">
    </head>
    <body>
        <div id="addEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addaccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm tài khoản</h4>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên</label>
                                <br>       
                                <input name="user_name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Gmail</label>
                                <br>       
                                <input name="user_email" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <br>       
                                <input name="user_password" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <br>       
                                <input name="address" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="manageaccount" class="back">Trở về</a>
                            <input type="submit" class="submit" value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

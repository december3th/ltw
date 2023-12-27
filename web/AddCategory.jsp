<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <link rel="stylesheet" href="./css/manageForm.css">
    </head> 
    <body>
        <div id="addEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addcategory" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm loại sản phẩm</h4>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên</label>
                                <br>       
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Mô tả</label>
                                <br>
                                <textarea name="describe" class="form-control" required></textarea>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <a href="managecategory" class="back">Trở về</a>
                            <input type="submit" class="submit" value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

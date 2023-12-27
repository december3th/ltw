
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="./css/manageForm.css">
    </head> 
    <body>
        <div id="addEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editproduct" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Sửa sản phẩm</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID</label>
                                <br>       
                                <input name="pid" type="text" class="form-control" value="${detail.product_id}" readonly="" required>
                            </div>
                            <div class="form-group">
                                <label>Tên</label>
                                <br>       
                                <input name="name" type="text" class="form-control" value="${detail.name}" required>
                            </div>
                            <div class="form-group">
                                <label>Số lượng M</label>
                                <br>
                                <input name="quantityM" type="text" class="form-control" value="${detail.quantityM}" required>
                            </div>
                            <div class="form-group">
                                <label>Số lượng L</label>
                                <br>
                                <input name="quantityL" type="text" class="form-control" value="${detail.quantityL}" required>
                            </div>
                            <div class="form-group">
                                <label>Số lượng XL</label>
                                <br>
                                <input name="quantityXL" type="text" class="form-control" value="${detail.quantityXL}" required>
                            </div>
                            <div class="form-group">
                                <label>Số lượng 2XL</label>
                                <br>
                                <input name="quantity2XL" type="text" class="form-control" value="${detail.quantity2XL}" required>
                            </div>
                            <div class="form-group">
                                <label>Gía</label>
                                <br>
                                <input name="price" type="text" class="form-control" value="${detail.price}" required>
                            </div>

                            <div class="form-group">
                                <label>Mô tả</label>
                                <br>
                                <textarea name="describe" class="form-control"required>${detail.describe}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 1</label>
                                <br>
                                <input name="image1" type="text" class="form-control" value="${detail.image1}" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 2</label>
                                <br>
                                <input name="image2" type="text" class="form-control" value="${detail.image2}" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 3</label>
                                <br>
                                <input name="image3" type="text" class="form-control" value="${detail.image3}" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 4</label>
                                <br>
                                <input name="image4" type="text" class="form-control" value="${detail.image4}" required>
                            </div>
                            <div class="form-group">
                                <label>Loại sản phẩm</label>
                                <br>      
                                <select name="category_id" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.category_id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <a href="manageproduct" class="back">Trở về</a>
                            <input type="submit" class="submit" value="Sửa">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <input name="pid" type="text" class="form-control" value="${detail.product_id}" readonly="" required>
                            </div>
                            <div class="form-group">
                                <label>Tên</label>
                                <input name="name" type="text" class="form-control" value="${detail.name}" required>
                            </div>
                            <div class="size-div">
                                <div class="form-group">
                                    <label>Số lượng M</label>
                                    <input name="quantityM" type="text" oninput="formatNumberInput(this)" class="form-control" value="${detail.quantityM}" required>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng L</label>
                                    <input name="quantityL" type="text" oninput="formatNumberInput(this)" class="form-control" value="${detail.quantityL}" required>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng XL</label>
                                    <input name="quantityXL" type="text" oninput="formatNumberInput(this)" class="form-control" value="${detail.quantityXL}" required>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng 2XL</label>
                                    <input name="quantity2XL" type="text" oninput="formatNumberInput(this)" class="form-control" value="${detail.quantity2XL}" required>
                                </div>
                            </div>
                            <div class="div-info">
                                <div class="form-group">
                                    <label>Gía</label>
                                    <input name="price" type="text"  oninput="formatNumberInput(this)" value="<fmt:formatNumber pattern="###,##0" value="${detail.price}"/>" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Loại sản phẩm</label>
                                    <select name="category_id" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.category_id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea name="describe" class="form-control"required>${detail.describe}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 1</label>
                                <input name="image1" type="text" class="form-control" value="${detail.image1}" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 2</label>
                                <input name="image2" type="text" class="form-control" value="${detail.image2}" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 3</label>
                                <input name="image3" type="text" class="form-control" value="${detail.image3}" required>
                            </div>
                            <div class="form-group">
                                <label>Ảnh 4</label>
                                <input name="image4" type="text" class="form-control" value="${detail.image4}" required>
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
        <script>
            function formatNumberInput(input) {
                input.value = input.value.replace(/[^0-9]/g, '');
            }
        </script>
    </body>
</html>

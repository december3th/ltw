
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enter Information</title>
        <!-- Font awesome -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="./css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assest/css/info.css">
    </head>
    <body>
        <div class="main">
            <div class="main-form">
                <div class="img_shop"><img src="https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-flat-shop-image_1127540.jpg" alt="alt"/></div>
                <div class=""div-form">
                    <form action="processorder" method="POST" class="form" id="form2" autocomplete="off">
                        <div style="width: 100%">
                            <h3 class="heading">Thông tin nhận hàng</h3>
                            <c:if test="${not empty login_wrong}">
                                <h3>${login_wrong}</h3>
                            </c:if>
                            <div class="form-group">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" id="email" name="email" value="${acc.getUser_email()}" class="form-control" required="" autocomplete="off" ${acc.getUser_email() != null ? 'disabled' : ''}>
                            </div>
                            <c:if test="${empty acc}">
                                <div class="form-group">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" id="password" name="password" placeholder="Password" class="form-control"  autocomplete="off">
                                </div> 
                            </c:if>
                            <c:if test="${not empty acc}">
                                <div class="form-group">
                                    <label for="username" class="form-label">Họ Và Tên</label>
                                    <input type="text" value="${acc.getUser_name()}" id="username" name="username" class="form-control"  autocomplete="off"  ${acc.getUser_name()!= null ? 'disabled' : ''}>
                                </div> 
                            </c:if>
                            <div class="form-group">
                                <label for="address" class="form-label">Địa Chỉ</label>
                                <input type="text" id="address" name="address" placeholder="Địa chỉ"class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="code" class="form-label">Số Điện Thoại</label>
                                <input type="text" id="phonenumber" name="phonenumber" placeholder="Số điện thoại"class="form-control" required="">
                                <span class="form-message"></span>
                            </div>                  
                            <button class="form-submit" type="submit" style="font-size: 20px">Tiếp Tục</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>       
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
            integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="./assest/css/header.css" />   
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    </head>
    <body>
        <header class="header">
            <div class="header-wide">
                <div class="header-left">
                    <img src="./assest/images/logo/logo-header.png" alt="" />
                </div>
                <div class="header-center">
                    <div><h1>Quản Lý</h1></div>
                    <div class="navbar8">
                        <ul class="navbar8-list">
                            <li class="navbar8-item" style="padding: 10px;"><a href="manageproduct">Sản phẩm</a></li>
                            <li class="navbar8-item" style="padding: 10px;"><a href="managecategory">Loại sản phẩm</a></li>
                            <li class="navbar8-item" style="padding: 10px;"><a href="manageaccount">Tài khoản</a></li>
                            <li class="navbar8-item" style="padding: 10px;"><a href="manageorder">Đơn hàng</a></li>
                        </ul>
                    </div>

                </div>

                <div class="header-right">
                    <c:if test="${sessionScope.acc != null}">
                        <div class="drop-box login login-suss">
                            <span  href="#" id="dropdown-trigger" class="login-name">${sessionScope.acc.user_name}</span>
                            <div class="dropdown login-profile" id="dropdown">
                                <div class="dropdown-item"><a href="profile" class="profile-a">Trang Cá Nhân</a></div>
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <div class="dropdown-item"><a href="manageproduct" class="profile-a">Quản Lý</a></div>
                                </c:if>
                                <div class="dropdown-item"><a href="buyorder" class="profile-a">Đơn Hàng</a></div>
                                <div class="dropdown-item"><a href="logout" class="profile-a">Đăng Xuất</a></div>

                            </div>
                        </div>
                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                var dropdownTrigger = document.getElementById("dropdown-trigger");
                                var dropdown = document.getElementById("dropdown");
                                dropdownTrigger.addEventListener("mouseover", function () {
                                    dropdown.style.display = "block";
                                });
                                dropdownTrigger.addEventListener("mouseout", function () {
                                    dropdown.style.display = "none";
                                });
                                dropdown.addEventListener("mouseover", function () {
                                    dropdown.style.display = "block";
                                });
                                dropdown.addEventListener("mouseout", function () {
                                    dropdown.style.display = "none";
                                });
                            });
                        </script>
                    </c:if>                     
                </div>
            </div>
        </header>

    </body>
</html>
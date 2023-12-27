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
    </head>
    <body>
        <header class="header">
            <div class="header-wide">
                <div class="header-left">
                    <img src="./assest/images/logo/logo-header.png" alt="" />
                </div>
                <div class="header-center">
                    <form action="search" method="post" >
                        <div class="search-nav">
                            <div class="search-box">
                                <input type="text" name="txt" id="" value="${txtS}" />                           
                                <button type="submit">
                                    <i class="fa-solid fa-magnifying-glass"> </i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="navbar8">
                        <ul class="navbar8-list">
                            <li class="navbar8-item">
                                <a href="home">Trang chủ</a>
                            </li>
                            <li class="navbar8-item">
                                <a href="news">Tin tức</a>
                            </li>

                            <li class="navbar8-item">
                                <a href="contact">Liên hệ</a>
                            </li>
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
                    <c:if test="${sessionScope.acc == null}">
                        <a href="Login.jsp"><div class="login login-suss">
                                <span class="login-name">Đăng nhập</span>                               
                            </div></a>  

                    </c:if>
                    <div class="cart-icon">
                        <a href="showcart">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                        <span>${sizeCart!=null?sizeCart:0}</span>

                    </div>
                </div>
            </div>
        </header>

    </body>
</html>
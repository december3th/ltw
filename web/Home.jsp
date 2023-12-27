<%-- 
    Document   : Home
    Created on : Nov 15, 2023, 5:43:54 PM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
            integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="./assest/css/root.css" />
        <link rel="stylesheet" href="./assest/css/reset.css" />
        <link rel="stylesheet" href="./assest/css/header.css" />
        <link rel="stylesheet" href="./assest/css/slider.css" />
        <link rel="stylesheet" href="./assest/css/content.css" />
        <link rel="stylesheet" href="./assest/css/productDetail.css" />
        <link rel="stylesheet" href="./assest/css/footer.css" />
        <link rel="stylesheet" href="./assest/css/grid.css" />
        <link rel="stylesheet" href="./assest/css/responsive.css" />
        <link rel="stylesheet" href="./assest/css/hidden.css" />
        <title>Shop</title>
        <style>
            .product-name--item.underline a {
                text-decoration: underline;
            }
            .size-order--content{
                font-size: medium;
            }
            .size-order--content label{
                margin: 0 5px;
            }
            .size-order--content input{
                cursor: pointer;
            }
            .quantity-order--content{
                font-size: medium;

            }
            .quantity-order--content label{
                font-size: medium;
                margin: 0 11px;
            }

            .size-2xl, .size-xl, .size-l, .size-m, .het-hang{
                display: none;
            }

            button.add-to-cart:disabled{
                opacity: 0.5;
                cursor: not-allowed;
            }
            
            .filter{
                height: 0;
                overflow: hidden;
                transition: height 0.5s;
                width: 100%;
                display: flex;
                justify-content: flex-start;
            }
            
            .titleFilter{
                padding: 8px;
                width: fit-content;
                cursor: pointer;
                border: 1px solid;
                margin-bottom: 10px;
            }
            .titleFilter:hover{
                background-color: #f5f5f5;
            }
            .filterLeft{
                flex: 0.2;
            }
            .filterRight {
                flex: 0.2;
            }
            .filterLeft h3 , .filterRight h3{
                margin-bottom: 5px;
            }
            .buttonFilter{
                flex: 0.05;
                height: 40px;
                margin-bottom: 10px;
                cursor: pointer;
                padding: 5px 15px;
            }
            .filterLeft label , .filterLeft input , .filterRight lable,.filterRight input{
                cursor: pointer;
            }
            .size-order--content{
                padding: 10px;
            }

        </style>
    </head>
    <body>
        <div id="app">
            <header class="header">
                <div class="grid wide">
                    <div class="nav-bar--extra">
                        <i class="fa-solid fa-bars"></i>
                    </div>
                    <div class="header-left">
                        <!--<img src="./assest/images/logo/logo-header.png" alt="" />-->
                        <a href="home">BTL_03_08</a>
                    </div>
                    <div class="header-center">
                        <div class="navbar8">
                            <ul class="navbar8-list">
                                <li class="navbar8-item">
                                    <a href="home">Trang chủ</a>
                                </li>
                                <!-- <li class="navbar8-item">
                                    <a href="">Sản phẩm</a>
                                </li> -->
                                <li class="navbar8-item">
                                    <a href="news">Tin tức</a>
                                </li>

                                <li class="navbar8-item">
                                    <a href="contact">Liên hệ</a>
                                </li>
                                <c:if test="${sessionScope.acc == null}">
                                    <li class="navbar8-item">
                                        <a href="ForgotPassword.jsp">Quên mật khẩu </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <form action="search" method="post">
                            <div class="search-nav">
                                <div class="search-box">
                                    <input oninput="searchByName(this)" type="text" name="txt" id="" value="${txtS}" />                           
                                    <button type="submit" style="border: none; height: 100%;">
                                        <i class="fa-solid fa-magnifying-glass"> </i>
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="header-right">
                        <c:if test="${sessionScope.acc != null}">
                            <div class="login login-suss">
                                <span class="login-name">${sessionScope.acc.user_name}</span>
                                <div class="login-profile">
                                    <a href="profile" class="profile-a">Trang cá nhân</a>
                                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                                        <a href="manageproduct" class="profile-a">Quản lý </a>
                                    </c:if>
                                    <a href="buyorder" class="profile-a">Đơn hàng</a>
                                    <a href="logout" class="logout">Đăng xuất</a>
                                </div>

                            </div>                         
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
                            <span>${sizeCart}</span>

                        </div>
                    </div>

                </div>
            </header>
            <div class="nav-bar__extra--content hidden">
                <div class="nav-bar--overlay"></div>
                <div class="nav-bar--list">
                    <div class="nav-bar__extra--icon">
                        <i class="fa-solid fa-bars"></i>
                    </div>

                    <div class="nav-bar__extra--search">
                        <input type="text" name="" id="" />
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                    <div class="nav-bar--list-item">
                        <ul class="nav-bar__extra-list">
                            <li class="nav-bar__extra-item">
                                <a href="home">Trang chủ</a>
                            </li>
                            <li class="nav-bar__extra-item">
                                <a href="news">Tin mới</a>
                            </li>

                            <li class="nav-bar__extra-item">
                                <a href="contact">Liên hệ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="slider">
                <div class="grid wide">
                    <div class="row slides-contents">
                        <div class="slide-left col l-9 m-12 c-12">
                            <div class="slide-left--wrap">
                                <div class="slide-left--content">
                                    <div class="slide-show slide-show--active">
                                        <img
                                            src="https://cf.shopee.vn/file/vn-50009109-a6c7926ba4f1127e212e5df54443117d_xxhdpi"
                                            alt=""
                                            class="slide-show--1"
                                            />
                                        <img
                                            src="https://cf.shopee.vn/file/vn-50009109-57d35dc784f9fbea4a4f5a3ac25d55f8_xxhdpi"
                                            alt=""
                                            class="slide-show--1"
                                            />
                                        <img
                                            src="https://cf.shopee.vn/file/vn-50009109-17dbcb9b5b64e1ea8d77f29e03d86b5c_xxhdpi"
                                            alt=""
                                            class="slide-show--1"
                                            />
                                        <img
                                            src="https://cf.shopee.vn/file/vn-50009109-b64b18a749a12f1278a83019210f0607_xxhdpi"
                                            alt=""
                                            class="slide-show--1"
                                            />
                                    </div>
                                    <!-- <div class="slide-show">
                                    <img src="https://cf.shopee.vn/file/vn-50009109-bc4891edc4e5d1487b0fdc8a77906315_xxhdpi" alt="" class="slide-show--1">
                                </div> -->
                                </div>
                                <div class="slide-button slide-button--prev">
                                    <i class="fa-solid fa-chevron-left"></i>
                                </div>
                                <div class="slide-button slide-button--next">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                                <div class="slide-left--pagination">
                                    <span class="slide-left--pagination-bullet slide-left--pagination-0 active"> </span>
                                    <span class="slide-left--pagination-bullet slide-left--pagination-1"> </span>
                                    <span class="slide-left--pagination-bullet slide-left--pagination-2"> </span>
                                    <span class="slide-left--pagination-bullet slide-left--pagination-3"> </span>
                                </div>
                            </div>
                        </div>
                        <div class="slide-right col l-3 m-12 c-12">
                            <div class="slide-right--item">
                                <i class="fa-solid fa-medal"></i>
                                <div class="slide-right--content">
                                    <h3>Sản phẩm chất lượng cao</h3>
                                    <p>Quy trình sản phẩm đạt tiêu chuẩn</p>
                                </div>
                            </div>
                            <div class="slide-right--item">
                                <i class="fa-solid fa-store"></i>
                                <div class="slide-right--content">
                                    <h3>Đặt hàng</h3>
                                    <p>Shop bán hàng tất cả các ngày trong tuần</p>
                                </div>
                            </div>
                            <div class="slide-right--item">
                                <i class="fa-solid fa-truck-fast"></i>
                                <div class="slide-right--content">
                                    <h3>Giao hàng</h3>
                                    <p>Miễn phí giao hàng cho tất cả đơn hàng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 1/4 -->
            <div class="content">
                <div class="grid wide">
                    <div class="home-products">
                        <div class="products-list">


                            <ul class="products-name">
                                <li class="product-name--item ${tag == "0" ? "underline" : ""}"><a href="category?cid=${0}">Tất cả</a></li>
                                    <c:forEach items="${listC}" var="o">
                                    <li class="product-name--item ${tag == o.category_id ? "underline" : ""}"><a href="category?cid=${o.category_id}">${o.name}</a></li>
                                    </c:forEach>  
                            </ul>
                            <hr><!-- comment -->
                            <br>



                            <form action="" method="get">
                                <h1 class="titleFilter" onclick="showFilter()">Lọc</h1>
                                <div class="filter">

                                    <div class="filterLeft">
                                        <h2 style="margin-bottom: 8px;">Loại sản phẩm</h2>
                                        <c:forEach items="${listC}" var="o">
                                            <label>
                                                <input class="filtercategory" type="checkbox" name="filtercategory" value="${o.category_id}"> ${o.name}
                                            </label><br>
                                        </c:forEach>
                                    </div>                                 
                                    <div class="filterRight">
                                        <h2 style="margin-bottom: 8px;">Giá sản phẩm</h2>
                                        <label>
                                            <input class="filterprice" type="checkbox" name="filterprice" value="p.price BETWEEN 0 AND 300000"> 0-300.000
                                        </label><br>
                                        <label>
                                            <input class="filterprice" type="checkbox" name="filterprice" value="p.price BETWEEN 300000 AND 500000"> 300.000-500.000
                                        </label><br>
                                        <label>
                                            <input class="filterprice" type="checkbox" name="filterprice" value="p.price > 500000"> > 500.000
                                        </label>
                                    </div>
                                    <button class="buttonFilter" onclick="Filter()">Lọc</button>
                                </div>
                                <br>
                            </form>

                            <!--<button class="buttonFilter" onclick="Filter()">Lọc</button>-->
                            <hr>

                            <div class="product-list--product row" id="product">

                                <c:forEach items="${listP}" var="o">
                                    <div class="col l-2-4 m-4 c-6" onclick="showModalDetail(${o.product_id})">
                                        <div href="" class="home-product-item">
                                            <div class="home-product--img">
                                                <div class="home-product--add">
                                                    <!--style="pointer-events: none;"--> 
                                                    <div class="home-product--cart">
                                                        <i class="fa-solid fa-cart-plus"></i>
                                                        Thêm vào giỏ hàng
                                                    </div>

                                                </div>
                                                <img
                                                    class="img1"
                                                    src="${o.image1}"
                                                    alt=""
                                                    />


                                            </div>
                                            <div class="home-product--info">
                                                <div class="home-product--title">${o.name}

                                                </div>

                                                <div class="home-product--price">

                                                    <div class="home-product__sale"> 
                                                        <fmt:formatNumber pattern="##.#" value="${o.price}"/> ₫ </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="modal-detail modal-detail-${o.product_id} hidden">
                                        <!-- Them hidden-->
                                        <div class="overlay"></div>
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Sản phẩm</h4>
                                                <button class="modal-close modal-close-${o.product_id}" onclick="closeDetail(${o.product_id})">
                                                    <i class="fa-solid fa-xmark"></i>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col c-12 m-5 l-5">
                                                        <div class="modal-body-wapper">
                                                            <div class="modal-body--slider">
                                                                <div class="modal-body--slide-show modal-body--slide-show--active">
                                                                    <img 
                                                                        src="${o.image1}"
                                                                        alt="1"
                                                                        class="modal-body--slide-show--1 main-img-${o.product_id}"
                                                                        />

                                                                </div>
                                                                <div class="modal-body--slide-button modal-body--slide-button--prev" onclick="chevronClick(this, ${o.product_id})">
                                                                    <i class="fa-solid fa-chevron-left"></i>
                                                                </div>
                                                                <div class="modal-body--slide-button modal-body--slide-button--next" onclick="chevronClick(this, ${o.product_id})">
                                                                    <i class="fa-solid fa-chevron-right"></i>
                                                                </div>
                                                            </div>
                                                            <div class="modal-body--pagination slide-img-${o.product_id}">
                                                                <span class="modal-body--pagination-bullet modal-body--pagination-0" onclick="slideImgClick(this, ${o.product_id})">
                                                                    <img 
                                                                        src="${o.image1}"
                                                                        alt="1"
                                                                        srcset=""
                                                                        class="modal-body--slide-show--1"
                                                                        />
                                                                </span>
                                                                <span class="modal-body--pagination-bullet modal-body--pagination-1" onclick="slideImgClick(this, ${o.product_id})">
                                                                    <img
                                                                        src="${o.image2}"
                                                                        alt="2"
                                                                        srcset=""
                                                                        class="modal-body--slide-show--2"
                                                                        />
                                                                </span>
                                                                <span class="modal-body--pagination-bullet modal-body--pagination-2" onclick="slideImgClick(this, ${o.product_id})">
                                                                    <img
                                                                        src="${o.image3}"
                                                                        alt="3"
                                                                        srcset=""
                                                                        class="modal-body--slide-show--3"
                                                                        />
                                                                </span>
                                                                <span class="modal-body--pagination-bullet modal-body--pagination-3" onclick="slideImgClick(this, ${o.product_id})">
                                                                    <img
                                                                        src="${o.image4}"
                                                                        alt="4"
                                                                        srcset=""
                                                                        class="modal-body--slide-show--4"
                                                                        />
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- edit tiếp -->
                                                    <div class="col c-12 m-7 l-7">
                                                        <div class="modal-body--content">
                                                            <div class="modal-body--content__header">
                                                                ${o.name}
                                                            </div>
                                                            <div class="modal-body--price_ads">
                                                                <div class="modal-body--price">

                                                                    <div class="modal-body--price__sale">₫${o.price}</div>

                                                                </div>
                                                                <div class="modal-body--ads">
                                                                    Giá tốt nhất so với các sản phẩm cùng loại trên thị trường
                                                                    !                                        </div>
                                                            </div>
                                                            <section class="modal-body--promo-section">
                                                                <!-- <div class="modal-body--deal-container">
                                                                    <div class="deal-container-title">Ưu đãi</div>
                                                                    <div class="deal-container-content"></div>
                                                                </div> -->

                                                                <div class="modal-body--shipping-container">
                                                                    <div class="shipping-container-title">Vận Chuyển</div>
                                                                    <div class="shipping-container-content">
                                                                        <div class="shipping-container-content-1">
                                                                            <img
                                                                                src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/74f3e9ac01da8565c3baead996ed6e2a.png"
                                                                                alt=""
                                                                                />
                                                                            <span>Miễn phí vận chuyển cho đơn hàng </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="order-count">
                                                                    <span>Mô tả</span>
                                                                    <div class="count-order--content">
                                                                        &nbsp;&nbsp; <h3 class="describeDetail">${o.describe}</h3>
                                                                    </div>
                                                                </div>




                                                                <div class="order-count">
                                                                    <span>Size</span>
                                                                    <div class="size-order--content size-order--content-${o.product_id}">                                                  
                                                                        <label>
                                                                            <input name="option" type="radio" onclick="chooseSize(this, ${o.product_id});" value="M">M
                                                                        </label>                                     

                                                                        <label>
                                                                            <input name="option" type="radio" onclick="chooseSize(this, ${o.product_id});" value="L"> L
                                                                        </label>  

                                                                        <label>
                                                                            <input name="option" type="radio" onclick="chooseSize(this, ${o.product_id});" value="XL">XL
                                                                        </label>  

                                                                        <label>
                                                                            <input name="option" type="radio" onclick="chooseSize(this, ${o.product_id});" value="2XL"> 2XL
                                                                        </label>  

                                                                    </div>
                                                                </div>
                                                                <!--                                        <input name="trung" value="vvv" type="text">-->
                                                                <div class="order-count">
                                                                    <span>Sản phẩm có sẵn</span>
                                                                    <div class="quantity-order--content quantity-order--content-${o.product_id}">
                                                                        <label class="size-m size-m-${o.product_id}">
                                                                            ${o.quantityM}
                                                                        </label>      

                                                                        <label class="size-l size-l-${o.product_id}">
                                                                            ${o.quantityL}
                                                                        </label>  

                                                                        <label class="size-xl size-xl-${o.product_id}">
                                                                            ${o.quantityXL}
                                                                        </label>  

                                                                        <label class="size-2xl size-2xl-${o.product_id}">
                                                                            ${o.quantity2XL}
                                                                        </label>  

                                                                        <label class="het-hang het-hang-${o.product_id}">
                                                                            Hết hàng
                                                                        </label>  
                                                                    </div>
                                                                </div>

                                                            </section>
                                                            <form onclick="Cart(${o.product_id})"  class="modal-body--buy__form modal-body--buy__form-${o.product_id}"  action="" method="post">
                                                                <div class="product__id">
                                                                    <input name="product_id" type="text"  value="${o.product_id}" hidden="">
                                                                    <input name="num" type="text"  value="1" hidden="">
                                                                    <input class="sizeProduct-${o.product_id}" name="sizeProduct" type="text"  value="M" hidden="">
                                                                </div>
                                                                <section class="modal-body--buy modal-body--buy-${o.product_id}">

                                                                    <button class="add-to-cart add-to-cart-${o.product_id}" type="button">
                                                                        <i class="fa-solid fa-cart-plus"></i>
                                                                        Thêm Vào Giỏ Hàng
                                                                    </button>

                                                                </section>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!-- edit tiếp -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>


                        <c:if test="${tag == null && txtS == null && filter == null}">
                            <div class="products-btn">
                                <button onclick="loadMore()" class="btn">Hiện thị thêm</button>
                            </div>
                        </c:if>


                    </div>
                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>

        </div>
    </body>
    <script src="./assest/js/testHiddenHeader.js"></script>
    <script src="./assest/js/sliderShow.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="./js/cart.js"></script>

    <script>
        function showFilter(){
            var filterSection = document.querySelector('.filter');
            filterSection.classList.toggle("show-filter");
            if (filterSection.classList.contains("show-filter")) {
                filterSection.style.height = filterSection.scrollHeight + "px";
            } else {
                filterSection.style.height = "0";
            }
        }
        
        function chevronClick(chevron, id){
            var main_img = document.querySelector(".main-img-" + id);
            var slide_imgs = document.querySelector(".slide-img-"+id).querySelectorAll("img");
            var stt = main_img.alt;
            
            if(chevron.classList.contains("modal-body--slide-button--prev")){
                if(stt-2 < 0){
                    main_img.src = slide_imgs[3].src;
                    main_img.alt = 4;
                }else{
                    main_img.src = slide_imgs[stt-2].src;
                    main_img.alt = stt-1;
                }
            }else{
                if(stt > 3){
                    main_img.src = slide_imgs[0].src;
                    main_img.alt = 1;
                }else{
                    main_img.src = slide_imgs[stt].src;
                    main_img.alt = stt-1+2;
                }
            }
        }
        
        function slideImgClick(img, id){
            var main_img = document.querySelector(".main-img-" + id);
            var choosenImg = img.querySelector("img");
            
            main_img.src = choosenImg.src;
            main_img.alt = choosenImg.alt;
        }
        
                                    function chooseSize(myRadio, id) {
                                        var sizeM_quantity = document.querySelector('.size-m-' + id);
                                        var sizeL_quantity = document.querySelector('.size-l-' + id);
                                        var sizeXL_quantity = document.querySelector('.size-xl-' + id);
                                        var size2XL_quantity = document.querySelector('.size-2xl-' + id);
                                        var hethang = document.querySelector('.het-hang-' + id);
                                        var buttonAddToCart = document.querySelector(".add-to-cart-" + id);
                                        switch (myRadio.value) {
                                            case "M":
                                                if(Number(sizeM_quantity.innerHTML) <= 0){
                                                    sizeM_quantity.style.display = "none";
                                                    hethang.style.display = "block";
                                                    buttonAddToCart.disabled = true;
                                                }else{
                                                    sizeM_quantity.style.display = "block";
                                                    hethang.style.display = "none";
                                                    buttonAddToCart.disabled = false;
                                                }
                                                sizeL_quantity.style.display = "none";
                                                sizeXL_quantity.style.display = "none";
                                                size2XL_quantity.style.display = "none";
                                                break;
                                            case "L":
                                                if(Number(sizeL_quantity.innerHTML) <= 0){
                                                    sizeL_quantity.style.display = "none";
                                                    hethang.style.display = "block";
                                                    buttonAddToCart.disabled = true;
                                                }else{
                                                    sizeL_quantity.style.display = "block";
                                                    hethang.style.display = "none";
                                                    buttonAddToCart.disabled = false;
                                                }
                                                sizeM_quantity.style.display = "none";
                                                sizeXL_quantity.style.display = "none";
                                                size2XL_quantity.style.display = "none";
                                                break;
                                            case "XL":
                                                if(Number(sizeXL_quantity.innerHTML) <= 0){
                                                    sizeXL_quantity.style.display = "none";
                                                    hethang.style.display = "block";
                                                    buttonAddToCart.disabled = true;
                                                }else{
                                                    sizeXL_quantity.style.display = "block";
                                                    hethang.style.display = "none";
                                                    buttonAddToCart.disabled = false;
                                                }
                                                sizeM_quantity.style.display = "none";
                                                sizeL_quantity.style.display = "none";
                                                size2XL_quantity.style.display = "none";
                                                break;
                                            case "2XL":
                                                if(Number(size2XL_quantity.innerHTML) <= 0){
                                                    size2XL_quantity.style.display = "none";
                                                    hethang.style.display = "block";
                                                    buttonAddToCart.disabled = true;
                                                }else{
                                                    size2XL_quantity.style.display = "block";
                                                    hethang.style.display = "none";
                                                    buttonAddToCart.disabled = false;
                                                }
                                                sizeM_quantity.style.display = "none";
                                                sizeL_quantity.style.display = "none";
                                                sizeXL_quantity.style.display = "none";
                                                break;
                                        }
                                    }
    </script>

    <script>
        function loadMore() {
            var amount = document.getElementsByClassName("col l-2-4 m-4 c-6").length;
            $.ajax({
                url: "/websell/loadmore",
                type: "get", //send it through get method
                data: {
                    exits: amount
                },
                // lay dc data tu servlet
                success: function (data) {
                    var row = document.getElementById('product');
                    row.innerHTML += data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }

        function searchByName(param) {
            var txtSearch = param.value;
            $.ajax({
                url: "/websell/searchbyajax",
                type: "get", //send it through get method
                data: {
                    txt: txtSearch
                },
                success: function (data) {
                    var row = document.getElementById('product');
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>

    <script>
        function Filter() {
            var category = document.querySelectorAll(".filtercategory");
            var price = document.querySelectorAll(".filterprice");
            var valueCategory = [];
            var valuePrice = [];
            if (category.length > 0) {
                for (var item of category) {
                    if (item.checked) {
                        valueCategory.push(item.value);
                    }
                }
            }
            if (price.length > 0) {
                for (var item of price) {
                    if (item.checked) {
                        valuePrice.push(item.value);
                    }
                }
            }
//                alert(valueCategory);
            var queryPrice = "";
            if (valuePrice.length > 0) {
                if (valuePrice.length === 1) {
                    queryPrice = valuePrice[0];
                }
                if (valuePrice.length === 2) {
                    queryPrice = valuePrice[0] + " or " + valuePrice[1];
                }
                if (valuePrice.length === 3) {
                    queryPrice = "";
                }
            }
            var queryCategory = "";
            if (valueCategory.length > 0) {
                queryCategory = "c.category_id=" + valueCategory[0];
                for (var i = 1; i < valueCategory.length; i++) {
                    queryCategory = queryCategory + " or " + "c.category_id=" + valueCategory[i];
                }
            }

            $.ajax({
                url: "/websell/filter",
                type: "get", //send it through get method
                data: {
                    filtercategory: queryCategory,
                    filterprice: queryPrice
                },
                // lay dc data tu servlet
                success: function (data) {
                    var row = document.getElementById('product');
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>

    <script src="./assest/js/showModalDetail.js"></script>

</html>


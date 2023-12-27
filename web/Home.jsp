<%-- Document : Home Created on : Nov 15, 2023, 5:43:54 PM Author : Hieu --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assest/css/root.css" />
        <link rel="stylesheet" href="./assest/css/reset.css" />
        <link rel="stylesheet" href="./assest/css/slider.css" />
        <link rel="stylesheet" href="./assest/css/content.css" />
        <link rel="stylesheet" href="./assest/css/productDetail.css" />
        <link rel="stylesheet" href="./assest/css/home.css" />
        <title>Shop</title>
    </head>

    <body>
        <jsp:include page="HeaderHome.jsp"></jsp:include>
            <div id="app">
                <div class="div-body">
                    <div class="left-content">
                        <div class="div-filter">
                            <form action="" method="get">
                                <h2 class="titleFilter">Lọc</h2>
                                <div class="filter">
                                    <h3>Loại sản phẩm</h3>
                                    <div class="loai-sp">
                                    <c:forEach items="${listC}" var="o">
                                        <label><input class="filtercategory" type="checkbox"name="filtercategory" value="${o.category_id}"> ${o.name}
                                        </label>
                                    </c:forEach>
                                </div>
                                <h3>Giá sản phẩm</h3>
                                <div class="gia-sp">
                                    <label><input class="filterprice" type="checkbox" name="filterprice"
                                                  value="p.price BETWEEN 0 AND 300000"> 0-300.000</label>
                                    <label><input class="filterprice" type="checkbox" name="filterprice"
                                                  value="p.price BETWEEN 300000 AND 500000">
                                        300.000-500.000</label>
                                    <label><input class="filterprice" type="checkbox" name="filterprice"
                                                  value="p.price > 500000"> > 500.000</label>
                                </div>
                            </div>
                        </form>

                        <div style="text-align: center;"><button class="buttonFilter" onclick="Filter()">Lọc</button></div>
                    </div>
                </div>
                <div class="right-content">
                    <div class="right-item">
                        <i class="fa-solid fa-medal fa-5x"></i>
                        <div class="right-item-content">
                            <h3>Sản phẩm chất lượng cao</h3>
                            <p>Quy trình sản phẩm đạt tiêu chuẩn</p>
                        </div>
                    </div>
                    <div class="right-item">
                        <i class="fa-solid fa-store fa-5x"></i>
                        <div class="right-item-content">
                            <h3>Đặt hàng</h3>
                            <p>Shop bán hàng tất cả các ngày trong tuần</p>
                        </div>
                    </div>
                    <div class="right-item">
                        <i class="fa-solid fa-truck-fast fa-5x"></i>
                        <div class="right-item-content">
                            <h3>Giao hàng</h3>
                            <p>Miễn phí giao hàng cho tất cả đơn hàng</p>
                        </div>
                    </div>
                </div>

                <div class="slider-container">
                    <div class="slider-wrapper">
                        <div class="slide"><img src="https://cf.shopee.vn/file/vn-50009109-a6c7926ba4f1127e212e5df54443117d_xxhdpi" alt="Slide 1"></div>
                        <div class="slide"><img src="https://cf.shopee.vn/file/vn-50009109-57d35dc784f9fbea4a4f5a3ac25d55f8_xxhdpi" alt="Slide 2"></div>
                        <div class="slide"><img src="https://cf.shopee.vn/file/vn-50009109-17dbcb9b5b64e1ea8d77f29e03d86b5c_xxhdpi" alt="Slide 3"></div>
                        <div class="slide"><img src="https://cf.shopee.vn/file/vn-50009109-b64b18a749a12f1278a83019210f0607_xxhdpi" alt="Slide 4"></div>
                    </div>
                </div>

                <!-- 1/4 -->
                <div class="content">
                    <div class="grid wide">
                        <div class="home-products">
                            <div class="products-list">
                                <ul class="products-name">
                                    <li class="product-name--item ${tag == "0" ? "underline" : "" }"><a href="category?cid=${0}">Tất cả</a></li>
                                        <c:forEach items="${listC}" var="o">
                                        <li class="product-name--item ${tag == o.category_id ? " underline" : "" }"><a href="category?cid=${o.category_id}">${o.name}</a></li>
                                        </c:forEach>
                                </ul>
                                <hr>
                                <br>
                                <div class="grid-product" id="productContainer">
                                    <c:forEach items="${listP}" var="o">
                                        <div class="col l-2-4 m-4 c-6" onclick="showModalDetail(${o.product_id})">
                                            <div href="" class="home-product-item">
                                                <div class="home-product--img">
                                                    <div class="home-product--add">
                                                        <div class="home-product--cart"><i class="fa-solid fa-cart-plus"></i>Thêm vào giỏ hàng</div>
                                                    </div>
                                                    <img class="img1" src="${o.image1}" alt="" />
                                                </div>
                                                <div class="home-product--info">
                                                    <div class="home-product--title">${o.name}</div>
                                                    <div class="home-product--price">
                                                        <div class="home-product__sale"><fmt:formatNumber pattern="###,##0" value="${o.price}" /> ₫</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-detail-${o.product_id} hidden">
                                            <!-- Them hidden-->
                                            <div class="overlay" onclick="closeDetail(${o.product_id})"></div>
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Sản phẩm</h4>
                                                    <button class="modal-close modal-close-${o.product_id}" onclick="closeDetail(${o.product_id})">
                                                        <i class="fa-solid fa-xmark"></i>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="img-product">
                                                        <div class="modal-body-wapper">
                                                            <div class="modal-body--slider">
                                                                <div class="modal-body--slide-show modal-body--slide-show--active" ><img src="${o.image1}" alt="1" class="main-img-slide main-img-${o.product_id}"  style="width: 430px;height: 430px;object-fit: fit;"/></div>
                                                                <div class="modal-body--slide-button modal-body--slide-button--prev"  onclick="chevronClick(this, ${o.product_id})"><i class="fa-solid fa-chevron-left"></i></div>
                                                                <div class="modal-body--slide-button modal-body--slide-button--next"  onclick="chevronClick(this, ${o.product_id})"><i class="fa-solid fa-chevron-right"></i></div>
                                                            </div>
                                                            <div class="modal-body--pagination slide-img-${o.product_id}">
                                                                <span onclick="slideImgClick(this, ${o.product_id})"><img src="${o.image1}" alt="1" srcset="" class="side-img-slide slide-img-${o.product_id}"/></span>
                                                                <span onclick="slideImgClick(this, ${o.product_id})"><img src="${o.image2}" alt="2" srcset="" class="side-img-slide slide-img-${o.product_id}"/></span>
                                                                <span onclick="slideImgClick(this, ${o.product_id})"><img src="${o.image3}" alt="3" srcset="" class="side-img-slide slide-img-${o.product_id}"/></span>
                                                                <span onclick="slideImgClick(this, ${o.product_id})"><img src="${o.image4}" alt="4" srcset="" class="side-img-slide slide-img-${o.product_id}"/></span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- edit tiếp -->
                                                    <div class="detail-product">
                                                        <div class="modal-body--content">
                                                            <div class="modal-body--content__header">${o.name}</div>
                                                            <div class="modal-body--price_ads">
                                                                <div class="modal-body--price">
                                                                    <div class="modal-body--price__sale"><fmt:formatNumber pattern="###,##0" value="${o.price}"/>₫</div>
                                                                </div>
                                                                <div class="modal-body--ads">Giá tốt nhất so với các sản phẩm cùng loại trên thị trường!</div>
                                                            </div>
                                                            <section
                                                                class="modal-body--promo-section">
                                                                <div class="order-count">
                                                                    <span>Vận Chuyển</span>
                                                                    <div style="display: flex; align-items: center;">
                                                                        <div class="shipping-container-content-1">
                                                                            <img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/74f3e9ac01da8565c3baead996ed6e2a.png" alt="" />
                                                                            <div>Miễn phí vận chuyển cho đơn hàng </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="order-count">
                                                                    <span>Mô tả</span>
                                                                    <div class="count-order--content">&nbsp;&nbsp;<h3 class="describeDetail">${o.describe}</h3></div>
                                                                </div>
                                                                <div class="order-count">
                                                                    <span>Size</span>
                                                                    <div
                                                                        class="size-order--content size-order--content-${o.product_id}">
                                                                        <label>M <input name="option" type="radio" value="M"></label>
                                                                        <label>L <input name="option" type="radio" value="L"></label>
                                                                        <label>XL <input name="option" type="radio" value="XL"></label>
                                                                        <label>2XL <input name="option" type="radio" value="2XL"></label>
                                                                    </div>
                                                                </div>
                                                                <div class="order-count">
                                                                    <span>Sẵn có</span>
                                                                    <div
                                                                        class="quantity-order--content quantity-order--content-${o.product_id}">
                                                                        <label>${o.quantityM}</label>
                                                                        <label>${o.quantityL}</label>
                                                                        <label>${o.quantityXL}</label>
                                                                        <label>${o.quantity2XL}</label>
                                                                    </div>
                                                                </div>

                                                            </section>
                                                            <form onclick="Cart(${o.product_id})"
                                                                  class="modal-body--buy__form modal-body--buy__form-${o.product_id}"
                                                                  action="" method="post">
                                                                <div class="product__id">
                                                                    <input name="product_id"
                                                                           type="text"
                                                                           value="${o.product_id}"
                                                                           hidden="">
                                                                    <input name="num" type="text"
                                                                           value="1" hidden="">
                                                                    <input
                                                                        class="sizeProduct-${o.product_id}"
                                                                        name="sizeProduct"
                                                                        type="text" value="M"
                                                                        hidden="">
                                                                </div>
                                                                <section class="modal-body--buy modal-body--buy-${o.product_id}">
                                                                    <button class="add-to-cart" type="button"><i class="fa-solid fa-cart-plus"></i>Thêm Vào Giỏ Hàng</button>
                                                                </section>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!-- edit tiếp -->
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <c:if test="${tag == null && txtS == null && filter == null}">
                                    <div class="products-btn"><button onclick="loadMore()" class="btn">Hiện thị thêm</button></div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>

    <script>
        function chevronClick(chevron, id) {
            var main_img = document.querySelector(".main-img-" + id);
            var slide_imgs = document.querySelector(".slide-img-" + id).querySelectorAll("img");
            var stt = main_img.alt;
            console.log(chevron);
            if (chevron.classList.contains("modal-body--slide-button--prev")) {
                if (stt - 2 < 0) {
                    main_img.src = slide_imgs[3].src;
                    main_img.alt = 4;
                } else {
                    main_img.src = slide_imgs[stt - 2].src;
                    main_img.alt = stt - 1;
                }
            } else {
                if (stt > 3) {
                    main_img.src = slide_imgs[0].src;
                    main_img.alt = 1;
                } else {
                    main_img.src = slide_imgs[stt].src;
                    main_img.alt = stt - 1 + 2;
                }
            }
        }

        function slideImgClick(img, id) {
            var main_img = document.querySelector(".main-img-" + id);
            var choosenImg = img.querySelector("img");
            console.log(choosenImg + " " + main_img);
            main_img.src = choosenImg.src;
            main_img.alt = choosenImg.alt;
        }

        function loadMore() {
            var amount = document.getElementsByClassName("col l-2-4 m-4 c-6").length;

            $.ajax({
                url: "/websell/loadmore",
                type: "get",
                data: {
                    exits: amount
                },
                success: function (data) {
                    // Append the new items to the existing container
                    var productContainer = document.getElementById('productContainer');
                    productContainer.innerHTML += data;
                },
                error: function (xhr) {
                    // Handle errors
                }
            });
        }


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
                    var row = document.getElementById('productContainer');
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>
    <script src="./assest/js/sliderShow.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="./js/cart.js"></script>
    <script src="./assest/js/showModalDetail.js"></script>
</html>
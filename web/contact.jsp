

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contact-ShopNha</title>
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
        <link rel="stylesheet" href="./assest/css/grid.css" />
        <link rel="stylesheet" href="./assest/css/footer.css" />
        <link rel="stylesheet" href="./assest/css/contact.css" />
    </head>
    <body>
        <div id="app">
            <jsp:include page="HeaderHome.jsp"></jsp:include>
            <div class="content">
                <div class="contact">
                    <div class="contact-content1">
                        <h2>LIÊN HỆ</h2>
                        <h4>Chăm sóc khách hàng là niềm vui của chúng tôi!</h4>
                    </div>
                    <div class="contact-content2">
                        <div class="contact-element">
                            <div class="contact-element-info">
                                <h2>Cửa hàng 1</h2>
                                <p>Địa chỉ:Học Viện Công Nghệ Bưu Chính Viễn Thông D20ATTT </p>
                                <span>Điện thoại: 0988289071</span>
                                <span>Gmail: ltw0308@gmail.com</span>
                                <span>
                                    Website:
                                    <a href="">Thời trang nam Số 1</a>
                                </span>
                            </div>

                            <div class="contact-element-info">
                                <h2>Cửa hàng 2</h2>
                                <p>Địa chỉ: D20ATTT PTIT Lập trình Web Nhóm 03-08</p>
                                <span>Điện thoại: 0988289071</span>
                                <span>Gmail: ltw0308@gmail.com</span>
                                <span>
                                    Website:
                                    <a href="">Thời trang nam Số 2</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
    <script src="./assest/js/testHiddenHeader.js"></script>
</html>

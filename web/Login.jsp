<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="./css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login Form</title>
        <style>
            .error {
                color: red;
                margin-left: 10px;
            }
        </style>
    </head>
    <body>
        <div id="logreg-forms">
            <form class="form-signin" action="login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đăng nhập</h1>
                <!--login sai-->
                <c:set value="${requestScope.ms}" var="c"></c:set>                
                <c:if test="${c != null}">
                    <div class="alert alert-danger" role="alert">
                        Sai tài khoản hoặc mật khẩu
                    </div>
                </c:if>               
                <input name="email"  type="email" id="inputEmail" class="form-control" placeholder="Gmail" value="${cookie.email.value}" required="" autofocus="">
                <input name="pass"  type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" value="${cookie.pass.value}" required="">

                <div class="form-group form-check">
                    <input name="remember" value="ON" type="checkbox" ${(cookie.remember.value eq "ON") ? "checked": ""} class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Nhớ</label>
                </div>

                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i>Đăng nhập</button>
                <hr>
                <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i>Đăng kí</button>
            </form>

            <form action="#" method="post" class="form-signup" onmousemove="check()" id="form_signUp">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đăng kí</h1>
                <input  name="user" type="text" id="user-name" class="form-control" placeholder="Tên" required="" autofocus="">
                <span id="error1" class="error"></span>
                <input name="email" type="email" id="inputEmail2" class="form-control" placeholder="Gmail" required="" autofocus="">
                <span id="error2" class="error"></span>
                <br>
                <button class="m-1 email_send" type="" onclick="sendCode()"><i class="fa-regular fa-envelope"></i>Gửi mã</button>
                <input name="code" type="text" id="code" placeholder="Mã"  autofocus="" required="">

                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" required autofocus="">
                <span id="error3" class="error"></span>
                <input name="address" type="text" id="Address" class="form-control" placeholder="Địa chỉ" required="" autofocus="">
                <span id="error4" class="error"></span>
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Nhắc lại mật khẩu" required autofocus="">
                <span id="error5" class="error"></span>
                <input type="hidden" id="checkForm" value="0">
                <input type="hidden" id="checkForm2" value="0">
                <button class="btn btn-primary btn-block" type="submit" onclick="signUp()"><i class="fas fa-user-plus"></i>Đăng kí</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i>Trở về</a>
            </form>
            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script src="./js/signup.js"></script>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
        <script>
                function sendCode(){
                        var name = 'code to verify';
                        var email = document.querySelector('#inputEmail2').value;
                        var message;
                        var randomNum = Math.floor(Math.random() * 999999) + 1;
                        var randomString = randomNum.toString().padStart(6, "0");
                        message = randomString;
                        var macode = document.querySelector('#checkForm2');
                        macode.value = randomString;
                        Email.send({
                            SecureToken: "4962d7e6-9a7d-4dc2-befe-56464f6817e2",
                            To: email,
                            From: "trinhviethieu0112@gmail.com",
                            Subject: name,
                            Body: message
                        }).then(function (message) {
                            alert("Email sent successfully to: "+ email);
                        });
                    }
        </script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
    </body>
</html>

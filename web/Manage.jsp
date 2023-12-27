

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;700&display=swap" rel="stylesheet">
        <style>
            header h1 {
                text-decoration: underline black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="HeaderManage.jsp"></jsp:include>
        <div class="container">
            <div class="title">Biểu đồ thống kê</div>
            <canvas id="canvas"></canvas>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


        <footer>
            <p>Manage Shop</p>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script>


//            loadChart = async() => {
//                
//            }
                (main = async () => {
                    let myData;

                    await $.ajax({
                            url: "/websell/chart",
                    type: "get", //send it through get method
//                    data: {
//                        exits: amount
//                    },
                    // lay dc data tu servlet
                    success: function (data) {
                        myData = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });

                let rsCountOrder = myData.split("&")[0];
                let rsSumOrder = myData.split("&")[1];
                let rsCountProduct = myData.split("&")[2];

                let rsC = rsCountOrder.split(" ");
                let rsS = rsSumOrder.split(" ");
                let rsP = rsCountProduct.split(" ");

                console.log(parseInt(rsC[0]));
                console.log(parseFloat(rsS[0]));
                console.log(rsP);

                rsS = rsS.map((item) => item / 1000000);

                const labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
                const data = {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Số lượng đơn hàng/tháng',
                            backgroundColor: "blue",
                            borderColor: 'blue',
                            data: [parseInt(rsC[0]), parseInt(rsC[1]), parseInt(rsC[2]), parseInt(rsC[3]), parseInt(rsC[4]), parseInt(rsC[5])],
                            tension: 0.4,
                        },

                        {
                            label: 'Tổng doanh thu 1.000.000vnđ/tháng',
                            backgroundColor: "red",
                            borderColor: 'red',
                            data: [parseFloat(rsS[0]), parseFloat(rsS[1]), parseFloat(rsS[2]), parseFloat(rsS[3]), parseFloat(rsS[4]), parseFloat(rsS[5])],
                            tension: 0.4,
                        },
                        {
                            label: 'Tổng sản phẩm bán được/tháng',
                            backgroundColor: "yellow",
                            borderColor: 'yellow',
                            data: [parseInt(rsP[0]), parseInt(rsP[1]), parseInt(rsP[2]), parseInt(rsP[3]), parseInt(rsP[4]), parseInt(rsP[5])],
                            tension: 0.4,
                        },
                    ],
                }
                const config = {
                    type: 'line',
                    data: data,
                }
                const canvas = document.getElementById('canvas')
                const chart = new Chart(canvas, config)

            })();
        </script>
    </body>
</html>

<%-- 
    Document   : orderDetail
    Created on : Mar 7, 2022, 8:12:16 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <title>JSP Page</title>
    </head>
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <!--Container Main start-->
    <div class="height-100">
        <div class="container-fluid box-view-list">
            <div class="row">
                <div class="list-product">
                    <p class="fw-bold fs-5">Chi tiết mua hàng: </p>
                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Số Điện Thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Lưu ý</th>
                                <th scope="col">Ngày Mua Hàng</th>
                                <th scope="col">Discount</th>
                                <th scope="col">Ngày Giao Hàng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>
                                    Binh
                                </td>
                                <td>
                                    0321023010123
                                </td>
                                <td>
                                   cuongtv@gmail.com
                                </td>
                                <td>
                                    hàng dễ vỡ
                                </td>
                                <td>03/03/2022</td>
                                <td>10%</td>
                                <td>10/10/2020</td>

                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="product-list">
                    <p>Sản phẩm: </p>
                   
                    
                    <table class="table">
                            <tr>
                               <td>
                                <div class="row">
                                    <div class="col-2">
                                        <img src="./" alt="" width="80" height="80">
                                    </div>
                                    <div class="col-7">
                                        <p>Iphone 13 ProMax 256gb</p>
                                        <p>x1</p>
                                    </div>
                                    <div class="col-3">
                                        <p><b>Đơn giá: </b>: 39,900,000</p>
                                        <p><b>Tổng giá: </b> 39,900,000</p>
                                    </div>
                                </div>
                               </td>
                            </tr>
                            <tr>
                                <td>
                                 <div class="row">
                                     <div class="col-2">
                                         <img src="./" alt="" width="80" height="80">
                                     </div>
                                     <div class="col-7">
                                         <p>Iphone 13 ProMax 256gb</p>
                                         <p>x1</p>
                                     </div>
                                     <div class="col-3">
                                         <p><b>Đơn giá: </b>: 39,900,000</p>
                                         <p><b>Tổng giá: </b> 39,900,000</p>
                                     </div>
                                 </div>
                                </td>
                             </tr>
                    </table>
                </div>

            </div>
        </div>

    </div>
    </body>
</html>

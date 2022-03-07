<%-- 
    Document   : viewOrder
    Created on : Mar 7, 2022, 6:27:26 PM
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
    <!--side bar-->
    <jsp:include page = "./sideBar.jsp" />
    <body>
    <!--Container Main start-->
       <div class="height-100">
        <div class="container-fluid box-view-list">
            <div class="list-product">
                <p>Danh sách đặt hàng: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">ID Khách Hàng</th>
                            <th scope="col">Mã Sản Phẩm</th>
                            <th scope="col">Số Lượng</th>
                            <th scope="col">Ngày Mua</th>
                            <th scope="col">Ngày Vận Chuyển</th>
                            <th scope="col">ID Chi Tiết Đơn Hàng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>
                                Binh
                            </td>
                            <td>
                                abcd
                            </td>
                            <td>
                                1
                            </td>
                            <td>
                                01/03/2022
                            </td>
                            <td>02/03/2022</td>
                            <td>abc</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</body>
</html>

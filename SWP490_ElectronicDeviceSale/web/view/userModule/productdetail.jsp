<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         CuongTV         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${url}/css/productdetails.css" rel="stylesheet" type="text/css"/>
        <!--<link href="assets/css/productdetails.css" rel="stylesheet" type="text/css"/>-->
        <link href="${url}/css/review.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script src="${url}/js/detail.js" type="text/javascript" defer></script>
        <script src="${url}/js/review.js" type="text/javascript" defer></script>
        <title>${requestScope.product.name}</title>
    </head>
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->            
    <body>
        <article>
            <section>
                <div class="container product-detail mb-5">
                    <div class="row">
                        <p class="fs-3 fw-bolder">${requestScope.product.name}</p><hr>
                        <div class="col-6 text-center">                    
                            <img src="${requestScope.product.image}" alt="" width="300" height="300" class="">
                        </div>
                        <div class="col-6">
                            <p class="fs-3 fw-bold money-text">${requestScope.product.price} <u>??</u></p>                          
                            <div class="d-flex flex-row bg-light justify-content-around rounded text-gb">
                                <div class="bd-highlight">
                                    <div class="form-check form-check-inline ">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1"><b>128GB</b></label>
                                    </div>
                                    <p class="m-0">33.990.000<u>??</u></p>
                                </div>
                                <div class="bd-highlight">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1"><b>256GB</b></label>
                                    </div>
                                    <p class="m-0">33.490.000<u>??</u></p>
                                </div>
                                <div class=" bd-highlight">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1"><b>512GB</b></label>
                                    </div>
                                    <p class="m-0">39.490.000<u>??</u></p>
                                </div>
                                <div class=" bd-highlight">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                               id="inlineRadio1" value="option1">
                                        <label class="form-check-label" for="inlineRadio1"><b>1TGB</b></label>
                                    </div>
                                    <p class="m-0">45.990.000<u>??</u></p>
                                </div>
                            </div>
                            <div class="image-color my-3 d-flex">
                                <div class="text-center">
                                    <img src="" alt="" width="40" height="40">
                                    <p class="text-image-color m-0">V??ng</p>
                                </div>
                                <div class="text-center mx-3">
                                    <img src="" alt="" width="40" height="40">
                                    <p class="text-image-color m-0">X??m</p>
                                </div>
                                <div class="text-center me-3">
                                    <img src="" alt="" width="40" height="40">
                                    <p class="text-image-color m-0">B???c</p>
                                </div>
                                <div class="text-center me-3">
                                    <img src="" alt="" width="40" height="40">
                                    <p class="text-image-color m-0">Xanh</p>
                                </div>
                                <div class="text-center">
                                    <img src="" alt="" width="40" height="40">
                                    <p class="text-image-color m-0">Xanh L??</p>
                                </div>
                            </div>

                            <div class="quantity">
                                <div class="input-group">
                                    <span class="fs-6 me-3 my-2">S??? l?????ng</span>
                                    <button type="button" onclick="decrease()" class="btn-decrease">-</button>                                
                                    <input type="text" value="1" id="num" class="input-group-text" name="qty">                           
                                    <button type="button" onclick="increase()" class="btn-increase">+</button>                                                    
                                </div>

                            </div>
                            <div class="text-comment-image rounded p-3 border my-3">
                                <div>
                                    <p class="fw-bold">Nh???n ngay khuy???n m???i ?????c bi???t</p>
                                </div>
                                <div>
                                    <p> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill color-check-circle" viewBox="0 0 16 16">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                        </svg> 
                                        <span class="text-promotion">
                                            ??u ????i d??nh cho kh??ch h??ng sinh nh???t trong Th??ng 3: T???ng b???o h??nh th??m 1 n??m <a href="">Xem chi ti???t</a>
                                        </span>
                                    </p>
                                    <p> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill color-check-circle" viewBox="0 0 16 16">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                        </svg> 
                                        <span class="text-promotion">
                                            C?? h???i tr??ng Jackpot ?????n 2 t??? <a href="">Xem chi ti???t</a>
                                        </span>

                                    </p>
                                    <p> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill color-check-circle" viewBox="0 0 16 16">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                        </svg> 
                                        <span class="text-promotion">
                                            T???ng ph???n m???m h???c t???p online tr??? gi?? 300.000?? <a href="">Xem chi ti???t</a>
                                        </span>

                                    </p>
                                    <p> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill color-check-circle" viewBox="0 0 16 16">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                        </svg> 
                                        <span class="text-promotion">
                                            T???ng g??i iCloud 50GB mi???n ph?? 3 th??ng Xem <a href="">Xem chi ti???t</a>
                                        </span>

                                    </p>
                                    <p> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill color-check-circle" viewBox="0 0 16 16">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                        </svg> 
                                        <span class="text-promotion">
                                            Thu c?? ?????i m???i tr??? gi?? 15% <a href="">Xem chi ti???t</a>
                                        </span>

                                    </p>

                                </div>

                            </div>


                            <div class="btn-add-buy mt-5">
                                <a href="${pageContext.request.contextPath}/AddToCartFromProductDetailController?idProduct=${product.id}" class="btn btn-success py-2 mb-1 text-decoration-none" style="width: 100%;">
                                    Th??m v??o gi??? h??ng
                                </a><br>
                                <a href="${pageContext.request.contextPath}/ByNowController?idProduct=${product.id}"class="btn btn-danger p-0 text-decoration-none" style="width: 100%;">
                                    Mua ngay <br>
                                    <span class="free-ship">Mi???n ph?? giao h??ng</span>
                                </a>
                                <p class="my-3">Mua h??ng tr???c ti???p t???i 
                                    <i>Ph?????ng M??? ????nh 2, Qu???n Nam T??? Li??m, H?? N???i</i> <br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </article>
        <article>
            <section>
                <div class="container description-product">
                    <div class="row">
                        <div class="col-7 border p-3">
                            <p class="fs-5 fw-bolder">?????c ??i???m n???i b???t c???a ${requestScope.product.name}</p><hr>
                            <p class="fw-bold">iPhone 13 Pro Max deserves to be the largest, most powerful and longest-lasting iPhone ever that will give you a great experience, from casual tasks to professional applications.</p>
                            <div class="img-detail text-center my-4">
                                <img src="${requestScope.product.image}" alt="" width="400" height="400">
                            </div>
                            <p class="fw-bold">Immerse yourself in the huge screen space</p>
                            <span>Whether it's entertainment when watching movies, playing games or checking emails, reading documents, the iPhone 13 Pro Max 's large 6.7-inch screen always gives the best experience.

                                Not only is it big, it's also the world's top quality smartphone display with a stunning OLED panel, super-sharp Super Retina XDR technology, and unbelievable peak brightness of up to 1200 nits for HDR content. In front of you is a breathtaking entertainment space, an ideal mobile device for quick work with a truly excellent display.</span>
                            <div class="img-inch text-center my-4">
                                <img src="${requestScope.product.image}" alt="" width="400" height="400">
                            </div>
                            <p class="fw-bold">Leap in battery life</p>   
                            <span>The iPhone Pro Max series has always been loved by users for its super-long battery life, but the iPhone 13 Pro Max does so much more. A larger battery capacity, new screen, and more energy-efficient Apple A15 Bionic processor make the iPhone 13 Pro Max the best iPhone ever.

                                Compared to iPhone 12 Pro Max, iPhone 13 Pro Max has 2.5 hours longer usage time. You will clearly feel the difference in actual use, the iPhone 13 Pro Max's battery life can even last up to the 3rd day with normal use.</span>
                        </div>
                        <div class="col-5">
                            <div class="specifications border p-3">
                                <p class="fs-5 fw-bolder">Th??ng s??? k??? thu???t</p>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>Screen</td>
                                        <td>6.7", Super Retina XDR, OLED, 2778 x 1284 Pixel</td>
                                    </tr>
                                    <tr>
                                        <td>His room</td>
                                        <td>12.0 MP + 12.0 MP + 12.0 MP</td>
                                    </tr>
                                    <tr>
                                        <td>Camera Selfie</td>
                                        <td>12.0 MP</td>
                                    </tr>
                                    <tr>
                                        <td>RAM</td>
                                        <td>6 GB</td>
                                    </tr>
                                    <tr>
                                        <td>Internal memory</td>
                                        <td>128 GB</td>
                                    </tr>
                                    <tr>
                                        <td>CPU</td>
                                        <td>A15 Bionic</td>
                                    </tr>
                                    <tr>
                                        <td>GPU</td>
                                        <td>Apple GPU 5 cores</td>
                                    </tr>
                                    <tr>
                                        <td>Battery capacity</td>
                                        <td>4352 mAh</td>
                                    </tr>
                                    <tr>
                                        <td>SIM</td>
                                        <td>2, 1 eSIM, 1 Nano SIM</td>
                                    </tr>
                                    <tr>
                                        <td>Operating system</td>
                                        <td>iOS 15</td>
                                    </tr>
                                    <tr>
                                        <td>Origin</td>
                                        <td>China</td>
                                    </tr>
                                    <tr>
                                        <td>Release time</td>
                                        <td>09/2021</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="container news border mt-3">
                                <p>Tin t???c v??? ${requestScope.product.name}</p>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <img src="${requestScope.product.image}" alt="" width="130" height="100">
                                        </td>
                                        <td>
                                            <p class="ms-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora at aliquid magni doloribus placeat ad porro molestias</p>                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${requestScope.product.image}" alt="" width="130" height="100">
                                        </td>
                                        <td>
                                            <p class="ms-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora at aliquid magni doloribus placeat ad porro molestias</p>                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${requestScope.product.image}" alt="" width="130" height="100">
                                        </td>
                                        <td>
                                            <p class="ms-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora at aliquid magni doloribus placeat ad porro molestias</p>                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="${requestScope.product.image}" alt="" width="130" height="100">
                                        </td>
                                        <td>
                                            <p class="ms-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora at aliquid magni doloribus placeat ad porro molestias</p>                                  
                                        </td>
                                    </tr>
                                </table>                       
                            </div>
                        </div>  
                    </div>
                </div>
            </section>
        </article>

        <article>
            <br>
            <div class="mb-3 text-center">
                <button class="btn-review" onclick="openTab('Review')">????nh gi?? c???a kh??ch h??ng</button>
                <button class="btn-review" onclick="openTab('AddReview')">Th??m ????nh gi??</button>

            </div>
            <!-- Start list review -->
            <div id="Review" class="w3-container tab">
                <ul class="">
                    <c:forEach items="${reviewbyid}" var="review" >
                        <li>
                            <div class="">
                                <div class="">
                                    <h4 class=""><strong>${review.name}</strong>  - <span>${review.created}</span></h4>
                                            <c:if test="${review.vote == 1}">
                                        <div>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${review.vote == 2}">
                                        <div>
                                            <a class="btn-icon-star text-decoration-none "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                                fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                        </div>

                                    </c:if>
                                    <c:if test="${review.vote == 3}">
                                        <div>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${review.vote == 4}">
                                        <div>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${review.vote == 5}">
                                        <div>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                            <a class="btn-icon-star text-decoration-none"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                                               fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                                <path
                                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                </svg>
                                            </a>
                                        </div>
                                    </c:if>

                                    <p>${review.content}</p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- End list review -->

            <!-- Start review form -->
            <div id="AddReview" class="w3-container tab" style="display:none">
                <form action="ReviewController?id=${requestScope.product.id}" method="post" class="form-review">
                    <div class="row">
                        <div class="col-2">
                            <img src="${requestScope.product.image}" alt="" width="80" height="80">
                        </div>
                        <div class="col-10">
                            <p class="mt-4">${requestScope.product.name }</p>
                        </div>
                    </div>
                    <div class="row my-3">
                        <div class="col-6 mt-2">
                            <p>Nh???p s??? sao t????ng ???ng v???i m???c ????? h??i l??ng:  <input class="input-quantity" type="number" name="vote" value="5" min="1" max="5"></td></p>
                        </div>
                        <div class="col-6 d-flex justify-content-evenly text-center">
                            <div>
                                <a class="btn-icon-star"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                              fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path
                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </a>
                                <p class="title-star">R???t t???</p>
                            </div>
                            <div class="">
                                <a class="btn-icon-star"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                              fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path
                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </a>
                                <p class="title-star">T???</p>
                            </div>
                            <div>
                                <a class="btn-icon-star"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                              fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path
                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </a>
                                <p class="title-star">B??nh th?????ng</p>
                            </div>
                            <div class="">
                                <a class="btn-icon-star"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                              fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path
                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </a>
                                <p class="title-star">T???t</p>
                            </div>
                            <div class="">
                                <a class="btn-icon-star"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                              fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path
                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                    </svg>
                                </a>
                                <p class="title-star">R???t t???t</p>
                            </div>
                        </div>
                    </div>
                    <div class="review-comment">
                        <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="N???i dung ????nh gi?? c???a b???n*"  name="content"rows="5" 
                                  maxlength="255"
                                  required
                                  ></textarea>
                    </div>
                    <div class="input-name-phone row g-2 my-4">
                        <div class="col-6">
                            <input type="text" class="form-control" placeholder="T??n c???a b???n*"  name="name"
                                   minlength="3"
                                   maxlength="50"
                                   required>
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control" placeholder="S??? ??i???n tho???i*" required name="phone"
                                   maxlength="10"
                                   pattern="(09|03|07|08|05)+([0-9]{8})$"
                                   title="Example 0912345678"
                                   required>
                        </div>
                    </div>
                    <div class="text-center my-4">
                        <button type="submit"class="btn btn-success" >G???i ????nh gi??</button>
                    </div>
                    <div class="text-center">
                        <p class="title-star">C???m ??n qu?? kh??ch ???? ????nh gi?? cho s???n ph???m n??y!</p>
                    </div>
                </form>
            </div>
            <!--End review form -->
        </article>
    </body>
    <!--Start footer-->
    <jsp:include page = "./footer/footer.jsp" />
    <!--End footer-->
</html>

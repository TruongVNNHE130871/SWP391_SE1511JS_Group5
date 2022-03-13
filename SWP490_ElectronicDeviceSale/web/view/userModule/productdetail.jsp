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
        <script src="${url}/js/detail.js" type="text/javascript" defer></script>
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
                            <p class="fs-3 fw-bold money-text">${requestScope.product.price} <u>đ</u></p>
                            <div class="product-review mb-4">
                                <span class="icon-start-rate me-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                    </svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                    </svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                    </svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill color-star" viewBox="0 0 16 16">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                    </svg>
                                </span>
                                <span class="border-start me-4"></span>
                                <a class="link-feedback">
                                    134 FeedBack
                                </a>
                            </div>

                            <div class="quantity">
                                <div class="input-group">
                                    <span class="fs-6 me-3 my-2">Quantity</span>
                                    <button type="button" onclick="decrease()" class="btn-decrease">-</button>                                
                                    <input type="text" value="1" id="num" class="input-group-text">                           
                                    <button type="button" onclick="increase()" class="btn-increase">+</button>                                                    
                                </div>

                            </div>
                            <div class="btn-add-buy mt-5">
                                <a href="${pageContext.request.contextPath}/AddToCart?idProduct=${product.id}" class="btn btn-success py-2 mb-1 text-decoration-none" style="width: 100%;">
                                    Add To Cart
                                </a><br>

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
                            <p class="fs-5 fw-bolder">Detailed review of ${requestScope.product.name}</p><hr>
                            <p class="fw-bold">iPhone 13 Pro Max deserves to be the largest, most powerful and longest-lasting iPhone ever that will give you a great experience, from casual tasks to professional applications.</p>
                            <div class="img-detail text-center">
                                <img src="${requestScope.product.image}" alt="">
                            </div>
                            <p class="fw-bold">Immerse yourself in the huge screen space</p>
                            <span>Whether it's entertainment when watching movies, playing games or checking emails, reading documents, the iPhone 13 Pro Max 's large 6.7-inch screen always gives the best experience.

                                Not only is it big, it's also the world's top quality smartphone display with a stunning OLED panel, super-sharp Super Retina XDR technology, and unbelievable peak brightness of up to 1200 nits for HDR content. In front of you is a breathtaking entertainment space, an ideal mobile device for quick work with a truly excellent display.</span>
                            <div class="img-inch">
                                <img src="${requestScope.product.image}" alt="" width="600" height="350">
                            </div>
                            <p class="fw-bold">Leap in battery life</p>   
                            <span>The iPhone Pro Max series has always been loved by users for its super-long battery life, but the iPhone 13 Pro Max does so much more. A larger battery capacity, new screen, and more energy-efficient Apple A15 Bionic processor make the iPhone 13 Pro Max the best iPhone ever.

                                Compared to iPhone 12 Pro Max, iPhone 13 Pro Max has 2.5 hours longer usage time. You will clearly feel the difference in actual use, the iPhone 13 Pro Max's battery life can even last up to the 3rd day with normal use.</span>
                        </div>
                        <div class="col-5">
                            <div class="specifications border p-3">
                                <p class="fs-5 fw-bolder">Specifications</p>
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
                                <p>News about iPhone</p>
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
            <h4>Đánh giá của khách hàng</h4>
            <div class="">
                <ul class="">
                    <c:forEach items="${reviewbyid}" var="review" >
                        <li>
                            <div class="">
                                <div class="">
                                    <h4 class=""><strong>${review.name}</strong> - <span>${review.created}</span></h4>
                                    <p>${review.content}</p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <h4>Thêm đánh giá</h4>
                <!-- review form -->
                <form action="ReviewController?id=${requestScope.product.id}" method="post" class="">
                    <div class="form-group">
                        <label>Tên</label>
                        <input type="text" class="form-control"  placeholder="Tên của bạn" required name="name">
                    </div>  
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <input type="text" class="form-control"  placeholder="Số điện thoại"  pattern="[0-9]{10}"
                                        required name="phone">
                    </div>
                    <div class="form-group">
                        <label>Đánh giá của bạn</label>
                        <textarea class="form-control" rows="3" required name="content"></textarea>
                    </div>

                    <button type="submit">Gửi đánh giá</button>
                </form>

            </div>

        </div>
    </article>
</body>
<footer>
    <div class="container d-flex justify-content-around">
        <div class="content-footer">
            <a href="" class="link-footer">Giới thiệu về công ty</a><br>
            <a href="" class="link-footer">Câu hỏi thường gặp</a><br>
            <a href="" class="link-footer">Chính sách bảo mật</a><br>
            <a href="" class="link-footer">Quy chế hoạt động</a><br>
            <a href="" class="link-footer">Tra cứu thông tin bảo hành</a>
        </div>
        <div class="content-footer">
            <a href="" class="link-footer">Tin tuyển dụng</a><br>
            <a href="" class="link-footer">Tin khuyến mãi</a><br>
            <a href="" class="link-footer">Hướng dân mua online</a><br>
            <a href="" class="link-footer">Hướng dân mua trả góp</a><br>
            <a href="" class="link-footer">Chính sách trả góp</a>
        </div>
        <div class="content-footer">
            <a href="" class="link-footer">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                </svg>
            </a><br><br>
            <a href="" class="link-footer mt-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-youtube icon-youtube" viewBox="0 0 16 16">
                <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                </svg>
            </a><br><br>
            <a href="" class="link-footer">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-instagram icon-insta" viewBox="0 0 16 16">
                <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </svg>
            </a>
        </div>
    </div> 
</footer>
</html>

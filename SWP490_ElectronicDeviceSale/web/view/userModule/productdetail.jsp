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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/productdetails.css" rel="stylesheet" type="text/css"/>
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
        <title>JSP Page</title>
    </head>
    <body>
         <!-- Header and Menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <!-- product detail-->
        <main class="">
        <article class="product-detail">
            <div class="container">
                <div class="row">
                    <div class="col-6 mt-5 border-end">            
                        <img src="https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/15/637673217820889289_iphone-13-pro-max-vang-1.jpg" alt="">
                    </div>
                    <div class="col-6 mt-5">
                        <p class="fs-1 product-detail-title">${requestScope.product.name}</p>
                        <div class="rating-start">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                              </svg>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                              </svg>
                        </div>
                        
                          <!-- price -->
                          <p class="product-detail-price fs-2">${requestScope.product.price} <span class="product-detail-sale fs-4">33.990.000</span></p>
                          <div class="quantity">
                              <span>Quantity</span>
                              <button type="button" class="" data-type="minus">-</button>
                              <input type="text" value="1" min="1" max="999" size="1" class="text-center">
                              <button type="button" class="" data-type="plus">+</button>
                          </div>

                          <div class="add-buy-to-cart mt-5">
                              <button class="btn btn-primary">Add To Cart</button>
                              <button class="btn btn-primary px-5">Buy</button>
                          </div>                        
                    </div>
                </div>
            </div>
        </article>
        <article>
            <div class="product-desciption">
                <h3>Product Description</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eaque doloribus id esse non quod rerum blanditiis, eum corrupti eius adipisci fugit rem commodi dolorem quis aliquam dicta! Pariatur, recusandae eaque.
                Consectetur maiores aperiam quasi iusto, quo veritatis eum accusamus quod impedit, sequi exercitationem nobis cupiditate repudiandae tempore voluptas! Numquam nihil, ducimus eligendi pariatur soluta aspernatur labore earum odio veniam dolores.
                Fugit dolore dolores ipsa sunt sint, suscipit similique sed minus quaerat a aut illo reprehenderit atque nobis eos facere. Dolorum fugiat facilis exercitationem nobis cupiditate veniam, sint expedita quibusdam sit?
                Consequuntur officia hic a. In quidem distinctio labore at assumenda aut quibusdam. Ipsum, sit nesciunt? Illo aliquam, porro nemo officia architecto fugiat accusamus dolor ea. Exercitationem dicta temporibus quas fugiat?
                Quos ut, accusamus maxime aperiam porro corporis impedit voluptatem? Suscipit id illo, natus deserunt voluptate at quas. Deserunt, ut maiores! Animi natus dolore nam inventore sint culpa molestiae autem possimus.
                Nobis ipsa, ullam suscipit veniam vitae eos praesentium dolores doloremque labore ratione tempore nam impedit dolorem error, mollitia repudiandae odit repellat, velit quaerat perspiciatis at natus dolor autem? Sunt, adipisci.
                Architecto placeat sint perferendis repudiandae minima amet? Assumenda error, rerum ex debitis sequi culpa labore numquam illo delectus voluptas non expedita velit architecto maxime aut esse nulla. Itaque, voluptas repellendus.
                Voluptatibus saepe expedita quisquam. Magnam neque facilis voluptatum quis similique necessitatibus, ullam aspernatur iusto asperiores veniam iste eum consequuntur vitae at dignissimos excepturi dolor tempore quia pariatur voluptatibus blanditiis praesentium.
                Quae aperiam ullam nam odit ab? Eos, quam enim. Dolor, architecto facere, repellat inventore ex sed facilis velit quam temporibus atque esse dolore non unde nisi tempora quibusdam labore ipsum.
                Temporibus, eveniet! Velit necessitatibus autem aspernatur, laudantium beatae cum ullam voluptates voluptatibus earum debitis, porro quisquam id blanditiis, aliquam aperiam itaque praesentium harum distinctio modi! Cum nihil maxime blanditiis esse!</p>
            </div>
        </article>

        <article>
            <div class="review-product">
                <div class="container">
                    <div class="row">
                        <div class="col-1">
                            <img src="https://thuthuatnhanh.com/wp-content/uploads/2020/09/anh-avt-anime-chat-nhat.jpg" alt="" width="50" height="50">
                            <p>Username</p>
                        </div>
                        <div class="col-11">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, quisquam, nostrum adipisci tempore voluptates soluta magnam sequi nihil ex cumque ipsa aperiam et fugit qui animi laboriosam! Animi, placeat accusamus.</p>
                        </div>
                        <div class="col-1">
                            <img src="https://thuthuatnhanh.com/wp-content/uploads/2020/09/anh-avt-anime-chat-nhat.jpg" alt="" width="50" height="50">
                            <p>Username</p>
                        </div>
                        <div class="col-11">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, quisquam, nostrum adipisci tempore voluptates soluta magnam sequi nihil ex cumque ipsa aperiam et fugit qui animi laboriosam! Animi, placeat accusamus.</p>
                        </div>
                        <div class="col-1">
                            <img src="https://thuthuatnhanh.com/wp-content/uploads/2020/09/anh-avt-anime-chat-nhat.jpg" alt="" width="50" height="50">
                            <p>Username</p>
                        </div>
                        <div class="col-11">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, quisquam, nostrum adipisci tempore voluptates soluta magnam sequi nihil ex cumque ipsa aperiam et fugit qui animi laboriosam! Animi, placeat accusamus.</p>
                        </div>
                        <div class="col-1">
                            <img src="https://thuthuatnhanh.com/wp-content/uploads/2020/09/anh-avt-anime-chat-nhat.jpg" alt="" width="50" height="50">
                            <p>Username</p>
                        </div>
                        <div class="col-11">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, quisquam, nostrum adipisci tempore voluptates soluta magnam sequi nihil ex cumque ipsa aperiam et fugit qui animi laboriosam! Animi, placeat accusamus.</p>
                        </div>                     
                    </div>
                </div>
            </div>
        </article>
    </main>
    </body>
</html>

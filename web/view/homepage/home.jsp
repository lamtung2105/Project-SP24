<%-- 
    Author     : Acer
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>PC Parts Store</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <!-- all css here -->
        <!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"
              integrity="sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- flexslider.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <!-- chosen.min.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">

    </head>

    <body class="shop">
        <!-- header-area-start -->
        <header>
            <!-- header-top-area-start -->
            <jsp:include page="../common/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->
                <!-- header-mid-area-start -->
            <jsp:include page="../common/header-mid-area.jsp"></jsp:include>
                <!-- header-mid-area-end -->
                <!-- main-menu-area-start -->

                <!-- main-menu-area-end -->
                <!-- mobile-menu-area-start --> 

                <!-- mobile-menu-area-end -->
            </header>
            <!-- header-area-end -->
            <!-- breadcrumbs-area-start -->

            <!-- breadcrumbs-area-end -->
            <!-- shop-main-area-start -->
            <div class="shop-main-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-12 col-12 order-lg-1 order-2 mt-sm-50 mt-xs-40">
                            <div class="shop-left">
                                <div class="section-title-5 mb-30">
                                    <h2>Shopping Options</h2>
                                </div>
                                <div class="left-title mb-20">
                                    <h4>Category</h4>
                                </div>
                                <div class="left-menu mb-30">
                                    <ul>
                                    <c:forEach items="${listCategory}" var="cate">
                                        <li><a href="home?search=category&categoryId=${cate.id}">${cate.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-9 col-md-12 col-12 order-lg-2 order-1">

                        <div class="section-title-5 mb-30">
                            <h2>PC Parts</h2>
                        </div>

                        <!-- tab-area-start -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="th">
                                <div class="row">
                                    <c:forEach items="${listProduct}" var="p">
                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                                            <!-- single-product-start -->
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img">
                                                    <a href="product-details?id=${p.id}">   
                                                        <img src="${pageContext.request.contextPath}/img/flex/40.jpg" alt="" />
                                                    </a>

                                                </div>
                                                <div class="product-details text-center">
                                                    <h4><a href="product-details?id=${p.id}">${p.name}</a></h4>
                                                    <div class="product-price">
                                                        <ul>
                                                            <li>$ ${p.price}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-link">
                                                    <form action="payment?action=add-product" method="POST">
                                                        <div class="product-button">
                                                            <a href="#" title="Add to cart" onclick="return this.closest('form').submit();"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                        </div>
                                                    </form>
                                                    <div class="add-to-link">
                                                        <ul>
                                                            <li><a href="product-details?id=${p.id}" title="Details"><i class="fa fa-external-link"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single-product-end -->
                                        </div>
                                    </c:forEach>                               
                                </div>
                            </div>
                        </div>
                        <!-- tab-area-end -->
                        <!-- pagination-area-start -->
                        <div class="pagination-area mt-50">

                            <div class="page-number">
                                <ul>
                                    <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                        <li><a href="${pageControl.urlPattern}page=${pageNumber}">${pageNumber}</a></li>
                                        </c:forEach>
                                    <li><a href="#" class="angle"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- pagination-area-end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- shop-main-area-end -->
        <!-- footer-area-start -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
            <!-- footer-area-end -->
            <!-- Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-5 col-sm-5 col-xs-12">
                                    <div class="modal-tab">
                                        <div class="product-details-large tab-content">
                                            <div class="tab-pane active" id="image-1">
                                                <img src="${pageContext.request.contextPath}/img/product/quickview-l4.jpg" alt="" />
                                        </div>
                                        <div class="tab-pane" id="image-2">
                                            <img src="${pageContext.request.contextPath}/img/product/quickview-l2.jpg" alt="" />
                                        </div>
                                        <div class="tab-pane" id="image-3">
                                            <img src="${pageContext.request.contextPath}/img/product/quickview-l3.jpg" alt="" />
                                        </div>
                                        <div class="tab-pane" id="image-4">
                                            <img src="${pageContext.request.contextPath}/img/product/quickview-l5.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="product-details-small quickview-active owl-carousel">
                                        <a class="active" href="#image-1"><img src="${pageContext.request.contextPath}/img/product/quickview-s4.jpg" alt="" /></a>
                                        <a href="#image-2"><img src="${pageContext.request.contextPath}/img/product/quickview-s2.jpg" alt="" /></a>
                                        <a href="#image-3"><img src="${pageContext.request.contextPath}/img/product/quickview-s3.jpg" alt="" /></a>
                                        <a href="#image-4"><img src="${pageContext.request.contextPath}/img/product/quickview-s5.jpg" alt="" /></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal end -->






        <!-- all js here -->
        <!-- jquery latest version -->
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- modernizr css -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>

        <!-- bootstrap js -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- owl.carousel js -->
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>
        <!-- wow js -->
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <!-- jquery.parallax-1.1.3.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.parallax-1.1.3.js"></script>
        <!-- jquery.countdown.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <!-- jquery.flexslider.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
        <!-- chosen.jquery.min.js -->
        <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
        <!-- jquery.counterup.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <!-- waypoints.min.js -->
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <!-- plugins js -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/main .js"></script>
    </body>
</html>

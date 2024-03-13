<%-- 
    Document   : product-details
    Created on : Mar 11, 2024, 11:48:09 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Koparion – Book Shop HTML5 Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.png">

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
        <!-- modernizr css -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="product-details">
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <!-- header-area-start -->
        <header>
            <!-- header-top-area-start -->
            <jsp:include page="../common/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->
                <!-- header-mid-area-start -->
            <jsp:include page="../common/header-mid-area.jsp"></jsp:include>
                <!-- header-mid-area-end -->
                <!-- main-menu-area-start -->
            <jsp:include page="../common/main-menu-area.jsp"></jsp:include>
                <!-- main-menu-area-end -->
                <!-- mobile-menu-area-start -->
            <jsp:include page="../common/mobile-menu-area.jsp"></jsp:include>
                <!-- mobile-menu-area-end -->
            </header>
            <!-- header-area-end -->
            <!-- breadcrumbs-area-start -->
        <jsp:include page="../common/breadcrumbs-area.jsp"></jsp:include>
            <!-- breadcrumbs-area-end -->
            <!-- product-main-area-start -->
            <div class="product-main-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-12 col-12 order-lg-1 order-1">
                            <!-- product-main-area-start -->
                            <div class="product-main-area">
                                <div class="row">
                                    <div class="col-lg-5 col-md-6 col-12">
                                        <div class="flexslider">
                                            <ul class="slides">                                                
                                                <img src="${product.image}"/>                                            
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-7 col-md-6 col-12">
                                    <div class="product-info-main">
                                        <div class="page-title">
                                            <h1>${product.name}</h1>
                                        </div>                                     
                                        <div class="product-reviews-summary">
                                            <div class="rating-summary">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-info-price">
                                            <div class="price-final">
                                                <span>$ ${product.price}</span>
                                            </div>
                                        </div>
                                        <div class="product-add-form">
                                            <form action="#">
                                                <div class="quality-button">
                                                    <input class="qty" type="number" value="1">
                                                </div>
                                                <a href="#">Add to cart</a>
                                            </form>
                                        </div>
                                        <div class="product-social-links">
                                            <div class="product-addto-links">
                                                <a href="#"><i class="fa fa-heart"></i></a>
                                                <a href="#"><i class="fa fa-pie-chart"></i></a>
                                                <a href="#"><i class="fa fa-envelope-o"></i></a>
                                            </div>
                                            <div class="product-addto-links-text">
                                                <p>${product.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>	
                        </div>
                        <!-- product-main-area-end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- product-main-area-end -->
        <!-- footer-area-start -->
        <footer>
            <!-- footer-top-start -->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer-top-menu bb-2">
                                <nav>
                                    <ul>
                                        <li><a href="#">home</a></li>
                                        <li><a href="#">Enable Cookies</a></li>
                                        <li><a href="#">Privacy and Cookie Policy</a></li>
                                        <li><a href="#">contact us</a></li>
                                        <li><a href="#">blog</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer-top-start -->
            <!-- footer-mid-start -->
            <div class="footer-mid ptb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-12">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-12">
                                    <div class="single-footer br-2 xs-mb">
                                        <div class="footer-title mb-20">
                                            <h3>Products</h3>
                                        </div>
                                        <div class="footer-mid-menu">
                                            <ul>
                                                <li><a href="#">About us</a></li>
                                                <li><a href="#">Prices drop </a></li>
                                                <li><a href="#">New products</a></li>
                                                <li><a href="#">Best sales</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-12">
                                    <div class="single-footer br-2 xs-mb">
                                        <div class="footer-title mb-20">
                                            <h3>Our company</h3>
                                        </div>
                                        <div class="footer-mid-menu">
                                            <ul>
                                                <li><a href="#">Contact us</a></li>
                                                <li><a href="#">Sitemap</a></li>
                                                <li><a href="#">Stores</a></li>
                                                <li><a href="#">My account </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-12">
                                    <div class="single-footer br-2 xs-mb">
                                        <div class="footer-title mb-20">
                                            <h3>Your account</h3>
                                        </div>
                                        <div class="footer-mid-menu">
                                            <ul>
                                                <li><a href="#">Addresses</a></li>
                                                <li><a href="#">Credit slips </a></li>
                                                <li><a href="#"> Orders</a></li>
                                                <li><a href="#">Personal info</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="single-footer mrg-sm">
                                <div class="footer-title mb-20">
                                    <h3>STORE INFORMATION</h3>
                                </div>
                                <div class="footer-contact">
                                    <p class="adress">
                                        <span>My Company</span>
                                        Your address goes here.
                                    </p>
                                    <p><span>Call us now:</span> 0123456789</p>
                                    <p><span>Email:</span>  demo@example.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer-mid-end -->
            <!-- footer-bottom-start -->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row bt-2">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="copy-right-area">
                                <p>&copy; 2022 <strong> Koparion </strong> Mede with ❤️ by <a href="https://hasthemes.com/" target="_blank"><strong>HasThemes</strong></a></p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="payment-img text-end">
                                <a href="#"><img src="${pageContext.request.contextPath}/img/1.png" alt="payment" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer-bottom-end -->
        </footer>
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
                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="modal-pro-content">
                                    <h3>Chaz Kangeroo Hoodie3</h3>
                                    <div class="price">
                                        <span>$70.00</span>
                                    </div>
                                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet.</p>	
                                    <div class="quick-view-select">
                                        <div class="select-option-part">
                                            <label>Size*</label>
                                            <select class="select">
                                                <option value="">S</option>
                                                <option value="">M</option>
                                                <option value="">L</option>
                                            </select>
                                        </div>
                                        <div class="quickview-color-wrap">
                                            <label>Color*</label>
                                            <div class="quickview-color">
                                                <ul>
                                                    <li class="blue">b</li>
                                                    <li class="red">r</li>
                                                    <li class="pink">p</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="#">
                                        <input type="number" value="1" />
                                        <button>Add to cart</button>
                                    </form>
                                    <span><i class="fa fa-check"></i> In stock</span>
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
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

    <!-- Mirrored from htmldemo.net/koparion/koparion/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:51 GMT -->
</html>

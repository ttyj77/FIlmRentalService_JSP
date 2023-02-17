<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.FilmDTO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.ReviewController" %>
<%@ page import="model.ReviewDTO" %>
<%@ page import="controller.ActorController" %>
<%@ page import="model.ActorDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Ads Details - ClassiGrids Classified Ads and Listing Website Template</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="/assets/css/animate.css"/>
    <link rel="stylesheet" href="/assets/css/tiny-slider.css"/>
    <link rel="stylesheet" href="/assets/css/glightbox.min.css"/>
    <link rel="stylesheet" href="/assets/css/main.css"/>
    <link rel="stylesheet" href="/assets/css/cgv.css"/>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    FilmController filmController = new FilmController(connectionMaker);
    ReviewController reviewController = new ReviewController(connectionMaker);
    ActorController actorController = new ActorController(connectionMaker);
    SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 H:m:s");
    FilmDTO f = filmController.selectOne(id); //여기서 id는 filmId
    ArrayList<ReviewDTO> list = reviewController.selectOneReviewList(id);
    ArrayList<ActorDTO> actorList = actorController.actorList(id);

    int reviewCount = reviewController.reviewCount(id);
    pageContext.setAttribute("reviewCount", reviewCount);
//        ReplyDTO r = replyController.selectOne(id); //여기서 아이디는 댓글아이디가 필요하다.
//    ArrayList<FilmDTO> list = filmController.selectAll(f.getId()); //댓글리스트
//    ReplyController replyController = new ReplyController(connectionMaker);

%>
<%--변수선언--%>
<c:set var="f" value="<%=f%>"/>
<c:set var="list" value="<%=list%>"/>
<c:set var="actorList" value="<%=actorList%>"/>
<%--<c:set var="selectOne" value="<%=userController.selectOne(b.getWriterId())%>"/>--%>

<!-- Start Breadcrumbs -->
<div class="breadcrumbs" style="height: 250px">
    <div class="container">
        <div class="row align-items-center" style="display: flex;justify-content: space-between;">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">Ad Details</h1>
                </div>
            </div>
            <ul class="policy_list_nav" style="font-size: 18px">
                <li><a href="/user/login.jsp">
                    <%--                    <img    src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인"/>--%>
                    <span>로그인</span></a></li>
                <li><a href="/user/register.jsp">
                    <%--                    <img--%>
                    <%--                        src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"--%>
                    <%--                        alt="회원가입"/>--%>
                    <span>회원가입</span></a></li>
                <li><a href="/user/mycgv/">
                    <%--                    <img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"--%>
                    <%--                                                alt="MY CGV"/>--%>
                    <span>MY PAGE</span></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Start Item Details -->
<section class="item-details section">
    <div class="container">
        <div class="top-area">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-images">
                        <main id="gallery">
                            <div class="main-img">
                                <img src="${f.poster_image}" id="current" alt="#">
                            </div>
                            <div class="images">
                                <img src="https://via.placeholder.com/1200x900" class="img" alt="#">
                                <img src="https://via.placeholder.com/1200x900" class="img" alt="#">
                                <img src="https://via.placeholder.com/1200x900" class="img" alt="#">
                                <img src="https://via.placeholder.com/1200x900" class="img" alt="#">
                                <img src="https://via.placeholder.com/1200x900" class="img" alt="#">
                            </div>
                        </main>
                    </div>
                </div>

                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-info">
                        <h2 class="title">${f.title}</h2>
                        <p class="location"><a href="javascript:void(0)">${f.english_title}</a></p>
                        <div class="row">
                            <h4 class="col-4">관람객 평점</h4>
                            <div class="col-8">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                     class="bi bi-star" viewBox="0 0 16 16">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                     class="bi bi-star" viewBox="0 0 16 16">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                     class="bi bi-star" viewBox="0 0 16 16">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                            </div>

                        </div>
                        <div class="list-info">
                            <h4>Informations</h4>
                            <ul>
                                <li><span>감독:</span> New</li>
                                <li><span>출연배우:</span> Apple</li>
                                <li><span>상영시간:</span> Mackbook Pro</li>
                                <br>
                                <hr>

                                <li><span class="fw-bold fs-5">줄거리</span><br><br> ${f.summary}</li>
                            </ul>
                        </div>
                        <div class="contact-info">
                            <button type="button" class="btn btn-primary"
                                    style="height: 8%; width: 100%; margin-top: 1%; background-color: #5931E0">
                                예매하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item-details-blocks">
            <div class="row">
                <div class="col-lg-8 col-md-7 col-12">
                    <c:choose>
                        <c:when test="${list.isEmpty()}">
                            <div class="single-block comments">
                                <h4>${f.title}에 대한 리뷰가 아직 없어요!</h4>
                                <div class="single-comment">
                                    <div class="row">
                                        <p>
                                            <button class="btn btn-primary" href="#">지금 등록하러 가기</button>
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Start Single Block -->
                            <div class="single-block comments">
                                <h4>${f.title}에 대한 리뷰가 ${reviewCount} 개 있어요!</h4>
                                <!-- Start Single Comment -->
                                <div class="single-comment">
                                    <c:forEach var="r" items="${list}">
                                        <div class="row">
                                            <div class="col-1_5">
                                                <h1>${r.score} </h1>
                                            </div>
                                            <div class="col-10 content">
                                                <h4>${r.nickname}</h4>
                                                <p class="m-3">
                                                        ${r.review}
                                                </p>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                                <!-- End Single Comment -->
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- End Single Block -->
                    <!-- Start Single Block -->
                    <div class="single-block tags">
                        <h3>Tags</h3>
                        <ul>
                            <li><a href="javascript:void(0)">Bike</a></li>
                            <li><a href="javascript:void(0)">Services</a></li>
                            <li><a href="javascript:void(0)">Brand</a></li>
                            <li><a href="javascript:void(0)">Popular</a></li>
                        </ul>
                    </div>
                    <!-- End Single Block -->
                    <!-- Start Single Block -->
                    <div class="single-block comment-form">
                        <h3>Post a comment</h3>
                        <form action="#" method="POST">
                            <div class="row">
                                <div class="col-lg-6 col-12">
                                    <div class="form-box form-group">
                                        <input type="text" name="name" class="form-control form-control-custom"
                                               placeholder="Your Name"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-box form-group">
                                        <input type="email" name="email" class="form-control form-control-custom"
                                               placeholder="Your Email"/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-box form-group">
                                            <textarea name="#" class="form-control form-control-custom"
                                                      placeholder="Your Comments"></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="button">
                                        <button type="submit" class="btn">Post Comment</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- End Single Block -->
                </div>
                <div class="col-lg-4 col-md-5 col-12">
                    <div class="item-details-sidebar">
                        <!-- Start Single Block -->
                        <div class="single-block author">
                            <h3>Director & Actor</h3>

                            <c:choose>
                                <c:when test="${actorList.isEmpty()}">

                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="a" items="${actorList}">
                                        <div class="content mb-4">
                                            <img src="${a.image}"
                                                 alt="#">
                                            <h4>${a.name}</h4>
                                            <span>${a.casting}</span>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>


                        </div>

                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block contant-seller comment-form ">
                            <h3>Contact Seller</h3>
                            <form action="#" method="POST">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-box form-group">
                                            <input type="text" name="name" class="form-control form-control-custom"
                                                   placeholder="Your Name"/>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-box form-group">
                                            <input type="email" name="email"
                                                   class="form-control form-control-custom" placeholder="Your Email"/>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-box form-group">
                                                <textarea name="#" class="form-control form-control-custom"
                                                          placeholder="Your Message"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="button">
                                            <button type="submit" class="btn">Send Message</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block ">
                            <h3>Location</h3>
                            <div class="mapouter">
                                <div class="gmap_canvas">
                                    <iframe width="100%" height="300" id="gmap_canvas"
                                            src="https://maps.google.com/maps?q=2880%20Broadway,%20New%20York&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                    <a
                                            href="https://putlocker-is.org"></a><br>
                                    <style>
                                        .mapouter {
                                            position: relative;
                                            text-align: right;
                                            height: 300px;
                                            width: 100%;
                                        }
                                    </style>
                                    <a href="https://www.embedgooglemap.net">google map code for website</a>
                                    <style>
                                        .gmap_canvas {
                                            overflow: hidden;
                                            background: none !important;
                                            height: 300px;
                                            width: 100%;
                                        }
                                    </style>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Block -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Item Details -->

<!-- Start Newsletter Area -->
<div class="newsletter section">
    <div class="container">
        <div class="inner-content">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="title">
                        <i class="lni lni-alarm"></i>
                        <h2>Newsletter</h2>
                        <p>We don't send spam so don't worry.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="form">
                        <form action="#" method="get" target="_blank" class="newsletter-form">
                            <input name="EMAIL" placeholder="Your email address" type="email">
                            <div class="button">
                                <button class="btn">Subscribe<span class="dir-part"></span></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Newsletter Area -->

<!-- Start Footer Area -->
<footer class="footer">
    <!-- Start Footer Top -->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer mobile-app">
                        <h3>Mobile Apps</h3>
                        <div class="app-button">
                            <a href="javascript:void(0)" class="btn">
                                <i class="lni lni-play-store"></i>
                                <span class="text">
                                        <span class="small-text">Get It On</span>
                                        Google Play
                                    </span>
                            </a>
                            <a href="javascript:void(0)" class="btn">
                                <i class="lni lni-apple"></i>
                                <span class="text">
                                        <span class="small-text">Get It On</span>
                                        App Store
                                    </span>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer f-link">
                        <h3>Locations</h3>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul>
                                    <li><a href="javascript:void(0)">Chicago</a></li>
                                    <li><a href="javascript:void(0)">New York City</a></li>
                                    <li><a href="javascript:void(0)">San Francisco</a></li>
                                    <li><a href="javascript:void(0)">Washington</a></li>
                                    <li><a href="javascript:void(0)">Boston</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul>
                                    <li><a href="javascript:void(0)">Los Angeles</a></li>
                                    <li><a href="javascript:void(0)">Seattle</a></li>
                                    <li><a href="javascript:void(0)">Las Vegas</a></li>
                                    <li><a href="javascript:void(0)">San Diego</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer f-link">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="javascript:void(0)">About Us</a></li>
                            <li><a href="javascript:void(0)">How It's Works</a></li>
                            <li><a href="javascript:void(0)">Login</a></li>
                            <li><a href="javascript:void(0)">Signup</a></li>
                            <li><a href="javascript:void(0)">Help & Support</a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer f-contact">
                        <h3>Contact</h3>
                        <ul>
                            <li>23 New Design Str, Lorem Upsum 10<br> Hudson Yards, USA</li>
                            <li>Tel. +(123) 1800-567-8990 <br> Mail. support@classigrids.com</li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
            </div>
        </div>
    </div>
    <!--/ End Footer Middle -->
    <!-- Start Footer Bottom -->
    <div class="footer-bottom">
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-12">
                        <div class="content">
                            <ul class="footer-bottom-links">
                                <li><a href="javascript:void(0)">Terms of use</a></li>
                                <li><a href="javascript:void(0)"> Privacy Policy</a></li>
                                <li><a href="javascript:void(0)">Advanced Search</a></li>
                                <li><a href="javascript:void(0)">Site Map</a></li>
                                <li><a href="javascript:void(0)">Information</a></li>
                            </ul>
                            <p class="copyright-text">Designed and Developed by <a href="https://graygrids.com/"
                                                                                   rel="nofollow" target="_blank">GrayGrids</a>
                            </p>
                            <ul class="footer-social">
                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-youtube"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Middle -->
</footer>
<!--/ End Footer Area -->

<!-- ========================= scroll-top ========================= -->
<a href="#" class="scroll-top btn-hover">
    <i class="lni lni-chevron-up"></i>
</a>

<!-- ========================= JS here ========================= -->
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/wow.min.js"></script>
<script src="/assets/js/tiny-slider.js"></script>
<script src="/assets/js/glightbox.min.js"></script>
<script src="/assets/js/main.js"></script>
<script type="text/javascript">
    const current = document.getElementById("current");
    const opacity = 0.6;
    const imgs = document.querySelectorAll(".img");
    imgs.forEach(img => {
        img.addEventListener("click", (e) => {
            //reset opacity
            imgs.forEach(img => {
                img.style.opacity = 1;
            });
            current.src = e.target.src;
            //adding class
            //current.classList.add("fade-in");
            //opacity
            e.target.style.opacity = opacity;
        });
    });
</script>
</body>
</html>

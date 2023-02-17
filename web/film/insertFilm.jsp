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
    <title>Admin-FilmInsert</title>
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
        <h3>영화 등록 페이지</h3>
        <div class="top-area">

            <div class="row">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-images">
                        <main id="gallery">
                            <form action="#" method="post">
                                <div class="main-img">
                                    <%--                                    <input>--%>
                                    <label class="input_label" id="current" alt="#" id="target_img">
                                        <form method="post" enctype="multipart/form-data" action="imgup.jsp">
                                            <input type="file" name="filename1" size=40 style="display: none"
                                                   onchange="setThumbnail(event)">
                                            <input type="submit" value="업로드" style="display: none"><br><br>

                                        </form>
                                        <div id="image_container">
                                            <%--                                            <img src="${f.poster_image}">--%>
                                        </div>

                                    </label>

                                </div>
                            </form>

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
                        <div class="text_row">
                            <label class="col-sm-3 col-form-label">영화제목</label>
                            <input type="text" class="form-control" placeholder="영화제목을 입력해주세요">
                        </div>
                        <div class="text_row">
                            <label class="col-sm-3 col-form-label fs-6">영화제목(영문)</label>
                            <input type="text" class="form-control" placeholder="영문이름을 입력해주세요 (생략가능)">
                        </div>

                        <div class="list-info">
                            <h4>Informations</h4>
                            <ul>
                                <li><span>감독:</span>
                                    <button class="btn btn-primary">추가하기</button>

                                    <span style="margin-left: 20%">출연배우:</span>
                                    <button class="btn btn-primary">추가하기</button>
                                </li>

                                <br>
                                <hr>

                                <li><span class="fw-bold fs-5">줄거리</span><br><br> <textarea class="form-control"
                                                                                            placeholder="줄거리를 입력해주세요"
                                                                                            rows="8"></textarea></li>
                            </ul>
                        </div>
                        <div class="contact-info">
                            <button type="button" class="btn btn-primary"
                                    style="height: 8%; width: 100%; margin-top: 1%; background-color: #5931E0">
                                등록하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item-details-blocks">
            <div class="row">
                <div class="col-lg-12 col-md-5 col-12">
                    <div class="item-details-sidebar">
                        <!-- Start Single Block -->
                        <div class="single-block contant-seller comment-form ">
                            <h3>추가기록사항</h3>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Item Details -->

<!-- Start Newsletter Area -->


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


<form name="signform" method="POST" ENCTYPE="multipart/form-data" action="./design_update.htm">
    <input type="file" id="file" name="file" style="display:none;" onchange="changeValue(this)">
    <input type="hidden" name="target_url">
</form>

<script>
    function setThumbnail(event) {
        let reader = new FileReader();
        let imageDIV = document.getElementById("image_container")
        imageDIV.innerHTML = '';
        reader.onload = function (event) {
            let img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }
</script>


</body>
</html>

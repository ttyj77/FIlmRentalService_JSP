<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %>
<%@ page import="model.FilmDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


    <link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/R2014/images/favicon.ico"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css"/>

    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css"/>
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css"/>

    <script type="text/javascript" src="/common/js/extraTheaters.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript"
            src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>

    <!--[if lte IE 9]>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script>
    <![endif]-->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" media="all" type="text/css"
          href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css"/>

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css"/>


    <!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css"/>
    <script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>

    <!-- 각페이지 Header Start-->

    <!--<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">https, http  혼합사용시-->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/swiper.min.js"></script>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="assets/css/cgv.css"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btnMovie").click(function () {
                $("#movieChart_list").show();
                $("#movieChart_list_Reser").hide();
                $("#btn_allView_Movie").attr("href", "/movies/?lt=1&ft=0");
            });

            $("#btnReserMovie").click(function () {
                $("#movieChart_list").hide();
                $("#movieChart_list_Reser").show();
                $("#btn_allView_Movie").attr("href", "/movies/pre-movies.aspx");
            });

            var movieChartSwiper = new Swiper("#movieChart_list", {

                slidesPerView: 5,
                spaceBetween: 32,
                slidesPerGroup: 5,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",

                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
            });


            $("#movieChart_list_Reser").hide(); //swiper 랜더링 완료 후 숨기기해야함

            var eventSwiper = new Swiper(".event_list", {
                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                slidesPerView: 3,
                spaceBetween: 24,
                slidesPerGroup: 3,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                a11y: {
                    prevSlideMessage: '이전 슬라이드',
                    nextSlideMessage: '다음 슬라이드',
                    slideLabelMessage: '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
                },
            });


            if (eventSwiper.autoplay.running) {
                $('.btn_eventControl').addClass('active');
            }

            $('.btn_eventControl').on({
                click: function (e) {
                    if (eventSwiper.autoplay.running) {
                        $(this).removeClass('active');
                        eventSwiper.autoplay.stop();
                    } else {
                        $(this).addClass('active');
                        eventSwiper.autoplay.start();
                    }
                }
            });


            $('.movieChartBeScreen_btn_wrap a').on({
                click: function (e) {
                    var target = e.target;
                    $(target).addClass('active').parent('h3').siblings().children('a').removeClass('active');
                }
            });

            $('.specialHall_list a').on({
                mouseenter: function (e) {
                    var target = e.target;
                    var idx = $(target).closest('li').index();

                    var arrimgUrl = ["https://img.cgv.co.kr//Front/Main/2021/1209/16390080561620.png", "https://img.cgv.co.kr//Front/Main/2022/0616/16553622935690.png", "https://img.cgv.co.kr//Front/Main/2021/1130/16382612660240.png", "https://img.cgv.co.kr//Front/Main/2021/1130/16382612660560.png"];

                    $(target).closest('li').addClass('active').siblings('li').removeClass('active');
                    $('.specialHall_link').attr('href', target.href) // 링크 주소 넣을 곳
                    $('.specialHall_link img').attr('src', arrimgUrl[idx]);
                    $('.specialHall_link img').attr('alt', $(target).children('strong').text());
                }
            });

            var movieSelectionVideoObj = $('.video_wrap video')[0];

            $('.video_wrap video').on({
                ended: function () {
                    $('.btn_movieSelection_playStop').removeClass('active');
                }
            })
            // movieSelectionVideoObj.onended = function(){

            // }

            $('.btn_movieSelection_playStop').on({
                click: function () {
                    if (movieSelectionVideoObj.paused) {
                        movieSelectionVideoObj.play();
                        $(this).addClass('active');
                    } else {
                        movieSelectionVideoObj.pause();
                        $(this).removeClass('active');
                    }
                }
            });

            $('.btn_movieSelection_soundOnOff').on({
                click: function () {
                    if (movieSelectionVideoObj.muted) {
                        movieSelectionVideoObj.muted = false;
                        $(this).addClass('active');
                    } else {
                        movieSelectionVideoObj.muted = true;
                        $(this).removeClass('active');
                    }
                }
            });

            var noticeClientBannerSwiper = new Swiper(".noticeClient_banner_list", {
                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                slidesPerView: 1,
                spaceBetween: 0,
                loopFillGroupWithBlank: true,
            });

            if (noticeClientBannerSwiper.autoplay.running) {
                $('.btn_noticeClientBannerControl').addClass('active');
            }

            $('.btn_noticeClientBannerControl').on({
                click: function (e) {
                    if (noticeClientBannerSwiper.autoplay.running) {
                        $(this).removeClass('active');
                        noticeClientBannerSwiper.autoplay.stop();
                    } else {
                        $(this).addClass('active');
                        noticeClientBannerSwiper.autoplay.start();
                    }
                }
            });

            $.fn.openPopup = function (id) {
                var popObj = $('#' + id);

                popObj.parent('.pop_wrap').addClass('active');
                popObj.fadeIn();

                popObj.parent('.pop_wrap').on({
                    click: function (e) {
                        if (e.target === e.currentTarget) {
                            $.fn.closePopup();
                        }
                    }
                });
                popObj.find('.btn_close').on({
                    click: function (e) {
                        $.fn.closePopup();
                    }
                });
            };

            $.fn.closePopup = function () {
                $('.pop_wrap').removeClass('active');
                $('.popup').fadeOut();
            };

        });
    </script>


</head>
<body class="">

<div class="skipnaiv">
    <a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
</div>
<div id="cgvwrap">

    <div class="header">
        <!-- 서비스 메뉴 -->


        <div class="header_content">
            <div class="contents">
                <h1 onclick=""><a href="/"><img style="width: 80px; height: 80px" src="assets/images/aa.jpg"
                                                alt="CGV"/></a><span>주희 영화관</span></h1>
                <ul class="memberInfo_wrap">
                    <li><a href="/user/login.jsp"><img
                            src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
                            alt="로그인"/><span>로그인</span></a></li>
                    <li><a href="/user/register.jsp"><img
                            src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
                            alt="회원가입"/><span>회원가입</span></a></li>
                    <li><a href="/user/mycgv/"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
                                                    alt="MY CGV"/><span>MY PAGE</span></a></li>
                    <li><a href="/support/default.aspx"><img
                            src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png"
                            alt="고객센터"/><span>고객센터</span></a></li>
                </ul>
            </div>
        </div>

        <div class="nav">
            <div class="contents">
                <h1><a href="/" tabindex="-1"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoWhite.png"
                                                   alt="CGV"/></a></h1>
                <ul class="policy_list_nav">
                    <li>
                        <h2><a href="/movies/?lt=1&ft=0">영화</a></h2>
                        <dl class="nav_overMenu">
                            <dt><h2><a href="/movies/?lt=1&ft=0" tabindex="-1">영화</a></h2></dt>
                            <dd><h3><a href="/movies/?lt=1&ft=0">무비차트</a></h3></dd>
                            <dd><h3><a href="/arthouse/">아트하우스</a></h3></dd>
                            <dd><h3><a href="/culture-event/event/detailViewUnited.aspx?seq=30717">ICECON</a></h3></dd>
                        </dl>
                    </li>
                    <li>
                        <h2><a href="/theaters/">극장</a></h2>
                        <dl class="nav_overMenu">
                            <dt><h2><a href="/theaters/" tabindex="-1">극장</a></h2></dt>
                            <dd><h3><a href="/theaters/">CGV 극장</a></h3></dd>
                            <dd><h3><a href="/theaters/special/defaultNew.aspx">특별관</a></h3></dd>
                        </dl>
                    </li>
                    <li>
                        <h2><a href="/theaters/">예매</a></h2>
                        <dl class="nav_overMenu">
                            <dt><h2><a href="/theaters/" tabindex="-1">극장</a></h2></dt>
                            <dd><h3><a href="/theaters/">CGV 극장</a></h3></dd>
                            <dd><h3><a href="/theaters/special/defaultNew.aspx">특별관</a></h3></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 서브 메뉴 -->
    </div>
    <!-- E Header -->

    <!-- Contaniner -->
    <div id="contaniner" class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->

            <%
            //사용자가 로그인을 안했을경울 메인으로 튕기게
            UserDTO logIn = (UserDTO) session.getAttribute("logIn");

            ConnectionMaker connectionMaker = new MysqlConnectionMaker();
            FilmController controller = new FilmController(connectionMaker);

            ArrayList<FilmDTO> list = controller.selectAll();
//          우리가 el 에서 변수를 접근하기위해 page, session 에 저장해야 불러올 수 있다.
            pageContext.setAttribute("list", list); //영화 전체 리스트
//            pageContext.setAttribute("userController", userController);
        %>


        <input type="hidden" id="isOpenUserEmailYNPopup" name="isOpenUserEmailYNPopup" value="False"/>

        <div class="movieChartBeScreen_wrap">
            <div class="contents">
                <div class="movieChartBeScreen_btn_wrap">
                    <div class="tabBtn_wrap">
                        <h3><a href="#none" class="active" id="btnMovie">무비차트</a></h3>
                        <h3><a href="#none" id="btnReserMovie">상영예정작</a></h3>
                    </div>
                    <a href="/movies/?lt=1&ft=0" id="btn_allView_Movie" class="btn_allView">전체보기</a>
                </div>

                <div class="swiper movieChart_list" id="movieChart_list">
                    <div class="swiper-wrapper">
                        <c:forEach var="f" items="${list}">
                            <div class="swiper-slide swiper-slide-movie">
                                <div class="img_wrap" data-scale="false">
                                    <img src="${f.poster_image}"
                                         alt="앤트맨과 와스프-퀀텀매니아">
                                    <div class="movieAgeLimit_wrap">
                                        <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                        <i class="cgvIcon etc age12">12</i>
                                        <!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
                                        <!-- <div class='dDay_wrap'><span>1</span></div>-->
                                        <i class='cgvIcon etc ageDay' data-before-text='D - 1'>D Day</i>

                                    </div>
                                    <div class="screenType_wrap">

                                        <i class="screenType"><img
                                                src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png"
                                                alt="imax"></i>

                                        <i class="screenType"><img
                                                src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png"
                                                alt="forDX"></i>

                                        <i class="screenType"><img
                                                src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png"
                                                alt="screenx"></i>

                                    </div>
                                    <div class="movieChart_btn_wrap">
                                            <%--상세보기 링크넣기 --%>
                                        <a class="btn_movieChart_detail" href="/film/detailsPage.jsp?id=${f.id}">상세보기</a>

                                        <a href="#"
                                           class='btn_movieChart_ticketing'>예매하기</a>


                                    </div>
                                </div>
                                <div class="movie_info_wrap">
                                    <strong class="movieName">${f.title}</strong>
                                    <span> <img
                                            src='https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png'
                                            alt='Golden Egg Preegg'> 99%</span>
                                    <span>예매율 61.0%</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="swiper movieChart_list" id="movieChart_list_Reser">
                    <div class="swiper-wrapper">
                        <c:forEach var="f" items="${list}">
                            <div class="swiper-slide swiper-slide-movie">
                                <div class="img_wrap" data-scale="false">
                                    <img src="${f.poster_image}"
                                         alt="앤트맨과 와스프-퀀텀매니아" onerror="errorImage(this)">
                                    <div class="movieAgeLimit_wrap">
                                        <!-- 영상물 등급 노출 변경 2022.08.24 -->
                                        <i class="cgvIcon etc age12">12</i>
                                        <!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
                                        <!-- <div class='dDay_wrap'><span>1</span></div>-->
                                        <i class='cgvIcon etc ageDay' data-before-text='D - 1'>D Day</i>

                                    </div>
                                    <div class="screenType_wrap">

                                        <i class="screenType"><img
                                                src="https://img.cgv.co.kr/R2014/images/common/logo/imax_white.png"
                                                alt="imax"></i>

                                        <i class="screenType"><img
                                                src="https://img.cgv.co.kr/R2014/images/common/logo/forDX_white.png"
                                                alt="forDX"></i>

                                        <i class="screenType"><img
                                                src="https://img.cgv.co.kr/R2014/images/common/logo/screenx_white.png"
                                                alt="screenx"></i>

                                    </div>
                                    <div class="movieChart_btn_wrap">
                                            <%--상세보기 링크넣기 --%>
                                        <a class="btn_movieChart_detail">상세보기</a>

                                        <a href="#"
                                           class='btn_movieChart_ticketing'>예매하기</a>


                                    </div>
                                </div>
                                <div class="movie_info_wrap">
                                    <strong class="movieName">${f.title}</strong>
                                    <span> <img
                                            src='https://img.cgv.co.kr/R2014/images/common/egg/eggGoldeneggPreegg.png'
                                            alt='Golden Egg Preegg'> 99%</span>
                                    <span>예매율 61.0%</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- E > 무비차트 | 상영예정작 -->
        <ul class="policy_list">
            <li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li>
            <li><a href="http://corp.cgv.co.kr/company/ir/financial/financial_list.aspx" target="_blank">IR</a></li>
            <li><a href="http://corp.cgv.co.kr/company/recruit/step/default.aspx" target="_blank">채용정보</a></li>
            <li><a href="http://corp.cgv.co.kr/company/advertize/ad_Default.aspx" target="_blank">광고/제휴/출점문의</a>
            </li>
            <li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>
            <li><a href="http://www.cgv.co.kr/rules/organized.aspx">편성기준</a></li>
            <li><a href="http://www.cgv.co.kr/rules/privacy.aspx"><strong>개인정보처리방침</strong></a></li>
            <li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
            <li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
            <li><a href="http://corp.cgv.co.kr/company/ethicalManagement/ceoMessage.aspx" target="_blank">윤리경영</a>
            </li>
            <li><a href="/company/cyberAudit.aspx" class="empha-red">사이버감사실</a></li>
        </ul>


        <!--/ Contents End -->

        <!-- /Contents Area -->

        <!-- E Popup -->

        <!-- S 예매하기 및 TOP Fixed 버튼 -->
        <div class="fixedBtn_wrap">

            <a href="/ticket/" class="btn_fixedTicketing">예매하기</a>

            <a href="#none" class="btn_gotoTop"><img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png"
                                                     alt="최상단으로 이동"/></a>
        </div>

        <!-- E 예매하기 및 TOP Fixed 버튼 -->


</body>
</html>
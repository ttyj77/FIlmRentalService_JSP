<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="controller.TheaterController" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.TheaterDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>상영관</title>

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="/assets/css/animate.css"/>
    <link rel="stylesheet" href="/assets/css/glightbox.min.css"/>
    <link rel="stylesheet" href="/assets/css/main.css"/>
    <link rel="stylesheet" href="/assets/css/cgv.css"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
            integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<%
    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    TheaterController theaterController = new TheaterController(connectionMaker);
    SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일 H:m:s");
    ArrayList<TheaterDTO> theaterList = theaterController.selectAll();

%>
<%--변수선언--%>
<c:set var="theaterList" value="<%=theaterList%>"/>
<c:set var="theaterController" value="<%=theaterController%>"/>

<!-- Start Breadcrumbs -->
<div class="breadcrumbs" style="height: 250px">
    <div class="container">
        <div class="row align-items-center" style="display: flex;justify-content: space-between;">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">J_Cinema</h1>
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
<div class="inner-wrap">
    <h2 class="tit mt-40">전체극장</h2>
    <div class="theater-box" style="height: 292px">
        <ul class="nav nav-pills mb-3 fs-4" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="1" data-bs-toggle="pill" data-bs-target="#pills-home"
                        type="button" role="tab" aria-controls="pills-home" aria-selected="true"
                        onclick="searchFunction(this.id)">
                    &nbsp&nbsp&nbsp서울&nbsp&nbsp&nbsp
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="2" data-bs-toggle="pill" data-bs-target="#pills-profile"
                        type="button" role="tab" aria-controls="pills-profile" aria-selected="false"
                        onclick="searchFunction(this.id)">
                    &nbsp&nbsp&nbsp경기&nbsp&nbsp&nbsp
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="3" data-bs-toggle="pill" data-bs-target="#pills-contact"
                        type="button" role="tab" aria-controls="pills-contact" aria-selected="false"
                        onclick="searchFunction(this.id)">
                    &nbsp&nbsp&nbsp인천&nbsp&nbsp&nbsp
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="4" data-bs-toggle="pill" data-bs-target="#pills-contact"
                        type="button" role="tab" aria-controls="pills-contact" aria-selected="false"
                        onclick="searchFunction(this.id)">대전/충청/세종
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="5" data-bs-toggle="pill" data-bs-target="#pills-contact"
                        type="button" role="tab" aria-controls="pills-contact" aria-selected="false"
                        onclick="searchFunction(this.id)">부산/대구/경상
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="6" data-bs-toggle="pill" data-bs-target="#pills-contact"
                        type="button" role="tab" aria-controls="pills-contact" aria-selected="false"
                        onclick="searchFunction(this.id)">
                    &nbsp&nbsp광주/전라&nbsp
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="7" data-bs-toggle="pill" data-bs-target="#pills-contact"
                        type="button" role="tab" aria-controls="pills-contact" aria-selected="false"
                        onclick="searchFunction(this.id)">
                    &nbsp&nbsp&nbsp&nbsp강원&nbsp&nbsp&nbsp&nbsp
                </button>
            </li>

        </ul>
        <div class="theater-list">
            <ul id="ajaxDiv">

            </ul>
        </div>


    </div>

    <div class="tit-util mt100 mb15">
        <h3 class="tit">극장 공지사항</h3>
        <a href="/support/notice?ti=3" class="more" title="극장 공지사항 더보기">더보기 <i
                class="iconset ico-arr-right-gray"></i></a>
    </div>
    <%--    <div class="tit mt-100">--%>
    <%--        <h2 class="tit">극장 공지사항</h2>--%>
    <%--        <a href="/support/notice?ti=3" class="more" title="극장 공지사항 더보기">더보기 <i--%>
    <%--                class="iconset ico-arr-right-gray"></i></a>--%>
    <%--    </div>--%>

    <div class="table-wrap">
        <table class="board-list info_table">
            <caption>극장, 제목, 지역, 등록일이 들어간 극장 공지사항 목록</caption>
            <colgroup>
                <col style="width:150px;">
                <col>
                <col style="width:150px;">
                <col style="width:120px;">
            </colgroup>
            <thead class="info_thead">
            <tr>
                <th scope="col">극장</th>
                <th scope="col">제목</th>
                <th scope="col">지역</th>
                <th scope="col">등록일</th>
            </tr>
            </thead>
            <tbody class="info_tbody">


            <tr>
                <td>상암월드컵경기장</td>
                <th scope="row">
                    <a href="/support/notice/detail?artiNo=10780&bbsNo=9" title="[상암월드컵경기장]관람요금 변경 안내 상세보기">
                        [상암월드컵경기장]관람요금 변경 안내
                    </a>
                </th>
                <td>서울</td>
                <td>2023.02.15</td>
            </tr>


        </table>
    </div>

</div>
<script>
    let request = new XMLHttpRequest();

    function searchFunction(id) {
        // request.open("Post", "../TheaterSearchServlet?cityId=" + encodeURIComponent(document.getElementById("cityId").value), true);
        request.open("Post", "../TheaterSearchServlet?cityId=" + id, true);
        request.onreadystatechange = searchProcess;
        console.log("request: " + request)
        request.send(null);
    }

    function searchProcess() {
        let DR1 = document.getElementById("ajaxDiv")
        DR1.innerHTML = "";
        console.log("searchProcess 진입")
        console.log("searchProcess : request" + request.responseText)


        if (request.readyState == 4 && request.status == 200) {

            let temp = JSON.parse(request.responseText);
            let array = JSON.parse(temp.responseText);

            for (let i = 0; i < array.length; i++) {
                let newDiv = document.createElement("li")
                let a_tag = document.createElement("a")
                a_tag.setAttribute("href", array[i].name)
                a_tag.innerHTML = array[i].name
                newDiv.appendChild(a_tag);
                DR1.appendChild(newDiv);

            }

        }
        window.onload = function () {
            searchFunction();
        }
    }


</script>


</body>
</html>

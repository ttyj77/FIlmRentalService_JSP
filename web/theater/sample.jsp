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

<div class="container">
    <dix class="form-control row pull-right">
        <div class="col-xs-8">
            <input class="form-control" id="cityId" onkeyup="searchFunction()" type="text" size="20">
        </div>
    </dix>


</div>
<table class="table" style="text-align: center" ; border: 1px soild #ddddd>
    <thead>
    <tr>
        <th style="background-color: #3fdd90 ; text-align: center">이름</th>
        <th style="background-color: #3fdd90 ; text-align: center">번호</th>
        <th style="background-color: #3fdd90 ; text-align: center">주소</th>
        <th style="background-color: #3fdd90 ; text-align: center">정보1</th>
        <th style="background-color: #3fdd90 ; text-align: center">정보2</th>
    </tr>
    </thead>
    <tbody id=ajaxTable>
    <tr>

    </tr>
    </tbody>
</table>

</div>


<script>
    let request = new XMLHttpRequest();

    function searchFunction() {
        request.open("Post", "../TheaterSearchServlet?cityId=" + encodeURIComponent(document.getElementById("cityId").value), true);
        // request.open("Post", "../TheaterSearchServlet?cityId=" + id, true);
        request.onreadystatechange = searchProcess;
        console.log("request: " + request)
        request.send(null);
    }

    function searchProcess() {
        console.log("searchProcess 진입")
        console.log("searchProcess : request" + request.responseText)
        let table = document.getElementById("ajaxTable");
        let DR1 = document.getElementById("ajaxDiv")
        table.innerHTML = "";
        if (request.readyState == 4 && request.status == 200) {
            let object1 = eval('(' + request.responseText + ')'); //json
            let result = object1.result;

            let temp = JSON.parse(request.responseText);
            let array = JSON.parse(temp.responseText);

            for (let i = 0; i < array.length; i++) {
                let row = table.insertRow(0);

                    let cell = row.insertCell(0);
                    cell.innerHTML = array[i].name;


            }
            // let new_tag = document.createElement('div');
            // new_tag.setAttribute("class", 'tab-pane fade show active')
            // new_tag.innerHTML = result[0][1].value;
            // DR1.append(new_tag);
            // console.log(result)

        }
        window.onload = function () {
            searchFunction();
        }
    }


</script>

</body>
</html>

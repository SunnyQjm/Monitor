<%@ page import="data.GroupInfo" %>
<%@ page import="data.FileStorageInfo" %>
<%@ page import="util.Tool" %>
<%@ page import="java.util.List" %><%--  Created by IntelliJ IDEA.
  User: Sunny
  Date: 2017/7/12 0012
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
HttpServletRequest request;
HttpServletResponse response;
JspWriter out;
HttpSession session;
ServletConfig config;
ServletContext application;
page;
PageContext pageContext;
Exception exception;
--%>

<%!
    List<GroupInfo> list = null;
%>

<%
    list = (List<GroupInfo>) request.getAttribute("data");
%>
<script language="JavaScript">
    <!--
    function myRefresh() {
        history.go(0);
    }
    var j = false;
    t = setTimeout("myRefresh()", 1000);
    function changeState() {
        if (j) {
            myRefresh();
        }
        else {
            j = true;
            clearTimeout(t);
            var btn = document.getElementById("autoFresh");
            btn.innerHTML = "开启自动刷新";
        }
    }
    -->
</script>

<html>
<head>
    <%--<meta http-equiv="refresh" content="1">--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <title>$Title$</title>
</head>

<h1 style="margin: 10px auto; text-align: center">监控程序</h1>
<table class="table table-hover" style="width: 80%;margin: 30px auto;">
    <tr>
        <th>NodeName</th>
        <th>IP</th>
        <th>PORT</th>
        <th>Capacity</th>
        <th>LeftCapacity</th>
        <th>ConnectNum</th>
        <th>GroupNumber</th>
        <th>State</th>
    </tr>

    <%
        for (GroupInfo groupInfo : list) {
            for (FileStorageInfo fileStorageInfo : groupInfo.getNodes()) {
                out.write("<tr>");
                out.print("<td>" + fileStorageInfo.getName() + "</td>");
                out.print("<td>" + fileStorageInfo.getIp() + "</td>");
                out.print("<td>" + fileStorageInfo.getPort() + "</td>");
                out.print("<td>" + Tool.convertToSize(fileStorageInfo.getCapacity()) + " </td>");
                out.print("<td>" + Tool.convertToSize(fileStorageInfo.getLeftCapacity()) + "</td>");
                out.print("<td>" + fileStorageInfo.getConnectNum() + "</td>");
                out.print("<td>" + fileStorageInfo.getGroupId() + "</td>");
                if (fileStorageInfo.isUseful()) {
                    out.print("<td>UP</td>");
                } else {
                    out.print("<td>DOWN</td>");
                }
                out.write("</tr>");
            }
            out.flush();
        }
    %>
</table>
<div style="width: 100%; text-align: center; margin: 0 auto">
    <button class="btn btn-primary" onclick="changeState()" id="autoFresh" style="">
        关闭自动刷新
    </button>
    <a href="FileInfo.jsp">
        <button class="btn btn-primary">
            文件信息
        </button>
    </a>
</div>
</div>
</body>
</html>

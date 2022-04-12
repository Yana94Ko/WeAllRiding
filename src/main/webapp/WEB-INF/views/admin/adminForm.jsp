<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="context-path" th:content="@{/}"/>

    <title>관리자입니다</title>

    <!--  Common header -->
    <th:block th:include="common/include-link"></th:block>
    <!-- Custom styles for sidebar -->
    <link th:href="@{/css/admin-sidebar.css}" rel="stylesheet">
</head>
<body>
<!-- Common script -->
<th:block th:include="common/include-script"></th:block>

<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav th:replace="admin/sidebar"></nav>

    <div id="content" class="content">
        <button type="button" id="sidebarCollapse" class="navbar-btn"><i class="fas fa-bars"></i></button>
        <hr>
        <!-- Page Content Holder -->
        <div th:replace="${template}"></div>
    </div>
</div>
</body>
</html>
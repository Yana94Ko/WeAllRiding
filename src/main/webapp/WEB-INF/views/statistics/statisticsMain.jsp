<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/statistics/statisticsMake.js"></script>
<link rel="stylesheet" href="/css/statistics/statistics.css" type="text/css"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<main>
    <div class="statisticsContainer">
        <div id="gender">
            <canvas id="genderChart" width="400px" height="400px"></canvas>
        </div>
        <div id="age">
            <canvas id="ageChart" width="400px" height="400px"></canvas>
        </div>
    </div>
</main>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm phòng</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        input {
            padding: 8px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 style="text-align: center;">Tìm kiếm phòng theo ID</h2>
    <form action="<c:url value='/tenant/search'/>" method="get">
        <input type="text" name="id" placeholder="Nhập ID phòng...">
        <input type="submit" value="Tìm kiếm">
    </form>
    <br>
    <table>
        <thead>
        <tr>
            <th>RoomID</th>
            <th>Tên người thuê</th>
            <th>Số điện thoại</th>
            <th>Ngày bắt đầu thuê</th>
            <th>Hình thức trả</th>
            <th>Ghi chú</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tenant" items="${rooms}">
            <tr>
                <td>${tenant.id}</td>
                <td>${tenant.tenantName}</td>
                <td>${tenant.phone}</td>
                <td>${tenant.startDate}</td>
                <td>${tenant.paymentMethod}</td>
                <td>${tenant.note}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

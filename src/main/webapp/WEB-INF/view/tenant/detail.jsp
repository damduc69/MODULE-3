<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết phòng</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Chi tiết phòng</h2>
    <table>
        <tr>
            <th>RoomID</th>
            <td>${room.id}</td>
        </tr>
        <tr>
            <th>Tên người thuê</th>
            <td>${room.tenantName}</td>
        </tr>
        <tr>
            <th>Số điện thoại</th>
            <td>${room.phone}</td>
        </tr>
        <tr>
            <th>Ngày bắt đầu thuê</th>
            <td>${room.startDate}</td>
        </tr>
        <tr>
            <th>Hình thức trả</th>
            <td>${room.paymentMethod}</td>
        </tr>
        <tr>
            <th>Ghi chú</th>
            <td>${room.note}</td>
        </tr>
    </table>
    <a href="/tenant/list">Quay Về</a>
</div>
</body>
</html>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý thuê phòng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            width: 95%;
            max-width: 1100px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            text-decoration: none;
            padding: 8px 14px;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            transition: 0.3s;
            display: inline-block;
            margin: 2px;
        }
        .btn-add {
            background-color: #28a745;
        }
        .btn-search {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn-search:hover {
            background-color: #0056b3;
        }

        .btn-view {
            background-color: #007bff;
        }
        .btn-edit {
            background-color: #ffc107;
            color: black;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh sách thuê phòng</h2>
    <table>
        <thead>
        <tr>
            <th>RoomID</th>
            <th>Tên người thuê</th>
            <th>Số điện thoại</th>
            <th>Ngày bắt đầu</th>
            <th>Hình thức thanh toán</th>
            <th>Ghi chú</th>
            <th>Hành động</th>
            <th>
                <a class="btn btn-add" href="<c:url value='/tenant/add'/>">Thêm</a>
            </th>
            <th>
                <a class="btn btn-search" href="<c:url value='/tenant/search'/>">Tìm kiếm</a>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>${room.id}</td>
                <td>${room.tenantName}</td>
                <td>${room.phone}</td>
                <td>${room.startDate}</td>
                <td>${room.paymentMethod}</td>
                <td>${room.note}</td>
                <td>
                    <a class="btn btn-view" href="<c:url value='/tenant/detail'/>?id=${room.id}">Xem</a>
                    <a class="btn btn-edit" href="<c:url value='/tenant/edit'/>?id=${room.id}">Sửa</a>
                    <a class="btn btn-delete" href="<c:url value='/tenant/remove'/>?id=${room.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
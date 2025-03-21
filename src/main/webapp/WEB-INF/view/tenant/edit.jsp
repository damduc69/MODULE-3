<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa phòng</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            text-align: left;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Sửa phòng</h2>
    <form action="<c:url value='/tenant/edit'/>" method="post">
        <input type="hidden" id="id" name="id" value="${room.id}">
        <table>
            <tr>
                <td><label for="tenantName">Tên người thuê:</label></td>
                <td><input type="text" id="tenantName" name="tenantName" value="${room.tenantName}"></td>
            </tr>
            <tr>
                <td><label for="phone">Số điện thoại:</label></td>
                <td><input type="text" id="phone" name="phone" value="${room.phone}"></td>
            </tr>
            <tr>
                <td><label for="startDate">Ngày bắt đầu thuê:</label></td>
                <td><input type="date" id="startDate" name="startDate" value="${room.startDate}"></td>
            </tr>
            <tr>
                <td><label for="paymentMethod">Hình thức trả:</label></td>
                <td><input type="text" id="paymentMethod" name="paymentMethod" value="${room.paymentMethod}"></td>
            </tr>
            <tr>
                <td><label for="note">Ghi chú:</label></td>
                <td><input type="text" id="note" name="note" value="${room.note}"></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Cập nhật">
    </form>
</div>
</body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm phòng mới</title>
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
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .submit-btn {
            text-align: center;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 style="text-align: center;">Thêm phòng mới</h2>
    <form action="<c:url value='/tenant/add'/>" method="post">
        <table>
            <tr>
                <td><label for="name">Tên người thuê:</label></td>
                <td><input type="text" id="name" name="tenantName" placeholder="Nhập tên người thuê"></td>
            </tr>
            <tr>
                <td><label for="phone">Số điện thoại:</label></td>
                <td><input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại"></td>
            </tr>
            <tr>
                <td><label for="startDate">Ngày bắt đầu thuê:</label></td>
                <td><input type="date" id="startDate" name="startDate"></td>
            </tr>
            <tr>
                <td><label for="paymentMethod">Hình thức trả:</label></td>
                <td><input type="text" id="paymentMethod" name="paymentMethod" placeholder="Nhập hình thức trả"></td>
            </tr>
            <tr>
                <td><label for="notes">Ghi chú:</label></td>
                <td><input type="text" id="notes" name="note" placeholder="Nhập ghi chú"></td>
            </tr>
            <tr>
                <td colspan="2" class="submit-btn">
                    <input type="submit" value="Thêm mới">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
<?php
$servername = "localhost";
$username = "root"; // Thay bằng tên đăng nhập của bạn
$password = "Lenghia0108@"; // Thay bằng mật khẩu của bạn
$dbname = "changhi_database"; // Thay bằng tên cơ sở dữ liệu của bạn

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
?>
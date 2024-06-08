<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cửa Hàng Chè</title>
    <link rel="stylesheet" href="../assets/css/login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "Lenghia0108@";
$dbname = "dbtest";

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['action']) && $_POST['action'] == 'register') {
        // Xử lý đăng ký
        $name = $_POST["name"];
        $email = $_POST["email"];
        $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

        // Kiểm tra xem email đã tồn tại chưa
        $sql_check_email = "SELECT * FROM users WHERE email='$email'";
        $result_check_email = $conn->query($sql_check_email);

        if ($result_check_email->num_rows > 0) {
            // Email đã tồn tại
            header("Location: ?status=error&message=" . urlencode("Email đã tồn tại!"));
            exit();
        } else {
            // Email chưa tồn tại, tiếp tục đăng ký
            $sql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$password')";

            if ($conn->query($sql) === TRUE) {
                header("Location: ?status=success&message=" . urlencode("Đăng ký thành công!"));
                exit();
            } else {
                header("Location: ?status=error&message=" . urlencode("Lỗi: " . $conn->error));
                exit();
            }
        }
    } elseif (isset($_POST['action']) && $_POST['action'] == 'login') {
        // Xử lý đăng nhập
        $email = $_POST["email"];
        $password = $_POST["password"];

        $sql = "SELECT * FROM users WHERE email='$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                $_SESSION['loggedin'] = true;
                $_SESSION['email'] = $email;
                header("Location: ../index.php");
                exit();
            } else {
                header("Location: ?status=error&message=" . urlencode("Mật khẩu không đúng!"));
                exit();
            }
        } else {
            header("Location: ?status=error&message=" . urlencode("Email không tồn tại!"));
            exit();
        }
    }
}

$conn->close();
?>

<p class="tip">Nhấn vào nút trong khung hình để tiếp tục</p>
<div class="cont">
    <div class="form sign-in">
        <h2>Chào mừng trở lại,</h2>
        <form method="post" id="loginForm">
            <input type="hidden" name="action" value="login">
            <label>
                <span>Email</span>
                <input type="email" name="email" required />
            </label>
            <label>
                <span>Mật khẩu</span>
                <input type="password" name="password" required />
            </label>
            <p class="forgot-pass">Quên mật khẩu?</p>
            <button type="submit" class="submit" id="loginButton" disabled>Đăng Nhập</button>
            <button type="button" class="fb-btn">Kết nối với <span>Facebook</span></button>
        </form>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>Chưa có tài khoản?</h2>
                <p>Đăng ký để nhận ngay ưu đãi và khám phá các loại chè đặc biệt!</p>
            </div>
            <div class="img__text m--in">
                <h2>Đã có tài khoản?</h2>
                <p>Nếu bạn đã có tài khoản, hãy đăng nhập để tiếp tục mua sắm!</p>
            </div>
            <div class="img__btn">
                <span class="m--up">Đăng Ký</span>
                <span class="m--in">Đăng Nhập</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>Chào mừng bạn đến với cửa hàng chè,</h2>
            <form method="post" id="registerForm">
                <input type="hidden" name="action" value="register">
                <label>
                    <span>Tên</span>
                    <input type="text" name="name" required />
                </label>
                <label>
                    <span>Email</span>
                    <input type="email" name="email" required />
                </label>
                <label>
                    <span>Mật khẩu</span>
                    <input type="password" name="password" required />
                </label>
                <button type="submit" class="submit" id="registerButton" disabled>Đăng Ký</button>
                <button type="button" class="fb-btn">Tham gia với <span>Facebook</span></button>
            </form>
        </div>
    </div>
</div>

<a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link">
    <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png">
</a>
<a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter">
    <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png">
</a>

<script>
document.querySelector('.img__btn').addEventListener('click', function() {
    document.querySelector('.cont').classList.toggle('s--signup');
});

function checkForm(formId, buttonId) {
    const form = document.getElementById(formId);
    const button = document.getElementById(buttonId);
    const inputs = form.querySelectorAll('input[required]');

    form.addEventListener('input', () => {
        let allFilled = true;
        inputs.forEach(input => {
            if (!input.value) {
                allFilled = false;
            }
        });
        button.disabled = !allFilled;
        button.classList.toggle('enabled', allFilled);
    });
}

checkForm('loginForm', 'loginButton');
checkForm('registerForm', 'registerButton');

// Kiểm tra và hiển thị thông báo nếu có status và message trong URL
const urlParams = new URLSearchParams(window.location.search);
const status = urlParams.get('status');
const message = urlParams.get('message');

if (status && message) {
    if (status === 'success') {
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: decodeURIComponent(message)
        });
    } else if (status === 'error') {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: decodeURIComponent(message)
        });
    }

    // Xóa các tham số status và message khỏi URL
    const newUrl = window.location.origin + window.location.pathname;
    window.history.replaceState(null, null, newUrl);
}
</script>

</body>
</html>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cửa Hàng Chè</title>
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>

<p class="tip">Nhấn vào nút trong khung hình để tiếp tục</p>
<div class="cont">
    <div class="form sign-in">
        <h2>Chào mừng trở lại,</h2>
        <label>
            <span>Email</span>
            <input type="email" />
        </label>
        <label>
            <span>Mật khẩu</span>
            <input type="password" />
        </label>
        <p class="forgot-pass">Quên mật khẩu?</p>
        <button type="button" class="submit">Đăng Nhập</button>
        <button type="button" class="fb-btn">Kết nối với <span>Facebook</span></button>
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
            <label>
                <span>Tên</span>
                <input type="text" />
            </label>
            <label>
                <span>Email</span>
                <input type="email" />
            </label>
            <label>
                <span>Mật khẩu</span>
                <input type="password" />
            </label>
            <button type="button" class="submit">Đăng Ký</button>
            <button type="button" class="fb-btn">Tham gia với <span>Facebook</span></button>
        </div>
    </div>
</div>

<a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link">
    <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png">
</a>
<a href="https://codepen.io/suez/pen/XWyBpre" target="_blank" class="link-footer">Phiên bản mới 2023</a>
<a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter">
    <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png">
</a>

<script>
document.querySelector('.img__btn').addEventListener('click', function() {
    document.querySelector('.cont').classList.toggle('s--signup');
});
</script>

</body>
</html>

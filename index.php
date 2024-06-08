<?php
 
    $conn = mysqli_connect("localhost", "root", "", "changhidatabase");
    if(!$conn){
        die("Connection failed: " . mysqli_connect_error());
    }

    $sql = "SELECT * FROM product";

    $result = mysqli_query($conn, $sql);


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Roboto+Slab:wght@100..900&display=swap" rel="stylesheet">

<style>
    @layer utilities {
        .font-custom {
            font-family: "Roboto Slab", serif;
        }
    }
</style>
</head>
<body>
    <div class="w-full fixed top-0 z-50"><?php include './pages/component/header.php'; ?></div>
    <div class="pt-[140px] px-[180px] relative z-10 font-custom">
        <div class="owl-carousel owl-theme">
            <img src="/ChangHi/assets/images/products/banner4.jpg" alt="banner" class='w-full rounded-lg h-[500px]'>
            <img src="/ChangHi/assets/images/products/banner5.jpg" alt="banner" class='w-full rounded-lg h-[500px]'>
            <img src="/ChangHi/assets/images/products/banner3.jpeg" alt="banner" class='w-full rounded-lg h-[500px]'>
            <img src="/ChangHi/assets/images/products/banner2.jpg" alt="banner" class='w-full rounded-lg h-[500px]'>
        </div>

        <div>
            <img src="/ChangHi/assets/images/delivery.png" alt="">
        </div>

        <div class='bg-gray-100 rounded-md overflow-hidden flex'>
            <img src="/ChangHi/assets/images/intro.png" alt="" class='w-[500px] h-[500px]'>
            <div class='p-4'>
                <h1 class='text-center font-semibold text-4xl font-custom'>Chè ngon - Sáng tạo</h1>
                <p class='px-6 mt-8'>
                🌹 Bạn thèm chè nhưng sợ béo❤  Sự khéo léo là chọn CHANG HI ❤
                💥 Dù đầu tuần của bạn trôi qua nhàm chán hay bận rộn, hãy cùng CHANG HI “sạc pin”” thêm phần ngọt ngào để chiến deadline nào!
                Rủ rê đồng bọn ghé ngay CHANG HI để thưởng thức những ly chè khoai dẻo phô mai siêu ngon mát lạnh quyến rũ.😛
                💥 Trót đem lòng “”u mê”” phô mai thì làm sao có thể bỏ qua được món ăn ngon tuyệt này, viên Pudding phô mai beo béo thơm lừng kết hợp cùng khoai dẻo tím, vàng, xanh đủ màu sắc và nhiều loại Topping như thạch cafe, trân châu dẻo, sương sáo, nước chan thảo mộc nữa ta nói đỉnh của chóp. Nghĩ tới thôi mà đã không kiềm lòng chảy nước miếng nổi rồi cả nhà ơi. 😋Đã thế chè nhà CHANG HI sử dùng 100% đường thốt nốt tốt cho sức khỏe và “ÍT NGỌT” Ăn chè nhà CHANG HI vừa Healthy vừa không lo mập nha.
                </p>

                <div class='px-12'><button class='w-full h-[44px] rounded-full bg-red-800   '>Đặt hàng ngay</button></div>
            </div>
        </div>

        <script>
        $(document).ready(function(){
            $('.owl-carousel').owlCarousel({
                items: 1, // Số mục hiển thị cùng lúc
                loop: true, // Lặp lại carousel
                margin: 20, // Khoảng cách giữa các mục
                nav: false, // Hiển thị nút điều hướng
                autoplay:true,
                autoplayTimeout: 2000, 
                autoplayHoverPause: true,
                dots:false,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 1
                    }
                }
            });
        });
    </script>
    </div>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
    <div class="w-full h-[80px] fixed px-[180px] flex justify-between items-center shadow z-90 bg-white">
        <div>
            <img src="/ChangHi/assets/images/logo.png" alt="Logo" class="w-[80px] h-[80px]"/>
        </div>
        <div class="flex items-center list-none ml-[120px] font-custom">
            <li class="mx-4 font-semibold text-md hover:text-red-800 hover:cursor-pointer">Trang chủ</li>
            <li class="mx-4 font-semibold text-md hover:text-red-800 hover:cursor-pointer">Giới thiệu</li>
            <li class="mx-4 font-semibold text-md hover:text-red-800 hover:cursor-pointer">Menu</li>
            <li class="mx-4 font-semibold text-md hover:text-red-800 hover:cursor-pointer">Đặt chè</li>
            <li class="mx-4 font-semibold text-md hover:text-red-800 hover:cursor-pointer">Tin tức</li>
            <li class="mx-4 font-semibold text-md hover:text-red-800 hover:cursor-pointer">Liên hệ</li>
        </div>

        <div class="w-[180px] flex justify-center">
            <button class="w-[120px] rounded-full bg-yellow-300 font-semibold py-2 hover:cursor-pointer hover:bg-yellow-400 transition-all duration-300 ease-in">Đăng nhập</button>
        </div>
    </div>
</body>
</html>
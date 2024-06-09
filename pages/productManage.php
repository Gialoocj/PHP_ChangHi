<?php 
include './controller/product.php';
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/productManage.css">
    <style>
        .overflow-x-auto {
            overflow-x: auto;
        }
    </style>
</head>
<body class="bg-gray-100">
<div class="flex">
    <div class="sidebar-bg text-white w-64 min-h-screen">
        <div class="p-4">
            <div class="items-center justify-between mb-4">
                <h2 class="text-xl font-semibold">Xin chào, Admin</h2>
                <button class="sidebar-btn hover:bg-red-600 text-white font-bold py-1 px-3 mt-3 rounded button-transition">Đăng xuất</button>
            </div>
            <h2 class="text-2xl font-semibold mb-4">Dashboard</h2>
            <ul>
                <li id="productManagement" class="sidebar-item mb-2"><a href="productManage.php" class="block py-2 px-4 rounded hover:bg-gray-600">Quản lý sản phẩm</a></li>
                <li id="orderManagement" class="sidebar-item mb-2"><a href="orderManage.php" class="block py-2 px-4 rounded hover:bg-gray-600">Quản lý đơn hàng</a></li>
                <li id="userManagement" class="sidebar-item mb-2"><a href="userManage.php" class="block py-2 px-4 rounded hover:bg-gray-600">Quản lý người dùng</a></li>
            </ul>
        </div>
    </div>
    <div class="container mx-auto px-4 py-8 flex-1">
        <h2 class="text-center text-2xl font-semibold mb-4">Danh sách sản phẩm</h2>
        <div class="flex items-center mb-4 space-x-3 w-3/4 m-auto">
            <input type="text" id="searchInput" class="form-input rounded-l-md flex-1 mr-2 p-2" placeholder="Tìm kiếm...">
            <button id="searchButton" class="btn text-white font-bold py-2 px-4 rounded-r-md button-transition">Tìm kiếm</button>
            <button class="btn text-white font-bold py-2 px-4 rounded-r-md button-transition" onclick="openModal('addModal')">Thêm sản phẩm</button>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="px-4 py-2">#</th>
                        <th class="px-4 py-2">Ảnh</th>
                        <th class="px-4 py-2">Tên</th>
                        <th class="px-4 py-2">Giá</th>
                        <th class="px-4 py-2">Giới thiệu</th>
                        <th class="px-4 py-2">Thể loại</th>
                        <th class="px-4 py-2">Hành động</th>
                    </tr>
                </thead>
                <tbody id="productTable">
                    <?php foreach ($products as $product): ?>
                        <tr>
                            <td class="border px-4 py-2"><?php echo $product['id']; ?></td>
                            <td class="border px-4 py-2">
                            <?php 
                             $imagePath = '../assets/images/Products/' . $product['image']; 
                             echo '<img class="w-30 h-30" src="' . $imagePath . '" alt="Product Image" class="h-10 w-auto">';
                            ?>
                            </td>
                            <td class="border px-4 py-2"><?php echo $product['product_name']; ?></td>
                            <td class="border px-4 py-2"><?php echo $product['price']; ?></td>
                            <td class="border px-4 py-2"><?php echo $product['description']; ?></td>
                            <td class="border px-4 py-2"><?php echo $product['category_name']; ?></td>
                            <td class="border px-4 py-2">
                                <button class="bg-yellow-400 hover:bg-yellow-500 text-white font-bold py-1 px-3 rounded button-transition">Sửa</button>
                                <form method="POST" action="productManage.php" style="display: inline;">
                                    <input type="hidden" name="deleteProductId" value="<?php echo $product['id']; ?>">
                                    <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-bold py-1 px-3 rounded button-transition">Xóa</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="addModal" class="modal fixed top-0 left-0 w-full h-full bg-gray-800 bg-opacity-50 flex items-center justify-center">
    <div class="modal-dialog bg-white rounded shadow-lg overflow-hidden w-1/3">
        <div class="modal-content p-8">
            <h2 class="text-xl font-semibold mb-4">Thêm sản phẩm</h2>
            <form id="addProductForm" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST" class="space-y-4" enctype="multipart/form-data">
                <div class="mb-4">
                    <img src="../assets/images/Products">
                    <label for="productName" class="block text-sm font-medium text-gray-700">Tên sản phẩm</label>
                    <input type="text" id="productName" name="productName" class="form-input h-10 p-2 rounded-md w-full bg-gray-100" required>
                </div>
                <div class="flex items-center space-x-4 mb-4">
                    <div class="w-1/2">
                        <label for="productPrice" class="block text-sm font-medium text-gray-700">Giá</label>
                        <input type="text" id="productPrice" name="productPrice" class="form-input h-10 p-2 rounded-md w-full bg-gray-100" required>
                    </div>
                    <div class="w-1/2">
                        <label for="productCategory" class="block text-sm font-medium text-gray-700">Thể loại</label>
                        <select id="productCategory" name="productCategory" class="form-select h-10 p-2 rounded-md w-full bg-gray-100" required>
                            <option value="" disabled selected>Chọn thể loại</option>
                            <option value="1">Chè hoa quả</option>
                            <option value="2">Chè bánh flan</option>
                            <option value="3">Chè pudding</option>
                            <!-- Thêm các tùy chọn thể loại từ cơ sở dữ liệu nếu cần -->
                        </select>
                    </div>
                </div>
                <div class="mb-4">
                    <label for="productDescription" class="block text-sm font-medium text-gray-700">Mô tả</label>
                    <textarea id="productDescription" name="productDescription" class="form-textarea rounded-md w-full bg-gray-100" rows="4" required></textarea>
                </div>
                <div class="mb-4">
                    <label for="productImage" class="block text-sm font-medium text-gray-700">Ảnh sản phẩm</label>
                    <div class="flex items-center space-x-2">
                        <input type="file" id="productImage" name="productImage" accept="image/*" class="mt-2 text-sm">
                    </div>
                </div>
                <div class="flex justify-end">
                    <button type="button" class="btn bg-gray-400 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded-md button-transition" onclick="closeModal('addModal')">Hủy</button>
                    <input name="addProduct" type="submit" class="btn bg-yellow-400 hover:bg-yellow-500 text-white font-bold py-2 px-4 rounded-md ml-2 button-transition">Thêm</input>
                </div>
            </form>
        </div>
    </div>
</div>


<form id="searchForm" action="" method="GET" class="hidden">
    <input type="hidden" name="search" id="searchTerm">
</form>
<script>

    function openModal(modalId) {
        document.getElementById(modalId).classList.add('active');
    }
    function closeModal(modalId) {
        document.getElementById(modalId).classList.remove('active');
    }

    document.getElementById('searchButton').addEventListener('click', function() {
        var searchTerm = document.getElementById('searchInput').value.trim();
        document.getElementById('searchTerm').value = searchTerm;
        document.getElementById('searchForm').submit();
    });
    document.getElementById('addProductForm').addEventListener('submit', function(event) {
        // event.preventDefault();
        closeModal('addModal');
    });
    document.addEventListener('DOMContentLoaded', function() {
        var path = window.location.pathname;
        var page = path.split("/").pop();
        var sidebarItems = {
            'productManage.php': 'productManagement',
            'orderManage.php': 'orderManagement',
            'userManage.php': 'userManagement'
        };
        if (sidebarItems[page]) {
            document.getElementById(sidebarItems[page]).classList.add('active');
        }
    });

    
    
</script>
</body>
</html>
<?php 
session_start(); // Bắt đầu session nếu chưa có

// Kiểm tra nếu form được submit và có dữ liệu sản phẩm
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["productName"]) && $_POST["productName"] != "") {
    // Các thông số kết nối đến cơ sở dữ liệu
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

    // Nhận dữ liệu từ biểu mẫu
    $productName = $_POST['productName'];
    $productPrice = $_POST['productPrice'];
    $productCategory = $_POST['productCategory'];
    $productDescription = $_POST['productDescription'];

    // Xử lý ảnh sản phẩm nếu có
    $imageName = '';
    if ($_FILES["productImage"]["name"] != '') {
        $targetDir = "../assets/images/Products/";
        $imageName = uniqid() . '_' . basename($_FILES["productImage"]["name"]);
        $targetFile = $targetDir . $imageName;

        // Di chuyển ảnh vào thư mục uploads
        if (!move_uploaded_file($_FILES["productImage"]["tmp_name"], $targetFile)) {
            $_SESSION['error_message'] = "Lỗi khi tải lên ảnh!";
            header("Location: productManage.php");
            exit();
        }
    }

    // Thêm sản phẩm vào cơ sở dữ liệu
    $sql = "INSERT INTO product (name, price, category_id, description, image) VALUES ('$productName', '$productPrice', '$productCategory', '$productDescription', '$imageName')";
    if ($conn->query($sql) === TRUE) {
        $_SESSION['success_message'] = "Thêm sản phẩm thành công";
        header("Location: productManage.php");
        exit();
    } else {
        $_SESSION['error_message'] = "Lỗi khi thêm sản phẩm: " . $conn->error;
        header("Location: productManage.php");
        exit();
    }
}

?>



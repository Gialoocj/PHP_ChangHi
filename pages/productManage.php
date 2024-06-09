<?php
include 'db_connection.php';

$searchTerm = ""; // Khởi tạo giá trị mặc định
$sqlCondition = ""; // Khởi tạo điều kiện tìm kiếm
if(isset($_GET['search']) && !empty($_GET['search'])) {
    $searchTerm = $_GET['search'];
    $sqlCondition = "WHERE p.name LIKE '%$searchTerm%'"; // Tạo điều kiện tìm kiếm
}

$sql = "SELECT p.id, p.name AS product_name, p.price, p.description,  c.categoryName AS category_name, p.image
        FROM product p
        INNER JOIN category c ON p.category_id = c.id
        $sqlCondition"; // Thêm điều kiện tìm kiếm vào câu truy vấn nếu có
$result = $conn->query($sql);

$products = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
} else {
    echo "0 kết quả";
}
$conn->close();
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
                        <th class="px-4 py-
2">Thể loại</th>
                        <th class="px-4 py-2">Hành động</th>
                    </tr>
                </thead>
                <tbody id="productTable">
                    <?php foreach ($products as $product): ?>
                        <tr>
                            <td class="border px-4 py-2"><?php echo $product['id']; ?></td>
                            <td class="border px-4 py-2"><img class="w-30 h-30" src=<?php echo str_replace('./', '../', $product['image']); ?> alt="Product Image" class="h-10 w-auto"></td>
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
        <div class="modal-content p-8"><h2 class="text-xl font-semibold mb-4">Thêm sản phẩm</h2>
            <form id="addProductForm" class="space-y-4">
                <div>
                    <label for="productName" class="block text-sm font-medium text-gray-700">Tên sản phẩm</label>
                    <input type="text" id="productName" name="productName" class="form-input rounded-md w-full">
                </div>
                <div>
                    <label for="productPrice" class="block text-sm font-medium text-gray-700">Giá</label>
                    <input type="text" id="productPrice" name="productPrice" class="form-input rounded-md w-full">
                </div>
                <div class="flex justify-end">
                    <button type="button" class="bg-gray-400 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded button-transition" onclick="closeModal('addModal')">Hủy</button>
                    <button type="submit" class="bg-yellow-400 hover:bg-yellow-500 text-white font-bold py-2 px-4 rounded ml-2 button-transition">Lưu</button>
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

    function deleteProduct(productId) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
            // Sử dụng Ajax để gửi yêu cầu xóa
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "delete_product.php", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // Xóa sản phẩm thành công, cập nhật giao diện
                    location.reload();
                }
            };
            xhr.send("productId=" + productId);
        }
    }

    document.getElementById('searchButton').addEventListener('click', function() {
        var searchTerm = document.getElementById('searchInput').value.trim();
        document.getElementById('searchTerm').value = searchTerm;
        document.getElementById('searchForm').submit();
    });
    document.getElementById('addProductForm').addEventListener('submit', function(event) {
        event.preventDefault();
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
include 'db_connection.php';

$deleteSuccess = false; // Biến để kiểm tra xem yêu cầu xóa sản phẩm đã được thực hiện thành công hay không

// Xử lý yêu cầu xóa sản phẩm
if(isset($_POST['deleteProductId']) && !empty($_POST['deleteProductId'])) {
    $productId = $_POST['deleteProductId'];
    // Bắt đầu một giao dịch
    $conn->begin_transaction();

    // Xóa tất cả các bản ghi trong product_topping liên quan đến sản phẩm
    $delete_topping_sql = "DELETE FROM product_topping WHERE product_id = $productId";
    if ($conn->query($delete_topping_sql) === TRUE) {
        // Xóa tất cả các đơn hàng liên quan đến sản phẩm
        $delete_order_sql = "DELETE FROM order_item WHERE product_id = $productId";
        if ($conn->query($delete_order_sql) === TRUE) {
            // Xóa tất cả các mục trong giỏ hàng liên quan đến sản phẩm
            $delete_cart_sql = "DELETE FROM cart_item WHERE product_id = $productId";
            if ($conn->query($delete_cart_sql) === TRUE) {
                // Tiếp tục xóa sản phẩm sau khi xóa các đơn hàng và mục giỏ hàng thành công
                $delete_product_sql = "DELETE FROM product WHERE id = $productId";
                if ($conn->query($delete_product_sql) === TRUE) {
                    // Nếu thành công, commit giao dịch
                    $conn->commit();
                    $deleteSuccess = true; // Đặt biến thành true khi xóa sản phẩm thành công
                } else {
                    // Nếu có lỗi khi xóa sản phẩm, rollback giao dịch và hiển thị thông báo lỗi cụ thể từ MySQL
                    $conn->rollback();
                    echo '<script>alert("Lỗi khi xóa sản phẩm: ' . $conn->error . '");</script>';
                }
            } else {
                // Nếu có lỗi khi xóa mục trong giỏ hàng, rollback giao dịch và hiển thị thông báo lỗi cụ thể từ MySQL
                $conn->rollback();
                echo '<script>alert("Lỗi khi xóa giỏ hàng: ' . $conn->error . '");</script>';
            }
        } else {
            // Nếu có lỗi khi xóa đơn hàng, rollback giao dịch và hiển thị thông báo lỗi cụ thể từ MySQL
            $conn->rollback();
            echo '<script>alert("Lỗi khi xóa đơn hàng: ' . $conn->error . '");</script>';
        }
    } else {
        // Nếu có lỗi khi xóa product_topping, rollback giao dịch và hiển thị thông báo lỗi cụ thể từ MySQL
        $conn->rollback();
        echo '<script>alert("Lỗi khi xóa product_topping: ' . $conn->error . '");</script>';
    }

    $conn->close();
}

// Kiểm tra xem xóa thành công thì hiển thị thông báo
if($deleteSuccess){
    echo '<script>alert("Xóa sản phẩm thành công!");</script>';
    $deleteSuccess = false; // Đặt lại biến thành false để tránh hiển thị liên tục
}
?>





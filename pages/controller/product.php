<!-- search product -->

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


<!-- delete product -->
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



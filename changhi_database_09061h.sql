-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 04:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `changhi_database`
--

-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `changhi_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `changhi_database`;

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '''default_avatar.jpg'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `email`, `password`, `role`, `avatar`) VALUES
(1, 'changhiadmin', 'changhiadmin@gmail.com', '@123Hello', 'admin', '\'default_avatar.jpg\''),
(2, 'team2test', 'team2test@gmail.com', '@123Hello', 'user', '\'default_avatar.jpg\'');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `account_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`cart_id`, `product_id`, `quantity`) VALUES
(1, 7, 2),
(1, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`) VALUES
(1, 'Chè hoa quả'),
(2, 'Chè bánh flan'),
(3, 'Chè pudding');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `time`) VALUES
(1, 'Cuối tuần rồi, hẹn hò chút thôi cùng Changhi', 'CUỐI TUẦN RỒI, HẸN HÒ CHÚT THÔI!\r\n\r\n🌿 Một tuần dài đã kết thúc, cũng đến lúc cho bản thân thư giãn sau những áp lực công việc, học tập. Chẳng cần đi đâu xa, ghé Chang Hi để thưởng thức những món chè ngọt ngào, đánh bay những muộn phiền mang trong mình.\r\n\r\n🌟 Menu chè ít ngọt đa dạng cho bạn lựa chọn được nấu hoàn toàn bằng đường thốt nốt, an toàn cho sức khỏe, rủ ngay đám bạn đến để hàn huyên chuyện đã qua và chọn cho mình một món chè ngon tại Chang Hi nhé!\r\n\r\n✨ Chè dừa nước\r\n✨ Chè Thái sầu riêng\r\n✨ Chè dừa dầm\r\n✨ Chè khúc bạch\r\n✨ Chè xoài uyên ương\r\n💕Chè ngon đã có, chỉ cần chờ bạn ghé Chang Hi thôi đó!\r\n—————————-', '2024-06-09 02:21:12'),
(2, 'Changhi đi muôn nơi khơi nguồn cảm xúc', 'CHANG HI ĐI MUÔN NƠI – KHƠI NGUỒN NHỮNG CẢM XÚC\r\n\r\n🥤 Để thưởng thức những chén chè hay những ly nước ngon Gu Đậm Vị tại Chang Hi thì không quá khó nữa, Chang Hi hiện tại với hơn 50 chi nhánh trên toàn quốc hứa hẹn sẽ mang đến cho bạn những trải nghiệm thú vị nhất.\r\n\r\n🌿 Chang Hi được khách hàng yêu thích bởi chè được nấu hoàn toàn bằng đường thốt nốt, một nguyên liệu hoàn hảo làm cho món chè trở nên ngọt ngào, thanh mát hơn. Cùng với đó là những loại nông sản Việt được Chang Hi lựa chọn kỹ càng, nguồn nguyên liệu tươi sẽ tạo ra những món ăn thơm ngon và chất lượng.\r\n🌤️ Mùa nắng nóng có ngay cho mình một loại thức uống, món chè yêu thích thì còn gì tuyệt vời hơn đúng không nè!', '2024-06-09 02:21:54'),
(3, 'Nhượng quyền thương hiệu chè Changhi', 'Changhi từ lâu đã là thương hiệu chè ngon có tiếng tại Việt Nam, bằng chứng là chúng tôi đã có hơn 30 cửa hàng trải dài từ Hà Nội đến TPHCM và để mở rộng và phát triển thương hiệu lên tầm cao mới chúng tôi có chính sách nhượng quyền thương hiệu chè Changhi với nhiều chính sách ưu đãi, đầu tư ít, hoàn vốn nhanh.\r\n\r\nNhượng quyền chè Changhi giá bao nhiêu?\r\n💥NHƯỢNG QUYỀN CHÈ CHANGHI CHỈ 150 TRIỆU – ĐẦU TƯ ÍT – HOÀN VỐN NHANH.\r\n\r\nGiữa cơn bão nhượng quyền các mô hình kinh doanh đang mọc ra như nấm, Changhi chọn cho mình một lối đi riêng để tồn tại và phát triển bền vững. Trải qua hơn 2 năm lựa chọn hướng xây dựng hệ thống kinh doanh Online để test thị trường, Changhi đã nhận được phản hồi rất tích cực của khách hàng với tốc độ tăng trường hơn 200%.\r\nMô hình kinh doanh của chè Changhi phát triển bền vững, không ngừng sáng tạo cho ra các món chè mới nên được nhiều khách hàng đón nhận. Các cơ sở, quán ché ngon tại Hà Nội, TPHCM và các tỉnh thành khác luôn thu hút nhiều khách hàng đến ăn và thưởng thức.\r\n\r\nMua nhượng quyền chè Changhi bạn sẽ được lợi gì?\r\n✅Chi phí đầu tư thấp – HOÀN VỐN CỰC NHANH so với các mô hình dịch vụ khác ( dự kiến tối đa 3-6 tháng hoàn vốn).\r\n✅Sản phẩm không những bán offline tại chỗ rất tốt mà bán online hay chạy quảng cáo bán cũng đạt tương tác cao, khách hàng trung thành nhiều, độ tuổi khách hàng rộng, sản phẩm có tốc độ quay vòng lớn.\r\n✅Menu chè thơm ngon, sáng tạo, hương vị khác biệt hoàn toàn so với những món chè truyền thống, được đông đảo khách hàng nhiều lứa tuổi yêu thích. Hầu hết tất cả các khách hàng đều quay lại sau lần đầu tiên thưởng thức.\r\n✅Chuyển giao thêm bộ menu chè + đồ uống mới CHỈ DÀNH RIÊNG CHO CỬA HÀNG NHƯỢNG QUYỀN – đặc biệt CHƯA TỪNG XUẤT HIỆN trong menu Changhi đã từng bán ra thị trường.\r\n✅Mô hình tinh gọn, vận hành dễ dàng, tối ưu chi phí, dễ quản lý, tỉ suất lợi nhuận tốt.\r\n✅Được cung cấp nguyên vật liệu với giá ưu đãi nhất, đảm bảo chất lượng tuyệt đối ( CÓ CAM KẾT BẢO HÀNH SẢN PHẨM)\r\n✅Hỗ trợ hình ảnh sản phẩm, marketing chuyên nghiệp. ĐẶC BIỆT là thương hiệu\r\nđầu tiên ĐÀO TẠO QUY TRÌNH CHẠY FACEBOOK ADS để khách hàng có thể tự tối ưu chi phí vận hành.\r\n✅Hỗ trợ đào tạo quy trình bán hàng, tư vấn setup cửa hàng MIỄN PHÍ.\r\n\r\nMua nhượng quyền chè Changhi ở đâu?\r\nChanghi nhận được rất nhiều cuộc gọi và tư vấn riêng về nhượng quyền thương hiệu chè, đó là sự thật và chúng tôi luôn tự hào khi đang phát triển đúng với tiềm năng to lớn mà thị trường mang lại.', '2024-06-09 02:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `address` text NOT NULL,
  `phoneNumber` varchar(14) NOT NULL,
  `account_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address`, `phoneNumber`, `account_id`) VALUES
(1, 'Tam Thuấn - Phúc Thọ - Hà Nội', '0862269885', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `orders_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`orders_id`, `product_id`, `quantity`) VALUES
(1, 3, 2),
(1, 43, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `description` text NOT NULL,
  `size` enum('M','L') NOT NULL,
  `category_id` int(10) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `size`, `category_id`, `image`) VALUES
(3, 'Chè dừa dầm', 20000, 'TUY MÀU EM TRẮNG NHƯNG TẤM LÒNG EM NGỌT NGÀO SÂU LẮNG🥰\r\n\r\n⭐️Một màu trắng không hề nhàm chán từ tạo hình đến hương vị chính là 𝒄𝒉𝒆̀ 𝒅𝒖̛̀𝒂 𝒅𝒂̆̀𝒎 này đây các bác ạ. Nhìn bên ngoài tuy đơn sắc một màu trắng tinh nhưng ẩn sâu bên trong là hương vị tươi mát, thơm béo mà không chè nào có thể nhầm lẫn được.\r\n\r\n🥥Chè được làm từ nguyên liệu chính là dừa tươi nên thơm lừng hương dừa đặc biệt, gồm có dừa mon, thạch cũ năng, thạch dừa xiêm, thạch sữa dừa hòa quyện cùng nước chan nấu từ nước dừa tươi và đường thốt nốt.\r\n\r\n😍Nhìn vậy chứ không phải vậy chính là đây, trông không ngon nhưng ngon không tưởng, đặc biệt nếu bạn là tín đồ của dừa thì thử ngay đi nhá!', 'M', 1, '\"./assets/images/Products/che-dua-dam-520x330.jpeg\"'),
(4, 'Chè dừa dầm', 25000, 'TUY MÀU EM TRẮNG NHƯNG TẤM LÒNG EM NGỌT NGÀO SÂU LẮNG🥰\r\n\r\n⭐️Một màu trắng không hề nhàm chán từ tạo hình đến hương vị chính là 𝒄𝒉𝒆̀ 𝒅𝒖̛̀𝒂 𝒅𝒂̆̀𝒎 này đây các bác ạ. Nhìn bên ngoài tuy đơn sắc một màu trắng tinh nhưng ẩn sâu bên trong là hương vị tươi mát, thơm béo mà không chè nào có thể nhầm lẫn được.\r\n\r\n🥥Chè được làm từ nguyên liệu chính là dừa tươi nên thơm lừng hương dừa đặc biệt, gồm có dừa mon, thạch cũ năng, thạch dừa xiêm, thạch sữa dừa hòa quyện cùng nước chan nấu từ nước dừa tươi và đường thốt nốt.\r\n\r\n😍Nhìn vậy chứ không phải vậy chính là đây, trông không ngon nhưng ngon không tưởng, đặc biệt nếu bạn là tín đồ của dừa thì thử ngay đi nhá!', 'L', 1, '\"./assets/images/Products/che-dua-dam-520x330.jpeg\"'),
(5, 'Chè Thái sầu riêng', 20000, 'Cho em order một 𝐜𝐡𝐞̀ 𝐓𝐡𝐚́𝐢 𝐬𝐚̂̀𝐮 𝐫𝐢𝐞̂𝐧𝐠 mình anh thôi!\r\n\r\n💌Gửi người yêu tương lai: Em là một người rất sợ béo nhưng lại rất thích đồ ngọt, chè Chang Hi là sự lựa chọn tuyệt vời cho em, anh có hiểu ý em không?\r\n👉Tag ngay @nguoiyeu vào và cùng nhau thưởng thức chè thôi nào, chè với hương vị siêu đặc trưng của sầu riêng, béo béo ngọt ngọt.\r\n👉Hãy cùng điểm qua các topping 𝐜𝐡𝐞̀ 𝐓𝐡𝐚́𝐢 𝐬𝐚̂̀𝐮 𝐫𝐢𝐞̂𝐧𝐠 nha: sầu riêng tươi, nhãn, mít, thạch chocolate, thạch lá nếp, thạch sữa dừa, thạch giòn hòa quyện cùng nước chan huyền thoại nấu từ 100% đường thốt nốt. Chè ngọt vừa phải nên không bị gắt và ít béo cho chị em nha, nếu mà anh em thích thì vẫn bon chen được nhen!\r\n🤩Hôm nay chiều mát thảnh thơi, thôi thì mình rủ người yêu đi chơi. Bạn thấy đây có phải là ý kiến tuyệt vời không?', 'M', 1, '\"./assets/images/Products/che-thai-sau-rieng-520x330.jpg\"'),
(6, 'Chè Thái sầu riêng', 25000, 'Cho em order một 𝐜𝐡𝐞̀ 𝐓𝐡𝐚́𝐢 𝐬𝐚̂̀𝐮 𝐫𝐢𝐞̂𝐧𝐠 mình anh thôi!\r\n\r\n💌Gửi người yêu tương lai: Em là một người rất sợ béo nhưng lại rất thích đồ ngọt, chè Chang Hi là sự lựa chọn tuyệt vời cho em, anh có hiểu ý em không?\r\n👉Tag ngay @nguoiyeu vào và cùng nhau thưởng thức chè thôi nào, chè với hương vị siêu đặc trưng của sầu riêng, béo béo ngọt ngọt.\r\n👉Hãy cùng điểm qua các topping 𝐜𝐡𝐞̀ 𝐓𝐡𝐚́𝐢 𝐬𝐚̂̀𝐮 𝐫𝐢𝐞̂𝐧𝐠 nha: sầu riêng tươi, nhãn, mít, thạch chocolate, thạch lá nếp, thạch sữa dừa, thạch giòn hòa quyện cùng nước chan huyền thoại nấu từ 100% đường thốt nốt. Chè ngọt vừa phải nên không bị gắt và ít béo cho chị em nha, nếu mà anh em thích thì vẫn bon chen được nhen!\r\n🤩Hôm nay chiều mát thảnh thơi, thôi thì mình rủ người yêu đi chơi. Bạn thấy đây có phải là ý kiến tuyệt vời không?', 'L', 1, '\"./assets/images/Products/che-thai-sau-rieng-520x330.jpg\"'),
(7, 'Chè bánh flan sương sáo', 20000, 'Chè bánh flan sương sáo\r\nCho buổi chiều công ty hoạt náo 🥳\r\n\r\n🤩Chiều buồn miệng mạnh dạng rủ hội bạn đồng nghiệp order chè Chang Hi cho rộn ràng ngày làm việc vui vẻ nào!\r\n\r\n👉Order ngay chén 𝐜𝐡𝐞̀ 𝐛𝐚́𝐧𝐡 𝐟𝐥𝐚𝐧 𝐬𝐮̛𝐨̛𝐧𝐠 𝐬𝐚́𝐨 với chiếc bánh flan bóng bẩy nổi bật vị béo ngọt thơm lừng, muỗng đầu tiên đã “say wow” bởi vị ngọt thanh hòa quyện cùng topping sương sáo, trân châu, thạch cafe cùng nước chan từ 100% đường thốt nốt, cafe và chút giòn giòn từ dừa sấy.\r\n\r\n🥳Chỉ có vị ngon của chè mới có thể giải cứu trái tym nóng hổi này khỏi thời tiết nóng nực của mùa hè. Đừng quên mách các chị em order chung nhen, Chang Hi ship ngay kịp chiều nay cho các bạn nhé!', 'M', 2, '\"./assets/images/Products/che-banh-flan-suong-sao-520x330.jpeg\"'),
(8, 'Chè bánh flan sương sáo', 25000, 'Chè bánh flan sương sáo\r\nCho buổi chiều công ty hoạt náo 🥳\r\n\r\n🤩Chiều buồn miệng mạnh dạng rủ hội bạn đồng nghiệp order chè Chang Hi cho rộn ràng ngày làm việc vui vẻ nào!\r\n\r\n👉Order ngay chén 𝐜𝐡𝐞̀ 𝐛𝐚́𝐧𝐡 𝐟𝐥𝐚𝐧 𝐬𝐮̛𝐨̛𝐧𝐠 𝐬𝐚́𝐨 với chiếc bánh flan bóng bẩy nổi bật vị béo ngọt thơm lừng, muỗng đầu tiên đã “say wow” bởi vị ngọt thanh hòa quyện cùng topping sương sáo, trân châu, thạch cafe cùng nước chan từ 100% đường thốt nốt, cafe và chút giòn giòn từ dừa sấy.\r\n\r\n🥳Chỉ có vị ngon của chè mới có thể giải cứu trái tym nóng hổi này khỏi thời tiết nóng nực của mùa hè. Đừng quên mách các chị em order chung nhen, Chang Hi ship ngay kịp chiều nay cho các bạn nhé!', 'L', 2, '\"./assets/images/Products/che-banh-flan-suong-sao-520x330.jpeg\"'),
(9, 'Chè khoai dẻo Đài Loan', 20000, '🍠𝐂𝐡𝐞̀ 𝐤𝐡𝐨𝐚𝐢 𝐝𝐞̉𝐨 Đ𝐚̀𝐢 𝐋𝐨𝐚𝐧 thơm ngon mời bạn ăn nha\r\nTôi đây không chờ bạn nữa, giờ tui ăn liền💘\r\n\r\n😍Hạnh phúc đơn giản chỉ là tận hưởng cuộc sống bên những người thân yêu, thưởng thức chén thơm ngon, quay quần bên nhau nói chuyện rôm rả và nhìn ngắm con phố đã lên đèn xe xe cộ cộ.\r\n👉Một loại chè thơm ngon dẻo ngọt đặc biệt với hơi hướng Đài Loan cực ngon các bạn đã ăn thử chưa? Chang Hi mời bạn thử ngay chè 𝐂𝐡𝐞̀ 𝐤𝐡𝐨𝐚𝐢 𝐝𝐞̉𝐨 Đ𝐚̀𝐢 𝐋𝐨𝐚𝐧 với Topping đầy màu sắc và không kém phần hấp dẫn như: khoai dẻo các vị (vàng, tím, matcha, vừng đen), thạch cafe, sương sáo, trân châu dẻo hòa quyện cùng nước cốt chan thảo mộc. Hương vị cuốn theo từng giai điệu luôn🎼', 'M', 1, '\"./assets/images/Products/che-khoai-deo-dai-loan-520x330.jpg\"'),
(10, 'Chè khoai dẻo Đài Loan', 25000, '🍠𝐂𝐡𝐞̀ 𝐤𝐡𝐨𝐚𝐢 𝐝𝐞̉𝐨 Đ𝐚̀𝐢 𝐋𝐨𝐚𝐧 thơm ngon mời bạn ăn nha\r\nTôi đây không chờ bạn nữa, giờ tui ăn liền💘\r\n\r\n😍Hạnh phúc đơn giản chỉ là tận hưởng cuộc sống bên những người thân yêu, thưởng thức chén thơm ngon, quay quần bên nhau nói chuyện rôm rả và nhìn ngắm con phố đã lên đèn xe xe cộ cộ.\r\n👉Một loại chè thơm ngon dẻo ngọt đặc biệt với hơi hướng Đài Loan cực ngon các bạn đã ăn thử chưa? Chang Hi mời bạn thử ngay chè 𝐂𝐡𝐞̀ 𝐤𝐡𝐨𝐚𝐢 𝐝𝐞̉𝐨 Đ𝐚̀𝐢 𝐋𝐨𝐚𝐧 với Topping đầy màu sắc và không kém phần hấp dẫn như: khoai dẻo các vị (vàng, tím, matcha, vừng đen), thạch cafe, sương sáo, trân châu dẻo hòa quyện cùng nước cốt chan thảo mộc. Hương vị cuốn theo từng giai điệu luôn🎼', 'L', 1, '\"./assets/images/Products/che-khoai-deo-dai-loan-520x330.jpg\"'),
(11, 'Chè khúc bạch Changhi', 20000, 'Làm gì thì làm,\r\nChiều tối ghé Chang Hi ăn chè cái đã🥳\r\n\r\n🤩Lại la lại la, cùng thưởng thức 𝐜𝐡𝐞̀ 𝐤𝐡𝐮́𝐜 𝐛𝐚̣𝐜𝐡 𝐂𝐡𝐚𝐧𝐠 𝐇𝐢 nha! Món chè truyền thống đã quá thân quen với mọi nhà nhưng lại không bao giờ hết hot và được nhiều khách yêu lựa chọn.\r\n🌟Vị chè mát ngọt, beo béo của khúc bạch kem sữa, khúc bạch trà xanh, hạnh nhân, nhãn cùng nước đường lá dứa thơm lừng. Ăn cứ bị ghiền làm sao.\r\n👋Ở đây có ai mê ăn chè khúc bạch không, cho xin cánh tay các bạn nào.', 'M', 1, '\"./assets/images/Products/\"./assets/images/Products/che-khoai-deo-dai-loan-520x330.jpg\"\"'),
(12, 'Chè khúc bạch Changhi', 25000, 'Làm gì thì làm,\r\nChiều tối ghé Chang Hi ăn chè cái đã🥳\r\n\r\n🤩Lại la lại la, cùng thưởng thức 𝐜𝐡𝐞̀ 𝐤𝐡𝐮́𝐜 𝐛𝐚̣𝐜𝐡 𝐂𝐡𝐚𝐧𝐠 𝐇𝐢 nha! Món chè truyền thống đã quá thân quen với mọi nhà nhưng lại không bao giờ hết hot và được nhiều khách yêu lựa chọn.\r\n🌟Vị chè mát ngọt, beo béo của khúc bạch kem sữa, khúc bạch trà xanh, hạnh nhân, nhãn cùng nước đường lá dứa thơm lừng. Ăn cứ bị ghiền làm sao.\r\n👋Ở đây có ai mê ăn chè khúc bạch không, cho xin cánh tay các bạn nào.', 'L', 1, '\"./assets/images/Products/che-khuc-bach-changhi-520x330.jpg\"'),
(13, 'Chè Mochi khoai tím Singapore', 25000, 'Một chén chè hạnh phúc\r\nMột Chang Hi ngọt ngào🤩\r\n\r\n👉Nếu bạn muốn ngọt ngào, bạn muốn hạnh phúc trong ngọt ngào ấy thì hãy đến đây với Chang Hi nhé!\r\n⚡Làm sao cưỡng lại được chén 𝐜𝐡𝐞̀ 𝐦𝐨𝐜𝐡𝐢 𝐤𝐡𝐨𝐚𝐢 𝐭𝐢́𝐦 𝐒𝐢𝐧𝐠𝐚𝐩𝐨𝐫𝐞 ngọt mát, thanh dịu với màu sắc đậm chất thơ. Chè nổi bật với Pudding khoai tím vừa ngon vừa lạ miệng, khoai tím dẻo, sương sáo, trân châu, thạch sữa dừa, bột báng cùng nước chan thảo mộc. Đặc biệt, nước chan được nấu từ 100% đường thốt nốt giúp vị chè ngọt thanh không bị gắt và an toàn cho sức khỏe.\r\n😻Hạnh phúc đơn giản chỉ là yêu, yêu đơn giản là Chang Hi.', 'M', 1, '\"./assets/images/Products/che-mochi-khoai-tim-singapore-520x330.jpg\"'),
(14, 'Chè Mochi khoai tím Singapore', 30000, 'Một chén chè hạnh phúc\r\nMột Chang Hi ngọt ngào🤩\r\n\r\n👉Nếu bạn muốn ngọt ngào, bạn muốn hạnh phúc trong ngọt ngào ấy thì hãy đến đây với Chang Hi nhé!\r\n⚡Làm sao cưỡng lại được chén 𝐜𝐡𝐞̀ 𝐦𝐨𝐜𝐡𝐢 𝐤𝐡𝐨𝐚𝐢 𝐭𝐢́𝐦 𝐒𝐢𝐧𝐠𝐚𝐩𝐨𝐫𝐞 ngọt mát, thanh dịu với màu sắc đậm chất thơ. Chè nổi bật với Pudding khoai tím vừa ngon vừa lạ miệng, khoai tím dẻo, sương sáo, trân châu, thạch sữa dừa, bột báng cùng nước chan thảo mộc. Đặc biệt, nước chan được nấu từ 100% đường thốt nốt giúp vị chè ngọt thanh không bị gắt và an toàn cho sức khỏe.\r\n😻Hạnh phúc đơn giản chỉ là yêu, yêu đơn giản là Chang Hi.', 'L', 1, '\"./assets/images/Products/che-mochi-khoai-tim-singapore-520x330.jpg\"'),
(15, 'Chè sương sa hạt lựu bánh flan', 25000, '🤘Một chút Chang Hi cho cuối tuần tràn đầy năng lượng!🤘\r\nNếu là một “tín đồ” đồ ngọt thì chẳng thể cưỡng lại được vị 𝐜𝐡𝐞̀ 𝐬𝐮̛𝐨̛𝐧𝐠 𝐬𝐚 𝐡𝐚̣𝐭 𝐥𝐮̛̣𝐮 𝐛𝐚́𝐧𝐡 𝐅𝐥𝐚𝐧 “mê đứ đừ” với màu sắc cầu vòng óng ánh của sương sa và bánh Flan thơm béo👍\r\n️🥇Được mệnh danh “em cưng” nhà Chang Hi vì lượt yêu thích đứng Top 1, chè với hơn 5 Topping: sương sa 3 vị, bánh flan, mít, thạch lá nếp, dậu xanh đánh, bột báng hòa quyện cùng nước chan cốt dừa tươi. Nghe thôi đã thèm “chảy nước miếng, chảy nước miếng” rồi😋\r\n🌺Món ngon chỉ thử một lần, thế nhưng thử một lần là yêu mãi luôn đấy! Các bạn đã thử chưa?', 'M', 2, '\"./assets/images/Products/che-suong-sa-hat-luu-banh-flan-520x330.jpg\"'),
(16, 'Chè sương sa hạt lựu bánh flan', 30000, '🤘Một chút Chang Hi cho cuối tuần tràn đầy năng lượng!🤘\r\nNếu là một “tín đồ” đồ ngọt thì chẳng thể cưỡng lại được vị 𝐜𝐡𝐞̀ 𝐬𝐮̛𝐨̛𝐧𝐠 𝐬𝐚 𝐡𝐚̣𝐭 𝐥𝐮̛̣𝐮 𝐛𝐚́𝐧𝐡 𝐅𝐥𝐚𝐧 “mê đứ đừ” với màu sắc cầu vòng óng ánh của sương sa và bánh Flan thơm béo👍\r\n️🥇Được mệnh danh “em cưng” nhà Chang Hi vì lượt yêu thích đứng Top 1, chè với hơn 5 Topping: sương sa 3 vị, bánh flan, mít, thạch lá nếp, dậu xanh đánh, bột báng hòa quyện cùng nước chan cốt dừa tươi. Nghe thôi đã thèm “chảy nước miếng, chảy nước miếng” rồi😋\r\n🌺Món ngon chỉ thử một lần, thế nhưng thử một lần là yêu mãi luôn đấy! Các bạn đã thử chưa?', '', 2, '\"./assets/images/Products/che-suong-sa-hat-luu-banh-flan-520x330.jpg\"'),
(17, 'Chè khoai dẻo phô mai lạnh đặc biệt', 20000, '👉Chang Hi gợi ý cho các tín đồ thèm ngọt 𝗰𝗵𝗲̀ 𝗸𝗵𝗼𝗮𝗶 𝗱𝗲̉𝗼 𝗽𝗵𝗼̂ 𝗺𝗮𝗶 𝗹𝗮̣𝗻𝗵 đ𝗮̣̆𝗰 𝗯𝗶𝗲̣̂𝘁 với em thạch phomai to “bạ chà bứ”. Tuyệt vời làm sao khi sắn một miếng thạch phô mai mềm dẻo, béo béo trong miệng. Các topping khoai dẻo hòa quyện cùng nước chan thảo mộc. Nhìn vậy chứ thoáng chút đã hết chén đấy nhé!\r\n\r\n🌼Hạnh phúc nào bằng được ăn ngon, hạnh phúc nào bằng được sum vầy với gia đình. Cùng cả nhà order chè ngon sáng tạo Chang Hi thôi nào🌼', 'M', 1, '\"./assets/images/Products/che-khoai-deo-pho-mai-lanh-dac-biet-520x330.jpg\"'),
(18, 'Chè khoai dẻo phô mai lạnh đặc biệt', 25000, '👉Chang Hi gợi ý cho các tín đồ thèm ngọt 𝗰𝗵𝗲̀ 𝗸𝗵𝗼𝗮𝗶 𝗱𝗲̉𝗼 𝗽𝗵𝗼̂ 𝗺𝗮𝗶 𝗹𝗮̣𝗻𝗵 đ𝗮̣̆𝗰 𝗯𝗶𝗲̣̂𝘁 với em thạch phomai to “bạ chà bứ”. Tuyệt vời làm sao khi sắn một miếng thạch phô mai mềm dẻo, béo béo trong miệng. Các topping khoai dẻo hòa quyện cùng nước chan thảo mộc. Nhìn vậy chứ thoáng chút đã hết chén đấy nhé!\r\n\r\n🌼Hạnh phúc nào bằng được ăn ngon, hạnh phúc nào bằng được sum vầy với gia đình. Cùng cả nhà order chè ngon sáng tạo Chang Hi thôi nào🌼', 'L', 1, '\"./assets/images/Products/che-khoai-deo-pho-mai-lanh-dac-biet-520x330.jpg\"'),
(19, 'Chè xoài Hongkong', 25000, 'RA NGOÀI CHỈ ĐỂ RONG CHƠI\r\nĐI NGANG HI QUÁN U MÊ CẢ ĐỜI!\r\n\r\n🌅Hôm nay trời xanh mây trắng, lượn lòng vòng lướt thấy Chang Hi. Mà thấy Chang Hi thì phải ghé ăn chè thôi🤤\r\n👉Em chè Xoài HongKong với màu đặc trưng vàng óng và vị chua ngọt kích thích vị giác sẽ không làm các bạn thất vọng^^\r\nCho Chang Hi xin cánh tay của các bạn mê xoài nào👋', 'M', 1, '\"./assets/images/Products/che-xoai-hong-kong-520x330.jpg\"'),
(20, 'Chè xoài Hongkong', 30000, 'RA NGOÀI CHỈ ĐỂ RONG CHƠI\r\nĐI NGANG HI QUÁN U MÊ CẢ ĐỜI!\r\n\r\n🌅Hôm nay trời xanh mây trắng, lượn lòng vòng lướt thấy Chang Hi. Mà thấy Chang Hi thì phải ghé ăn chè thôi🤤\r\n👉Em chè Xoài HongKong với màu đặc trưng vàng óng và vị chua ngọt kích thích vị giác sẽ không làm các bạn thất vọng^^\r\nCho Chang Hi xin cánh tay của các bạn mê xoài nào👋', 'L', 1, '\"./assets/images/Products/che-xoai-hong-kong-520x330.jpg\"'),
(21, 'Chè hạt đác dứa mật', 25000, 'Ai là tín đồ mê hạt đác giơ tay? Mùa hè năm nay Chang Hi sẽ ưu ái team thích hạt đác nhé ạ. Chúng mình đem đến cho bạn một món chè đỉnh cao CHƯA TỪNG XUẤT HIỆN TRÊN THỊ TRƯỜNG.\r\n\r\nHạt đác là loại thực phẩm mà người Việt Nam mình cực kỳ yêu thích. Đác xuất hiện trong hầu hết các loại chè đình đám nhất, hoặc chỉ đơn giản là đác rim cùng các loại trái cây dùng ăn kèm sữa chua cũng siêu ngon.\r\n\r\nXuất phát từ niềm yêu thích vô bờ bến với hạt đác mà Chang Hi sáng tạo ra món chè hứa hẹn sẽ không làm bạn thất vọng đó chính là chè hạt đác dứa mật.', 'M', 1, '\"./assets/images/Products/che-hat-dac-dua-mat-520x330.jpg\"'),
(22, 'Chè hạt đác dứa mật', 30000, 'Ai là tín đồ mê hạt đác giơ tay? Mùa hè năm nay Chang Hi sẽ ưu ái team thích hạt đác nhé ạ. Chúng mình đem đến cho bạn một món chè đỉnh cao CHƯA TỪNG XUẤT HIỆN TRÊN THỊ TRƯỜNG.\r\n\r\nHạt đác là loại thực phẩm mà người Việt Nam mình cực kỳ yêu thích. Đác xuất hiện trong hầu hết các loại chè đình đám nhất, hoặc chỉ đơn giản là đác rim cùng các loại trái cây dùng ăn kèm sữa chua cũng siêu ngon.\r\n\r\nXuất phát từ niềm yêu thích vô bờ bến với hạt đác mà Chang Hi sáng tạo ra món chè hứa hẹn sẽ không làm bạn thất vọng đó chính là chè hạt đác dứa mật.', 'L', 1, '\"./assets/images/Products/che-hat-dac-dua-mat-520x330.jpg\"'),
(23, 'Chè hạt đác mãng cầu', 25000, 'Changhi vừa ra mắt món chè hạt đác mãng cầu thơm ngon, hương vị 100% cam kết từ nguyên liệu tự nhiên không có chất tạo mùi.\r\n\r\nHạt đác là loại thực phẩm mà người Việt Nam mình cực kỳ yêu thích. Đác xuất hiện trong hầu hết các loại chè đình đám nhất, hoặc chỉ đơn giản là đác rim cùng các loại trái cây dùng ăn kèm sữa chua cũng siêu ngon.\r\n\r\nXuất phát từ niềm yêu thích vô bờ bến với hạt đác mà Chang Hi sáng tạo ra món chè hứa hẹn sẽ không làm bạn thất vọng.', 'M', 1, '\"./assets/images/Products/che-hat-dac-mang-cau-520x330.jpg\"'),
(24, 'Chè hạt đác mãng cầu', 30000, 'Changhi vừa ra mắt món chè hạt đác mãng cầu thơm ngon, hương vị 100% cam kết từ nguyên liệu tự nhiên không có chất tạo mùi.\r\n\r\nHạt đác là loại thực phẩm mà người Việt Nam mình cực kỳ yêu thích. Đác xuất hiện trong hầu hết các loại chè đình đám nhất, hoặc chỉ đơn giản là đác rim cùng các loại trái cây dùng ăn kèm sữa chua cũng siêu ngon.\r\n\r\nXuất phát từ niềm yêu thích vô bờ bến với hạt đác mà Chang Hi sáng tạo ra món chè hứa hẹn sẽ không làm bạn thất vọng.', 'L', 1, '\"./assets/images/Products/che-hat-dac-mang-cau-520x330.jpg\"'),
(25, 'Chè dừa non lá nếp', 20000, '💥𝐂𝐇𝐄̀ 𝐃𝐔̛̀𝐀 𝐍𝐎𝐍 𝐋𝐀́ 𝐍𝐄̂́𝐏💥\r\n\r\nMột trong những món chè best seller của nhà Chang Hi đó chính là DỪA NON LÁ NẾP. Tất cả các nguyên liệu tạo nên món chè này đều được làm từ trái dừa xiêm Bến Tre. Nước cốt thanh mát, béo ngậy, không ngọt khé, cảm nhận được hương vị nước dừa xiêm tự nhiên giải khát vô cùng.', 'M', 1, '\"./assets/images/Products/che-dua-non-la-nep-520x330.jpeg\"'),
(26, 'Chè dừa non lá nếp', 25000, '💥𝐂𝐇𝐄̀ 𝐃𝐔̛̀𝐀 𝐍𝐎𝐍 𝐋𝐀́ 𝐍𝐄̂́𝐏💥\r\n\r\nMột trong những món chè best seller của nhà Chang Hi đó chính là DỪA NON LÁ NẾP. Tất cả các nguyên liệu tạo nên món chè này đều được làm từ trái dừa xiêm Bến Tre. Nước cốt thanh mát, béo ngậy, không ngọt khé, cảm nhận được hương vị nước dừa xiêm tự nhiên giải khát vô cùng.', 'L', 1, '\"./assets/images/Products/che-dua-non-la-nep-520x330.jpeg\"'),
(27, 'Chè dừa non khoai dẻo', 20000, '🔥Vừa dai dẻo, vừa mềm ngọt, cắn một miếng lại muốn cắn thêm miếng nữa thì bảo sao danh sách yêu thích luôn có mặt em topping này 😍\r\n🔥Cùng Chang Hi thưởng thức món ngon ngay nào!', 'M', 1, '\"./assets/images/Products/che-dua-non-khoai-deo-520x330.jpeg\"'),
(28, 'Chè dừa non khoai dẻo', 25000, '🔥Vừa dai dẻo, vừa mềm ngọt, cắn một miếng lại muốn cắn thêm miếng nữa thì bảo sao danh sách yêu thích luôn có mặt em topping này 😍\r\n🔥Cùng Chang Hi thưởng thức món ngon ngay nào!', 'L', 1, '\"./assets/images/Products/che-dua-non-khoai-deo-520x330.jpeg\"'),
(29, 'Tàu hũ trân châu đường đen', 20000, '✅Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\n✅Khách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\n🔥Mọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'M', 3, '\"./assets/images/Products/tau-hu-chan-trau-duong-den-1-520x330.jpg\"'),
(30, 'Tàu hũ trân châu đường đen', 25000, '✅Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\n✅Khách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\n🔥Mọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'L', 3, '\"./assets/images/Products/tau-hu-chan-trau-duong-den-1-520x330.jpg\"'),
(31, 'Chè dừa nước', 20000, 'CỐ TÌNH TRỒNG HOA, HOA KHÔNG NỞ\r\nVÔ TÌNH ĂN CHÈ, PHÁT HIỆN CHANG HI CÓ CHÈ MỚI !!\r\n\r\n❤️Chang Hi xin giới thiệu đến cho các bạn một món chè mới siêu hấp dẫn đó là 𝐂𝐇𝐄̀ 𝐃𝐔̛̀𝐀 𝐍𝐔̛𝐎̛́𝐂🌴\r\n✨Dừa nước khi ăn sẽ mang lại cảm giác ngọt thanh, thơm ngon, sật sật tăng kích thích vị giác và vui miệng.\r\n✨Kết hợp “ăn ý” cùng với các loại topping như: hạt đác, mít nghệ Tiền Giang, thạch lá nếp, thạch thốt nốt, thạch sữa dừa nấu từ 100% đường thốt nốt tạo nên hương vị độc đáo, khác biệt và đặc sắc hơn.\r\n✨Ngoài kết hợp với chè siêu ngon, dừa nước còn giúp ngăn ngừa quá trình hình thành các cholesterol xấu, giảm nguy cơ mắc các chứng tắc nghẽn động mạch và bệnh huyết áp.', 'M', 1, '\"./assets/images/Products/che-dua-nuoc-520x330.jpg\"'),
(32, 'Chè dừa nước', 25000, 'CỐ TÌNH TRỒNG HOA, HOA KHÔNG NỞ\r\nVÔ TÌNH ĂN CHÈ, PHÁT HIỆN CHANG HI CÓ CHÈ MỚI !!\r\n\r\n❤️Chang Hi xin giới thiệu đến cho các bạn một món chè mới siêu hấp dẫn đó là 𝐂𝐇𝐄̀ 𝐃𝐔̛̀𝐀 𝐍𝐔̛𝐎̛́𝐂🌴\r\n✨Dừa nước khi ăn sẽ mang lại cảm giác ngọt thanh, thơm ngon, sật sật tăng kích thích vị giác và vui miệng.\r\n✨Kết hợp “ăn ý” cùng với các loại topping như: hạt đác, mít nghệ Tiền Giang, thạch lá nếp, thạch thốt nốt, thạch sữa dừa nấu từ 100% đường thốt nốt tạo nên hương vị độc đáo, khác biệt và đặc sắc hơn.\r\n✨Ngoài kết hợp với chè siêu ngon, dừa nước còn giúp ngăn ngừa quá trình hình thành các cholesterol xấu, giảm nguy cơ mắc các chứng tắc nghẽn động mạch và bệnh huyết áp.', 'L', 1, '\"./assets/images/Products/che-dua-nuoc-520x330.jpg\"'),
(33, 'Chè sắn mochi dừa dẻo', 25000, '✨CHANGHI CHÍNH THỨC MỞ BÁN CHÈ SẮN MOCHI DỪA DẺO\r\n\r\n❄Để xoa dịu cái lạnh lẽo của mùa đông miền Bắc và miền Trung, nhà ChangHi mở bán món chè nóng đã gây sốt cộng đồng mạng suốt 02 năm qua. Chang Hi chính là nơi đầu tiên khai sinh ra món Chè sắn mochi đó các tình yêu.\r\n\r\n👉Nếu Chè sắn truyền thống bị một nhược điểm là khi ăn vào dễ ngáy thì 𝑪𝒉𝒆̀ 𝒔𝒂̆́𝒏 𝑴𝒐𝒄𝒉𝒊 𝒅𝒖̛̀𝒂 𝒅𝒆̉𝒐 được làm theo công thức mới mẻ “ngoài dẻo trong giòn” chắc chắn sẽ khiến bạn phải bất ngờ trước hương vị này.\r\n👉Chè sắn Mochi sẽ được mix cùng cùi bưởi giòn sần sật, dừa non sên dẻo và lớp nước cốt dừa beo béo. Vẫn theo cách nấu chè quen thuộc của Chang Hi là dùng đường thốt nốt An Giang để tạo độ ngọt tự nhiên chứ không ngọt gắt.', 'M', 1, '\"./assets/images/Products/che-san-mochi-dua-deo-520x330.jpg\"'),
(34, 'Chè sắn mochi dừa dẻo', 30000, '✨CHANGHI CHÍNH THỨC MỞ BÁN CHÈ SẮN MOCHI DỪA DẺO\r\n\r\n❄Để xoa dịu cái lạnh lẽo của mùa đông miền Bắc và miền Trung, nhà ChangHi mở bán món chè nóng đã gây sốt cộng đồng mạng suốt 02 năm qua. Chang Hi chính là nơi đầu tiên khai sinh ra món Chè sắn mochi đó các tình yêu.\r\n\r\n👉Nếu Chè sắn truyền thống bị một nhược điểm là khi ăn vào dễ ngáy thì 𝑪𝒉𝒆̀ 𝒔𝒂̆́𝒏 𝑴𝒐𝒄𝒉𝒊 𝒅𝒖̛̀𝒂 𝒅𝒆̉𝒐 được làm theo công thức mới mẻ “ngoài dẻo trong giòn” chắc chắn sẽ khiến bạn phải bất ngờ trước hương vị này.\r\n👉Chè sắn Mochi sẽ được mix cùng cùi bưởi giòn sần sật, dừa non sên dẻo và lớp nước cốt dừa beo béo. Vẫn theo cách nấu chè quen thuộc của Chang Hi là dùng đường thốt nốt An Giang để tạo độ ngọt tự nhiên chứ không ngọt gắt.', 'L', 1, '\"./assets/images/Products/che-san-mochi-dua-deo-520x330.jpg\"'),
(35, 'Chè pudding lá nếp', 25000, 'Đã không ra món thì thôi chứ ra là làm liền một mạch…. MƯỜI MẤY MÓN MỚI … \r\nĐể vận hành mười mấy món mới, cộng với hơn 20 món cũ cho các tiệm trên khắp Việt Nam đòi hỏi Chang Hi phải xử lý tốt khâu sản xuất tại gốc mới có thể triển khai được. Menu mới mất 6 tháng nghiên cứu, liệu menu mới có ra gì? Cùng Chang Hi thưởng thức Chè pudding lá nếp nhé!!!', 'M', 3, '\"./assets/images/Products/che-pudding-la-nep-chan-trau-thach-520x330.jpg\"'),
(36, 'Chè pudding lá nếp', 30000, 'Đã không ra món thì thôi chứ ra là làm liền một mạch…. MƯỜI MẤY MÓN MỚI … \r\nĐể vận hành mười mấy món mới, cộng với hơn 20 món cũ cho các tiệm trên khắp Việt Nam đòi hỏi Chang Hi phải xử lý tốt khâu sản xuất tại gốc mới có thể triển khai được. Menu mới mất 6 tháng nghiên cứu, liệu menu mới có ra gì? Cùng Chang Hi thưởng thức Chè pudding lá nếp nhé!!!', 'L', 3, '\"./assets/images/Products/che-pudding-la-nep-chan-trau-thach-520x330.jpg\"'),
(37, 'Chè pudding xoài', 25000, 'Đã không ra món thì thôi chứ ra là làm liền một mạch…. MƯỜI MẤY MÓN MỚI … \r\nĐể vận hành mười mấy món mới, cộng với hơn 20 món cũ cho các tiệm trên khắp Việt Nam đòi hỏi Chang Hi phải xử lý tốt khâu sản xuất tại gốc mới có thể triển khai được. Menu mới mất 6 tháng nghiên cứu, liệu menu mới có ra gì? Cùng Chang Hi thưởng thức Chè pudding xoài nhé!!!', 'M', 3, '\"./assets/images/Products/che-pudding-xoai-tran-chau-520x330.jpg\"'),
(38, 'Chè pudding xoài', 30000, 'Đã không ra món thì thôi chứ ra là làm liền một mạch…. MƯỜI MẤY MÓN MỚI … \r\nĐể vận hành mười mấy món mới, cộng với hơn 20 món cũ cho các tiệm trên khắp Việt Nam đòi hỏi Chang Hi phải xử lý tốt khâu sản xuất tại gốc mới có thể triển khai được. Menu mới mất 6 tháng nghiên cứu, liệu menu mới có ra gì? Cùng Chang Hi thưởng thức Chè pudding xoài nhé!!!', 'L', 3, '\"./assets/images/Products/che-pudding-xoai-tran-chau-520x330.jpg\"'),
(39, 'Chè pudding kim cương đen', 20000, 'Đã không ra món thì thôi chứ ra là làm liền một mạch…. MƯỜI MẤY MÓN MỚI … \r\nĐể vận hành mười mấy món mới, cộng với hơn 20 món cũ cho các tiệm trên khắp Việt Nam đòi hỏi Chang Hi phải xử lý tốt khâu sản xuất tại gốc mới có thể triển khai được. Menu mới mất 6 tháng nghiên cứu, liệu menu mới có ra gì? Cùng Chang Hi thưởng thức Chè pudding kim cương đen nhé!!!', 'M', 3, '\"./assets/images/Products/che-pudding-kim-cuong-den-520x330.jpg\"'),
(40, 'Chè pudding kim cương đen', 25000, 'Đã không ra món thì thôi chứ ra là làm liền một mạch…. MƯỜI MẤY MÓN MỚI … \r\nĐể vận hành mười mấy món mới, cộng với hơn 20 món cũ cho các tiệm trên khắp Việt Nam đòi hỏi Chang Hi phải xử lý tốt khâu sản xuất tại gốc mới có thể triển khai được. Menu mới mất 6 tháng nghiên cứu, liệu menu mới có ra gì? Cùng Chang Hi thưởng thức Chè pudding kim cương đen nhé!!!', 'L', 3, '\"./assets/images/Products/che-pudding-kim-cuong-den-520x330.jpg\"'),
(41, 'Chè Flan đường đen phô mai', 20000, 'Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\nKhách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\nMọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'M', 2, '\"./assets/images/Products/che-flan-duong-den-pho-mai-520x330.jpg\"'),
(42, 'Chè Flan đường đen phô mai', 25000, 'Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\nKhách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\nMọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'L', 2, '\"./assets/images/Products/che-flan-duong-den-pho-mai-520x330.jpg\"'),
(43, 'Chè Flan mãng cầu lưu ly', 25000, 'Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\nKhách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\nMọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'M', 2, '\"./assets/images/Products/che-mang-cau-luu-ly-520x330.jpg\"'),
(44, 'Chè Flan mãng cầu lưu ly', 30000, 'Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\nKhách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\nMọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'L', 2, '\"./assets/images/Products/che-mang-cau-luu-ly-520x330.jpg\"'),
(45, 'Tàu hủ trân châu Ô Long', 20000, 'Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\nKhách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\nMọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'M', 3, '\"./assets/images/Products/tau-hu-tran-chau-oolong-520x330.jpg\"'),
(46, 'Tàu hủ trân châu Ô Long', 25000, 'Chơi đồ hàng với món này chill phết các bạn ạ. Chè gì mà cầu kỳ và lâu công khiến các cô nhà mình miệt mài đến thế.\r\nKhách Chang Hi nói rằng mê mẩn mấy viên bi tròn tròn này dã man, đó là lý do khiến các cô nắn nót đến thế đấy. Mấy hôm nay món mới luôn trong tình trạng cháy hàng đủ để thấy “em” nó hot bỏng tay luôn.\r\nMọi người mau cùng Chang Hi trải nghiệm những món chè mới độc lạ đi nào.', 'L', 3, '\"./assets/images/Products/tau-hu-tran-chau-oolong-520x330.jpg\"');

-- --------------------------------------------------------

--
-- Table structure for table `product_topping`
--

CREATE TABLE `product_topping` (
  `product_id` int(10) NOT NULL,
  `topping_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_topping`
--

INSERT INTO `product_topping` (`product_id`, `topping_id`) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 6),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(21, 5),
(21, 6),
(22, 1),
(22, 2),
(22, 3),
(22, 4),
(22, 5),
(22, 6),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(23, 5),
(23, 6),
(24, 1),
(24, 2),
(24, 3),
(24, 4),
(24, 5),
(24, 6),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(25, 5),
(25, 6),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(26, 5),
(26, 6),
(27, 1),
(27, 2),
(27, 3),
(27, 4),
(27, 5),
(27, 6),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(28, 5),
(28, 6),
(29, 1),
(29, 2),
(29, 3),
(29, 4),
(29, 5),
(29, 6),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(30, 6),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(31, 5),
(31, 6),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(32, 5),
(32, 6),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(33, 5),
(33, 6),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(34, 5),
(34, 6),
(35, 1),
(35, 2),
(35, 3),
(35, 4),
(35, 5),
(35, 6),
(36, 1),
(36, 2),
(36, 3),
(36, 4),
(36, 5),
(36, 6),
(37, 1),
(37, 2),
(37, 3),
(37, 4),
(37, 5),
(37, 6),
(38, 1),
(38, 2),
(38, 3),
(38, 4),
(38, 5),
(38, 6),
(39, 1),
(39, 2),
(39, 3),
(39, 4),
(39, 5),
(39, 6),
(40, 1),
(40, 2),
(40, 3),
(40, 4),
(40, 5),
(40, 6),
(41, 1),
(41, 2),
(41, 3),
(41, 4),
(41, 5),
(41, 6),
(42, 1),
(42, 2),
(42, 3),
(42, 4),
(42, 5),
(42, 6),
(43, 1),
(43, 2),
(43, 3),
(43, 4),
(43, 5),
(43, 6),
(44, 1),
(44, 2),
(44, 3),
(44, 4),
(44, 5),
(44, 6),
(45, 1),
(45, 2),
(45, 3),
(45, 4),
(45, 5),
(45, 6),
(46, 1),
(46, 2),
(46, 3),
(46, 4),
(46, 5),
(46, 6);

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `id` int(10) NOT NULL,
  `toppingName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topping`
--

INSERT INTO `topping` (`id`, `toppingName`) VALUES
(1, 'Trân châu đen'),
(2, 'Trân châu trắng'),
(3, 'Dừa sợi'),
(4, 'Dừa khô'),
(5, 'Thạch rau câu'),
(6, 'Thạch sương sáo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`orders_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_topping`
--
ALTER TABLE `product_topping`
  ADD PRIMARY KEY (`product_id`,`topping_id`),
  ADD KEY `product_topping_ibfk2` (`topping_id`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `topping`
--
ALTER TABLE `topping`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_topping`
--
ALTER TABLE `product_topping`
  ADD CONSTRAINT `product_topping_ibfk1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_topping_ibfk2` FOREIGN KEY (`topping_id`) REFERENCES `topping` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

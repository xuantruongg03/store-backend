/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: banners
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `banners` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `banner_type` varchar(45) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: blogs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `blogs` (
  `blog_id` varchar(50) NOT NULL,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_description` text,
  `blog_content` text,
  `customer_id` varchar(10) DEFAULT NULL,
  `blog_rate` int DEFAULT '0',
  `blog_visited` int DEFAULT '0',
  `blog_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_status` bit(1) DEFAULT b'0',
  `blog_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cart
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(10) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 30 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: comments_blog
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `comments_blog` (
  `comment_blog_id` int NOT NULL AUTO_INCREMENT,
  `blog_id` varchar(50) DEFAULT NULL,
  `comment_blog_name_user` varchar(255) DEFAULT NULL,
  `comment_blog_value` text,
  `comment_blog_created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_blog_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `comments_blog_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`blog_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: customers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` varchar(10) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(400) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: order_items
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number_phone` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `payment` varchar(255) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: orders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(10) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_quantity` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: product_details
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `product_details` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL,
  `detail_name` varchar(255) NOT NULL,
  `detail_value` varchar(255) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `product_details_ibfk_1` (`product_id`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1038 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: product_images
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `product_images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_images_ibfk_1` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 622 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: product_likes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `product_likes` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `product_likes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `product_likes_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: products
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text,
  `product_price` decimal(10, 2) NOT NULL,
  `product_sale_price` decimal(10, 2) DEFAULT '0.00',
  `product_type` varchar(255) NOT NULL,
  `product_quantity` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: repair_schedule
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `repair_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number_phone` varchar(255) NOT NULL,
  `repair_date` varchar(255) NOT NULL,
  `problem` varchar(255) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `repair_schedule_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: whitelist
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `whitelist` (
  `id_whitelist` int NOT NULL AUTO_INCREMENT,
  `ip_whitelist` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_whitelist`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: banners
# ------------------------------------------------------------

INSERT INTO
  `banners` (
    `banner_id`,
    `banner_name`,
    `banner_image`,
    `banner_type`
  )
VALUES
  (
    1,
    'Siêu sale',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681964117/image_products/n2hscuboyffyxx4iosyo.jpg',
    'width'
  );
INSERT INTO
  `banners` (
    `banner_id`,
    `banner_name`,
    `banner_image`,
    `banner_type`
  )
VALUES
  (
    2,
    'Cyber Monday',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681964225/image_products/sgcqxcjcw7sztvyidnhr.jpg',
    'width'
  );
INSERT INTO
  `banners` (
    `banner_id`,
    `banner_name`,
    `banner_image`,
    `banner_type`
  )
VALUES
  (
    3,
    'Cyber Monday',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681964870/image_products/wiyiaw7h8lqztbxvgxl2.jpg',
    'width'
  );
INSERT INTO
  `banners` (
    `banner_id`,
    `banner_name`,
    `banner_image`,
    `banner_type`
  )
VALUES
  (
    4,
    'Sale',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681979865/image_products/d2v1dekqlcy4jhboa2ks.webp',
    'height'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: blogs
# ------------------------------------------------------------

INSERT INTO
  `blogs` (
    `blog_id`,
    `blog_title`,
    `blog_description`,
    `blog_content`,
    `customer_id`,
    `blog_rate`,
    `blog_visited`,
    `blog_created_at`,
    `blog_status`,
    `blog_image`
  )
VALUES
  (
    '17423135816969',
    'Nhà phân tích này khẳng định Apple Watch đã vượt qua các đối thủ từ cách đây cả thập kỷ',
    'Một nhà phân tích có tiếng về Apple tin rằng, Apple Watch đã dẫn trước các đối thủ trên thị trường thiết bị đeo từ lâu và khoảng cách tạo ra giữa Apple và các hãng có thể lên tới cả thập kỷ.',
    '<p>Nhà phân tích có nhiều năm kinh nghiệm quan sát về Apple, Neil Cybart đang công tác tại công ty Above Avalon cho rằng, Apple đang đi trước các đối thủ trong phân khúc thiết bị đeo tới cả một thập kỷ.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://genk.mediacdn.vn/thumb_w/660/139269124445442048/2021/6/7/2021-06-06232337-1623041152472995456378.jpg\" alt=\"Nhà phân tích này khẳng định Apple Watch đã vượt qua các đối thủ từ cách đây cả thập kỷ - Ảnh 1.\"></figure><p>Sở dĩ Apple có thể đi trước các đối thủ tới cả thập kỷ và có lượng fan đông đảo, đó là nhờ việc công ty tập trung phát triển chip riêng, từ đó mang đến trải nghiệm người dùng tốt hơn các đối thủ.</p><p>Nhà phân tích cho biết hơn 6 năm sau khi Apple Watch lần đầu tiên ra mắt, không có sản phẩm hoặc công ty nào trên thị trường đủ sức cạnh tranh thực sự với Apple trên thị trường thiết bị đeo.</p><p>Cybart nhận định, vị trí dẫn đầu của Apple trong phân khúc thiết bị đeo đến từ ba yếu tố: chip độc quyền (giúp Apple đủ sức dẫn đầu từ 4-5 năm); quy trình phát triển sản phẩm và thiết kế ấn tượng (giúp Apple dẫn đầu thêm 3 năm nữa) và hệ sinh thái rộng lớn, liên kết được giữa các thiết bị đeo và dịch vụ (giúp Apple dẫn đầu thêm 2 năm nữa). Kết hợp tất cả yếu tố trên đã giúp Apple dẫn trước các đối thủ trên thị trường thiết bị đeo tới cả thập kỷ.</p><p>Cybart ước tính, Apple đang trên đà bán được hơn 100 triệu thiết bị đeo vào năm 2021. Điều này không quá ngạc nhiên vì Apple Watch đã chiếm được hơn 1/3 thị phần thiết bị đeo mặc dù chỉ tương thích với iPhone.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://genk.mediacdn.vn/thumb_w/660/139269124445442048/2021/6/7/2021-06-06232144-16230411524811930563941.jpg\" alt=\"Nhà phân tích này khẳng định Apple Watch đã vượt qua các đối thủ từ cách đây cả thập kỷ - Ảnh 2.\"><figcaption>Doanh thu của Apple Watch qua từng năm.&nbsp;<br>Ảnh AboveAvalon</figcaption></figure><p>&nbsp;</p><p>Nhà phân tích nêu bật vị thế dẫn đầu của Apple thông qua một số ví dụ. Ông nhấn mạnh cách AssistiveTouch trên Apple Watch so với bản demo của Facebook’s Reality Labs về một thiết bị giống smartwatch có thể dùng làm phương thức nhập liệu cho kính AR.</p><p>Các mẫu kính AR/VR như Microsoft HoloLens, Magic Leap và Snap Spectacles đều trông khá ấn tượng trên giấy nhưng chưa thực sự gây ấn tượng với người tiêu dùng. Nguyên nhân được chỉ ra do thiếu \"tư duy thiết kế\".</p><p>Cybart khẳng định, một khi Apple tham gia vào thị trường AR/VR, hãng sẽ khiến nhiều công ty&nbsp; buộc phải suy nghĩ lại về thiết kế sản phẩm của họ.</p><p>Vậy đâu là yếu tố giúp Apple có thể đi sớm trước các đối thủ tới cả một thập kỷ? Cybart cho biết, Apple đã sớm có sản phẩm và tập trung vào thiết kế từ lâu. Đây là điều mà các đối thủ cạnh tranh không làm được.</p><p>Trong lúc nhiều công ty còn đang loay hoay nghiên cứu điện toán giọng nói và trợ lý giọng nói, bỏ quên đầu tư vào công nghệ thiết bị đeo, điều này càng khiến các công ty thêm chậm chân trước Apple trên thị trường thiết bị đeo.</p><p>Những nhận định của Cybart cho thấy sự tập trung của Apple ngay từ đầu đã giúp hãng này tạo ra vị thế dẫn đầu lớn so với đối thủ cạnh như ngày nay.</p>',
    '2057925',
    0,
    36,
    '2023-05-17 13:58:01',
    b'1',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1684306669/image_users/pcbregiqh4og7u8lmvgs.webp'
  );
INSERT INTO
  `blogs` (
    `blog_id`,
    `blog_title`,
    `blog_description`,
    `blog_content`,
    `customer_id`,
    `blog_rate`,
    `blog_visited`,
    `blog_created_at`,
    `blog_status`,
    `blog_image`
  )
VALUES
  (
    '204231822293437',
    'Sony tai nghe True Wireless nhỏ gọn',
    'Tai nghe True Wireless WF-1000XM4 của Sony có thiết kế nhỏ, nhẹ, nhưng được nâng cấp mạnh về tính năng chống ồn và âm thanh so với thế hệ trước.',
    '<p>Tai nghe True Wireless WF-1000XM4 của Sony có thiết kế nhỏ, nhẹ, nhưng được nâng cấp mạnh về tính năng chống ồn và âm thanh so với thế hệ trước.</p><p>WF-1000XM4 giải quyết được nhược điểm của thế hệ trước là thiết kế to và nặng, khó sử dụng trong thời gian dài. Ngoài ra sản phẩm còn có thêm công nghệ chống nước IPX4. Thời lượng pin cũng được nâng cấp mạnh, với 8 giờ liên tục khi mở chống ồn và 12 giờ khi tắt tính năng này - cao gấp đôi so thế hệ trước. Hộp đựng được làm nhỏ hơn nên chỉ có thể sạc thêm được 2 lần, cho tổng thời gian sử dụng là 24 giờ khi mở chống ồn và 36 giờ khi tắt tính năng này. Sony lần đầu tiên trang bị sạc không dây cho hộp sạc tai nghe của mình, bên khả năng sạc nhanh 5 phút cho một giờ sử dụng.</p><figure class=\"image\"><img src=\"https://i1-sohoa.vnecdn.net/2021/06/09/gsmarena-001-8-1623173530-2046-1623173544.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=1sPB_MfhuHXh5rXp5-ii2A\" alt=\"WF-1000XM4 sẽ là một trong những mẫu tai nghe chống ồn tốt nhất trên thị trường. Ảnh: Gsmarena.\"></figure><p>WF-1000XM4 sẽ là một trong những mẫu tai nghe chống ồn tốt nhất trên thị trường. Ảnh:&nbsp;<i>Gsmarena.</i></p><p>Sony trang bị chip xử lý V1 mới cho WF-1000XM4 nên cải thiện chất lượng âm thanh và khả năng chống ồn. Đây là tai nghe True Wireless đầu tiên thế giới hỗ trợ âm thanh Hi-res chuẩn LDAC, có dữ liệu âm thanh cao gấp 3 lần so với Bluetooth thông thường. Ngoài ra, tính năng DSEE Extreme sử dụng AI để tái tạo lại âm thanh đã nén với chất lượng gần với Hi-res.</p><p>Về khả năng chống ồn, chip V1 loại bỏ được âm thanh tần số cao tốt hơn 40% so với XM3, Sony cũng sử dụng driver lớn hơn 20% cùng bộ khuếch đại 24-bit được cải tiến để loại âm thanh tần số thấp và tạo ra âm trầm tốt hơn. Các đầu mút tai nghe làm bằng polyurethane cũng giảm tiếng ồn.</p><p>Khả năng kết nối cũng được cải thiện với tốc độ ghép nối nhanh cho Android và Windows 10 thay vì phải làm thủ công khá phức tạp như thế hệ trước. WF-1000XM4 có thể tự phát hiện tiếng nói của người dùng để tạm dừng nhạc và tự động bật chế độ Âm thanh xung quanh để người dùng nói chuyện dễ dàng mà không cần lấy tai nghe ra, hay phải kích hoạt chế độ Âm thanh xung quanh bằng tay. Tính năng này giống Samsung Galaxy Buds Pro hay Huawei Free Buds Pro. Micro cũng được cải tiến để thu giọng nói tốt hơn. Tai nghe của Sony cũng được tối ưu hóa cho Google Assistant và Alexa.</p><p>Sony WF-1000XM4 có giá 280 USD, đắt hơn AirPods Pro 50 USD và Galaxy Buds Pro 80 USD.</p>',
    '2057925',
    0,
    4,
    '2023-05-20 18:22:29',
    b'1',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1684067019/image_users/b4khmssuvjsqotlzwehm.jpg'
  );
INSERT INTO
  `blogs` (
    `blog_id`,
    `blog_title`,
    `blog_description`,
    `blog_content`,
    `customer_id`,
    `blog_rate`,
    `blog_visited`,
    `blog_created_at`,
    `blog_status`,
    `blog_image`
  )
VALUES
  (
    '20423194133632',
    'Galaxy Z Fold 3 và Z Flip 3 sẽ có giá rẻ hơn',
    'Hai smartphone đắt nhất của Samsung sẽ có giá rẻ hơn 400 USD so với thế hệ trước. Theo báo cáo của SamMobile nhằm phổ biến smartphone màn hình gập cũng như hoàn thành mục tiêu 7 triệu máy của hai model khi ra mắt, Galaxy Z Fold 3 và Galaxy Z Flip 3 sẽ rẻ hơn 20% so Z Fold 2 và Z Flip. Theo đó, Galaxy Z Fold 3 sẽ có giá 1.599 USD và Z Flip 3 là 959 USD.',
    '<p>Hai smartphone đắt nhất của Samsung sẽ có giá rẻ hơn 400 USD so với thế hệ trước.</p><p>Theo báo cáo của&nbsp;<i>SamMobile</i>&nbsp;nhằm phổ biến smartphone màn hình gập cũng như hoàn thành mục tiêu 7 triệu máy của hai model khi ra mắt,&nbsp;Galaxy Z Fold 3&nbsp;và&nbsp;Galaxy Z Flip 3&nbsp;sẽ rẻ hơn 20% so&nbsp;Z Fold 2&nbsp;và&nbsp;Z Flip. Theo đó, Galaxy Z Fold 3 sẽ có giá 1.599 USD và Z Flip 3 là 959 USD.</p><figure class=\"image\"><img src=\"https://i1-sohoa.vnecdn.net/2021/06/08/insider-hints-at-likely-samsun-1694-1549-1623088597.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=bYAMpJ-8yHbcRV_gkntPng\" alt=\"Samsung đang dẫn đầu thị trường về smartphone màn hình gập. Ảnh:Phonearena.\"><figcaption>Samsung đang dẫn đầu thị trường về smartphone màn hình gập</figcaption></figure><p>&nbsp;</p><p>Hai model này sẽ được trang bị chip xử lý mới nhất của&nbsp;Qualcomm&nbsp;- Snapdragon 888. Z Flip 3 chưa có thông tin về cấu hình, còn Z Fold 3 sẽ được trang bị 12 GB RAM và bộ nhớ trong 256 GB.</p><p>Z Fold 3 có màn hình ngoài 6,21 inch, màn hình trong nhỏ hơn so với thế hệ trước, còn 7,55 inch. Máy sẽ có pin 4.380 mAh, hỗ trợ sạc nhanh 25W. Máy chạy&nbsp;Android 11&nbsp;khi ra mắt và sẽ được nâng cấp lên&nbsp;Android&nbsp;thế hệ mới trong 3 năm.</p><p>Z Flip3 sẽ được trang bị màn hình chính 6,9 inch, tốc độ làm tươi 120 Hz và có viền mỏng cùng camera trước dạng đục lỗ nhỏ hơn. Màn hình bên ngoài cũng tăng kích thước. Đi kèm là pin 3.900 mAh.</p><p>Nếu năm nay&nbsp;Samsung&nbsp;khai tử dòng Galaxy Note, Z Fold 3 sẽ được hỗ trợ S Pen và bút này sẽ tích hợp trong máy. Hãng cũng sẽ sử dụng kính siêu mỏng UTG thế hệ thứ hai với độ bền cao hơn cho Z Fold 3.</p><p>Galaxy Z Flip 3 sẽ sử dụng cụm camera giống&nbsp;Galaxy S21, với camera chính và camera góc siêu rộng 12 megapixel, camera tele 64 megapixel với khả năng zoom hybrid 3x. Galaxy Z Fold 3 có thể trang bị camera giống&nbsp;S21 Ultra. Ngoài ra, model này cũng được trang bị camera ẩn dưới màn hình.</p><p>Theo&nbsp;<i>Ice Universe</i>, sự kiện Unpacked của Samsung có thể diễn ra vào giữa hoặc cuối tháng 6. Hai model Galaxy Z Fold 3 và Z Flip 3 sẽ được giao đến khách hàng trong tháng 7.</p>',
    '2057925',
    0,
    16,
    '2023-05-20 19:04:13',
    b'1',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1684061156/image_users/z7dmwkentrwzunsgfkeb.jpg'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cart
# ------------------------------------------------------------

INSERT INTO
  `cart` (`cart_id`, `customer_id`, `product_id`, `quantity`)
VALUES
  (16, '2222399', 'A202516', 2);
INSERT INTO
  `cart` (`cart_id`, `customer_id`, `product_id`, `quantity`)
VALUES
  (17, '2222399', 'A2025366', 2);
INSERT INTO
  `cart` (`cart_id`, `customer_id`, `product_id`, `quantity`)
VALUES
  (23, '2057925', 'L2025920', 1);
INSERT INTO
  `cart` (`cart_id`, `customer_id`, `product_id`, `quantity`)
VALUES
  (24, '2057925', 'L2025788', 3);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: comments_blog
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: customers
# ------------------------------------------------------------

INSERT INTO
  `customers` (
    `customer_id`,
    `first_name`,
    `last_name`,
    `gender`,
    `email`,
    `username`,
    `password`,
    `avatar`,
    `code`,
    `refresh_token`
  )
VALUES
  (
    '2057925',
    'Lê Xuân',
    'Trường',
    'Nam',
    'lexuantruong098@gmail.com',
    'lexuantruong',
    '$2a$10$hOT9qe.821jbGehYiOugROkN95/xzMqZS1Zt/zoMVmly3y3bSYXBW',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681991657/image_users/ilrmuzkoups7zypsrujb.jpg',
    NULL,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21lcl9pZCI6IjIwNTc5MjUiLCJpYXQiOjE2ODUwMDEyNDUsImV4cCI6MTY4NTA4NzY0NX0.9DLiY9H-SACAgsoZHbA27jSfJ-KnBDRnSVbU7IRLfks'
  );
INSERT INTO
  `customers` (
    `customer_id`,
    `first_name`,
    `last_name`,
    `gender`,
    `email`,
    `username`,
    `password`,
    `avatar`,
    `code`,
    `refresh_token`
  )
VALUES
  (
    '2222399',
    'Lê',
    'Hương',
    'Nữ',
    'lenhalienhuong@gmail.com',
    'lenhalienhuong',
    '$2a$10$5DLGNsrdMpKxr4hLY1wA6u.UbR/9K7eOim/yaCwwhjwr5TXZ.fxTe',
    NULL,
    NULL,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21lcl9pZCI6IjIyMjIzOTkiLCJpYXQiOjE2ODQ5MjEyMDYsImV4cCI6MTY4NTAwNzYwNn0.eOo7rQ_ZGimwkcLLa4oH9hZU7YruTZdGylxrxaBc_zc'
  );
INSERT INTO
  `customers` (
    `customer_id`,
    `first_name`,
    `last_name`,
    `gender`,
    `email`,
    `username`,
    `password`,
    `avatar`,
    `code`,
    `refresh_token`
  )
VALUES
  (
    '52514',
    'a',
    'a',
    'Nam',
    'a',
    'lexuantruong123',
    '123456',
    NULL,
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: order_items
# ------------------------------------------------------------

INSERT INTO
  `order_items` (
    `order_item_id`,
    `order_id`,
    `first_name`,
    `last_name`,
    `address`,
    `number_phone`,
    `notes`,
    `payment`
  )
VALUES
  (
    10,
    13,
    'Le Xuan',
    'Truong',
    '147 An Duong Vuong - Xã Cao Sơn - Huyện Đà Bắc',
    '0981793201',
    '',
    'cod'
  );
INSERT INTO
  `order_items` (
    `order_item_id`,
    `order_id`,
    `first_name`,
    `last_name`,
    `address`,
    `number_phone`,
    `notes`,
    `payment`
  )
VALUES
  (
    11,
    16,
    'Le Xuan',
    'Truong',
    '147 An Duong Vuong - Xã Cao Sơn - Huyện Đà Bắc',
    '0981793201',
    '',
    'cod'
  );
INSERT INTO
  `order_items` (
    `order_item_id`,
    `order_id`,
    `first_name`,
    `last_name`,
    `address`,
    `number_phone`,
    `notes`,
    `payment`
  )
VALUES
  (
    12,
    16,
    'Le Xuan',
    'Truong',
    '147 An Duong Vuong - Xã Cao Sơn - Huyện Đà Bắc',
    '0981793201',
    '',
    'cod'
  );
INSERT INTO
  `order_items` (
    `order_item_id`,
    `order_id`,
    `first_name`,
    `last_name`,
    `address`,
    `number_phone`,
    `notes`,
    `payment`
  )
VALUES
  (
    13,
    16,
    'Le Xuan',
    'Truong',
    '147 An Duong Vuong - Xã Cao Sơn - Huyện Đà Bắc',
    '0981793201',
    '',
    'cod'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: orders
# ------------------------------------------------------------

INSERT INTO
  `orders` (
    `order_id`,
    `customer_id`,
    `product_id`,
    `order_date`,
    `order_quantity`
  )
VALUES
  (13, '2057925', 'A2025119', '5/24/2023', 1);
INSERT INTO
  `orders` (
    `order_id`,
    `customer_id`,
    `product_id`,
    `order_date`,
    `order_quantity`
  )
VALUES
  (14, '2057925', 'A202516', '5/24/2023', 1);
INSERT INTO
  `orders` (
    `order_id`,
    `customer_id`,
    `product_id`,
    `order_date`,
    `order_quantity`
  )
VALUES
  (15, '2057925', 'A2025708', '5/24/2023', 1);
INSERT INTO
  `orders` (
    `order_id`,
    `customer_id`,
    `product_id`,
    `order_date`,
    `order_quantity`
  )
VALUES
  (16, '2057925', 'A2025366', '5/24/2023', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: product_details
# ------------------------------------------------------------

INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (676, 'L202520', 'CPU', 'i5 1135G7 2.4GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    677,
    'L202520',
    'RAM',
    '8 GB DDR4 (Onboard) 4266 MHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    678,
    'L202520',
    'Ổ cứng',
    '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    679,
    'L202520',
    'Màn hình',
    '14\"Full HD (1920 x 1080)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    680,
    'L202520',
    'Card màn hình',
    'Card tích hợp, Intel Iris Xe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    681,
    'L202520',
    'Cổng kết nối',
    'HDMI, Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C2 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (682, 'L202520', 'Đặc biệt', 'Có đèn bàn phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    683,
    'L202520',
    'Hệ điều hành',
    'Windows 10 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (684, 'L202520', 'Thiết kế', 'Vỏ kim loại');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    685,
    'L202520',
    'Kích thước, khối lượng',
    'Dài 322 mm - Rộng 207 mm - Dày 14.9 mm - Nặng 1.27 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (686, 'L202520', 'Thời điểm ra mắt', '2020');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    687,
    'L2025920',
    'CPU',
    'Intel Core i7 Alder Lake - 12700H'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (688, 'L2025920', 'Số nhân', '14');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (689, 'L2025920', 'Số luồng', '20');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (690, 'L2025920', 'Tốc độ CPU', '2.30 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    691,
    'L2025920',
    'Tốc độ tối đa',
    'Turbo Boost 4.7 GHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (692, 'L2025920', 'Bộ nhớ đệm', '24 MB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (693, 'L2025920', 'RAM', '8 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    694,
    'L2025920',
    'Loại RAM',
    'DDR4 2 khe (1 khe 8 GB + 1 khe rời)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (695, 'L2025920', 'Tốc độ Bus RAM', '3200 MHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (696, 'L2025920', 'Hỗ trợ RAM tối đa', '32 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    697,
    'L2025920',
    'Ổ cứng',
    'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (698, 'L2025920', 'Màn hình', '15.6 inch');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    699,
    'L2025920',
    'Độ phân giải',
    'Full HD (1920 x 1080)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (700, 'L2025920', 'Tần số quét', '144 Hz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    701,
    'L2025920',
    'Công nghệ màn hình',
    'G-Sync Tấm nền IPS Chống chói Anti Glare 100% sRGB'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    702,
    'L2025920',
    'Công nghệ âm thanh',
    'Hi-Res certificationDolby Atmos'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    703,
    'L2025920',
    'Cổng giao tiếp',
    '1 x Thunderbolt 4 (hỗ trợ DisplayPort) Jack tai nghe 3.5 mm 1 x USB 3.2 Gen 2 Type-C (hỗ trợ DisplayPort, Power delivery, G-SYNC) 2 x USB 3.2 HDMI LAN (RJ45)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    704,
    'L2025920',
    'Kết nối không dây',
    'Bluetooth 5.2Wi-Fi 6 (802.11ax)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (705, 'L2025920', 'Webcam', 'HD webcam');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    706,
    'L2025920',
    'Tính năng khác',
    'Đèn bàn phím chuyển màu RGB'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    707,
    'L2025920',
    'Card màn hình',
    'Card rời - NVIDIA GeForce RTX 4050, 6 GB'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (708, 'L2025920', 'Đèn bàn phím', 'Có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    709,
    'L2025920',
    'Chất liệu',
    'Vỏ nhựa - nắp lưng bằng kim loại'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    710,
    'L2025920',
    'Kích thước, khối lượng',
    'Dài 354 mm - Rộng 251 mm - Dày 22.4 ~ 24.9 mm - Nặng 2.2 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (711, 'L2025920', 'Thời điểm ra mắt', '2023');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    712,
    'L2025920',
    'Thông tin Pin',
    '4-cell Li-ion, 90 Wh'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    713,
    'L2025920',
    'Hệ điều hành',
    'Windows 11 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (714, 'L2025867', 'CPU', 'Apple M2 100GB/s');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (715, 'L2025867', 'RAM', '16 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (716, 'L2025867', 'Ổ cứng', '512 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    717,
    'L2025867',
    'Card màn hình',
    'Card tích hợp10 nhân GPU'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    718,
    'L2025867',
    'Màn hình',
    '13.6\" Liquid Retina (2560 x 1664)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    719,
    'L2025867',
    'Cổng kết nối',
    'Jack tai nghe 3.5 mmMagSafe 32 x Thunderbolt 3'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (720, 'L2025867', 'Đặc biệt', 'Có đèn bàn phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (721, 'L2025867', 'Hệ điều hành', 'Mac OS');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (722, 'L2025867', 'Thiết kế', 'Vỏ kim loại');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    723,
    'L2025867',
    'Kích thước, khối lượng',
    'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (724, 'L2025867', 'Thời điểm ra mắt', '6/2022');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (725, 'L2025589', 'CPU', 'i5 - 10300H - 2.5GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    726,
    'L2025589',
    'RAM',
    '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 2933 MHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    727,
    'L2025589',
    'Ổ cứng',
    '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    728,
    'L2025589',
    'Màn hình',
    '15.6\"Full HD (1920 x 1080) 144Hz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    729,
    'L2025589',
    'Card màn hình',
    'Card rờiGTX 1650 4GB'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    730,
    'L2025589',
    'Cổng kết nối',
    'HDMILAN (RJ45)USB 2.0Jack tai nghe 3.5 mm2 x USB 3.21 x USB 3.2 Gen 2 Type-C (hỗ trợ DisplayPort, Power delivery, G-SYNC)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (731, 'L2025589', 'Đặc biệt', 'Có đèn bàn phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    732,
    'L2025589',
    'Hệ điều hành',
    'Windows 11 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    733,
    'L2025589',
    'Thiết kế',
    'Vỏ nhựa - nắp lưng bằng kim loại'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    734,
    'L2025589',
    'Kích thước, khối lượng',
    'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (735, 'L2025589', 'Thời điểm ra mắt', '2021');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (736, 'L2025111', 'CPU', 'i5 1135G7 2.4GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    737,
    'L2025111',
    'RAM',
    '8 GB DDR4 (Onboard) 4266 MHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    738,
    'L2025111',
    'Ổ cứng',
    '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    739,
    'L2025111',
    'Màn hình',
    '14\"Full HD (1920 x 1080)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    740,
    'L2025111',
    'Card màn hình',
    'Card tích hợpIntel Iris Xe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (741, 'L2025111', 'Đặc biệt', 'Có đèn bàn phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    742,
    'L2025111',
    'Cổng kết nối',
    'HDMIJack tai nghe 3.5 mmThunderbolt 4 USB-C2 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    743,
    'L2025111',
    'Hệ điều hành',
    'Windows 10 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (744, 'L2025111', 'Thiết kế', 'Vỏ kim loại');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    745,
    'L2025111',
    'Kích thước, khối lượng',
    'Dài 322 mm - Rộng 207 mm - Dày 14.9 mm - Nặng 1.27 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (746, 'L2025111', 'Thời điểm ra mắt', '2020');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (747, 'L2025534', 'CPU', 'i5 1135G7 2.4GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    748,
    'L2025534',
    'RAM',
    '8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    749,
    'L2025534',
    'Ổ cứng',
    '512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230)) Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    750,
    'L2025534',
    'Màn hình',
    '15.6\"Full HD (1920 x 1080)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    751,
    'L2025534',
    'Card màn hình',
    'Card rời MX350 2GB'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    752,
    'L2025534',
    'Cổng kết nối',
    'HDMI, LAN (RJ45) USB 2.0 Jack tai nghe 3.5 mm2 x USB 3.2 / 1 x USB 3.2 và 1 x USB Type-C (Tuỳ thuộc vào lô hàng)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    753,
    'L2025534',
    'Hệ điều hành',
    'Windows 11 Home SL + Office Home & Student vĩnh viễn'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (754, 'L2025534', 'Thiết kế', 'Vỏ nhựa');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    755,
    'L2025534',
    'Kích thước, khối lượng',
    'Dài 358.5 mm - Rộng 235.5 mm - Dày 18.9 mm - Nặng 1.69 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (756, 'L2025534', 'Thời điểm ra mắt', '2021');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (757, 'L2025818', 'CPU', 'i7 - 1255U - 1.7GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    758,
    'L2025818',
    'RAM',
    '8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (759, 'L2025818', 'Ổ cứng', '512 GB SSD NVMe PCIe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    760,
    'L2025818',
    'Màn hình',
    '16\"Full HD+ (1920 x 1200)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    761,
    'L2025818',
    'Card màn hình',
    'Card tích hợp, Intel UHD'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    762,
    'L2025818',
    'Cổng kết nối',
    'HDMI Jack tai nghe 3.5 mm2 x USB 3.2 USB Type-C (hỗ trợ Power Delivery và DisplayPort)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (763, 'L2025818', 'Đặc biệt', 'Có đèn bàn phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    764,
    'L2025818',
    'Hệ điều hành',
    'Windows 11 Home SL + Office Home & Student vĩnh viễn'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (765, 'L2025818', 'Thiết kế', 'Vỏ kim loại');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    766,
    'L2025818',
    'Kích thước, khối lượng',
    'Dài 356.7 mm - Rộng 251.9 mm - Dày 17.95 mm - Nặng 1.87 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (767, 'L2025818', 'Thời điểm ra mắt', '2022');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (768, 'L2025788', 'CPU', 'i7 - 1255U - 1.7GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    769,
    'L2025788',
    'RAM',
    '16 GB DDR5 (Onboard) 4800 MHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (770, 'L2025788', 'Ổ cứng', '512 GB SSD NVMe PCIe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    771,
    'L2025788',
    'Màn hình',
    '14\" WUXGA (1920 x 1200)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    772,
    'L2025788',
    'Card màn hình',
    'Card tích hợpIntel Iris Xe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    773,
    'L2025788',
    'Cổng kết nối',
    'HDMI, Jack tai nghe 3.5 mm, 2x SuperSpeed USB A2 x Thunderbolt 4 with USB-C (USB Power Delivery, DisplayPort 1.4)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    774,
    'L2025788',
    'Đặc biệt',
    'Có màn hình cảm ứngCó đèn bàn phím'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (775, 'L2025788', 'Hệ điều hành', 'Windows 11 Pro');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (776, 'L2025788', 'Thiết kế', 'Vỏ kim loại - Nhôm');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    777,
    'L2025788',
    'Kích thước, khối lượng',
    'Dài 315.6 mm - Rộng 225.6 mm - Dày 19.2 mm - Nặng 1.35 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (778, 'L2025788', 'Thời điểm ra mắt', '2022');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (790, 'P2025259', 'Công nghệ CPU', 'Apple M1');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (791, 'P2025259', 'RAM', '8 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (792, 'P2025259', 'Ổ cứng', '256 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (793, 'P2025259', 'Màn hình', '24 inch 4.5K');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (794, 'P2025259', 'Card màn hình', '8-core GPU');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    795,
    'P2025259',
    'Cổng kết nối',
    'LAN (RJ45) Jack 3.5 mm, 2 x Thunderbolt, 2 x USB 3'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (796, 'P2025259', 'Hệ điều hành', 'Mac OS');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    797,
    'P2025259',
    'Kích thước',
    'Dài 547 mm - Rộng 461 mm - Dày 147 mm - Nặng 4.48 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    798,
    'P2025427',
    'Công nghệ CPU',
    'i5 - 1135G7 - 2.40 GHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    799,
    'P2025427',
    'RAM',
    '4 GB DDR4 2 khe (1 khe 4 GB + 1 khe trống) 3200 MHz, 2 khe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    800,
    'P2025427',
    'Ổ cứng',
    '512 GB SSD Chuẩn PCIe/NVMe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (801, 'P2025427', 'Màn hình', '21.5 inch Full HD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (802, 'P2025427', 'Card màn hình', 'Intel Iris Xe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    803,
    'P2025427',
    'Cổng kết nối',
    'HDMI, LAN (RJ45), 2 x USB 2.0, Jack 3.5 mm, 2 x SuperSpeed USB Type-A'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (804, 'P2025427', 'Hệ điều hành', 'Windows 10');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    805,
    'P2025427',
    'Kích thước',
    'Dài 490.3 mm - Rộng 380.7 mm - Dày 204.5 mm - Nặng 5.7 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (806, 'L2025911', 'CPU', 'Celeron, N4020, 1.1GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    807,
    'L2025911',
    'RAM',
    '4 GB, DDR4 (1 khe), Từ 2400 MHz (Hãng công bố)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (808, 'L2025911', 'Ổ cứng', '128 GB SSD M2 PCIe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    809,
    'L2025911',
    'Màn hình',
    '11.6\"HD (1366 x 768)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    810,
    'L2025911',
    'Cổng kết nối',
    'USB Type-CHDMILAN (RJ45)Jack tai nghe 3.5 mm2 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    811,
    'L2025911',
    'Card màn hình',
    'Card tích hợpIntel UHD 600'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    812,
    'L2025911',
    'Hệ điều hành',
    'Windows 11 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (813, 'L2025911', 'Thiết kế', 'Vỏ nhựa');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    814,
    'L2025911',
    'Kích thước, khối lượng',
    'Dài 295 mm - Rộng 215 mm - Dày 20.99 mm - Nặng 1.4 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (815, 'L2025911', 'Thời điểm ra mắt', '2021');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    816,
    'P2025638',
    'Công nghệ CPU',
    'Intel Core i3 Alder Lake'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (817, 'P2025638', 'Loại CPU', '1215U');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (818, 'P2025638', 'Tốc độ CPU', '1.20 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (819, 'P2025638', 'Tốc độ tối đa', '4.40 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (820, 'P2025638', 'Chipset', 'Intel SoC Platform');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (821, 'P2025638', 'RAM', '4 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    822,
    'P2025638',
    'Loại RAM',
    'DDR4 2 khe (1 khe 4 GB + 1 khe trống)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (823, 'P2025638', 'Số khe RAM', '2 khe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (824, 'P2025638', 'Tốc độ Bus RAM', '3200 MHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    825,
    'P2025638',
    'Card màn hình',
    'Intel UHD Graphics'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (826, 'P2025638', 'Hỗ trợ RAM tối đa', '16 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    827,
    'P2025638',
    'Ổ cứng',
    '256 GB SSD (Có thể tháo ra, lắp thanh khác tối đa 1TB)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    828,
    'P2025638',
    'Chuẩn kết nối ổ cứng',
    'Hỗ trợ khe cắm HDD SATA 2.5 inch (nâng cấp tối đa 1 TB), Hỗ trợ khe M.2 connector for WLAN'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (829, 'P2025638', 'Kích thước màn hình', '23.8 inch');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    830,
    'P2025638',
    'Công nghệ màn hình',
    'Độ sáng 250 nits, Chống chói Anti Glare, IPS'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    831,
    'P2025638',
    'Độ phân giải',
    'Full HD (1920 x 1080)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    832,
    'P2025638',
    'Thiết kế card',
    'Card đồ hoạ tích hợp'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    833,
    'P2025638',
    'Công nghệ âm thanh',
    'High Definition (HD) Audio'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    834,
    'P2025638',
    'Cổng giao tiếp',
    'LAN (RJ45), HDMI 1.4. 2 x USB 2.0, 2 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    835,
    'P2025638',
    'Giao tiếp mạng',
    'Bluetooth 5.1, Wi-Fi 6 (802.11ax)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (836, 'P2025638', 'Khe đọc thẻ nhớ', 'Không có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (837, 'P2025638', 'Webcam', 'HD webcam');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    838,
    'P2025638',
    'Tính năng khác',
    'TPM 2.0Đi kèm chuột & bàn phím'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    839,
    'P2025638',
    'Kích thước, khối lượng',
    'Dài 541.2 mm - Rộng 433.96 mm - Dày 185.34 mm - Nặng 7.03 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (840, 'P2025638', 'Bộ nguồn điện', '90 W');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    841,
    'P2025638',
    'Hệ điều hành',
    'Windows 11 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (842, 'P2025638', 'Thời gian ra mắt', '2022');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    843,
    'P2025897',
    'Công nghệ CPU',
    'i5 - 1235U - 1.30 GHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    844,
    'P2025897',
    'RAM',
    '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe trống) 3200 MHz, 2 khe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (845, 'P2025897', 'Ổ cứng', '512 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (846, 'P2025897', 'Màn hình', '23.8 inch Full HD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (847, 'P2025897', 'Card màn hình', 'Intel UHD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    848,
    'P2025897',
    'Cổng kết nối',
    'LAN (RJ45), Jack 3.5 mm, 2 x USB 2.0, 1x USB 3.2 Gen 1 Type-CHDMI out HDMI in, 3 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (849, 'P2025897', 'Hệ điều hành', 'Windows 11');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    850,
    'P2025897',
    'Kích thước',
    'Dài 539 mm - Rộng 423 mm - Dày 15 ~ 165 mm - Nặng 5.4 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    851,
    'P2025555',
    'Công nghệ CPU',
    'Intel Core i5 Alder Lake'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (852, 'P2025555', 'Loại CPU', '12500');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (853, 'P2025555', 'Tốc độ CPU', '3.00 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (854, 'P2025555', 'Tốc độ tối đa', '4.60 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (855, 'P2025555', 'Chipset', 'Intel Q670');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (856, 'P2025555', 'RAM', '8 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    857,
    'P2025555',
    'Loại RAM',
    'DDR5 2 khe (1 khe 8 GB + 1 khe trống)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (858, 'P2025555', 'Số khe RAM', '2 khe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (859, 'P2025555', 'Tốc độ Bus RAM', '4800 MHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (860, 'P2025555', 'Hỗ trợ RAM tối đa', '64 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (861, 'P2025555', 'Ổ cứng', '512 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    862,
    'P2025555',
    'Chuẩn kết nối ổ cứng',
    'Hỗ trợ khe M.2 connector for WLAN'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (863, 'P2025555', 'Kích thước màn hình', '23.8 inch');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    864,
    'P2025555',
    'Công nghệ màn hình',
    'Độ sáng 250 nits Chống chói Anti Glare IPS'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    865,
    'P2025555',
    'Độ phân giải',
    'Full HD (1920 x 1080)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (866, 'P2025555', 'Màn hình cảm ứng', 'Có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    867,
    'P2025555',
    'Thiết kế card',
    'Card đồ hoạ tích hợp'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    868,
    'P2025555',
    'Card màn hình',
    'Intel UHD Graphics 770'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    869,
    'P2025555',
    'Công nghệ âm thanh',
    'Bang & Olufsen audioRealtek High Definition Audio'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    870,
    'P2025555',
    'Cổng giao tiếp',
    'LAN (RJ45), HDMI in, 1 x SuperSpeed USB Type-C , 1 x Headphone/microphone combo, Display port, 5 x SuperSpeed USB Type-A'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    871,
    'P2025555',
    'Giao tiếp mạng',
    'Wi-Fi 6, Bluetooth 5.3'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (872, 'P2025555', 'Khe đọc thẻ nhớ', 'Không có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (873, 'P2025555', 'Webcam', '5 MP');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (874, 'P2025555', 'Tính năng khác', 'TPM 2.0');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    875,
    'P2025555',
    'Kích thước, khối lượng',
    'Dài 539.6 mm - Rộng 558.1 mm - Dày 238 mm - Nặng 8.96 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (876, 'P2025555', 'Hệ điều hành', 'Windows 11 Pro');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (877, 'P2025555', 'Thời gian ra mắt', '2022');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (878, 'P2025209', 'Công nghệ CPU', 'Apple M1');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (879, 'P2025209', 'Ổ cứng', '512 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (880, 'P2025209', 'Card màn hình', '8-core GPU');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    881,
    'P2025209',
    'Cổng kết nối',
    'HDMI, LAN (RJ45), Jack 3.5 mm, 2 x USB A, 2 x Thunderbolt 4'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (882, 'P2025209', 'Hệ điều hành', 'Mac OS');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    883,
    'P2025209',
    'Kích thước',
    'Dài 197 mm - Rộng 197 mm - Dày 36 mm - Nặng 1.2 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    884,
    'P202572',
    'Công nghệ CPU',
    'Intel Core i5 Alder Lake'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (885, 'P202572', 'Loại CPU', '12400');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (886, 'P202572', 'Tốc độ CPU', '2.50 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (887, 'P202572', 'Tốc độ tối đa', '4.40 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (888, 'P202572', 'Chipset', 'Intel B660 Chipset');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (889, 'P202572', 'RAM', '8 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    890,
    'P202572',
    'Loại RAM',
    'DDR4 2 khe (1 khe 8 GB + 1 khe trống)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (891, 'P202572', 'Số khe RAM', '2 khe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (892, 'P202572', 'Tốc độ Bus RAM', '3200 MHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (893, 'P202572', 'Hỗ trợ RAM tối đa', '64 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (894, 'P202572', 'Ổ cứng', '256 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    895,
    'P202572',
    'Chuẩn kết nối ổ cứng',
    '2 x Đầu nối M.2 cho bộ nhớ, 1 x Đầu nối M.2 cho WiFi, 2 x Hỗ trợ khe M.2 PCIe 3.0 x 1, 1 x Hỗ trợ khe cắm SSD M.2 PCIe 4.0 x 16, 4 x Hỗ trợ khe cắm HDD SATA'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    896,
    'P202572',
    'Thiết kế card:Card đồ hoạ tích hợp',
    'undefined'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    897,
    'P202572',
    'Card màn hình',
    'Intel UHD Graphics 730'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    898,
    'P202572',
    'Công nghệ âm thanh',
    'High Definition 7.1 Channel Audio'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    899,
    'P202572',
    'Cổng kết nối - Mặt sau',
    '1 x VGA (D-sub), 1 x LAN (RJ45), 1 x HDMI, 1 x Line-in, 1 x Mic-in, 1 x Tai nghe ra, 2 x PS2, 4 x USB 2.0'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    900,
    'P202572',
    'Cổng kết nối - Mặt trước',
    '1 x Headphone, 1 x Jack 3.5 mm, 4 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    901,
    'P202572',
    'Giao tiếp mạng',
    'Bluetooth 5.2, Wi-Fi 6 (802.11ax)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (902, 'P202572', 'Khe đọc thẻ nhớ', 'Không có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    903,
    'P202572',
    'Tính năng khác',
    'Đi kèm chuột & bàn phím'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    904,
    'P202572',
    'Kích thước, khối lượng',
    'Dài 339.6 mm - Rộng 292.7 mm - Dày 94.6 mm - Nặng 5 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (905, 'P202572', 'Bộ nguồn điện', '300W');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    906,
    'P202572',
    'Hệ điều hành',
    'Windows 11 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (907, 'P202572', 'Thời gian ra mắt', '2023');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    908,
    'P2025122',
    'Công nghệ CPU',
    'Intel Core i5 Alder Lake'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (909, 'P2025122', 'Loại CPU', '12400');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (910, 'P2025122', 'Tốc độ CPU', '2.50 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (911, 'P2025122', 'Tốc độ tối đa', '4.40 GHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (912, 'P2025122', 'Chipset', 'Intel B660 Chipset');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (913, 'P2025122', 'RAM', '8 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    914,
    'P2025122',
    'Loại RAM',
    'DDR4 2 khe (1 khe 8 GB + 1 khe trống)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (915, 'P2025122', 'Số khe RAM', '2 khe');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (916, 'P2025122', 'Tốc độ Bus RAM', '3200 MHz');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (917, 'P2025122', 'Hỗ trợ RAM tối đa', '64 GB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (918, 'P2025122', 'Ổ cứng', '512 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    919,
    'P2025122',
    'Chuẩn kết nối ổ cứng',
    '2 x Đầu nối M.2 cho bộ nhớ, 1 x Đầu nối M.2 cho WiFi, 2 x Hỗ trợ khe M.2 PCIe 3.0 x 1, 4 x Hỗ trợ khe cắm HDD SATA'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    920,
    'P2025122',
    'Thiết kế card',
    'Card đồ hoạ tích hợp'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    921,
    'P2025122',
    'Card màn hình',
    'Intel UHD Graphics 730'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    922,
    'P2025122',
    'Công nghệ âm thanh',
    'High Definition 7.1 Channel Audio'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    923,
    'P2025122',
    'Giao tiếp mạng',
    'Bluetooth 5.2, Wi-Fi 6'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (924, 'P2025122', 'Khe đọc thẻ nhớ', 'Không có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    925,
    'P2025122',
    'Tính năng khác',
    'Đi kèm chuột & bàn phím'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    926,
    'P2025122',
    'Kích thước, khối lượng',
    'Dài 367.8 mm - Rộng 318.9 mm - Dày 160 mm - Nặng 5.9 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (927, 'P2025122', 'Bộ nguồn điện', '300W');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    928,
    'P2025122',
    'Hệ điều hành',
    'Windows 11 Home SL'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (929, 'P2025122', 'Thời gian ra mắt', '2023');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    930,
    'P2025712',
    'Công nghệ CPU',
    'i5 - 1235U - 1.30 GHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    931,
    'P2025712',
    'RAM',
    '8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe trống), 3200 MHz2 khe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    932,
    'P2025712',
    'Ổ cứng',
    '512 GB SSD Hỗ trợ khe M.2 connector for WLANHỗ trợ khe cắm HDD SATA3 2.5 inch'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (933, 'P2025712', 'Màn hình', '21.5 inch Full HD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (934, 'P2025712', 'Card màn hình', 'Intel UHD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    935,
    'P2025712',
    'Cổng kết nối',
    'HDMI, LAN (RJ45), 2 x USB 2.0, Jack 3.5 mm, 2 x USB 3.2'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (936, 'P2025712', 'Hệ điều hành', 'Windows 11');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    937,
    'P2025712',
    'Kích thước',
    'Dài 490.3 mm - Rộng 380.7 mm - Dày 204.5 mm - Nặng 5.7 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    938,
    'P2025543',
    'Công nghệ CPU',
    'i5 - 1235U - 1.30 GHz'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    939,
    'P2025543',
    'RAM',
    '8 GB, DDR4 2 khe (1 khe 8 GB + 1 khe trống), 3200 MHz2 khe'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (940, 'P2025543', 'Ổ cứng', '512 GB SSD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (941, 'P2025543', 'Màn hình', '21.45 inch Full HD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (942, 'P2025543', 'Card màn hình', 'Intel UHD');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    943,
    'P2025543',
    'Cổng kết nối',
    'LAN (RJ45), Jack 3.5 mm, 2 x USB 2.0, HDMI, 2 x USB 3.2, 1x USB 3.2 Gen 1 Type-C'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (944, 'P2025543', 'Hệ điều hành', 'Windows 11');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    945,
    'P2025543',
    'Kích thước',
    'Dài 493 mm - Rộng 395 mm - Dày 13 ~ 165 mm - Nặng 4.84 kg'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    946,
    'A2025547',
    'Tương thích',
    'macOS (MacBook, iMac), Windows'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (947, 'A2025547', 'Độ phân giải', '1300 DPI');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    948,
    'A2025547',
    'Cách kết nối',
    'Đầu thu USB Receiver, Bluetooth'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    949,
    'A2025547',
    'Độ dài dây / Khoảng cách kết nối',
    '10 m'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (950, 'A2025547', 'Loại pin', '1 viên pin AA');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    951,
    'A2025547',
    'Trọng lượng',
    '60 g (bao gồm hộp)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (952, 'A2025547', 'Thương hiệu của', 'Trung Quốc');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (953, 'A2025547', 'Sản xuất tại', 'Trung Quốc');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    954,
    'A202549',
    'Tương thích',
    'macOS (MacBook, iMac), Windows'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (955, 'A202549', 'Độ phân giải', '4000 DPI');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    956,
    'A202549',
    'Cách kết nối',
    'Đầu thu USB Receiver, Bluetooth'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    957,
    'A202549',
    'Độ dài dây / Khoảng cách kết nối',
    '10 m'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (958, 'A202549', 'Loại pin', '1 viên pin AA');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    959,
    'A202549',
    'Trọng lượng',
    '137 g (bao gồm hộp)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (960, 'A202549', 'Thương hiệu của', 'Thụy Sĩ');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (961, 'A202549', 'Sản xuất tại', 'Trung Quốc');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (962, 'A2025366', 'Tương thích', 'Windows');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (963, 'A2025366', 'Cách kết nối', 'Dây cắm USB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (964, 'A2025366', 'Đèn LED', 'RGB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (965, 'A2025366', 'Số phím', '108 Phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (966, 'A2025366', 'Thương hiệu của', 'Đài Loan');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (967, 'A2025366', 'Hãng', 'MSI');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (968, 'A2025370', 'Pin', 'Dùng 10 giờ - Sạc 2 giờ');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (969, 'A2025370', 'Cổng sạc', 'Micro USB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    970,
    'A2025370',
    'Tương thích',
    'Android, Windows Phone, iOS (iPhone), Windows'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (971, 'A2025370', 'Tiện ích', 'Có mic thoại');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (972, 'A2025370', 'Hỗ trợ kết nối', 'Bluetooth 4.1');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (973, 'A2025370', 'Điều khiển bằng', 'Phím nhấn');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (974, 'A2025370', 'Hãng', 'Kanen');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    975,
    'A202516',
    'Tương thích',
    'Windows, MacOS (MacBook, iMac)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (976, 'A202516', 'Cách kết nối', 'Dây cắm USB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (977, 'A202516', 'Đèn LED', 'Có');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (978, 'A202516', 'Thương hiệu của', 'Trung Quốc');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (979, 'A202516', 'Hãng', 'Rapoo');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (980, 'A202568', 'Tương thích', 'MacOS, Windows');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (981, 'A202516', 'Số phím', '104 Phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    982,
    'A202568',
    'Cách kết nối',
    'USB Receiver (đầu thu USB)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (983, 'A202568', 'Số phím', '87 Phím');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (984, 'A202568', 'Thương hiệu của', 'Trung Quốc');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (985, 'A202568', 'Hãng', 'DareU');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (986, 'A2025624', 'Tổng công suất', '20 W');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (987, 'A2025624', 'Nguồn', 'Pin');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    988,
    'A2025624',
    'Thời gian sử dụng',
    'Dùng khoảng 8 tiếng'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (989, 'A2025624', 'Kết nối không dây', 'Bluetooth');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (990, 'A2025624', 'Kết nối khác', 'AUX 3.5 mm');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    991,
    'A2025624',
    'Phím điều khiển',
    'Tăng/giảm âm lượngChuyển bài hátBật/Tắt bluetoothBật/Tắt nguồn'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (992, 'A2025624', 'Thương hiệu của', 'Mỹ');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (993, 'A2025624', 'Hãng', 'Klipsch');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (994, 'A2025708', 'Tổng công suất', '30 W');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (995, 'A2025708', 'Nguồn', 'Type C 5V DC');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    996,
    'A2025708',
    'Thời gian sử dụng',
    'Dùng khoảng 12 tiếng (với 50% âm lượng) Sạc khoảng 4 tiếng'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    997,
    'A2025708',
    'Kết nối không dây',
    'Bluetooth 5.3'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    998,
    'A2025708',
    'Kết nối khác',
    'USB, AUX in, USB Type C, Micro 6.3 mm'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    999,
    'A2025708',
    'Tiện ích',
    'Chống nước IPX5, Có đèn LED'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    1000,
    'A2025708',
    'Phím điều khiển',
    'Tăng/giảm âm lượngChuyển bài hátPhát/dừng chơi nhạcBật/Tắt âm bassBật/Tắt bluetoothBật/Tắt đèn LEDBật/Tắt nguồn'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1001, 'A2025708', 'Thương hiệu của', 'Mỹ');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1002, 'A202511', 'Pin', 'Dùng 15 giờ - Sạc 2 giờ');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1003, 'A202511', 'Cổng sạc', 'Micro USB');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    1004,
    'A202511',
    'Tương thích',
    'iOS (iPhone), Android, Windows'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1005, 'A202511', 'Tiện ích', 'Có mic thoại');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1006, 'A202511', 'Hỗ trợ kết nối', 'Bluetooth 4.2');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1007, 'A202511', 'Điều khiển bằng', 'Phím nhấn');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1008, 'A202511', 'Hãng', 'Mozard.');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    1009,
    'A2025119',
    'Loại micro',
    'Micro thu âm Podcast'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    1010,
    'A2025119',
    'Tương thích',
    'Windows, MacOS, Android, iOS'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    1011,
    'A2025119',
    'Jack cắm (Đầu ra)',
    'Micro USB, XLR, Jack 3.5 mm'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (
    1012,
    'A2025119',
    'Tính năng',
    'Lọc tiếng ồn, Tự động xử lý giọng nói\r\nĐiều khiển qua ứng dụng ShurePlus MOTIV (Windows, Android, iOS)'
  );
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1013, 'A2025119', 'Thương hiệu của', 'Mỹ');
INSERT INTO
  `product_details` (
    `detail_id`,
    `product_id`,
    `detail_name`,
    `detail_value`
  )
VALUES
  (1014, 'A2025119', 'Sản xuất tại', 'Trung Quốc');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: product_images
# ------------------------------------------------------------

INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    403,
    'L202520',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681643544/1_ysodga.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    404,
    'L202520',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681643542/2_n9noqe.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    405,
    'L202520',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681643542/6_vqsxcn.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    406,
    'L202520',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681643542/4_qidnxq.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    407,
    'L202520',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681643542/3_qj2iue.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    408,
    'L202520',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681643541/5_ipwkaj.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    409,
    'L2025920',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952444/1_sccvja.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    410,
    'L2025920',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952477/6_mtxrqh.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    411,
    'L2025920',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952437/2_hqmng5.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    412,
    'L2025920',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952433/3_otjgsl.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    413,
    'L2025920',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952433/5_kboit9.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    414,
    'L2025920',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952432/4_puvumn.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    415,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/9_kkwfzn.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    416,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/8_pgym5a.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    417,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/6_t7kq3f.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    418,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/7_uom2cm.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    419,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/1_zkyxhq.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    420,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/2_i099xy.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    421,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892943/4_s38muq.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    422,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892943/3_ic0sfp.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    423,
    'L2025867',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892943/5_kq9api.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    424,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895654/11_fuxzkd.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    425,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895654/9_xygd04.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    426,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895654/9_xygd04.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    427,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895654/10_pjofw5.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    428,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895654/8_g04bkd.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    429,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895653/5_dchmpj.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    430,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895653/4_dauqz7.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    431,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895653/6_fwco2a.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    432,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895653/2_eb53x2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    433,
    'L2025589',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895653/1_sgbtfm.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    434,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893375/2_pzaaci.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    435,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893374/7_k7leol.png'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    436,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893374/10_jd00l3.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    437,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893374/4_uto9rl.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    438,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893374/3_ysrdt9.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    439,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893374/9_pnib8j.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    440,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893373/8_i4fyod.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    441,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893373/1_nzwotw.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    442,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893373/6_ouawd8.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    443,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893373/5_ihcmmq.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    444,
    'L2025111',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681892944/9_kkwfzn.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    445,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894337/8_wsebi0.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    446,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894338/9_qqmpg2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    447,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894338/7_nozalg.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    448,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894338/11_zplykr.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    449,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894338/10_kmhieh.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    450,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894337/5_nasvmg.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    451,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894337/4_aaoufq.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    452,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894337/1_c43bgc.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    453,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894337/6_kovuct.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    454,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894336/2_pacahi.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    455,
    'L2025534',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681894336/3_nue1qx.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    456,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895095/8_ywecyr.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    457,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895095/9_h6p81i.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    458,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895096/10_pgjga6.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    459,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895095/11_sb5xmx.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    460,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895095/7_djjlsv.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    461,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895094/5_mid7u2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    462,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895094/2_uglnaf.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    463,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895094/4_b7mqwj.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    464,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895094/1_nqpovf.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    465,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895094/3_mvijr9.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    466,
    'L2025818',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681895094/6_eo7srf.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    467,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896747/1_ryrciu.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    468,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896748/8_usbvaz.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    469,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896748/11_ckdnt6.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    470,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896748/10_wy8616.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    471,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896748/7_dosroy.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    472,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896747/4_gkvxjv.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    473,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896747/2_esvxmw.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    474,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896747/3_aavypz.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    475,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896747/6_sc2kso.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    476,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896748/9_uw7ufy.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    477,
    'L2025788',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681896747/5_nfvgc1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    484,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952885/8_sr5oud.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    485,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952884/6_xy4llu.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    486,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952886/9_c2jhaz.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    487,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952883/7_tmpcoj.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    488,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952881/5_wvphgu.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    489,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952880/4_tidw8r.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    490,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952880/3_jutvo0.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    491,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952878/2_xp3sbc.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    492,
    'P2025259',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681952878/1_zqm0ec.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    493,
    'P2025427',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954226/1_w5qdxp.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    494,
    'P2025427',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954226/2_lhkdxa.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    495,
    'P2025427',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954229/3_kmgo1x.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    496,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/5_ndjtia.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    497,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893798/9_lki5ux.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    498,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893798/8_omk2hk.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    499,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/7_gdnirt.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    500,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/6_bb6btw.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    501,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/5_ndjtia.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    502,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/4_htez4c.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    503,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/3_syqmtb.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    504,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893798/10_xpuzqy.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    505,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/1_em8hy8.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    506,
    'L2025911',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681893797/2_wyhmgt.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    507,
    'P2025638',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957465/1_fx9fhv.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    508,
    'P2025638',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957465/5_das6gu.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    509,
    'P2025638',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957465/6_ndlf1p.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    510,
    'P2025638',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957465/2_xt4hkd.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    511,
    'P2025638',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957465/3_xmnnxy.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    512,
    'P2025638',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957465/4_sfuglz.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (513, 'P2025638', '');
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    514,
    'P2025897',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954467/1_texneg.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    515,
    'P2025897',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954468/4_trds0q.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    516,
    'P2025897',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954467/3_t9qngm.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    517,
    'P2025897',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681954467/2_uoyene.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    518,
    'P2025555',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957870/3_q4dofc.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    519,
    'P2025555',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957869/1_vxehhu.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    520,
    'P2025555',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957869/2_cczuuh.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    521,
    'P2025555',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957869/4_iawvcl.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    522,
    'P2025555',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957869/5_vaerhi.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    523,
    'P2025555',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957869/6_rkn6ne.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    524,
    'P2025209',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681953226/4_o9ld10.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    525,
    'P2025209',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681953226/5_nxyrgs.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    526,
    'P2025209',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681953225/3_ksxscv.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    527,
    'P2025209',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681953224/1_ltynsb.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    528,
    'P2025209',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681953224/2_npoxgj.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    529,
    'P202572',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957011/6_jyyenl.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    530,
    'P202572',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957011/4_rhn8rd.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    531,
    'P202572',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957011/2_oh9dm7.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    532,
    'P202572',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957011/5_bzmk8s.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    533,
    'P202572',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957011/3_oiu0is.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    534,
    'P202572',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681957011/1_ybkxmp.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    535,
    'P2025122',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681958261/1_mcatmp.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    536,
    'P2025122',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681958261/4_xav45l.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    537,
    'P2025122',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681958261/3_vrgsyx.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    538,
    'P2025122',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681958261/2_bmspfg.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    539,
    'P2025122',
    'https://res.cloudinary.com/dvyutdqkj/image/upload/v1681958261/5_wygwa9.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    540,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-1-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    541,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-2-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    542,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-2-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    543,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-4-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    544,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-5.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    545,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-6.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    546,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-7.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    547,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-7.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    548,
    'P2025712',
    'https://cdn.tgdd.vn/Products/Images/5698/293648/hp-aio-22-dd2002d-i5-6k7g1pa-9.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    549,
    'P2025543',
    'https://cdn.tgdd.vn/Products/Images/5698/304412/asus-expertcenter-aio-a3202wbak-i5-wa019w-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    550,
    'P2025543',
    'https://cdn.tgdd.vn/Products/Images/5698/304412/asus-expertcenter-aio-a3202wbak-i5-wa019w-3.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    551,
    'P2025543',
    'https://cdn.tgdd.vn/Products/Images/5698/304412/asus-expertcenter-aio-a3202wbak-i5-wa019w-4.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    552,
    'P2025543',
    'https://cdn.tgdd.vn/Products/Images/5698/304412/asus-expertcenter-aio-a3202wbak-i5-wa019w-5.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    553,
    'P2025543',
    'https://cdn.tgdd.vn/Products/Images/5698/304412/asus-expertcenter-aio-a3202wbak-i5-wa019w-7.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    554,
    'A2025547',
    'https://cdn.tgdd.vn/Products/Images/86/299933/chuot-khong-day-bluetooth-silent-rapoo-m650-tet-2023-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    555,
    'A2025547',
    'https://cdn.tgdd.vn/Products/Images/86/299933/chuot-khong-day-bluetooth-silent-rapoo-m650-tet-2023-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    556,
    'A2025547',
    'https://cdn.tgdd.vn/Products/Images/86/299933/chuot-khong-day-bluetooth-silent-rapoo-m650-tet-2023-4.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    557,
    'A2025547',
    'https://cdn.tgdd.vn/Products/Images/86/299933/chuot-khong-day-bluetooth-silent-rapoo-m650-tet-2023-3.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    558,
    'A202549',
    'https://cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    559,
    'A202549',
    'https://cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    560,
    'A202549',
    'https://cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-3.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    561,
    'A202549',
    'https://cdn.tgdd.vn/Products/Images/86/299931/chuot-khong-day-logitech-signature-m650-den-size-m-4.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    562,
    'A2025366',
    'https://cdn.tgdd.vn/Products/Images/4547/283688/co-day-gaming-msi-vigor-gk30-us-den-1-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    563,
    'A2025366',
    'https://cdn.tgdd.vn/Products/Images/4547/283688/co-day-gaming-msi-vigor-gk30-us-den-2-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    564,
    'A2025366',
    'https://cdn.tgdd.vn/Products/Images/4547/283688/co-day-gaming-msi-vigor-gk30-us-den-3-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    565,
    'A2025366',
    'https://cdn.tgdd.vn/Products/Images/4547/283688/co-day-gaming-msi-vigor-gk30-us-den-4-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    566,
    'A2025370',
    'https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-xanh-2-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    567,
    'A2025370',
    'https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-xanh-3-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    568,
    'A2025370',
    'https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-xanh-4-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    569,
    'A2025370',
    'https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-xanh-5-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    570,
    'A2025370',
    'https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-xanh-6-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    571,
    'A2025370',
    'https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-xanh-7-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    572,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-1-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    573,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    574,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-3-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    575,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-4-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    576,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-4-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    577,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-6-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    578,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-7-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    579,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-8-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    580,
    'A202516',
    'https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-9-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    581,
    'A202568',
    'https://cdn.tgdd.vn/Products/Images/4547/273015/khong-day-dareu-ek807g-2-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    582,
    'A202568',
    'https://cdn.tgdd.vn/Products/Images/4547/273015/khong-day-dareu-ek807g-4-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    583,
    'A202568',
    'https://cdn.tgdd.vn/Products/Images/4547/273015/khong-day-dareu-ek807g-3-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    584,
    'A202568',
    'https://cdn.tgdd.vn/Products/Images/4547/273015/khong-day-dareu-ek807g-5-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    585,
    'A202568',
    'https://cdn.tgdd.vn/Products/Images/4547/273015/khong-day-dareu-ek807g-6.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    586,
    'A2025624',
    'https://cdn.tgdd.vn/Products/Images/2162/304557/loa-bluetooth-klipsch-heritage-groove-matte-black-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    587,
    'A2025624',
    'https://cdn.tgdd.vn/Products/Images/2162/304557/loa-bluetooth-klipsch-heritage-groove-matte-black-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    588,
    'A2025624',
    'https://cdn.tgdd.vn/Products/Images/2162/304557/loa-bluetooth-klipsch-heritage-groove-matte-black-3.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    589,
    'A2025624',
    'https://cdn.tgdd.vn/Products/Images/2162/304557/loa-bluetooth-klipsch-heritage-groove-matte-black-4.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    590,
    'A2025624',
    'https://cdn.tgdd.vn/Products/Images/2162/304557/loa-bluetooth-klipsch-heritage-groove-matte-black-5.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    591,
    'A2025624',
    'https://cdn.tgdd.vn/Products/Images/2162/304557/loa-bluetooth-klipsch-heritage-groove-matte-black-6.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    592,
    'A2025708',
    'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-1-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    593,
    'A2025708',
    'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-2-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    594,
    'A2025708',
    'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-3-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    595,
    'A2025708',
    'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-4-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    596,
    'A2025708',
    'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-5-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    597,
    'A2025708',
    'https://cdn.tgdd.vn/Products/Images/2162/304547/loa-bluetooth-monster-sparkle-6.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    598,
    'A202511',
    'https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-hong-1-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    599,
    'A202511',
    'https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-hong-2-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    600,
    'A202511',
    'https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-hong-3-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    601,
    'A202511',
    'https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-hong-4-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    602,
    'A202511',
    'https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-hong-5-org.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    603,
    'A2025119',
    'https://cdn.tgdd.vn/Products/Images/12498/304965/micro-co-day-shure-mv7-s-1.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    604,
    'A2025119',
    'https://cdn.tgdd.vn/Products/Images/12498/304965/micro-co-day-shure-mv7-s-2.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    605,
    'A2025119',
    'https://cdn.tgdd.vn/Products/Images/12498/304965/micro-co-day-shure-mv7-s-3.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    606,
    'A2025119',
    'https://cdn.tgdd.vn/Products/Images/12498/304965/micro-co-day-shure-mv7-s-4.jpg'
  );
INSERT INTO
  `product_images` (`image_id`, `product_id`, `file_path`)
VALUES
  (
    607,
    'A2025119',
    'https://cdn.tgdd.vn/Products/Images/12498/304965/micro-co-day-shure-mv7-s-5.jpg'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: product_likes
# ------------------------------------------------------------

INSERT INTO
  `product_likes` (`like_id`, `product_id`, `customer_id`)
VALUES
  (6, 'L2025589', '2057925');
INSERT INTO
  `product_likes` (`like_id`, `product_id`, `customer_id`)
VALUES
  (16, 'A2025119', '2057925');
INSERT INTO
  `product_likes` (`like_id`, `product_id`, `customer_id`)
VALUES
  (17, 'A202516', '2057925');
INSERT INTO
  `product_likes` (`like_id`, `product_id`, `customer_id`)
VALUES
  (18, 'A2025708', '2057925');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: products
# ------------------------------------------------------------

INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A202511',
    'Tai nghe Bluetooth Chụp Tai Mozard K8',
    '<h3><strong>Thiết kế đầy cá tính, 2 phiên bản màu xanh - hồng cực kỳ bắt mắt</strong></h3><p><a href=\"https://www.thegioididong.com/tai-nghe\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Tai nghe</a>&nbsp;được làm tinh xảo, bộ khung cứng cáp, có hệ thống treo tiện dụng và chụp tai phủ bên ngoài bởi lớp chất liệu mềm mại, đeo vào đầu nhẹ nhàng, không làm mỏi, đau vùng đầu - cổ - tai.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-1.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/ban-phim/khong-day-dareu-ek807g\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Có thể chỉnh&nbsp;</strong></a><strong>kéo giãn khung tai nghe đến 3.7 cm</strong>, dễ dàng tùy chỉnh&nbsp;<a href=\"https://www.thegioididong.com/tai-nghe-mozard\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">tai nghe Mozard</a>&nbsp;phù hợp với cỡ đầu của bạn và đem đến cảm giác sử dụng thoải mái nhất.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8--8.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8--8.jpg\"></strong></a></p><h3><strong>Đệm tai bao bọc quanh tai nghe dày dặn nên đeo rất êm ái, dễ chịu</strong></h3><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-2.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-2.jpg\"></strong></a></p><h3><strong>Kết nối dạng không dây qua&nbsp;Bluetooth 4.2 hoặc có dây qua cổng 3.5 mm</strong></h3><p>Công nghệ<strong>&nbsp;Bluetooth 4.2&nbsp;</strong>cho kết nối nhanh, khoảng cách kết nối xa đến&nbsp;<strong>10 m</strong>. Nếu thích kiểu kết nối thiết bị có dây truyền thống, bạn có thể sử dụng thêm dây cáp có cổng 3.5 để nối vào.&nbsp;</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-3.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-3.jpg\"></strong></a></p><h3><strong>Chất âm gây ngạc nhiên với độ rõ nét cao, âm bass sâu, khỏe</strong></h3><p>Tái hiện<strong>&nbsp;âm thanh chi tiết, rõ ràng</strong>&nbsp;nhờ có driver lớn, thiết kế cách âm, cho người dùng dễ dàng hoàn toàn chìm đắm vào giai điệu du dương của nhạc trữ tình, cuốn theo tiết tấu của các bài rap, rock mạnh mẽ.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-5.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-5.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/ban-phim/khong-day-dareu-ek807g\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Có microphone cho&nbsp;</strong></a><strong>giọng nói trong trẻo</strong>, nghe và nói dễ dàng khi chơi game, đàm thoại.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-4.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-4.jpg\"></strong></a></p><h3><strong>Dung lượng pin&nbsp;300 mAh cung cấp 15 giờ sử dụng, sạc khoảng 2 giờ với cổng Micro USB quen thuộc</strong></h3><p>Mozard K8 mang đến thời gian trải nghiệm dài, yên tâm hơn khi chọn&nbsp;<a href=\"https://www.thegioididong.com/tai-nghe-bluetooth\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">tai nghe Bluetooth</a>&nbsp;đồng hành trong các chuyến đi xa, nhất là đến những nơi không có điện.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-6.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-6.jpg\"></strong></a></p><h3><strong>Sử dụng nút nhấn điều khiển trực quan tiện dụng</strong></h3><p>-&nbsp;<strong>Nút nguồn:</strong>&nbsp;Bật/Tắt tai nghe, kết nối Bluetooth.</p><p>-&nbsp;<strong>Nút ký hiệu +</strong>: Tăng âm lượng.</p><p>-&nbsp;<strong>Nút ký hiệu -:</strong>&nbsp;Giảm âm lượng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-7.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/235955/bluetooth-mozard-k8-7.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/ban-phim/khong-day-dareu-ek807g\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Thu hút với thiết kế của&nbsp;</strong></a><a href=\"https://www.thegioididong.com/tai-nghe/bluetooth-mozard-k8\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">tai nghe Chụp Tai Bluetooth Mozard K8</a>&nbsp;nhưng khi dùng thử, bạn sẽ mê ngay chất âm, khả năng kết nối vượt trội mà tai nghe mang lại. Nếu yêu, đừng chần chừ nhấn nút MUA NGAY để sở hữu ngay một chiếc cho riêng mình.</p>',
    700.00,
    0.00,
    'Accessory',
    16
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A2025119',
    'Micro có dây Shure MV7 S',
    '<h3><a href=\"https://www.thegioididong.com/micro-thu-am-podcast-livestream/micro-co-day-shure-mv7-s\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Micro có dây Shure MV7 S</strong></a><strong>&nbsp;là chiếc micro chuyên dụng để làm Podcast, livestream, thu&nbsp;tiếng nói rõ ràng, sắc nét, điều khiển bằng điện thoại linh hoạt qua app&nbsp;ShurePlus MOTIV, ghi âm được qua cổng&nbsp;XLR và micro USB.</strong></h3><p>•&nbsp;Shure MV7 S có thiết kế tối giản, màu bạc thời trang, phối hợp hài hòa với các món đồ nội thất, dụng cụ trong phòng thu của bạn. Có khung kim loại cho bạn gắn micro vào chân đế hay tay micro tiện lợi.&nbsp;</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/micro-thu-am-podcast-livestream-shure\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Micro Shure</a>&nbsp;có dải tần số từ&nbsp;<strong>50 Hz - 16 kHz</strong>&nbsp;cho ghi được độ sâu của âm thanh mà bạn cần, chất âm trong trẻo, trung thực.&nbsp;</p><p>• Công nghệ&nbsp;<strong>xử lý giọng nói tự động</strong>&nbsp;ngăn chặn tiếng ồn trong môi trường, chỉ tập trung vào giọng nói của bạn bằng tia&nbsp;laser nhằm đảm bảo bản thu chất lượng.&nbsp;</p><p>• Với ứng dụng&nbsp;<strong>ShurePlus MOTIV</strong>, người dùng điều khiển từ xa linh hoạt, ở&nbsp;chế độ Auto Level bạn có thể kiểm soát tone giọng, khoảng cách micro,&nbsp;chế độ Manual Mode kiểm soát âm thanh, EQ,&nbsp;Mic Gain,...</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/micro-thu-am-podcast-livestream\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Micro</a>&nbsp;có tín hiệu ổn định trong khoảng cách sử dụng tới&nbsp;<strong>50 cm</strong>.</p><p>• Thiết kế có các giao tiếp: XLR, micro USB, jack 3.5 mm dễ dàng phối ghép với&nbsp;<a href=\"https://www.dienmayxanh.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính</a>,&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">điện thoại</a>,&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-bang\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính bảng</a>, Amply cùng các thiết bị phòng thu chuyên nghiệp. Có thể ghi âm đồng thời với cả&nbsp;XLR và micro USB mà vẫn đảm bảo bản thu chất lượng, không bị lỗi.&nbsp;</p>',
    8500.00,
    10.00,
    'Accessory',
    17
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A202516',
    'Bàn Phím Cơ Có Dây Gaming Rapoo V500Pro',
    '<h3><a href=\"https://www.thegioididong.com/ban-phim-rapoo\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Bàn phím Rapoo</strong></a><strong>&nbsp;với 104 phím thông dụng, phím bấm nhạy bén, tuổi thọ cao</strong></h3><p>Rapoo V500 Pro trang bị đầy đủ các phím bấm cơ bản với hành trình phím rất đỗi quen thuộc, dễ dàng để người dùng mới tiếp cận và làm quen ngay từ lần đầu sử dụng.</p><p>Bàn phím cơ sử dụng switch treo cho độ nảy, độ đàn hồi và độ nhạy cực tốt,&nbsp;<strong>Switch Rapoo Blue</strong>&nbsp;tuổi thọ tốt lên đến&nbsp;<strong>60 triệu lượt nhấn</strong>, đảm bảo bàn phím bền bỉ đồng hành cùng bạn trong suốt thời gian dài.</p><p>Nhờ được trang bị&nbsp;<strong>hệ thống chống xung đột</strong>&nbsp;trên toàn bộ các phím, thật thoải mái để sử dụng cùng lúc nhiều phím, hoặc thao tác nhấn phím cực nhanh trên Rapoo V500 Pro mà không xảy ra hiện tượng xung đột tín hiệu, đảm bảo cho độ chuẩn xác trên từng lệnh thao tác.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-012958.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-012958.jpg\"></strong></a></p><h3><strong>Thiết kế hiện đại, tinh tế, gọn đẹp cho không gian dùng</strong></h3><p>Dù là bàn phím gaming nhưng Rapoo V500 Pro lại có thiết kế khá đơn giản, trang nhã để bạn dễ dàng đặt nó trên bàn làm việc gia đình hoặc cả ở văn phòng, hay mang theo sử dụng khi ra ngoài.</p><p>Khung viền bàn phím sử dụng chất liệu thép để bảo vệ chắc chắn cho toàn bộ thiết bị, giảm chấn hiệu quả do các va chạm thông thường khi sử dụng. Đồng thời, bề mặt chính còn được phủ lớp hợp kim nhôm sáng bóng, dễ lau chùi.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-012956.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-012956.jpg\"></strong></a></p><p><a href=\"https://thegioididong.com/sp-283688\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Phím cơ quen thuộc độ trũng bề mặt vừa phải, chất liệu nhựa nhám thao tác chắc tay, thiết kế che chắn hiệu quả cho các bo mạch bên trong để ngăn nhiễm ẩm trong các tình huống bị đổ tràn nước.</strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-013000.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-013000.jpg\"></strong></a></p><p><a href=\"https://thegioididong.com/sp-283688\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Mặt đáy bàn phím có độ bám tốt, chống trượt, hạn chế xê dịch trên bề mặt sử dụng khi dùng. Khi cần tạo độ nghiêng cho bàn phím, có thể dùng 2 chân nâng mặt đế để thao tác phím thuận tay hơn.</strong></a></p><h3><strong>Dùng dây nối đầu cáp USB thông dụng, dễ dàng liên kết với PC,&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop</strong></a></h3><p><a href=\"https://www.thegioididong.com/ban-phim\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn phím</a>&nbsp;tương thích với hệ điều hành&nbsp;<strong>Windows và MacOS</strong>, chiều dài dây nối&nbsp;<strong>1.81 m</strong>&nbsp;dùng linh hoạt.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-013004.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/4547/246178/co-co-day-gaming-rapoo-v500pro-vang-xanh-251121-013004.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/ban-phim/co-co-day-gaming-rapoo-v500pro-vang-xanh\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn Phím Cơ Có Dây Gaming Rapoo V500Pro Vàng Xanh</a>&nbsp;sẽ mang đến những trải nghiệm thật ấn tượng cho từng tác vụ mà bạn sử dụng, làm việc hiệu quả hơn, chiến game thích thú hơn.</p>',
    1000.00,
    10.00,
    'Accessory',
    19
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A2025366',
    'Bàn Phím Có Dây Gaming MSI Vigor GK30 US',
    '<h3><a href=\"https://thegioididong.com/sp-283688\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Bàn phím Có dây Gaming MSI Vigor GK30 US Đen</strong></a><strong>&nbsp;với chân đế gaming vững vàng ngay bên dưới phím Space Bar đem đến sự vững vàng, chống trượt khi chơi game.</strong></h3><p>•&nbsp;Thiết kế phím nổi chống nước không chỉ giúp bàn phím đẹp hơn, mà còn giúp cho bạn dễ dàng lau chùi bàn phím hơn khi dính bẩn.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/ban-phim-msi\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn phím MSI</a>&nbsp;được trang bị các switch tịnh tiến tương tự switch cơ học với ba bộ phận đem đến trải nghiệm gõ phím chắc chắn với độ bền hơn 12 triệu lần nhấn.</p><p>•&nbsp;Thông qua phần mềm MSI Center bạn có thể tuỳ biến&nbsp;<a href=\"https://www.thegioididong.com/ban-phim-gaming\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">bàn phím gaming</a>&nbsp;với hàng triệu màu sắc và đến 7 hiệu ứng đèn trên 6 khu vực.</p><p>•&nbsp;Ngoài ra, với các phím tắt tiện lợi bạn dễ dàng thay đổi nhanh tốc độ, hướng hay chế độ đèn mà không cần cài đặt phần mềm. Phía trên của bàn phím là dãy phím tắt điều chỉnh âm lượng.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/ban-phim-co-day\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn phím có dây</a>&nbsp;kết nối nhanh chóng với PC, Laptop qua cổng USB với đầu nối mạ vàng, dây dài 1.85 m.</p>',
    900.00,
    10.00,
    'Accessory',
    18
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A2025370',
    'Tai nghe Bluetooth Chụp Tai Kanen K9',
    '<h3><a href=\"https://www.thegioididong.com/tai-nghe/tai-nghe-bluetooth-kanen-k9\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Tai nghe Bluetooth Chụp Tai Kanen K9</strong></a><strong>&nbsp;mang đến thiết kế gọn đẹp, thời trang và năng động</strong></h3><h3><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-1-fix.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-1-fix.jpg\"></strong></a></h3><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/6.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/6.jpg\"></strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/3.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/3.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/tai-nghe-kanen\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Tai nghe Kanen</a>&nbsp;có thể điều chỉnh gọng dễ dàng để phù hợp với mỗi người dùng</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/7.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/7.jpg\"></strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-2-fix.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-2-fix.jpg\"></strong></a></p><h3><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-101520-091552.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-101520-091552.jpg\"></strong></a></h3><h3><strong>Cách sử dụng&nbsp;</strong><a href=\"https://www.thegioididong.com/tai-nghe\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>tai nghe</strong></a></h3><p>- Nút tròn ấn giữ:&nbsp;Bật/tắt nguồn.</p><p>- Nút tròn ấn 1 lần:&nbsp;Dừng/phát nhạc, nhận/ngắt cuộc gọi.</p><p>- Nút tròn ấn 2 lần:&nbsp;Kích hoạt Siri, Bixby,...</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/9.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/9.jpg\"></strong></a></p><h3><strong>Cách kết nối&nbsp;</strong><a href=\"https://www.thegioididong.com/tai-nghe-kanen-bluetooth\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>tai nghe Bluetooth Kanen</strong></a></h3><p>- Bạn ấn&nbsp;nút nguồn (hình tròn), lúc này tai nghe sẽ&nbsp;chớp&nbsp;xanh đỏ&nbsp;liên tục&nbsp;để chờ kết nối.</p><p>- Mở Bluetooth trong&nbsp;<a href=\"https://www.thegioididong.com/dien-thoai\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">điện thoại</a>&nbsp;và dò tìm tên&nbsp;K9&nbsp;để kết nối.</p><p>- Tai nghe sẽ tự động kết nối với điện thoại ở những lần sau.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/1.jpg\"></strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/2-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/2-1.jpg\"></strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/4.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/4.jpg\"></strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-3-fix.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/54/187375/tai-nghe-bluetooth-kanen-k9-3-fix.jpg\"></strong></a></p>',
    600.00,
    0.00,
    'Accessory',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A202549',
    'Chuột Không dây Bluetooth Silent Logitech Signature M650',
    '<h3><a href=\"https://www.thegioididong.com/chuot-may-tinh/chuot-khong-day-logitech-silent-signature-m650-size-m\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Chuột Không dây Bluetooth Silent Logitech Signature M650</strong></a><strong>&nbsp;sở hữu kiểu dáng công thái học cùng độ phân giải lớn, đáp ứng tốt gần như mọi nhu cầu từ sử dụng cơ bản tới những tác vụ chuyên nghiệp của người dùng.</strong></h3><p>•&nbsp;Thiết kế gọn đẹp, vừa tay, màu sắc thời thượng, lịch lãm, viền bên được lót thêm miếng cao su giúp cầm và sử dụng chuột chắc chắn hơn.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/chuot-may-tinh-chuot-khong-day\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Chuột không dây</a>&nbsp;này có thể kết nối được với phần lớn các máy tính hiện nay nhờ tương thích với các hệ điều hành phổ biến: Windows và macOS.</p><p>•&nbsp;Độ phân giải lên tới 4000 DPI, cho phản hồi cực kỳ nhanh chóng và chính xác.</p><p>•&nbsp;Kích thước&nbsp;<a href=\"https://www.thegioididong.com/chuot-may-tinh\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">chuột</a>&nbsp;cỡ vừa (size M), phù hợp với kích cỡ tay của phần đông người dùng (chiều dài tay khoảng&nbsp;17.5 cm - 19 cm).</p><p>•&nbsp;Phím nhấn và con lăn được chế tác chỉn chu, cuộn siêu nhanh, click dễ dàng. Thêm vào đó, công nghệ SilentTouch giúp giảm hiệu quả tiếng ồn khi nhấp chuột, cho phép bạn tập trung hơn vào công việc.</p><p>•&nbsp;Kết nối nhanh chóng và tiện lợi qua 2 cách: Bluetooth và đầu thu USB, cho người dùng đa dạng sự lựa chọn. Với 2 cách kết nối này đều cho phép bạn thoải mái di chuyển&nbsp;<a href=\"https://www.thegioididong.com/chuot-may-tinh-logitech\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">chuột Logitech</a>&nbsp;này&nbsp;ở phạm vi khá xa, lên tới khoảng 10 m, linh động hơn trong quá trình sử dụng.</p>',
    600.00,
    0.00,
    'Accessory',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A2025547',
    'Chuột Không dây Bluetooth Silent Rapoo M650 Lucky Cat',
    '<h3><strong>Nổi bật với thiết kế đậm chất \"Xuân 2023\' cùng độ nhạy cao,&nbsp;</strong><a href=\"https://www.thegioididong.com/chuot-may-tinh/chuot-khong-day-bluetooth-silent-rapoo-m650-tet-2023\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>chuột Không dây Bluetooth Silent Rapoo M650</strong></a><strong>&nbsp;hứa hẹn sẽ là món phụ kiện đáng đầu tư, đáp ứng hầu hết các yêu cầu khi làm việc và học tập hàng ngày của bạn.</strong></h3><p>•&nbsp;Thiết kế bên ngoài vô cùng gọn gàng, màu đỏ chủ đạo nổi bật cùng hoạ tiết chú mèo thần tài dễ thương đem sắc xuân ngập tràn đến cho không gian làm việc của bạn.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/chuot-may-tinh\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Chuột</a>&nbsp;được chế tác tỉ mỉ, vỏ ngoài chắc chắn cùng kiểu thiết kế mỏng giúp quá trình cất giữ thêm phần tiện lợi.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/chuot-may-tinh-rapoo\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Chuột Rapoo</a>&nbsp;với độ phân giải đạt 1300 DPI, cho phép chơi game hay thực hiện các tác vụ chỉnh sửa hình ảnh thông thường vô cùng tốt, đáp ứng yêu cầu cơ bản hàng ngày của bạn.</p><p>•&nbsp;Kết nối không dây với 2 cách sau: Sử dụng đầu thu USB hoặc kết nối qua Bluetooth hiện đại, đa dạng sự lựa chọn cho người dùng. Kết nối dễ dàng cho hầu hết các dòng máy trên thị trường nhờ khả năng tương thích với các thiết bị sử dụng hệ điều hành Windows và macOS.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/chuot-may-tinh-silent\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Chuột Silent</a>&nbsp;cho phép nhấp chuột êm ái, hạn chế tối đa tiếng ồn, giúp bạn tập trung vào công việc, hạn chế ảnh hưởng đến người xung quanh.</p><p>•&nbsp;Cuộn con lăn dễ dàng, xem tài liệu, đọc báo,... nhanh chóng, sử dụng chuột thoải mái trong mọi tình huống.</p>',
    600.00,
    0.00,
    'Accessory',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A2025624',
    'Loa Bluetooth Klipsch Heritage Groove',
    '<h3><strong>Loa Bluetooth Klipsch Heritage Groove nổi bật với&nbsp;thiết kế cổ điển sang trọng, công suất 20 W, sử dụng liên tục đến 8 tiếng, có mirco đàm thoại thuận tiện cho người dùng.&nbsp;</strong></h3><h3><strong>Thiết kế sang trọng, chất liệu cao cấp</strong></h3><p><a href=\"https://www.thegioididong.com/loa-laptop-bluetooth\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Loa Bluetooth</a>&nbsp;này có màu đen sang trọng, phủ bên ngoài là lớp ê - căng màu vàng cổ điển. Loa có dạng hình chữ nhật, nhỏ gọn với&nbsp;khối lượng 0.95 kg, thuận tiện cho việc di chuyển. Vỏ&nbsp;loa&nbsp;được làm bằng gỗ MDF tăng cường tính thẩm mỹ, bền bỉ giúp bảo vệ được các linh kiện bên trong.&nbsp;</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-1-1-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-1-1-1.jpg\"></strong></a></p><h3><strong>Chất lượng âm thanh tuyệt đỉnh</strong></h3><p><a href=\"https://www.thegioididong.com/loa-laptop-klipsch\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Loa&nbsp;Klipsch</a>&nbsp;có&nbsp;tổng công suất 20 W&nbsp;cho cường độ âm lớn, phù hợp cho không gian có diện tích từ&nbsp;10 - 15m2, âm thanh phát ra sống động, mượt mà đến từng chi tiết. Loa trang bị&nbsp;cả loa bass lẫn loa treble giúp&nbsp;tái tạo âm bass đầy uy lực và sâu lắng, âm treble nhẹ nhàng, lên các nốt cao hay mở âm lượng lớn cũng không bì rè hay mất tiếng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-2-1-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-2-1-1.jpg\"></strong></a></p><h3><strong>Khả năng kết nối Bluetooth</strong></h3><p>Người dùng có thể kết nối nhanh chóng với&nbsp;<a href=\"https://www.thegioididong.com/loa-laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">loa</a>&nbsp;thông qua cổng Bluetooth từ các thiết bị di động từ xa một cách dễ dàng và tiện lợi.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-4-1-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-4-1-1.jpg\"></strong></a></p><h3><strong>Điều khiển dễ dàng, phản hồi nhanh chóng</strong></h3><p>Loa có bảng điều khiển bằng nút bấm cơ học được trang bị ngay&nbsp;mặt trước của loa với các nút chức năng như bật/tắt nguồn, kết nối Bluetooth, cắm dây line 3.5, nút Pause/Play, nút tăng/giảm âm lượng. Bên cạnh đó, loa Klipsch Groove còn được trang bị chức năng thu âm, gọi điện, mic bắt xa và khá tiện lợi khi ở chế độ rảnh tay.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-7-1-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-7-1-1.jpg\"></strong></a></p><h3><strong>Kết nối khác thông qua các cổng vật lý</strong></h3><p>Loa Klipsch còn trang bị cổng kết nối ngoại vi qua cổng AUX 3.5 mm để bạn có thể kết nối thiết bị với các nguồn phát khác từ đầu phát CD, điện thoại, laptop giúp nâng cao nhu cầu giải trí, tăng hiệu suất âm thanh.&nbsp;</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-8-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/2162/286879/loa-klipsch-heritage-groove-matte-black-8-1.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/tai-nghe/tai-nghe-bluetooth-kanen-k9\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Nhìn chung, loa Bluetooth Klipsch Heritage Groove có kiểu dáng cổ điển, thu hút mọi ánh nhìn, tạo điểm nhấn cho không gian nhà. Với công suất 20 W cùng có khả năng kết nối Bluetooth hiện đại thì đây là một sản phẩm không thể thiếu đối với các gia đình thích cổ điển.</strong></a></p>',
    3000.00,
    0.00,
    'Accessory',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A202568',
    'Bàn Phím Không Dây DareU EK807G',
    '<h3><a href=\"https://www.thegioididong.com/ban-phim/khong-day-dareu-ek807g\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Bàn Phím Không Dây DareU EK807G</strong></a><strong>&nbsp;có trọng lượng nhẹ&nbsp;với kích thước gọn gàng, thiết kế không dây cho phép dùng linh hoạt, để bạn tùy chọn vị trí sử dụng phù hợp nhất cho riêng mình.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/ban-phim-khong-day\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn phím không dây</a>&nbsp;gây ấn tượng mạnh với&nbsp;màu đen đẹp mắt, thiết kế tuân thủ chuẩn&nbsp;công thái học, giảm áp lực cho ống cổ tay tạo cảm giác thoải mái khi làm việc trong thời gian dài hơn.</p><p>•&nbsp;Các phím bấm có kích cỡ và khoảng cách hợp lý giúp bạn thao tác nhanh nhẹn, hạn chế tình trạng nhầm lẫn các lệnh, tốc độ phản hồi tốt, nhấn êm.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/ban-phim-dareu\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn phím DareU</a>&nbsp;kết nối với&nbsp;laptop, màn hình máy tính, màn hình game,… bằng&nbsp;<strong>USB Receiver</strong>&nbsp;(đầu thu USB)&nbsp;2.4 GHz với đường truyền tin cậy, hầu như không bị nhiễu sóng.</p><p>•&nbsp;Là chiếc bàn phím cơ thực thụ, DareU EK807G được lắp hệ thống&nbsp;<strong>Blue&nbsp;switch</strong>&nbsp;phù hợp với nhiều người sử dụng để chơi game lẫn văn phòng.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/ban-phim\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Bàn phím</a>&nbsp;sử dụng&nbsp;<strong>2 viên pin AAA</strong>&nbsp;cực kỳ thông dụng, dễ mua, thời lượng sử dụng pin tối đa có thể lên tới 6 tháng.</p>',
    800.00,
    0.00,
    'Accessory',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'A2025708',
    'Loa Bluetooth Monster Sparkle',
    '<h3><a href=\"https://www.thegioididong.com/loa-laptop/loa-bluetooth-monster-sparkle\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Loa Bluetooth Monster Sparkle</strong></a><strong>&nbsp;với hệ thống đèn LED nổi bật cùng thiết kế thuôn dài đẹp mắt, công nghệ âm thanh sống động, tốc độ kết nối nhanh chóng, tiện lợi sử dụng trong những bữa tiệc cá nhân và các buổi tụ họp bạn bè hàng ngày.</strong></h3><p>•&nbsp;Thiết kế gọn gàng, khối lượng khoảng 2.6 kg dễ dàng di chuyển khi cần, phù hợp với nhiều không gian nội thất trong nhà.</p><p>•&nbsp;Cuốn hút trong từng điệu nhạc với mức công suất 30 W cùng công nghệ âm thanh độc quyền Monster Sound trên&nbsp;<a href=\"https://www.thegioididong.com/loa-laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">loa</a>&nbsp;đem đến chất âm sống động, cảm giác như đang tận hưởng không gian giải trí tại rạp chiếu phim.</p><p>• Dung lượng pin lớn, lưu trữ năng lượng cho cả ngày dài sử dụng, sạc 1 lần khoảng 4 tiếng là có ngay 12 giờ sử dụng liên tục (ở mức 50% âm lượng).</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/loa-laptop-monster\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Loa Monster</a>&nbsp;hỗ trợ công nghệ Bluetooth 5.3 cho tốc độ kết nối nhanh hơn, đường truyền ổn định và mượt mà, liền mạch trải nghiệm âm thanh của bạn.</p><p>•&nbsp;Hiệu ứng đèn LED nhấp nháy nhiều màu sắc cùng khả năng chuyển nhịp theo tiếng nhạc cho người dùng mãn nhãn.</p>',
    2000.00,
    10.00,
    'Accessory',
    19
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025111',
    'Laptop Lenovo ThinkBook 14s G2 ITL i5 1135G7/8GB/512GB/Win10',
    '<h3><strong>Lenovo ThinkBook 14s G2 ITL i5 (20VA000NVN) là chiếc&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=hoc-tap-van-phong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop học tập - văn phòng</strong></a><strong>&nbsp;phù hợp với học sinh, sinh viên hay người làm văn phòng cần một chiếc máy tính mỏng nhẹ nhưng vẫn có cấu hình ổn định.</strong></h3><h3><strong>Thiết kế gọn nhẹ, sang trọng</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-lenovo?g=lenovo-thinkbook\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Lenovo ThinkBook</a>&nbsp;đi theo lối thiết kế đơn giản, hiện đại với kiểu dáng vuông vắn, sắc sảo từ kim loại nguyên khối với 2 tông màu xám bóng và xám nhám, thân máy gọn nhẹ chỉ nặng&nbsp;<strong>1.27 kg</strong>, mỏng&nbsp;<strong>14.9 mm</strong>&nbsp;bạn có thể cầm bằng một tay. Kích thước tương đương như khổ giấy A4 (Dài 322 mm - Rộng 207 mm) dễ dàng để vào balo, túi xách tối ưu cho việc di chuyển làm việc và học tập của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-02.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-02.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Tuy máy khá mỏng nhưng vẫn được trang bị đầy đủ các cổng kết nối thông dụng: 1 cổng Thunderbolt 4 USB-C có tốc độ truyền tải đến 40 Gbps, 1 cổng HDMI hỗ trợ cho việc kết nối máy chiếu hoặc tivi để thuyết trình và 1 jack cắm tai nghe 3.5, 2 cổng USB 3.2. Bên cạnh kết nối có dây máy còn hỗ trợ&nbsp;</strong></a><strong>Bluetooth 5.1</strong>&nbsp;cho phạm vi kết nối ổn định lên đến hơn 10 m,<strong>&nbsp;Wi-Fi 6 AX201</strong><a href=\"https://www.thegioididong.com/hoi-dap/wi-fi-chuan-80211ax-la-gi-tim-hieu-ve-wi-fi-the-he-thu-6-1187524\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">&nbsp;</a>cho đường truyền mượt mà, nhanh chóng với tốc độ 10.000 Mbps.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-11.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-11.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Bàn phím có hành trình phím tốt, rộng rãi và được tích hợp đèn nền hỗ trợ gõ phím chính xác khi bạn sử dụng ở nơi ánh sáng yếu. Bàn di chuột có kích thước lớn và đặt hơi lệch về bên trái tạo không gian đặt tay thoải mái hơn nhưng vẫn đảm bảo các thao tác lướt, thu phòng trơn tru.</strong></a></p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-09.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-09.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Bản lề của&nbsp;</strong></a><a href=\"https://www.thegioididong.com/laptop-lenovo\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop Lenovo</a>&nbsp;này có thể mở rộng&nbsp;<strong>180 độ</strong>, hạn chế khả năng hư hỏng và dễ dàng chia sẻ màn hình với mọi người, tiện dụng ở mọi tư thế bạn muốn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-07.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-07.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Đặc biệt, bạn có thể yên tâm sử dụng hay mang theo laptop di chuyển nhiều nơi, không lo ngại như va đập vô ý, rơi rớt từ bàn làm việc xuống đất (độ cao khoảng 76 cm) mà vẫn hoạt động tốt khi máy có chứng nhận đạt tiêu chuẩn độ bền quân đội Mỹ&nbsp;</strong></a><a href=\"https://www.thegioididong.com/hoi-dap/tieu-chuan-quan-su-my-mil-std-810g-1304935\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">MLT STD 810G</a>.</p><h3><strong>Hiệu năng ổn định xử lý tốt các tác vụ văn phòng và đồ họa căn bản</strong></h3><p>Chiếc laptop Lenovo này được trang bị CPU&nbsp;<strong>Intel Core i5</strong>&nbsp;<strong>1135G7</strong>&nbsp;thế hệ 11 xử lý nhanh, ổn định các công việc văn phòng, đồ họa 2D và tiết kiệm năng lượng hiệu quả với<strong>&nbsp;</strong>lõi Willow Cove&nbsp;<strong>4 nhân 8 luồng</strong>&nbsp;mang đến xung nhịp tối đa&nbsp;<strong>4.2 GHz</strong>&nbsp;nhờ&nbsp;<strong>Turbo Boost</strong>.</p><p>CPU kết hợp cùng card đồ họa tích hợp&nbsp;<strong>Intel Iris Xe Graphics</strong>&nbsp;giúp nâng cao hiệu suất xử lý đồ họa các thao tác chỉnh ảnh trên Photoshop, Ai trở nên mượt mà hơn. Bên cạnh hỗ trợ làm việc thì máy cũng có thể chạy tốt các tựa phổ biến với độ họa trung bình khá như: Rocket League, CS:GO, Valorant, LoL, Genshin Impact,...</p><p><strong>RAM 8 GB&nbsp;DDR4</strong>&nbsp;(On board) giúp laptop chuyển đổi mượt mà giữa các cửa sổ làm việc, nâng cao hiệu xuất làm việc của bạn với tốc độ Bus RAM&nbsp;<strong>4266 MHz</strong>. Bạn có thể mở Lightroom để chỉnh ảnh vừa mở nhiều tab Chrome để tìm nguồn cảm hứng hoặc đơn giản là mở YouTube để nghe nhạc, cày view cho thần tượng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-04.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-04.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Bên cạnh đó chiếc laptop Lenovo ThinkBook này còn được trang&nbsp;ổ cứng&nbsp;</strong></a><strong>SSD 512 GB M.2 PCIe</strong>&nbsp;cho tốc độ khởi động và mở máy cực nhanh chỉ trong vài giây. Dung lượng&nbsp;<strong>512 GB</strong>&nbsp;cho bạn không gian lưu trữ lớn bạn có thể thoải mái lưu trữ các bộ phim điện ảnh yêu thích hay các tập tin lớn mà không lo lắng bị đầy dung lượng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-05.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-05.jpg\"></strong></a></p><h3><strong>Đắm chìm vào khung hình tuyệt mỹ</strong></h3><p>Kích thước&nbsp;<strong>14 inch</strong>&nbsp;khá rộng rãi, độ phân giải&nbsp;<strong>Full HD&nbsp;</strong>cùng màn hình&nbsp;<strong>100% sRGB&nbsp;</strong>đem đến những khung ảnh sắc nét, màu sắc chính xác cuốn bạn vào thế giới hình ảnh tuyệt vời phù hợp cho những ai đam mê phim ảnh hay làm những công việc liên quan đến đồ họa.</p><p>Tấm nền<strong>&nbsp;IPS&nbsp;</strong>mở rộng góc nhìn lên&nbsp;<strong>178 độ</strong>, cộng thêm viền màn hình được thiết kế mỏng, cho bạn khung hình rõ nét dù nhìn từ bất cứ đâu.</p><p>Độ sáng lên đến&nbsp;<strong>300 nits&nbsp;</strong>cho hình ảnh hiển thị rõ ràng ở nơi có ánh sáng cao. Công nghệ&nbsp;<strong>Dolby Vision</strong>&nbsp;đem đến chất lượng hình ảnh như ở rạp, giờ đây bạn có thể nằm ngay trên giường của mình để xem điện ảnh cực đã.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-06.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-06.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Tạo hiệu ứng âm thanh vòm sống động đầy lôi cuốn, âm sắc trong trẻo nhờ công nghệ âm thanh của máy là&nbsp;</strong></a><a href=\"https://www.thegioididong.com/hoi-dap/am-thanh-dolby-audio-premium-co-gi-dac-biet-1017812\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Dolby Audio Premium</a>.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-10.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-10.jpg\"></strong></a></p><h3><strong>Bảo vệ sự riêng tư và bí mật kinh doanh tốt hơn</strong></h3><p>Mở khóa nhanh chóng chỉ bằng một cái chạm nhẹ thông qua&nbsp;<strong>cảm biến vân tay</strong>&nbsp;được tích hợp trên nút nguồn, máy chỉ được mở khi đúng vân tay của bạn tránh trường hợp bị kẻ gian đánh cắp mật khẩu như kiểu khóa truyền thống.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-08.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(21, 94, 193);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-08.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop</a>&nbsp;trang bị&nbsp;<strong>webcam 720p</strong>&nbsp;hỗ trợ rất tốt cho các cuộc hội họp trực tuyến, Facetime với người thân với chất lượng hình ảnh đẹp và rõ nét. Phía trước webcam được tích hợp màn trập ThinkShutter để che camera những lúc không cần dùng tới, đảm bảo thông tin của bạn trước các phần mềm gián điệp.&nbsp;</p><h3><a href=\"https://www.thegioididong.com/laptop/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Lenovo ThinkBook 14s G2 ITL i5 (20VA000NVN)</a>&nbsp;với hiệu năng mạnh mẽ đáp ứng tốt công việc của bạn, vẻ ngoài sang trọng sẽ là sự lựa chọn tuyệt vời dành cho bạn.</h3>',
    23600.00,
    0.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L202520',
    'Laptop Lenovo ThinkBook 14s G2 ITL i5 1135G7/8GB/512GB/Win10',
    '<h3><strong>Lenovo ThinkBook 14s G2 ITL i5 (20VA000NVN) là chiếc&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=hoc-tap-van-phong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop học tập - văn phòng</strong></a><strong>&nbsp;phù hợp với học sinh, sinh viên hay người làm văn phòng cần một chiếc máy tính mỏng nhẹ nhưng vẫn có cấu hình ổn định.</strong></h3><h3><strong>Thiết kế gọn nhẹ, sang trọng</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-lenovo?g=lenovo-thinkbook\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Lenovo ThinkBook</a>&nbsp;đi theo lối thiết kế đơn giản, hiện đại với kiểu dáng vuông vắn, sắc sảo từ kim loại nguyên khối với 2 tông màu xám bóng và xám nhám, thân máy gọn nhẹ chỉ nặng&nbsp;<strong>1.27 kg</strong>, mỏng&nbsp;<strong>14.9 mm</strong>&nbsp;bạn có thể cầm bằng một tay. Kích thước tương đương như khổ giấy A4 (Dài 322 mm - Rộng 207 mm) dễ dàng để vào balo, túi xách tối ưu cho việc di chuyển làm việc và học tập của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-02.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-02.jpg\"></a></p><p>Tuy máy khá mỏng nhưng vẫn được trang bị đầy đủ các cổng kết nối thông dụng: 1 cổng Thunderbolt 4 USB-C có tốc độ truyền tải đến 40 Gbps, 1 cổng HDMI hỗ trợ cho việc kết nối máy chiếu hoặc tivi để thuyết trình và 1 jack cắm tai nghe 3.5, 2 cổng USB 3.2. Bên cạnh kết nối có dây máy còn hỗ trợ&nbsp;<strong>Bluetooth 5.1</strong>&nbsp;cho phạm vi kết nối ổn định lên đến hơn 10 m,<strong>&nbsp;Wi-Fi 6 AX201</strong><a href=\"https://www.thegioididong.com/hoi-dap/wi-fi-chuan-80211ax-la-gi-tim-hieu-ve-wi-fi-the-he-thu-6-1187524\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">&nbsp;</a>cho đường truyền mượt mà, nhanh chóng với tốc độ 10.000 Mbps.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-11.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-11.jpg\"></a></p><p>Bàn phím có hành trình phím tốt, rộng rãi và được tích hợp đèn nền hỗ trợ gõ phím chính xác khi bạn sử dụng ở nơi ánh sáng yếu. Bàn di chuột có kích thước lớn và đặt hơi lệch về bên trái tạo không gian đặt tay thoải mái hơn nhưng vẫn đảm bảo các thao tác lướt, thu phòng trơn tru.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-09.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-09.jpg\"></a></p><p>Bản lề của&nbsp;<a href=\"https://www.thegioididong.com/laptop-lenovo\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop Lenovo</a>&nbsp;này có thể mở rộng&nbsp;<strong>180 độ</strong>, hạn chế khả năng hư hỏng và dễ dàng chia sẻ màn hình với mọi người, tiện dụng ở mọi tư thế bạn muốn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-07.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-07.jpg\"></a></p><p>Đặc biệt, bạn có thể yên tâm sử dụng hay mang theo laptop di chuyển nhiều nơi, không lo ngại như va đập vô ý, rơi rớt từ bàn làm việc xuống đất (độ cao khoảng 76 cm) mà vẫn hoạt động tốt khi máy có chứng nhận đạt tiêu chuẩn độ bền quân đội Mỹ&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tieu-chuan-quan-su-my-mil-std-810g-1304935\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">MLT STD 810G</a>.</p><h3><strong>Hiệu năng ổn định xử lý tốt các tác vụ văn phòng và đồ họa căn bản</strong></h3><p>Chiếc laptop Lenovo này được trang bị CPU&nbsp;<strong>Intel Core i5</strong>&nbsp;<strong>1135G7</strong>&nbsp;thế hệ 11 xử lý nhanh, ổn định các công việc văn phòng, đồ họa 2D và tiết kiệm năng lượng hiệu quả với<strong>&nbsp;</strong>lõi Willow Cove&nbsp;<strong>4 nhân 8 luồng</strong>&nbsp;mang đến xung nhịp tối đa&nbsp;<strong>4.2 GHz</strong>&nbsp;nhờ&nbsp;<strong>Turbo Boost</strong>.</p><p>CPU kết hợp cùng card đồ họa tích hợp&nbsp;<strong>Intel Iris Xe Graphics</strong>&nbsp;giúp nâng cao hiệu suất xử lý đồ họa các thao tác chỉnh ảnh trên Photoshop, Ai trở nên mượt mà hơn. Bên cạnh hỗ trợ làm việc thì máy cũng có thể chạy tốt các tựa phổ biến với độ họa trung bình khá như: Rocket League, CS:GO, Valorant, LoL, Genshin Impact,...</p><p><strong>RAM 8 GB&nbsp;DDR4</strong>&nbsp;(On board) giúp laptop chuyển đổi mượt mà giữa các cửa sổ làm việc, nâng cao hiệu xuất làm việc của bạn với tốc độ Bus RAM&nbsp;<strong>4266 MHz</strong>. Bạn có thể mở Lightroom để chỉnh ảnh vừa mở nhiều tab Chrome để tìm nguồn cảm hứng hoặc đơn giản là mở YouTube để nghe nhạc, cày view cho thần tượng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-04.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-04.jpg\"></a></p><p>Bên cạnh đó chiếc laptop Lenovo ThinkBook này còn được trang&nbsp;ổ cứng&nbsp;<strong>SSD 512 GB M.2 PCIe</strong>&nbsp;cho tốc độ khởi động và mở máy cực nhanh chỉ trong vài giây. Dung lượng&nbsp;<strong>512 GB</strong>&nbsp;cho bạn không gian lưu trữ lớn bạn có thể thoải mái lưu trữ các bộ phim điện ảnh yêu thích hay các tập tin lớn mà không lo lắng bị đầy dung lượng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-05.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-05.jpg\"></a></p><h3><strong>Đắm chìm vào khung hình tuyệt mỹ</strong></h3><p>Kích thước&nbsp;<strong>14 inch</strong>&nbsp;khá rộng rãi, độ phân giải&nbsp;<strong>Full HD&nbsp;</strong>cùng màn hình&nbsp;<strong>100% sRGB&nbsp;</strong>đem đến những khung ảnh sắc nét, màu sắc chính xác cuốn bạn vào thế giới hình ảnh tuyệt vời phù hợp cho những ai đam mê phim ảnh hay làm những công việc liên quan đến đồ họa.</p><p>Tấm nền<strong>&nbsp;IPS&nbsp;</strong>mở rộng góc nhìn lên&nbsp;<strong>178 độ</strong>, cộng thêm viền màn hình được thiết kế mỏng, cho bạn khung hình rõ nét dù nhìn từ bất cứ đâu.</p><p>Độ sáng lên đến&nbsp;<strong>300 nits&nbsp;</strong>cho hình ảnh hiển thị rõ ràng ở nơi có ánh sáng cao. Công nghệ&nbsp;<strong>Dolby Vision</strong>&nbsp;đem đến chất lượng hình ảnh như ở rạp, giờ đây bạn có thể nằm ngay trên giường của mình để xem điện ảnh cực đã.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-06.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-06.jpg\"></a></p><p>Tạo hiệu ứng âm thanh vòm sống động đầy lôi cuốn, âm sắc trong trẻo nhờ công nghệ âm thanh của máy là&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/am-thanh-dolby-audio-premium-co-gi-dac-biet-1017812\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Dolby Audio Premium</a>.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-10.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-10.jpg\"></a></p><h3><strong>Bảo vệ sự riêng tư và bí mật kinh doanh tốt hơn</strong></h3><p>Mở khóa nhanh chóng chỉ bằng một cái chạm nhẹ thông qua&nbsp;<strong>cảm biến vân tay</strong>&nbsp;được tích hợp trên nút nguồn, máy chỉ được mở khi đúng vân tay của bạn tránh trường hợp bị kẻ gian đánh cắp mật khẩu như kiểu khóa truyền thống.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-08.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/235393/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn-08.jpg\"></a></p><p><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop</a>&nbsp;trang bị&nbsp;<strong>webcam 720p</strong>&nbsp;hỗ trợ rất tốt cho các cuộc hội họp trực tuyến, Facetime với người thân với chất lượng hình ảnh đẹp và rõ nét. Phía trước webcam được tích hợp màn trập ThinkShutter để che camera những lúc không cần dùng tới, đảm bảo thông tin của bạn trước các phần mềm gián điệp.&nbsp;</p><p><a href=\"https://www.thegioididong.com/laptop/lenovo-thinkbook-14s-g2-itl-i5-20va000nvn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Lenovo ThinkBook 14s G2 ITL i5 (20VA000NVN)</a>&nbsp;với hiệu năng mạnh mẽ đáp ứng tốt công việc của bạn, vẻ ngoài sang trọng sẽ là sự lựa chọn tuyệt vời dành cho bạn.</p>',
    23700.00,
    0.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025534',
    'Laptop Dell Vostro 3510 i5 1135G7/8GB/512GB/2GB MX350/OfficeHS/Win11',
    '<h3><a href=\"https://www.thegioididong.com/laptop/dell-vostro-3510-i5-p112f002bbl\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Laptop Dell Vostro 3510 i5 (P112F002BBL)</strong></a><strong>&nbsp;sở hữu cấu hình mạnh mẽ, đa nhiệm mượt mà trên sức mạnh của bộ vi xử lý Intel thế hệ 11, cùng một thiết kế đơn giản mà sang đẹp, sẽ là lựa chọn đắt giá đáp ứng nhu cầu học tập, làm việc hay giải trí của bạn.</strong></h3><h3><strong>Hiệu năng mạnh mẽ, ổn định</strong></h3><p>Được trang bị dòng chip&nbsp;<strong>Intel Core i5&nbsp;Tiger Lake 1135G7</strong>&nbsp;mạnh mẽ, hoạt động trên xung nhịp cơ bản&nbsp;<strong>2.4 GHz</strong>&nbsp;và ép xung lên đến&nbsp;<strong>4.2 GHz</strong>&nbsp;ở chế độ Turbo Boost, Dell Vostro 3510 dễ dàng giải quyết mượt mà các tác vụ như soạn thảo hợp đồng trên Word, nhập liệu và thống kê qua Excel, tạo bảng thuyết trình cùng PowerPoint,... hay thiết kế đồ hoạ cơ bản trên các ứng dụng nhà Adobe cũng hiệu quả không kém.</p><p>Sự hỗ trợ của bộ nhớ&nbsp;<strong>RAM 8 GB</strong>&nbsp;chuẩn<strong>&nbsp;DDR4 2 khe</strong>&nbsp;(1 khe&nbsp;<strong>8 GB</strong>&nbsp;+ 1 khe rời) với tốc độ Bus RAM lên đến<strong>&nbsp;3200 MHz</strong>&nbsp;cho quá trình đa nhiệm trên&nbsp;<a href=\"https://www.dienmayxanh.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop</a>&nbsp;càng trơn tru, ổn định hơn, không gặp tình trạng giật lag máy, đơ màn hình. Máy cho phép nâng cấp RAM lên đến&nbsp;<strong>16 GB</strong>&nbsp;để tăng sức mạnh cấu hình cho những tác vụ nặng.</p><p>Bên cạnh đó, sức mạnh đồ họa từ card đồ họa rời&nbsp;<strong>NVIDIA GeForce MX350 2 GB&nbsp;</strong>cải tiến khả năng xử lý đồ họa thiết kế sản phẩm poster, banner,... ấn tượng cũng hiệu render video ngắn hiệu quả, từ đó giúp tăng trải nghiệm của người dùng, bạn cũng dễ dàng thử các tựa game nhẹ nhàng thịnh hành một cách mượt mà.</p><p><a href=\"https://www.thegioididong.com/laptop?g=ssd-512-gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop SSD 512 GB</a><strong>&nbsp;NVMe PCIe</strong>&nbsp;(Có thể tháo ra, lắp thanh khác tối đa&nbsp;<strong>2 TB&nbsp;(2280) / 1 TB (2230)</strong>) cho phép lưu trữ khá thoải mái dữ liệu cá nhân cho công việc, giải trí, hỗ trợ khởi động máy nhanh chóng, truy xuất dữ liệu ổn định. Khi cần mở rộng không gian lưu trữ, bạn cũng có thể dùng&nbsp;<strong>khe cắm HDD SATA&nbsp;</strong>(nâng cấp tối đa&nbsp;<strong>2 TB</strong>).</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-5-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-5-1.jpg\"></a></p><h3><strong>Thiết kế thanh lịch, sang đẹp</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-dell-vostro\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Dell Vostro</a>&nbsp;có lớp vỏ ngoài bằng nhựa màu đen hiện đại, tổng thể thiết kế toát lên sự chắc chắn, sang trọng mà rất thanh lịch, các chi tiết tinh tế, đẹp mắt. Máy có khối lượng&nbsp;<strong>1.69 kg</strong>, độ dày&nbsp;<strong>18.9 mm</strong>&nbsp;dễ dàng để mang theo trong hành trang thường nhật cho học tập, làm việc.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-2-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-2-1.jpg\"></a></p><p><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop</a>&nbsp;có bàn phím&nbsp;<strong>Fullsize&nbsp;</strong>với khoảng cách phím rộng, rất thoải mái cho việc soạn thảo văn bản nhanh, phím nhấn êm và nhạy khi thao tác.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-6-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-6-1.jpg\"></a></p><p><strong>Cảm biến vân tay&nbsp;</strong>tích hợp hỗ trợ truy cập màn hình nhanh chỉ với 1 chạm, khả năng bảo mật tốt trên thiết bị cá nhân của bạn.</p><p><a href=\"https://www.thegioididong.com/laptop-dell\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Dell</a>&nbsp;có đầy đủ các cổng kết nối thông dụng gồm 2 cổng USB 3.2 hoặc 1 cổng USB 3.2 và 1 cổng USB Type-C (Tuỳ theo lô hàng), cổng HDMI, jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0 và khe đọc thẻ SD, kết nối thuận tiện với nhiều thiết bị ngoại vi để phục vụ công việc. Bên cạnh đó còn có kết nối không dây&nbsp;<strong>Bluetooth và Wi-Fi&nbsp;802.11 a/b/g/n/ac&nbsp;</strong>độ nhạy cao, đảm bảo hiệu suất sử dụng máy của bạn.</p><h3><strong>Màn hình sắc nét với góc nhìn rộng, âm thanh giải trí sống động</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-tren-15-inch\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop màn hình 15.6 inch</a>&nbsp;kết hợp với công nghệ góc nhìn rộng&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/wide-viewing-angle-la-gi-uu-nhuoc-diem-1302188\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Wide Viewing Angle (WVA)</a>&nbsp;mang đến trải nghiệm xem đã mắt hơn trên màn hình, chất lượng hình ảnh sắc nét chuẩn&nbsp;<strong>Full HD&nbsp;(1920 x 1080)</strong>, màu sắc tương phản tốt, chi tiết chân thật.</p><p>Công nghệ chống chói&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-man-hinh-chong-choi-anti-glare-1182688\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Anti Glare</a>, bạn dễ dàng sử dụng laptop ngoài trời mà không bị lóa mờ màn hình do ánh sáng chói, làm việc thuận lợi hơn, giải trí thích thú hơn, bảo vệ tốt hơn cho thị giác. Cùng công nghệ<strong>&nbsp;LED Backlight&nbsp;</strong>cho màn hình mỏng hơn, toả nhiệt ít hơn và tiết kiệm điện năng cho bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-7.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-7.jpg\"></a></p><p>Kết hợp cùng công nghệ&nbsp;<strong>Realtek High Definition Audio</strong>&nbsp;khuếch đại âm thanh&nbsp;tốt khi chơi game, xem phim, nghe nhạc,… chất âm to rõ, đủ để đáp ứng nhu cầu giải trí của bạn trong những giờ rảnh rỗi.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-8.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/266280/dell-vostro-3510-i5-p112f002bbl-8.jpg\"></a></p><h3>Laptop Dell Vostro 3510 i5 (P112F002BBL) sẽ không chỉ đáp ứng tốt cho nhu cầu sử dụng cơ bản mà còn xử lý hiệu quả các tác vụ đòi hỏi hiệu năng cao hơn như đồ họa, một đầu tư xứng đáng cho nhu cầu của bạn.</h3>',
    18000.00,
    10.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025589',
    'Laptop Asus TUF Gaming F15 FX506LHB i5 10300H/8GB/512GB/4GB',
    '<h3><a href=\"https://www.thegioididong.com/laptop/asus-tuf-gaming-fx506lhb-i5-hn188w\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Laptop Asus TUF Gaming F15 FX506LHB i5 10300H (HN188W)</strong></a><strong>&nbsp;được trang bị bộ vi xử lý Intel dòng H mạnh mẽ, card đồ họa rời NVIDIA và ổ cứng SSD tốc độ cao, tất cả tạo nên một \"cỗ máy\" mạnh mẽ, đáp ứng tốt nhu cầu chơi game ở mức độ cấu hình cao.</strong></h3><h3><strong>Cấu hình mạnh mẽ, cân mọi tựa game HOT</strong></h3><p>CPU&nbsp;<strong>Intel Core i5 10300H</strong>&nbsp;thế hệ thứ 10 với&nbsp;<strong>4 nhân</strong>&nbsp;và&nbsp;<strong>8 luồng</strong>, tốc độ xung nhịp cơ bản&nbsp;<strong>2.50 GHz</strong>&nbsp;và tần số tăng tốc tối đa lên đến&nbsp;<strong>4.5 GHz</strong>. Một bộ vi xử lý mạnh mẽ có thể đáp ứng được nhiều nhu cầu như chơi game, làm việc văn phòng, làm đồ họa và xử lý video. CPU cũng hỗ trợ các công nghệ tiên tiến như&nbsp;<strong>Intel Turbo Boost</strong>&nbsp;và&nbsp;<strong>Intel Hyper Threading</strong>&nbsp;để tăng hiệu suất cũng như tăng cường khả năng xử lý đa nhiệm.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082813.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082813.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/laptop-asus\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Asus</a>&nbsp;được trang bị&nbsp;<strong>RAM 8 GB DDR4</strong>, đủ để xử lý hầu hết các tác vụ và trò chơi không quá nặng. Nếu có nhu cầu cao hơn bạn có thể nâng cấp RAM lên tối đa&nbsp;<strong>32 GB</strong>&nbsp;để giúp cho việc xử lý đa nhiệm trên máy tính trở nên trơn tru hơn, đồng thời cũng khiến cho các ứng dụng và trò chơi hoạt động nhanh và mượt mà hơn. Dung lượng RAM cao cũng giúp tránh hiện tượng giật hoặc lag khi sử dụng nhiều ứng dụng cùng lúc.</p><p>Với ổ cứng SSD dung lượng lưu trữ&nbsp;<strong>512 GB</strong>&nbsp;không chỉ có tốc độ truy xuất dữ liệu cao, giúp tối ưu tốc độ khởi động máy mà còn cho phép người dùng lưu trữ nhiều ứng dụng và dữ liệu.&nbsp;Nếu cần thêm không gian lưu trữ, bạn cũng có thể tháo ra ổ SSD trong máy ra lắp ổ khác tối đa&nbsp;<strong>1 TB</strong>.</p><p>Card đồ họa&nbsp;<strong>NVIDIA GeForce GTX 1650</strong>&nbsp;với bộ nhớ&nbsp;<strong>VRAM 4 GB</strong>&nbsp;đủ mạnh để chơi được hầu hết các game phổ biến hiện nay như: PUBG, Valorant, GTA V, The Witcher 3,... Tuy nhiên, để chơi các game nặng hơn như Cyberpunk 2077, Call of Duty: Warzone, bạn nên cân nhắc giảm độ phân giải hoặc chỉnh mức cấu hình thấp hơn để đảm bảo tốc độ khung hình cũng như chơi với độ mượt mà và ổn định hơn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082811.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082811.jpg\"></strong></a></p><p><strong>Hệ thống tản nhiệt của Asus TUF Gaming F15 được thiết kế khá đặc biệt để đảm bảo khả năng làm mát tốt cho các linh kiện bên trong máy. Thiết bị có&nbsp;2 quạt làm mát</strong>&nbsp;và&nbsp;<strong>2 ống dẫn nhiệt</strong>&nbsp;chuyên dụng để tản nhiệt cho bộ vi xử lý và card đồ họa. Khe thông gió được bố trí ở cạnh mặt trên của máy, giúp lưu thông không khí một cách hiệu quả.</p><p>Khi sử dụng ở chế độ tải nặng, TUF Gaming F15 vẫn giữ được nhiệt độ ổn định và không bị quá nóng, giúp tăng tuổi thọ và hiệu suất của các linh kiện bên trong máy. Ngoài ra, thiết kế tản nhiệt của máy cũng giúp giảm thiểu tiếng ồn phát ra từ quạt làm mát, mang lại trải nghiệm sử dụng thoải mái hơn cho người dùng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082826.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082826.jpg\"></strong></a></p><h3><strong>Đem đến những khung hình chân thực nhất</strong></h3><p>Màn hình của Asus TUF Gaming F15 có kích thước&nbsp;<strong>15.6 inch</strong>&nbsp;với độ phân giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;và tần số làm tươi&nbsp;<strong>144 Hz</strong>, mang đến trải nghiệm chơi game mượt mà. Với tần số làm tươi cao, các pha chuyển động nhanh trong game sẽ được tái tạo một cách mượt mà, giúp tăng độ chính xác và đồng thời cũng hỗ trợ bạn đưa ra quyết định hay phản hồi nhanh hơn.</p><p>Màn hình còn có lớp phủ chống chói&nbsp;<strong>Anti Glare</strong>, giúp giảm ánh sáng phản chiếu và bóng mờ, giảm mỏi mắt khi sử dụng trong thời gian dài. Ngoài ra, công nghệ&nbsp;<strong>IPS</strong>&nbsp;của màn hình cung cấp góc nhìn rộng hơn, tránh tình trạng mất màu khi nhìn từ các góc khác nhau.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082814.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082814.jpg\"></strong></a></p><p><strong>Với những thông số màn hình ấn tượng trên, người dùng sẽ được tận hưởng trải nghiệm chơi game mượt mà và chính xác hơn với hình ảnh sắc nét, độ trung thực màu sắc cao, từ đó giúp bạn tập trung vào trò chơi mà không bị phân tâm bởi các yếu tố khác.</strong></p><p><strong>Công nghệ âm thanh&nbsp;DTS:X Ultra Audio</strong>&nbsp;được tối ưu hóa cho trò chơi và giải trí, cho phép bạn tùy chỉnh trải nghiệm âm thanh của mình thông qua các tùy chọn cài đặt dành riêng cho trò chơi, phim và nhạc. Công nghệ này cho bạn trải nghiệm âm thanh vòm 7.1 sống động để phân biệt rõ ràng hơn các tiếng động trong trò chơi.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082821.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082821.jpg\"></strong></a></p><h3><strong>Nâng cao trải nghiệm, nổi bật cá tính</strong></h3><p>Bàn phím của Asus TUF Gaming F15 được thiết kế để đáp ứng nhu cầu chơi game của người dùng khi có kích thước đầy đủ với khoảng cách giữa các phím vừa phải, giúp người dùng gõ phím chính xác hơn. Ngoài ra, bàn phím còn hỗ trợ&nbsp;<strong>đèn nền RGB</strong>, cho phép bạn tùy chỉnh màu sắc và độ sáng của phím để tạo ra không khí chơi game độc đáo, phong phú hơn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082820.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082820.jpg\"></strong></a></p><p><strong>Ngoài ra, siêu phẩm TUF Gaming F15 còn có một số tính năng hữu ích khác liên quan đến bàn phím như khóa phím trong trò chơi, giúp ngăn chặn những lần bấm phím nhầm khi chơi game, đồng thời cũng có các phím tắt ROG để giúp bạn dễ dàng truy cập vào các tính năng trò chơi.</strong></p><p><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop</a>&nbsp;được thiết kế với phong cách đậm chất gaming, nắp lưng được làm bằng&nbsp;<strong>kim loại</strong>&nbsp;cao cấp với màu đen lịch lãm và logo của dòng sản phẩm TUF Gaming được đặt ở giữa. Bên cạnh đó nắp lưng còn có một số đường vân tạo nên một vẻ ngoài trông rất sang trọng và hiện đại.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082824.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082824.jpg\"></strong></a></p><p><strong>Ngoài ra những chi tiết nhỏ, chẳng hạn như các cạnh bo tròn, đường cắt sắc nét cũng làm tăng thêm sự độc đáo và tính hiện đại cho sản phẩm. Đối với những người dùng cần một chiếc&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=laptop-gaming\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop gaming</a>&nbsp;mạnh mẽ cho công việc hoặc chơi game, thì khối lượng&nbsp;<strong>2.3 kg</strong>&nbsp;vẫn có thể được chấp nhận khi máy cung cấp hiệu suất tốt.</p><p><a href=\"https://www.thegioididong.com/laptop-asus-tuf-gaming\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Asus TUF Gaming</a>&nbsp;có các cổng giao tiếp như: HDMI,&nbsp;Jack tai nghe 3.5 mm,&nbsp;USB 3.2 Gen 2 Type-C,&nbsp;USB 3.2,&nbsp;LAN (RJ45)&nbsp;cung cấp tốc độ truyền dữ liệu rất nhanh, giúp bạn sao chép dữ liệu hoặc truyền tệp lớn một cách nhanh chóng hoặc đơn giản là kết nối với các thiết bị ngoại vi như chuột, bàn phím, ổ cứng di động, loa ngoài,... cổng LAN cung cấp kết nối mạng có dây, đảm bảo tốc độ truyền tải nhanh và ổn định hơn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082823.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/279259/asus-tuf-gaming-fx506lhb-i5-hn188w-180423-082823.jpg\"></strong></a></p><h3><strong>Tổng thể, Asus TUF Gaming F15 FX506LHB i5 10300H (HN188W) là mẫu laptop chơi game mạnh mẽ với một loạt các tính năng và thông số kỹ thuật ấn tượng, có khả năng xử lý các trò chơi và ứng dụng đòi hỏi nhiều tài nguyên hệ thống, bên cạnh đó máy còn sở hữu màn hình có tốc độ làm mới cao và bàn phím hỗ trợ đèn nền, làm dâng trào sự hưng phấn mỗi khi bước vào trận chiến.</strong></h3>',
    17000.00,
    5.00,
    'Laptop',
    19
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025788',
    'Cấu hình Laptop HP Elitebook X360 1040 G9 i7 1255U/16GB/512GB/Touch/Pen/Win11',
    '<h3><a href=\"https://www.thegioididong.com/laptop/hp-elitebook-x360-1040-g9-i7-6z982pa\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Laptop HP Elitebook X360 1040 G9 i7 1255U (6Z982PA)</strong></a><strong>&nbsp;thuộc dòng sản phẩm&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=cao-cap-sang-trong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop cao cấp</strong></a><strong>&nbsp;của hãng HP với những thông số hết sức ấn tượng như bộ vi xử lý Intel thế hệ 12, màn hình sắc nét và kiểu dáng gập 360 độ tiện lợi, luôn sẵn sàng đồng hành cùng bạn trong mọi chuyến đi.</strong></h3><h3><strong>Bộc phá sức mạnh cùng bộ vi xử lý Intel thế hệ 12</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-hp-compaq-elitebook\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop HP Elitebook</a>&nbsp;mang trong mình sức mạnh vượt trội của bộ vi xử lý&nbsp;<strong>Intel Core i7 1255U</strong>&nbsp;với hiệu suất tối đa lên tới&nbsp;<strong>4.7 GHz</strong>, trang bị hoàn hảo dành cho người dùng&nbsp;cần một chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop</a>&nbsp;có khả năng đa nhiệm mượt mà, đồng thời vẫn đảm bảo tốc độ xử lý nhanh chóng và tiết kiệm điện năng. Card tích hợp&nbsp;<strong>Intel Iris Xe Graphics</strong>&nbsp;đáp ứng tốt nhu cầu xử lý đồ họa cơ bản trên các ứng dụng nhà Adobe.</p><p>Bộ nhớ&nbsp;<strong>RAM&nbsp;DDR5 16 GB</strong>&nbsp;cho phép bạn làm việc đa tác vụ mà không bị giật lag, vừa làm việc trên Word hoặc Excel, vừa nghe nhạc trên Spotify hay thậm chí thiết kế đồ họa với Photoshop cũng không thành vấn đề. Ổ&nbsp;cứng&nbsp;<strong>SSD 512 GB NVMe PCIe</strong>&nbsp;có khả năng lưu trữ và truy xuất dữ liệu nhanh chóng, từ đó rút ngắn thời gian phản hồi tác vụ, cho bạn trải nghiệm trơn tru hơn trong mọi thao tác.</p><h3><strong>Làm việc, giải trí đầy mãn nhãn trong từng khung hình</strong></h3><p>Màn hình&nbsp;<strong>14 inch</strong>&nbsp;với độ phân giải&nbsp;<strong>WUXGA (1920 x 1200)</strong>&nbsp;đảm bảo chất lượng hình ảnh sắc nét, màu sắc trung thực, hơn nữa còn&nbsp;<strong>hỗ trợ cảm ứng</strong>&nbsp;cho phép bạn thực hiện các thao tác như vẽ, ghi chú hay điều khiển bằng cử chỉ một cách dễ dàng. Bên cạnh đó màn hình cũng đạt chuẩn&nbsp;<strong>100% sRGB</strong>, sử dụng tấm nền&nbsp;<strong>IPS</strong>&nbsp;cho màu sắc tái tạo chuẩn xác đến từng chi tiết để bạn hòa mình vào không gian giải trí đầy thú vị.</p><p>Với công nghệ&nbsp;<strong>Bang &amp; Olufsen audio</strong>, bạn sẽ được trải nghiệm âm thanh sống động, tận hưởng âm thanh không bị méo, đầy đủ chi tiết. Bên cạnh đó công nghệ này cũng cho phép bạn tùy chỉnh âm thanh theo sở thích của mình thông qua các ứng dụng được tích hợp sẵn trong máy.</p><h3><strong>Tinh tế trong từng đường nét</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-hp-compaq\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop HP</a>&nbsp;được hoàn thiện từ lớp&nbsp;<strong>vỏ kim loại</strong>&nbsp;sơn&nbsp;<strong>màu bạc</strong>&nbsp;sang trọng với những đường nét góc cạnh vô cùng tinh tế, chắc chắn sẽ thu hút mọi ánh nhìn khi sử dụng ở nơi đông người. Khối lượng của máy chỉ&nbsp;<strong>1.35 kg</strong>&nbsp;cho phép bạn cầm nắm, sử dụng ở dạng tablet một cách dễ dàng nhờ vào thiết kế bản lề đặc biệt có thể&nbsp;<strong>xoay màn hình 360 độ</strong>.</p><p>Những công nghệ bảo mật tiên tiến như&nbsp;<strong>mở khóa khuôn mặt</strong>,&nbsp;<strong>mở khóa vân tay</strong>&nbsp;và&nbsp;<strong>công tắc khóa camera</strong>&nbsp;hỗ trợ bạn mở khóa máy nhanh chóng, đồng thời bảo vệ dữ liệu cá nhân trước các nguy cơ bị xâm nhập trái phép. Dọc hai bên thân máy được trang bị nhiều cổng kết nối như: HDMI, Jack tai nghe 3.5 mm, Thunderbolt 4 và SuperSpeed USB A.</p>',
    46000.00,
    5.00,
    'Laptop',
    19
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025818',
    'Laptop Dell Inspiron 16 5620 i7 1255U/8GB/512GB/OfficeHS/Win11',
    '<h3><strong>Khi nhắc đến dòng&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=hoc-tap-van-phong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop học tập - văn phòng</strong></a><strong>&nbsp;thì bạn không thể nào bỏ qua&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop/dell-inspiron-16-5620-i7-n6i7110w1\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop Dell Inspiron 16 5620 i7 (N6I7110W1)</strong></a><strong>&nbsp;với hiệu năng vượt trội, thiết kế hiện đại và gọn nhẹ phù hợp với nhu cầu sử dụng của sinh viên và nhân viên văn phòng cần phải di chuyển thường xuyên.</strong></h3><h3><strong>Mượt mà đa tác vụ văn phòng</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-dell\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Dell</a>&nbsp;sở hữu bộ vi xử lý Intel thế hệ 12, chính xác hơn đó là&nbsp;<strong>Intel Core i7 1255U</strong>&nbsp;với khả năng tối ưu để vừa cung cấp hiệu năng mạnh mẽ có thể cân hoàn hảo các tác vụ văn phòng vừa hạn chế mức độ tiêu thụ điện năng. Card đồ họa tích hợp&nbsp;<strong>Intel UHD</strong>&nbsp;cũng đủ tốt để đáp ứng cho các nhu cầu chỉnh sửa hình ảnh 2D, file thiết kế cơ bản trên các ứng dụng nhà Adobe.&nbsp;</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021924.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021924.jpg\"></a></p><p>Mình đã thử đo đạc hiệu năng bằng công cụ Cinebench R23 được hai con số&nbsp;<strong>3178 điểm đa nhân</strong>&nbsp;và&nbsp;<strong>1009 điểm đơn nhân</strong>, cũng như thử chiến tựa game MOBA nhẹ nhàng - Liên Minh Huyền Thoại ở mức cấu hình trung bình, chỉ số khung hình dao động trong khoảng&nbsp;<strong>60 - 70 FPS</strong>&nbsp;và tất nhiên sẽ bị rớt xuống đôi chút khi tham gia giao tranh đông người, số FPS không cao nhưng cũng đủ để đáp ứng cho nhu cầu giải trí cơ bản trên một chiếc laptop vốn sinh ra dành cho các tác vụ văn phòng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021938.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021938.jpg\"></a></p><p>Nếu có nhu cầu cao hơn về thiết kế đồ họa hoặc muốn cải tiến chỉ số FPS trong những trận game thì bạn có thể nâng cấp lên card đồ họa&nbsp;<strong>Iris Xe</strong>&nbsp;bằng cách lắp thêm một thanh RAM khác với tổng dung lượng tối đa&nbsp;<strong>32 GB</strong>&nbsp;và đồng thời cũng kích hoạt được luôn cơ chế&nbsp;<strong>Dual-Channel</strong>&nbsp;để có trải nghiệm thêm mượt mà hơn.</p><p>Về cơ bản thì thanh&nbsp;<strong>RAM 8 GB</strong>&nbsp;chuẩn&nbsp;<strong>DDR4</strong>&nbsp;lắp sẵn trong máy cũng đủ để đáp ứng mượt mà các nhu cầu thông thường của một người dùng là sinh viên như mình, tha hồ mở từ 2 - 3 ứng dụng Office hoặc mở hơn 15 tabs Chrome mà không lo giật lag. Nhưng để có được trải nghiệm trơn tru và tốt nhất, bạn vẫn nên lắp thêm RAM cho máy vì không chỉ nâng cao được hiệu suất đa nhiệm mà còn cải thiện được cả khả năng xử lý đồ họa như mình đã đề cập ở trên.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021930.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021930.jpg\"></a></p><p><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop</a>&nbsp;được trang bị ổ&nbsp;<strong>SSD 512 GB NVMe PCIe</strong>&nbsp;có tốc độ truy xuất dữ liệu cao khiến cho các thao tác cũng như thời gian khởi động máy và ứng dụng đều nhanh chỉ trong vài giây. Không gian ổ cứng vừa đủ để mình lưu trữ tài liệu cho học tập và công việc mà không phải lo nghĩ về vấn đề nâng cấp khi sử dụng về lâu về dài.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021935.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021935.jpg\"></a></p><p>Mặc dù chỉ sở hữu pin&nbsp;<strong>54 Wh</strong>&nbsp;không cao nhưng nhờ có sự tối ưu tiết kiệm điện năng tiêu thụ đến từ bộ vi xử lý Intel thế hệ 12 dòng U mà máy cho mình thời gian sử dụng ấn tượng, con số lên đến&nbsp;<strong>6 tiếng</strong>&nbsp;đối với các tác vụ văn phòng và giải trí cơ bản, hoàn toàn đủ cho một buổi học trên trường hoặc xách máy ra quán cà phê làm việc mà không cần mang theo củ sạc nặng nề.</p><h3><strong>Màn hình hiển thị chân thực, sắc nét</strong></h3><p><a href=\"https://www.thegioididong.com/laptop-dell-inspiron\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Dell Inspiron</a>&nbsp;đem đến cho mình trải nghiệm hình ảnh thật sự đã mắt với không gian hiển thị rộng lớn lên đến&nbsp;<strong>16 inch</strong>, thoải mái mở từ 2 - 3 cửa sổ ứng dụng để làm việc hoặc vừa soạn thảo văn bản ở một bên của màn hình vừa xem YouTube ở một bên còn lại cũng rất thoải mái, nội dung không bị che khuất gây khó chịu.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021920.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021920.jpg\"></a></p><p>Mặc dù có kích thước màn hình lớn nhưng nội dung lại luôn được đảm bảo hiển thị với độ chi tiết cao nhờ độ phân giải&nbsp;<strong>Full HD+ (1920 x 1200)</strong>, màu sắc tươi tắn và có độ sâu khi đạt chuẩn&nbsp;<strong>100% sRGB</strong>. Ngoài khả năng tái tạo chuẩn chỉnh màu sắc đem đến những thước phim chân thật mà còn cho phép mình chỉnh sửa hình ảnh, màu sắc chuyên nghiệp trên các phần mềm đồ họa Adobe.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021922.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021922.jpg\"></a></p><p>Ngoài ra, màn hình cũng được trang bị công nghệ chống chói&nbsp;<strong>Anti Glare</strong>, hạn chế tình trạng chói lóa khi mình sử dụng máy ở nơi có cường độ sáng cao. Độ sáng&nbsp;<strong>300 nits</strong>&nbsp;giúp cho nội dung hiển thị rõ ràng và có chiều sâu hơn kể cả khi mình sử dụng máy ở những nơi như quán cà phê hay bàn làm việc gần cửa sổ.</p><p>Hệ thống loa kép (2 kênh) nằm dọc hai bên khu vực bàn phím cùng công nghệ&nbsp;<strong>Realtek Audio</strong>&nbsp;khuếch đại âm thanh cho mình đắm chìm trong không gian âm nhạc sống động và chân thật kể cả khi chơi game hay xem phim, nghe nhạc giải trí.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021937.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021937.jpg\"></a></p><h3><strong>Khối lượng cân đối, sắc bạc sang trọng</strong></h3><p>Laptop được hoàn thiện với lớp&nbsp;<strong>vỏ kim loại</strong>&nbsp;màu bạc vô cùng hiện đại và sang trọng, khi sờ vào bề mặt rất mát và sướng tay. Khối lượng&nbsp;<strong>1.87 kg</strong>&nbsp;không quá nặng để mình bỏ vào balo mang theo đi học, đi làm. Bên cạnh đó, máy cũng có thông số độ dày ở mức vừa phải -&nbsp;<strong>17.95 mm</strong>, từ đó cho phép mình cầm nắm dễ dàng hơn, xách máy bằng một tay cũng không thành vấn đề.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021925.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021925.jpg\"></a></p><p>Bàn phím của máy tuy có&nbsp;<strong>bố cục rút gọn</strong>&nbsp;nhưng lại được làm thoáng đãng, độ nảy và độ sâu ở mức tương đối, đặc biệt còn hỗ trợ&nbsp;<a href=\"https://www.thegioididong.com/laptop-den-ban-phim\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">đèn nền</a>&nbsp;giúp mình dễ dàng làm việc, soạn thảo văn bản trong những môi trường thiếu sáng. Bàn di chuột được làm rộng rãi, thao tác di vuốt mượt mà nên mình rất ít khi sử dụng đến chuột rời, chỉ khi nào cần chỉnh sửa các chi tiết phức tạp trong Photoshop mới cần dùng đến.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021929.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021929.jpg\"></a></p><p>Ngoài ra, máy còn được trang bị hàng loạt các tiện ích hỗ trợ tối đa cho trải nghiệm thường ngày, trong đó tính năng mà mình sử dụng nhiều nhất đó là công nghệ&nbsp;<strong>bảo mật vân tay</strong>&nbsp;nhờ một cảm biến tích hợp chung với nút nguồn giúp mở máy nhanh chóng và an toàn hơn, không cần nhập mật khẩu rườm rà. Máy còn sở hữu&nbsp;<strong>Webcam Full HD</strong>&nbsp;ở cạnh viền trên của màn hình, đảm bảo hình ảnh của mình luôn tươi tắn, sắc nét khi tham gia các lớp học hoặc cuộc họp trực tuyến.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021933.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021933.jpg\"></a></p><p>Dọc hai bên thân máy có các cổng giao tiếp đáp ứng tốt cho mọi nhu cầu khi cần kết nối với các thiết bị ngoại vi như USB 3.2, Jack tai nghe 3.5 mm, USB Type-C (Power Delivery và DisplayPort), HDMI và khe đọc thẻ nhớ SD. Thông thường mình sẽ liên kết chuột và bàn phím với hai cổng USB 3.2 hay thỉnh thoảng xuất bài trình chiếu bằng cổng HDMI khi cần hoàn thành bài thuyết trình nhóm trên lớp.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021942.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/292396/dell-inspiron-16-5620-i7-n6i7110w1-171222-021942.jpg\"></a></p><h3>Nhìn chung, nếu bạn đang tìm kiếm một chiếc laptop có ngoại hình hiện đại có khả năng linh hoạt để tiện di chuyển, sở hữu thông số kỹ thuật đủ mạnh mẽ để đáp ứng các nhu cầu làm việc văn phòng thì Dell Inspiron 16 5620 i7 (N6I7110W1) là cái tên rất xứng đáng để bạn cân nhắc.</h3>',
    24000.00,
    10.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025867',
    'Laptop Apple MacBook Air M2 2022 16GB/512GB/10-core GPU',
    '<h3><a href=\"https://www.thegioididong.com/laptop/apple-macbook-air-m2-2022-16gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>MacBook Air M2 2022</strong></a><strong>&nbsp;một lần nữa đã khẳng định vị thế hàng đầu của Apple trong phân khúc&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=cao-cap-sang-trong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop cao cấp - sang trọng</strong></a><strong>&nbsp;vào giữa năm 2022 khi sở hữu phong cách thiết kế thời thượng, đẳng cấp cùng sức mạnh bộc phá đến từ bộ vi xử lý Apple M2 mạnh mẽ.</strong></h3><h3><strong>Khám phá nguồn sức mạnh từ dòng chip thế hệ mới</strong></h3><p><a href=\"https://www.thegioididong.com/tin-tuc/chip-apple-m2-chinh-thuc-ra-mat-voi-suc-manh-khung-1437839\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Chip Apple M2</a>&nbsp;vẫn được sản xuất ở tiến trình&nbsp;<strong>5 nm</strong>&nbsp;với&nbsp;<strong>4 nhân hiệu năng cao</strong>&nbsp;và&nbsp;<strong>4 nhân tiết kiệm kiệm</strong>&nbsp;như dòng M1 nhưng tốc độ băng thông đã được cải tiến vượt trội lên đến&nbsp;<strong>100GB/s</strong>, cùng với đó là sự trợ giúp của&nbsp;<strong>20 nghìn tỷ bóng bán dẫn</strong>&nbsp;giúp hiệu suất hoạt động được nâng cao hơn&nbsp;<strong>18%</strong>&nbsp;so với phiên bản tiền nhiệm, đảm bảo vận hành trơn tru mọi tác vụ học tập, làm việc từ cơ bản đến nâng cao.&nbsp;</p><p>Không chỉ giải quyết hoàn hảo những tác vụ thông thường,&nbsp;<a href=\"https://www.thegioididong.com/laptop-apple-macbook-apple-m2\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">MacBook M2</a>&nbsp;còn chinh phục người dùng sáng tạo khi trang bị&nbsp;<strong>10 nhân GPU</strong>&nbsp;với khả năng xử lý lên đến&nbsp;<strong>15.8 nghìn tỷ</strong>&nbsp;tác vụ chỉ trong&nbsp;<strong>1 giây</strong>, cho phép bạn thao tác mượt mà các ứng dụng đồ họa như Adobe Illustrator, Premiere, AutoCAD,... cũng như chỉnh sửa hình ảnh, phát video&nbsp;<strong>4K, 8K ProRes 12</strong>&nbsp;ấn tượng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-3.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-3.jpg\"></a></p><p>Khả năng đa nhiệm được nâng tầm đáng kể nhờ bộ nhớ&nbsp;<strong>RAM 16 GB</strong>, người dùng hoàn toàn có thể xử lý nhiều layer đồ họa khác nhau song song với việc nghe nhạc trên Spotify nhưng vẫn không xảy ra hiện tượng giật lag. Ổ cứng&nbsp;<strong>SSD 512 GB</strong>&nbsp;cho không gian lưu trữ ổn định đồng thời gia tăng tốc độ đọc ghi nhanh chóng hơn.</p><p>Hệ điều hành&nbsp;<strong>MacOS</strong>&nbsp;cùng vi xử lý&nbsp;<strong>Apple Silicon</strong>&nbsp;không chỉ mang đến một kho ứng dụng làm việc, giải trí đồ sộ mà còn nâng cao hệ thống bảo mật của máy, cho phép người dùng kiểm soát chặt chẽ hơn về quyền riêng tư cũng như các thông tin hay dữ liệu cá nhân.</p><h3><strong>Ngoại hình thời thượng, biểu tượng cho sự hoàn mỹ</strong></h3><p>Chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop-apple-macbook-air\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">MacBook Air</a>&nbsp;năm nay đã khoác lên mình một diện mạo hoàn toàn mới với xu hướng thiết kế có phần tương tự như MacBook Pro, lớp&nbsp;<strong>vỏ kim loại</strong>&nbsp;sang trọng, cứng cáp với khối lượng chỉ vỏn vẹn&nbsp;<strong>1.24 kg</strong>&nbsp;luôn là trợ thủ đắc lực cho mọi cuộc hành trình của người dùng dù là trong không gian văn phòng hay những chuyến công tác xa.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-2.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-2.jpg\"></a></p><p>Bàn phím&nbsp;<strong>Magic Key</strong>&nbsp;với dãy phím F chức năng giúp cho thao tác soạn thảo hay nhập liệu được dễ dàng và tiện lợi hơn. MacBook luôn là sự lựa chọn hàng đầu cho những người làm việc văn phòng hay yêu thích sự yên tĩnh với trải nghiệm gõ phím cực êm tay và hạn chế tối đa việc ảnh hưởng tiếng ồn đến những người xung quanh.&nbsp;<a href=\"https://www.thegioididong.com/laptop-den-ban-phim\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop có đèn bàn phím</a>&nbsp;hỗ trợ người dùng làm việc tốt hơn trong môi trường thiếu sáng.</p><p>Tính năng&nbsp;<strong>bảo mật vân tay</strong>&nbsp;được tích hợp với phím nguồn của máy vừa giúp bạn mở máy nhanh chóng chỉ bằng một chạm vừa củng cố thêm hệ thống bảo mật cũng như quyền riêng tư, hạn chế tối đa việc bị mất thông tin cá nhân của người dùng.&nbsp;</p><p>2 cổng Thunderbolt 3, Jack tai nghe 3.5 mm cùng MagSafe 3 đã mang đến cho máy vẻ đẹp tối giản nhưng vẫn đảm bảo truyền tải mọi dữ liệu hay hình ảnh, video,... đến các thiết bị ngoại vi khác một cách nhanh chóng và dễ dàng.&nbsp;<strong>1080p FaceTime HD camera</strong>&nbsp;cùng&nbsp;<strong>3 microphones</strong>&nbsp;hỗ trợ tối đa cho quá trình học tập và làm việc của bạn với chất lượng hình ảnh kết xuất sắc nét cùng giọng nói được thu âm rõ ràng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-8.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-8.jpg\"></a></p><h3><strong>Màn hình Retina sắc nét cho mọi trải nghiệm hoàn hảo</strong></h3><p>Kích thước màn hình&nbsp;<strong>13.6 inch</strong>&nbsp;có độ phân giải&nbsp;<strong>Liquid Retina (2560 x 1664)</strong>&nbsp;cùng&nbsp;<strong>1 tỷ màu</strong>&nbsp;mang đến cho chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop-apple-macbook\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">MacBook</a>&nbsp;những khung ảnh siêu sắc nét với những gam màu chuẩn xác, cực kỳ thích hợp cho người dùng khi thực hiện các tác vụ chỉnh sửa hình ảnh, video,... hay đắm chìm vào những thước phim hành động sống động.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-4.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-4.jpg\"></a></p><p>Độ sáng&nbsp;<strong>500 nits</strong>&nbsp;giúp bạn hoàn toàn tự tin khi sử dụng máy ở những điều kiện môi trường nắng gắt nhưng vẫn nhìn rõ được nội dung hiển thị trên màn hình. Dải màu rộng&nbsp;<strong>P3</strong>&nbsp;cùng công nghệ&nbsp;<strong>True Tone</strong>&nbsp;cho các khung ảnh được tái tạo chuyên nghiệp và chân thực nhất so với điều kiện ánh sáng xung quanh.&nbsp;</p><p>Hệ thống âm thanh vòm đa chiều&nbsp;<strong>Dolby Atmos</strong>,&nbsp;<strong>Spatial Audio</strong>&nbsp;kết hợp cùng&nbsp;<strong>4 loa</strong>&nbsp;mang đến trọn vẹn những trải nghiệm giải trí chân thực với chất âm sống động, âm bass to rõ, độ khuếch đại âm thanh lớn giúp bạn hòa mình vào những bản tình ca du dương hay các tập phim hành động kịch tính.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-6.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/289441/vi-vn-apple-macbook-air-m2-2022-16gb-ab-6.jpg\"></a></p><h3>MacBook Air M2 2022 sẽ là một đối thủ đáng gờm trong cùng phân khúc khi sở hữu một vẻ ngoài kiêu kỳ, hoàn mỹ, màn hình Retina sắc nét cùng hiệu năng ấn tượng đến từ chip Apple M2 tân tiến, hứa hẹn không làm các tín đồ nhà Táo thất vọng.</h3>',
    37900.00,
    0.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025911',
    'Laptop Acer TravelMate B3 TMB311 31 C2HB N4020/4GB/128GB/Win11',
    '<h3><a href=\"https://www.thegioididong.com/laptop/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Laptop Acer TravelMate B3 TMB311 31 C2HB (NX.VNFSV.006)</strong></a><strong>&nbsp;nhắm đến phân khúc&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop?g=hoc-tap-van-phong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop học tập - văn phòng</strong></a><strong>, phục vụ cho các nhu cầu cơ bản trên laptop, với kích thước nhỏ gọn và hiệu năng đủ dùng, là sự lựa chọn tốt cho học sinh, sinh viên.</strong></h3><h3><strong>Thiết kế nhỏ gọn, tính di động cao</strong></h3><p>Acer TravelMate B3 có khối lượng máy chỉ&nbsp;<strong>1.4 kg</strong>, độ dày&nbsp;<strong>20.99 mm</strong>, thiết kế thanh lịch, đẹp mắt với lớp vỏ nhựa màu đen đơn giản kèm logo hãng tinh tế ở góc trái trên mặt lưng, dễ dàng cùng bạn xuất hiện ở mọi nơi.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-2.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-2.jpg\"></strong></a></p><p><strong>Được tối giản cả ở bàn phím,&nbsp;</strong><a href=\"https://www.thegioididong.com/laptop\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop</a>&nbsp;dùng hệ bàn phím<strong>&nbsp;</strong>có hành trình tốt, độ nhạy cao, cho thao tác soạn thảo nhanh êm và nhạy, đáp ứng nhu cầu học tập, làm việc.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-6.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-6.jpg\"></strong></a></p><p><strong>Vượt qua nhiều bài kiểm tra nghiêm ngặt và đạt chuẩn quân đội&nbsp;MIL STD 810G</strong>&nbsp;trước các tác động của môi trường như nhiệt độ, bụi bẩn, sương muối, rung sốc,...</p><p>Chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop-acer\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">laptop Acer</a>&nbsp;nhỏ nhắn trang bị đa dạng các kết nối thông dụng, bao gồm cổng USB 3.2 x 2, HDMI, jack tai nghe 3.5 mm, LAN (RJ45), USB Type-C, khe cắm thẻ Micro SD và 2 kết nối không dây chất lượng cao, ổn định là&nbsp;<strong>Bluetooth 5.0 và Wi-Fi 802.11 a/b/g/n/ac</strong>, ngăn chặn sự mất kết nối đột ngột, tối ưu hiệu suất của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-11.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-11.jpg\"></strong></a></p><p><strong>Ngoài ra, với&nbsp;HD Webcam</strong>, học tập và làm việc, giao tiếp video trực tuyến qua Zoom,&nbsp;Microsoft Teams, Google Meet,… sẽ dễ dàng, thuận tiện, hiệu quả cho người dùng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-10.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-10.jpg\"></strong></a></p><h3><strong>Cấu hình đáp ứng tốt các tác vụ cơ bản</strong></h3><p>Nhắm tới nhu cầu sử dụng laptop để học tập và làm việc văn phòng cơ bản, Acer trang bị cho chiếc laptop dòng&nbsp;<strong>chip Intel Celeron N4020</strong>&nbsp;có hiệu năng đủ dùng với xung nhịp cơ bản&nbsp;<strong>1.1 GHz&nbsp;</strong>và tối đa&nbsp;<strong>2.8 GHz&nbsp;</strong>khi ép xung, được sự hỗ trợ của card tích hợp&nbsp;<strong>Intel UHD Graphics 600</strong>&nbsp;để giải quyết nhẹ nhàng, nhanh mượt các thao tác soạn thảo bài tập trên Word, tính toán, nhập liệu qua Excel, soạn bản thuyết trình bài học trên PowerPoint,… hay duyệt web, tìm kiếm thông tin trên Chrome.</p><p><a href=\"https://www.thegioididong.com/laptop-acer-travelmate\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Acer TravelMate</a>&nbsp;sở hữu bộ nhớ&nbsp;<strong>RAM 4 GB&nbsp;</strong>chuẩn&nbsp;<strong>DDR4 (1 khe)</strong>&nbsp;đáp ứng tốt đa nhiệm, bạn có thể mở nhiều tab cùng lúc hay vừa soạn bài vừa tìm kiếm thông tin, hạn chế hiện tượng máy bị đơ hoặc đứng.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-4.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-4.jpg\"></strong></a></p><p><strong>Trang bị&nbsp;ổ cứng SSD 128 GB&nbsp;M2 PCle</strong>&nbsp;đủ lưu trữ các dữ liệu cá nhân, đảm bảo tốc độ khởi động máy nhanh và đọc ghi dữ liệu tốt, ổn định hiệu suất làm việc của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-5.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-5.jpg\"></strong></a></p><h3><strong>Màn hình nhỏ gọn rõ nét, âm thanh chân thực rất ấn tượng</strong></h3><p>Chiếc laptop Acer có kích thước màn hình&nbsp;<strong>11.6 inch</strong>&nbsp;nhỏ nhắn, được tích hợp công nghệ&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-man-hinh-acer-comfyview-co-gi-dac-biet-1192380\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Acer ComfyView</a>&nbsp;độc quyền và&nbsp;<strong>TFT&nbsp;</strong>tái tạo màu sắc và độ tương phản tốt, khả năng chống chói hiệu quả nên dễ dàng sử dụng ngoài trời, chất lượng phân giải màn hình chuẩn&nbsp;<strong>HD (1366 x 768)</strong>&nbsp;mang đến khung hình rõ nét, tươi sáng, vừa mắt. Màn hình mỏng hơn, toả nhiệt ít hơn nhờ<strong>&nbsp;LED Backlit</strong>, tiết kiệm điện năng cho máy của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-7.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-7.jpg\"></strong></a></p><p><strong>Đặc biệt, dù nhỏ nhắn nhưng hệ thống loa tích hợp công nghệ âm thanh&nbsp;Acer TrueHarmony</strong>&nbsp;mang đến chất lượng âm đặc sắc, âm thanh mạnh mẽ, hiệu ứng 3D lan tỏa, trải nghiệm thật đã khi nghe nhạc, xem phim trực tuyến,… trong những khung giờ giải trí của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-8.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/44/265015/acer-travelmate-b3-tmb311-31-c2hb-nxvnfsv006-8.jpg\"></strong></a></p><h3><strong>Acer TravelMate B3 TMB311 31 C2HB (NX.VNFSV.006) nhỏ gọn, hiệu năng đủ dùng, chất lượng tạm ổn cho nhu cầu sử dụng laptop cơ bản, đáp ứng cả về tiêu chí sử dụng và giá thành tiêu dùng, lựa chọn kinh tế cho người tiêu dùng.</strong></h3>',
    57000.00,
    5.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'L2025920',
    'Laptop Asus TUF Gaming F15 FX507ZU4 i7 12700H/8GB/512GB/6GB RTX4050/144Hz/Win11',
    '<h3><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Laptop Asus TUF Gaming F15 FX507ZU4 i7 (LP520W)</strong></a><strong>&nbsp;là sự lựa chọn không thể hợp lý hơn khi bạn chọn mua&nbsp;</strong><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>laptop gaming</strong></a><strong>&nbsp;bởi không chỉ sở hữu ngoại hình bắt mắt mà thiết bị còn mang trong mình những thông số cấu hình mạnh mẽ.</strong></h3><h3><strong>Sẵn sàng chiến mọi tựa game</strong></h3><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Asus TUF Gaming</a>&nbsp;sở hữu sức mạnh vượt trội của bộ vi xử lý&nbsp;<strong>Intel Core i7 12700H</strong>&nbsp;với&nbsp;<strong>14 nhân</strong>&nbsp;và&nbsp;<strong>20 luồng</strong>, đồng thời được trang bị card đồ họa rời&nbsp;<strong>NVIDIA GeForce RTX 4050 6 GB</strong>&nbsp;mạnh mẽ, từ đó cho khả năng chơi game ở mức cấu hình cao và vận hành khối lượng công việc nặng mượt mà.</p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop&nbsp;</a>sở hữu&nbsp;<strong>RAM&nbsp;8 GB</strong>&nbsp;với khả năng nâng cấp tối đa lên đến&nbsp;<strong>32 GB</strong>&nbsp;cho phép bạn sử dụng đa nhiệm mượt mà, liên tục chuyển lại giữa các tác vụ công việc và giải trí mà không lo bị giật lag làm gián đoạn.</p><p>Ổ cứng&nbsp;<strong>SSD 512 GB NVMe PCIe</strong>&nbsp;tối ưu tốc độ khởi động Windows và ứng dụng nhờ có tốc độ đọc ghi dữ liệu cao. Máy cũng hỗ trợ khe cắm ổ&nbsp;<strong>SSD&nbsp;M.2 PCIe</strong>&nbsp;với dung lượng tối đa lên đến&nbsp;<strong>2 TB</strong>.</p><h3><strong>Tận hưởng hình ảnh đắm chìm</strong></h3><p>Màn hình&nbsp;<strong>15.6 inch</strong>&nbsp;hỗ trợ hiển thị nội dung ở độ phân giải&nbsp;<strong>Full HD</strong>&nbsp;cung cấp cho bạn trải nghiệm khung hình rộng lớn,&nbsp;đạt chuẩn màu&nbsp;<strong>100% sRGB</strong>&nbsp;đảm bảo mọi chi tiết đều được tái tạo sắc nét với màu sắc tươi tắn cùng độ trung thực cao.</p><p>Tấm nền&nbsp;<strong>IPS</strong>&nbsp;hỗ trợ tần số quét&nbsp;<strong>144 Hz</strong>&nbsp;có khả năng tái tạo hoàn hảo những khung hình chuyển động nhanh để bạn chiến game thêm hưng phấn. Cộng hưởng cùng công nghệ&nbsp;<strong>G-Sync</strong>&nbsp;sẽ cho bạn trải nghiệm thêm mượt mà.</p><p>Hệ thống loa đạt chuẩn&nbsp;<strong>Hi-Res</strong>&nbsp;đi cùng công nghệ&nbsp;<strong>Dolby Atmos</strong>&nbsp;sẽ mang đến cho bạn những giây phút giải trí trên cả tuyệt vời, âm thanh chất lượng cao cùng những âm vòm 3D sống động sẽ là động lực để bạn giành chiến thắng.</p><h3><strong>Thể hiện nổi bật phong cách độc đáo&nbsp;riêng</strong></h3><p><strong>Đèn bàn phím chuyển màu RGB</strong>&nbsp;không chỉ hỗ trợ bạn ấn phím chuẩn xác để điều khiển nhân vật trong game mà còn khơi nguồn cảm hứng chiến đấu với những dải màu sắc nhấp nháy trông thật phong cách.</p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Laptop Asus</a>&nbsp;sở hữu lớp&nbsp;<strong>vỏ nhựa</strong>&nbsp;cứng cáp với khối lượng&nbsp;<strong>2.2 kg</strong>&nbsp;không quá nặng và vẫn có thể nằm gọn trong một chiếc balo, theo bạn đến khắp mọi nơi để phục vụ cho nhu cầu giải trí.</p><p>Dọc hai bên thân máy được trang bị những cổng giao tiếp như: Thunderbolt 4, USB-C, USB-A, LAN,... đáp ứng mọi nhu cầu khi cần kết nối với thiết bị ngoại vi.</p>',
    37000.00,
    5.00,
    'Laptop',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P152735',
    'Asus ExpertCenter AIO A3402WBAK i5',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/asus-expertcenter-aio-a3402wbak-i5-wa066w\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Máy tính để bàn&nbsp;Asus ExpertCenter AIO A3402WBAK i5 1235U 23.8 inch (WA066W)</strong></a><strong>&nbsp;là một giải pháp hoàn hảo cho những bạn muốn tiết kiệm không gian với một thiết bị được tích hợp đầy đủ các tính năng của máy tính, đáp ứng các nhu cầu của học tập, làm việc và giải trí khác nhau.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-asus\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn Asus</a>&nbsp;được trang bị CPU&nbsp;<strong>Intel Core i5 1235U</strong>&nbsp;với tốc độ xung nhịp tối đa lên đến&nbsp;<strong>4.40 GHz</strong>, cho phép bạn xử lý các tác vụ văn phòng hay giải trí đa phương tiện một cách mượt mà, hiệu quả. Ngoài ra, máy còn đi kèm với card đồ họa&nbsp;<strong>Intel UHD Graphics</strong>&nbsp;giúp hiển thị hình ảnh sắc nét.</p><p>•&nbsp;Để đáp ứng các nhu cầu sử dụng đa nhiệm, Asus ExpertCenter AIO được trang bị bộ nhớ&nbsp;<strong>RAM 8 GB DDR4</strong>&nbsp;và có khả năng nâng cấp lên đến&nbsp;<strong>32 GB</strong>. Việc nâng cấp RAM sẽ giúp máy hoạt động mượt mà và xử lý tốt các tác vụ đa nhiệm cũng như ứng dụng nặng.</p><p>•&nbsp;Ổ cứng SSD dung lượng&nbsp;<strong>512 GB</strong>&nbsp;giúp tăng tốc độ vận hành của hệ thống, bạn sẽ không còn phải chờ đợi quá lâu khi khởi động máy hay mở các ứng dụng.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn AIO</a>&nbsp;này được trang bị hệ điều hành&nbsp;<strong>Windows 11 Home</strong>&nbsp;cho bạn trải nghiệm sử dụng máy tính đơn giản, hiệu quả và an toàn hơn.</p><p>•&nbsp;Màn hình&nbsp;<strong>23.8 inch</strong>&nbsp;độ phân giải&nbsp;<strong>Full HD</strong>&nbsp;với thông số&nbsp;<strong>sRGB 100%</strong>&nbsp;giúp hiển thị hình ảnh sắc nét và chân thực. Đặc biệt, màn hình còn hỗ trợ công nghệ chống chói&nbsp;<strong>Anti Glare</strong>&nbsp;giúp bạn dễ dàng quan sát nội dung một cách nhanh chóng và thuận tiện.</p><p>•&nbsp;Ngoài ra,&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn</a>&nbsp;còn được tích hợp công nghệ&nbsp;<strong>SonicMaster</strong>&nbsp;giúp tăng cường âm thanh, đem lại trải nghiệm giải trí tuyệt vời hơn.</p><h3>• Máy có nhiều cổng giao tiếp thông dụng: USB-A, USB-C, HDMI, LAN,...</h3>',
    32000.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025122',
    'Asus S501MD i5 12400/8GB/512GB/Bàn phím/Chuột/Win11',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/asus-s501md-i5-512400079w\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>PC Asus S501MD i5 12400 (512400079W)</strong></a><strong>&nbsp;với kiểu dáng hiện đại đi kèm những tính năng và thông số kỹ thuật ấn tượng, hứa hẹn sẽ đáp ứng được mọi nhu cầu sử dụng của người dùng.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-asus\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn Asus</a>&nbsp;được tích hợp bộ vi xử lý&nbsp;<strong>Intel Core i5 12400</strong>&nbsp;và card tích hợp&nbsp;<strong>Intel UHD Graphics 730</strong>, có thể vận hành hầu hết mọi tác vụ văn phòng từ nhẹ đến nặng hay xem phim giải trí, chơi game ở mức cấu hình vừa phải.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn</a>&nbsp;được trang bị một thanh&nbsp;<strong>RAM 8 GB DDR4</strong>&nbsp;với khả năng nâng cấp lên đến&nbsp;<strong>64 GB</strong>&nbsp;nhờ&nbsp;<strong>1 khe trống</strong>,&nbsp;cho phép bạn vận hành cùng lúc nhiều tác vụ mà không bị lag hay chậm trễ.&nbsp;</p><p>• Ổ cứng&nbsp;<strong>SSD 512 GB</strong>&nbsp;cho phép bạn lưu trữ một lượng lớn tài liệu, ứng dụng và dữ liệu một cách nhanh chóng. PC cũng có khe cắm&nbsp;<strong>ổ HDD SATA</strong>&nbsp;để nâng cấp dung lượng lưu trữ.</p><p>• Hệ điều hành&nbsp;<strong>Windows 11 Home</strong>&nbsp;với giao diện và các ứng dụng được cập nhật mới nhất giúp bạn hoàn thành công việc một cách nhanh chóng. Máy được tặng kèm&nbsp;<strong>bàn phím và chuột</strong>&nbsp;để bạn có thể làm việc hay giải trí một cách thuận tiện.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-pc\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">PC</a>&nbsp;có kiểu dáng hiện đại với lớp&nbsp;<strong>vỏ nhựa</strong>&nbsp;cứng cáp, kích thước nhỏ gọn không chiếm quá nhiều diện tích trên bàn làm việc hay bàn học.</p><p>• Với các cổng giao tiếp như: LAN, HDMI, USB-A, USB-C và jack tai nghe 3.5 mm ở mặt trước và mặt sau khung máy, bạn có thể dễ dàng kết nối với những thiết bị khác như màn hình, loa, máy in, USB,...</p>',
    20000.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025209',
    'Mac Mini 2020 M1 8-core/8GB/512GB/Silver',
    '<h3><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Mac Mini 2020 M1(MGNT3SA/A)&nbsp;</strong></a><strong>gây ấn tượng cho người dùng với thiết kế nhỏ gọn, tiện lợi cùng sức mạnh vượt trội đến từ con chip M1 mạnh mẽ, đáp ứng mọi nhu cầu văn phòng, đồ họa chuyên nghiệp.</strong></h3><h3><strong>Khám phá sức mạnh tiềm năng đến từ con</strong><a href=\"https://3https//www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>&nbsp;chip M1</strong></a></h3><p>Được trang bị bộ vi xử lý độc quyền đến từ nhà Apple với&nbsp;<strong>8 lõi</strong>&nbsp;trong CPU gồm&nbsp;<strong>4 lõi hiệu năng cao</strong>&nbsp;và&nbsp;<strong>4 lõi tiết kiệm điện</strong>, giúp bạn xử lý tốt các công việc nhẹ như lướt web, nghe nhạc, xem phim,... hay thậm chí là vận hành trơn tru những tác vụ nặng như chỉnh sửa hình ảnh, render video,... mang đến hiệu suất vượt trội gấp&nbsp;<strong>3 lần</strong>&nbsp;so với thế hệ tiền nhiệm nhờ tiến trình&nbsp;<strong>5 nm</strong>&nbsp;và&nbsp;<strong>16 tỷ</strong>&nbsp;bóng bán dẫn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100416.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100416.jpg\"></a></p><p>Đi kèm theo đó là<strong>&nbsp;8 nhân GPU</strong>&nbsp;mạnh mẽ gia tăng khả năng thiết kế đồ họa, dựng phim,... trên các ứng dụng như Photoshop, Illustrator, Final Cut,... được diễn ra mạch lạc với mức xung nhịp lớn.</p><p>Mac Mini được cấu hình với bộ nhớ<a href=\"https://www.thegioididong.com/hoi-dap/ram-lap-top-la-gi-dung-luong-bao-nhieu-la-du-1172167\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">&nbsp;RAM 8 GB&nbsp;</a>cho khả năng đa nhiệm mượt mà và có độ trễ thấp, giúp chiếc máy tính của bạn luôn chạy mượt mà giữa các ứng dụng cùng lúc mà không lo giật lag, đồng thời chia sẻ dữ liệu giữa CPU, GPU và Neural Engine hay mở hàng loạt layer trong phần mềm đồ họa một cách trơn tru, hiệu quả.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100709.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100709.jpg\"></a></p><p>Ổ cứng&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/o-cung-ssd-la-gi-923073\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">SSD 512 GB</a>&nbsp;cho tốc độ đọc ghi và phản hồi dữ liệu nhanh chóng, đồng thời cung cấp không gian lưu trữ đủ để bạn tải các tệp tin hữu ích hay những bộ phim yêu thích về máy, phục vụ tối đa nhu cầu học tập và làm việc hằng ngày.</p><p>Chạy trên hệ điều hành&nbsp;<strong>macOS Big Sur</strong>&nbsp;với giao diện hiện đại, Mac mini mang lại những trải nghiệm thú vị cho người dùng với những tính năng hữu ích tích hợp cùng lớp bảo mật cao đến từ con chip Apple M1, đảm bảo an toàn cho mọi thông tin cá nhân khi bạn đang lướt web hay làm việc.&nbsp;</p><h3><strong>Nhỏ gọn, linh hoạt và tinh tế trên từng đường nét</strong></h3><p>Sở hữu thiết kế khối vuông hiện đại với những đường nét bo tròn tinh tế,&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-apple-mac-mini\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Mac mini&nbsp;</a>M1 2020 mang đến cảm giác mềm mại nhưng không kém phần sang trọng với sắc bạc hiện đại, độ dày<strong>&nbsp;36 mm</strong>&nbsp;và khối lượng chỉ vỏn vẹn&nbsp;<strong>1.2 kg</strong>, giúp người dùng di chuyển tiện lợi đồng thời tiết kiệm được lượng điện năng đáng kể hơn so với thế hệ trước.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100412.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100412.jpg\"></a></p><p>Nhờ thiết kế siêu di động đặc biệt, nhà Apple đã mở ra một khái niệm mới cho máy tính để bàn, không còn là những cỗ máy CPU to lớn, cồng kềnh như các dòng khác, ngược lại bạn có thể bố trí ở bất cứ nơi đâu bạn thích mà không sợ chiếm quá nhiều không gian.</p><p>Bộ vi xử lý&nbsp;<strong>Secure Enclave</strong>&nbsp;cho khả năng bảo mật tối ưu với cơ chế mã hóa lưu trữ dữ liệu AES trên ổ cứng chuyên dụng, xác định danh tính với Apple ID cho bạn độ an toàn gần như là hoàn hảo.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100410.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100410.jpg\"></a></p><p>Tuy sở hữu thiết kế nhỏ gọn nhưng mức độ tản nhiệt trên máy vẫn là một điểm cộng lớn cho chiếc&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-apple\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn Apple</a>&nbsp;khi được trang bị hệ thống quạt lớn hơn với lỗ thông hơi mở rộng và bộ nguồn linh hoạt giúp luồng không khí được lưu thông tốt hơn, mang lại hiệu suất tối ưu khi hoạt động.</p><h3><strong>Đa dạng các cổng kết nối hiện đại</strong></h3><p>Máy được trang bị đầy đủ các cổng kết nối phổ biến hiện nay như 2 cổng USB A, HDMI, Jack 3.5 mm, LAN (RJ45) và đặc biệt là 2 cổng Thunderbolt 4 với tốc độ truyền tải lên đến&nbsp;<strong>40 GB/s</strong>, hỗ trợ kết xuất hình ảnh chất lượng&nbsp;<strong>6K</strong>&nbsp;sắc nét đồng thời giúp máy tương thích với nhiều thiết bị ngoại vi khác.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100414.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251248/mac-mini-2020-m1-mgnt3saa-060123-100414.jpg\"></a></p><p>Hai kết nối không dây chuẩn&nbsp;<strong>Bluetooth 5.0&nbsp;</strong>và&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/wifi-6-la-gi-toc-do-nhanh-nhu-the-nao-1341982\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Wi-Fi 6 AX201&nbsp;</a>cho tốc độ truyền tải dữ liệu nhanh chóng và chính xác hơn với băng thông lên đến&nbsp;<strong>10.000 Mbps</strong>, đảm bảo đường truyền luôn trong trạng thái ổn định mà không lo bị giật lag.</p><h3>Với thiết kế nhỏ gọn cùng những thông số kỹ thuật mạnh mẽ, Mac mini M1 2020 sẽ là một chiếc&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn&nbsp;</a>mới mẻ mang đến những trải nghiệm thú vị cho người dùng trong các tác vụ văn phòng thường ngày hay thiết kế đồ họa chuyên nghiệp.</h3>',
    16000.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025259',
    'iMac 24 inch 2021 4.5K M1/256GB/8GB/8-core GPU',
    '<h3><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>iMac 24 inch 2021 4.5K Retina M1</strong></a><strong>&nbsp;là mẫu máy tính để bàn tích hợp CPU vào màn hình của Apple với thiết kế vẻ ngoài hoàn toàn mới, màu sắc rực rỡ cùng hiệu năng vô cùng mạnh mẽ từ chip M1.</strong></h3><h3><strong>Sức mạnh từ chip Apple M1</strong></h3><p>Cung cấp sức mạnh cho iMac 24 inch 4.5K Retina này của Apple là&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-m1-con-chip-arm-5nm-dau-tien-danh-1305955\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">chip M1</a>&nbsp;<strong>8 nhân</strong>&nbsp;với hiệu năng mạnh, tản nhiệt tốt, đáp ứng nhu cầu đa tác vụ từ học tập, văn phòng đến đồ hoạ chuyên nghiệp. Nhờ M1 mà iMac chỉ cần&nbsp;<strong>2 quạt</strong>&nbsp;nhỏ để tản nhiệt thay vì một hệ thống tản nhiệt cồng kềnh trước đây.</p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn Apple M1</a>&nbsp;sở hữu&nbsp;card đồ hoạ tích hợp&nbsp;<strong>8 nhân</strong>, cung cấp tốc độ xử lý về hình ảnh đồ hoạ nhanh gấp 2 lần so với phiên bản tiền nhiệm, đáp ứng tốt nhu cầu sử dụng các phần mềm như Photoshop, Lightroom, Final Cut, Xcode,...</p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn đồ hoạ - kỹ thuật</a>&nbsp;này&nbsp;có&nbsp;<strong>RAM 8 GB</strong>&nbsp;mang đến khả năng đa nhiệm ổn định, chuyển qua lại giữa các phần mềm đang sử dụng mượt mà, nhanh chóng không lo bị giật, lag.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-4-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-4-1.jpg\"></strong></a></p><p><strong>SSD 256 GB</strong>&nbsp;cho một không gian lưu trữ đủ dùng để lưu các phần mềm, khởi động máy nhanh, truy xuất dữ liệu dường như trong chớp mắt.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-5.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-5.jpg\"></strong></a></p><h3><strong>Trải nghiệm hình ảnh, âm thanh sống động</strong></h3><p>iMac M1 sở hữu&nbsp;<a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">màn hình 24 inch</a>&nbsp;độ phân giải Retina 4.5K sắc nét đến từng chi tiết với hơn&nbsp;<strong>11.3 triệu</strong>&nbsp;điểm ảnh. Viền màn hình được chế tác nhỏ hơn, mang đến không gian hiển thị lớn ấn tượng.</p><p>Độ sáng màn hình lên đến&nbsp;<a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">500 nits</a>&nbsp;cùng lớp phủ chống phản chiếu trên màn hình càng làm tăng độ chính xác của hình ảnh hiển thị trong bất kì điều kiện ánh sáng nào, tạo sự thoải mái, dễ chịu khi trải nghiệm.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-7.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-7.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Màu sắc của các hình ảnh hiển thị trên&nbsp;</strong></a><a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn</a>&nbsp;Apple vô cùng chuẩn xác với chuẩn&nbsp;<strong>DCI-P3</strong>&nbsp;nổi tiếng bởi hơn&nbsp;<strong>1 tỷ</strong>&nbsp;màu khác nhau,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-cong-nghe-man-hinh-true-tone-992705\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">công nghệ True Tone</a>&nbsp;độc quyền giúp điều chỉnh màu sắc hình ảnh dựa vào ánh sáng môi trường xung quanh.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-01.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-01.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Hệ thống&nbsp;</strong></a><strong>6 loa</strong>&nbsp;kép được trang bị trên cạnh dưới của màn hình bao gồm&nbsp;<strong>4 loa trầm</strong>&nbsp;kép cùng&nbsp;<strong>2 loa tweeter</strong>&nbsp;đi kèm giúp âm thanh tái tạo chân thực, trong trẻo, hạn chế độ rung không cần thiết. Công nghệ âm thanh&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-dolby-altmos-la-gi-co-nhung-gi-noi-bat-1280672\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Dolby Atmos</a>&nbsp;cũng được tích hợp trong iMac 2021 cho những phút giây giải trí, xem phim, nghe nhạc sống động, thoải mái.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-10.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-10.jpg\"></strong></a></p><h3><strong>Mỏng hơn, tiết kiệm không gian hơn</strong></h3><p>Nhờ vi xử lý M1 của Apple nhỏ gọn, tản nhiệt tốt mà màn hình&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-apple\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">iMac</a>&nbsp;cũng được nhỏ gọn hơn, thiết kế mặt lưng phẳng thay vì cong như các phiên bản trước đây. Tại vị trí mỏng nhất, iMac M1 chỉ mỏng&nbsp;<strong>11.5 mm</strong>. Khối lượng toàn bộ máy là&nbsp;<strong>4.48 kg&nbsp;</strong>với chân đế rộng&nbsp;<strong>147 mm</strong>, tiết kiệm đến&nbsp;<strong>50%</strong>&nbsp;không gian đặt máy.</p><p>Với lớp vỏ ngoài bằng nhôm có thể tái chế đặc biệt, độc đáo lần đầu xuất hiện trên iMac, mẫu máy tính để bàn này thích hợp với những không gian phòng hiện đại, trẻ trung. Mặt sau của máy có màu đậm và rực rỡ hơn mặt trước khiến cho chiếc iMac này đặt ở đâu cũng có thể gây nổi bật.</p><p>Bộ máy của Apple bao gồm cả chuột và bàn phím đồng màu đi kèm, chỉ cần cắm dây cáp nguồn là đã có thể trải nghiệm.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-2-2.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-2-2.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Đặc biệt, bàn phím rời của Apple nay đã được trang bị&nbsp;</strong></a><strong>Touch ID</strong>, giúp thực hiện các thao tác bảo mật trên máy cũng như mở khoá vô cùng nhanh chóng, tiện lợi.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-6.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-6.jpg\"></strong></a></p><h3><strong>Kết nối đa dạng, webcam và micro được cải tiến</strong></h3><p>Mặt sau của máy có trang bị sẵn 4 cổng USB C, trong đó có 2 cổng Thunderbolt tốc độ kết nối&nbsp;<strong>40 Gbps</strong>&nbsp;siêu nhanh, hỗ trợ xuất màn hình rời lên đến 6K. Cạnh trái của màn hình còn trang bị 1 jack 3.5 mm để kết nối tai nghe cực tinh tế và thuận tiện.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-11.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-11.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/hoi-dap/apple-imac-la-gi-man-tro-lai-cua-imac-m1-voi-thiet-ke-mau-1345950\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Apple iMac</a>&nbsp;nay đã được sở hữu webcam&nbsp;<strong>Full HD</strong>, kết hợp với vi xử lý hình ảnh trên chip M1 cho chất lượng video trên các cuộc gọi trực tuyến của bạn luôn sắc nét và đẹp nhất.</p><p>Hệ thống&nbsp;<strong>3 micro</strong>&nbsp;chuẩn phòng thu được Apple cải tiến, cho chất lượng thu âm to rõ, lọc tạp âm tốt.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-9.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/238053/imac-24-inch-45k-retina-m1-mgph3saa-9.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Với những cải tiến đặc biệt từ thiết kế, màn hình, camera, âm thanh và hiệu năng cực kì mạnh mẽ từ chip M1, iMac 24 inch 2021 4.5K Retina M1 xứng đáng là sự lựa chọn hoàn hảo&nbsp;cho không gian làm việc của bạn.</strong></a></p>',
    32000.00,
    10.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025427',
    'HP AIO 22 df1019d i5 1135G7/4GB/512GB/21.5\" FullHD/Touch/Bàn phím/Chuột/Win10',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/hp-aio-22-df1019d-i5-4b6d7pa\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>HP AIO 22 df1019d i5 1135G7 (4B6D7PA)</strong></a><strong>&nbsp;là chiếc&nbsp;</strong><a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>máy tính AIO</strong></a><strong>&nbsp;được thiết kế đầy đủ CPU, loa, với kiểu dáng gọn gàng, năng động cùng cấu hình mạnh mẽ, đi kèm cả chuột và bàn phím, là người cộng sự lý tưởng cho bất kỳ ai.</strong></h3><h3><strong>Dáng vẻ hiện đại, năng động với thiết kế gọn nhẹ</strong></h3><p><a href=\"https://www.thegioididong.com/may-tinh-de-ban-hoc-tap-van-phong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn học tập - văn phòng</a>&nbsp;sở hữu đầy đủ tính năng đa dụng chỉ trên cùng một chiếc màn hình, mang đến hiệu quả công việc vượt trội nhưng diện tích chiếm dụng không quá lớn, cho bạn dễ dàng bày trí ở bất kỳ đâu.</p><p>Chiếc màn hình này sở hữu độ dày&nbsp;<strong>204.5 mm</strong>&nbsp;và khối lượng&nbsp;<strong>5.7 kg</strong>&nbsp;cùng gam màu trắng thanh lịch đi cùng với chân đế được tạo hình chữ X cách điệu đầy tinh tế, mang đến cảm giác chắc chắn, cho bạn thuận lợi di chuyển máy khi cần thiết.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-2-1.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-2-1.jpg\"></strong></a></p><p><a href=\"https://www.thegioididong.com/may-tinh-de-ban-hp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn HP</a>&nbsp;đã trang bị hàng loạt các cổng kết nối phổ biến như: 2 cổng SuperSpeed USB Type-A, 2 cổng USB 2.0, HDMI, Jack 3.5 mm, LAN (RJ45) và khe cắm HP 3-in-1, hỗ trợ bạn kết nối các thiết bị khác dễ dàng hơn mà không phải chuyển đổi rườm rà.</p><p>Các chuẩn kết nối không dây&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/cac-chuan-wifi-tren-laptop-1216711\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Wi-Fi chuẩn AC</a>&nbsp;và<strong>&nbsp;Bluetooth 4.2</strong>&nbsp;mang đến đường truyền ổn định, đảm bảo quá trình truyền tải dữ liệu thuận lợi trong suốt quá trình làm việc hay giải trí. Đặc biệt,&nbsp;<strong>HD Webcam</strong>&nbsp;rất tiện lợi, bạn có thể trượt lên/ xuống, vừa tiết kiệm diện tích cho máy vừa ngăn chặn được việc đánh cắp thông tin trên máy.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-8.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-8.jpg\"></strong></a></p><h3><strong>Cấu hình mạnh mẽ cho mọi tác vụ mượt mà</strong></h3><p>Bộ vi xử lý<strong>&nbsp;Intel Core i5&nbsp;Tiger Lake 1135G7</strong>&nbsp;với tốc độ CPU&nbsp;<strong>2.4 GHz</strong>&nbsp;và đạt tối đa lên đến&nbsp;<strong>4.2 GHz</strong>&nbsp;cùng bạn xử lý các công việc văn phòng một cách nhanh gọn, hiệu quả cùng các ứng dụng Word, Excel,... đồng thời hỗ trợ ít sản sinh nhiệt hơn các thế hệ tiền nhiệm.</p><p>Chỉnh sửa hình ảnh, render video một cách mượt mà với chất lượng hình ảnh vượt trội nhờ card đồ họa tích hợp&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-card-do-hoa-tich-hop-intel-iris-xe-graphics-1305192\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Intel Iris Xe Graphics</a>, cho phép bạn làm việc với các ứng dụng nhà Adobe một cách trơn tru.</p><p><a href=\"https://www.thegioididong.com/may-tinh-de-ban-core-i5\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn Intel core i5</a>&nbsp;sở hữu ổ&nbsp;cứng&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-ram-4-gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">RAM 4 GB</a><strong>&nbsp;</strong>thuộc dòng&nbsp;<strong>DDR4 2 khe</strong>&nbsp;(1 khe&nbsp;<strong>4 GB</strong>&nbsp;+ 1 khe trống) có tốc độ Bus RAM&nbsp;<strong>3200 MHz</strong>&nbsp;hỗ trợ người dùng mở và làm việc trên nhiều ứng dụng cùng lúc mà không lo giật lag, mang đến phiên bản máy tính nguyên bộ đa nhiệm hơn bao giờ hết. Không những thế bạn còn có thể nâng cấp RAM lên đến&nbsp;<strong>16 GB,&nbsp;</strong>phục vụ tối đa cho mọi nhu cầu của bạn.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-4.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-4.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Thoải mái lưu trữ mọi ứng dụng bạn thích nhờ không gian rộng rãi đến từ ổ cứng&nbsp;</strong></a><a href=\"https://www.thegioididong.com/may-tinh-de-ban?g=ssd-512-gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">SSD 512 GB</a>, đồng thời hỗ trợ mở và vận hành máy hay các ứng dụng trong tích tắc chỉ vài giây.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-5.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-5.jpg\"></strong></a></p><h3><strong>Tận hưởng trọn vẹn mọi khoảnh khắc</strong></h3><p><a href=\"https://www.thegioididong.com/may-tinh-de-ban-23-8-inch\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Màn hình 21.5 inch</a>&nbsp;với độ phân giải&nbsp;<strong>Full HD (1920 x 1080)</strong>​ cùng&nbsp;<strong>250 nits</strong>, cho bạn chìm đắm trong không gian hình ảnh chân thật, rõ nét dù ở ở bất kỳ đâu với điều kiện ánh sáng bình thường như trong phòng làm việc, tại lớp học,...</p><p>Khung ảnh được mở rộng lên đến 178 độ nhờ&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-ips-lcd-la-gi-905752\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">tấm nền IPS</a>&nbsp;với công nghệ chống chói&nbsp;<strong>Anti Glare</strong>&nbsp;hỗ trợ bạn nhận được hình ảnh sống động như thật dù không ngồi trực diện mà không lo mỏi mắt hay lóa mắt.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-7.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-7.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Ấn tượng hơn khi phiên bản này được trang bị&nbsp;</strong></a><strong>màn hình cảm ứng</strong>, giúp bạn dễ dàng thao tác bằng tay trên màn hình, nhất là đối với môi trường làm việc như các quán ăn, nhà hàng, khách sạn,... tiện lợi trong việc kiểm tra thông tin hay order món ăn, thức uống.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-6.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-6.jpg\"></strong></a></p><p><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Âm thanh vòm được tái tạo như thật nhờ công nghệ âm thanh&nbsp;</strong></a><a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-dts-tren-laptop-la-gi-1261821\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">DTS Headphone: X</a>, cho bạn cảm giác sống động như thật, chìm đắm trong không gian thư giãn cùng phim ảnh hay âm nhạc cực thoải mái.</p><p><a href=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-9.jpg\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong><img src=\"https://cdn.tgdd.vn/Products/Images/5698/251975/hp-aio-22-df1019d-i5-4b6d7pa-9.jpg\"></strong></a></p><h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính nguyên bộ</a>&nbsp;HP AIO 22 df1019d i5 1135G7 (4B6D7PA) sở hữu kiểu dáng trẻ trung cùng hiệu năng mạnh mẽ cho mọi công việc đều được xử lý nhanh gọn và hiệu quả, là phiên bản đáng sở hữu, phù hợp cho bất kỳ ai.</h3>',
    22000.00,
    10.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025543',
    'Asus ExpertCenter AIO A3202WBAK i5 1235U/8GB/512GB/21.45\"',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/asus-expertcenter-aio-a3202wbak-i5-wa019w\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Máy tính để bàn&nbsp;Asus ExpertCenter AIO A3202WBAK i5 1235U 21.45 inch (WA019W)</strong></a><strong>&nbsp;với cấu hình cao là sự lựa chọn tuyệt vời cho những bạn muốn tận hưởng trải nghiệm đỉnh cao khi làm việc cũng như giải trí. Chiếc máy AIO Asus này sẽ mang đến những tính năng vượt trội và hiệu suất cao cho người dùng.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn AIO</a>&nbsp;được trang bị bộ vi xử lý&nbsp;<strong>Intel Core i5 1235U</strong>&nbsp;và card tích hợp&nbsp;<strong>Intel UHD Graphics</strong>, đáp ứng được các yêu cầu cơ bản về xử lý đồ họa, đồng thời cho phép chạy mượt các tác vụ văn phòng và học tập.</p><p>•&nbsp;<strong>RAM 8 GB DDR4</strong>&nbsp;của Asus ExpertCenter AIO cho phép bạn chạy đa tác vụ một cách dễ dàng. Máy có khả năng nâng cấp lên&nbsp;<strong>32 GB</strong>&nbsp;có khả năng vận hành khối lượng công việc lớn mà không bị chậm hay tràn RAM gây đơ máy.</p><p>•&nbsp;Với ổ cứng&nbsp;<strong>SSD 512 GB</strong>, máy AIO đảm bảo hệ thống khởi động nhanh chóng và các ứng dụng đều được vận hành hiệu quả. Bạn cũng có thể lưu trữ một khối lượng lớn tài liệu, hình ảnh và video một cách thuận tiện.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tín để bàn</a>&nbsp;được cài đặt&nbsp;<strong>Windows 11 Home</strong>&nbsp;mang đến trải nghiệm người dùng mới nhất và tối ưu nhất. Hệ điều hành cung cấp nhiều tính năng tiện ích giúp bạn hoàn thành công việc nhanh hơn.</p><p>•&nbsp;Màn hình&nbsp;<strong>21.45 inch</strong>&nbsp;độ phân giải&nbsp;<strong>Full HD</strong>&nbsp;giúp hiển thị hình ảnh sắc nét và chân thực. Màn hình còn đạt chuẩn màu&nbsp;<strong>sRGB 100%</strong>&nbsp;đảm bảo nội dung luôn được tái tạo với màu sắc chuẩn xác, công nghệ chống chói&nbsp;<strong>Anti Glare</strong>&nbsp;giúp bạn quan sát dễ dàng hơn.</p><p>• Công nghệ&nbsp;<strong>SonicMaster</strong>&nbsp;cũng là một tính năng tuyệt vời được tích hợp trên máy Asus ExpertCenter AIO, cho phép bạn thưởng thức âm thanh chất lượng cao.</p><p>• Máy có nhiều cổng giao tiếp thông dụng như: USB-A, USB-C, HDMI, LAN,...</p>',
    18000.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025555',
    'HP EliteOne 840 G9 AIO i5 12500/8GB/512GB/23.8\"',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/hp-eliteone-840-g9-aio-i5-76n56pa\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Máy tính để bàn&nbsp;HP EliteOne 840 G9 AIO i5 12500 23.8 inch (76N56PA)</strong></a><strong>&nbsp;với thiết kế sang trọng sẽ là lựa chọn hoàn hảo cho những doanh nghiệp hay người dùng cá nhân đang tìm kiếm một sản phẩm đa dụng và có khả năng xử lý công việc một cách nhanh chóng, hiệu quả.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-hp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn HP</a>&nbsp;được trang bị bộ vi xử lý&nbsp;<strong>Intel Core i5 12500</strong>&nbsp;sẽ giúp người dùng thực hiện các công việc nặng và đa nhiệm một cách mượt mà và hiệu quả. Người dùng có thể sử dụng máy tính để làm việc với các ứng dụng như đồ họa, phần mềm thiết kế, chơi game và xử lý video một cách mượt mà, nhanh chóng.</p><p>•&nbsp;Trang bị&nbsp;<strong>RAM 8 GB DDR5</strong>&nbsp;giúp máy tính có khả năng chạy đa nhiệm và mở nhiều ứng dụng cùng lúc một cách mượt mà, từ đó giúp người dùng dễ dàng thực hiện các công việc đa nhiệm, xử lý đồ họa, cắt video, chơi game và nhiều tác vụ khác.</p><p>•&nbsp;Trang bị ổ cứng&nbsp;<strong>SSD</strong>&nbsp;<strong>512 GB</strong>&nbsp;của HP EliteOne 840 G9 cho phép người dùng thực hiện những công việc liên quan đến lưu trữ và xử lý dữ liệu một cách hiệu quả. Bạn có thể lưu nhiều tài liệu, hình ảnh, video, hoặc cài đặt phần mềm và ứng dụng một cách thoải mái mà không phải lo lắng về dung lượng ổ cứng.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn</a>&nbsp;cũng được trang bị&nbsp;<strong>màn hình cảm ứng</strong>&nbsp;<strong>23.8 inch</strong>&nbsp;với độ phân giải&nbsp;<strong>Full HD</strong>&nbsp;và độ sáng&nbsp;<strong>250 nits</strong>, không chỉ có khả năng hiển thị màu sắc chân thực mà còn cho góc nhìn rộng, giúp cho công việc và giải trí trở nên dễ dàng hơn.</p><p>• Card đồ họa&nbsp;<strong>Intel UHD Graphics 770</strong>&nbsp;giúp người dùng có thể thực hiện các công việc liên quan đến đồ họa như chỉnh sửa hình ảnh, video và vẽ đồ họa. Ngoài ra, card đồ họa này cũng hỗ trợ người dùng chơi game cơ bản với độ phân giải trung bình một cách mượt mà.</p><p>•&nbsp;HP đã cải thiện chất lượng âm thanh trên máy tính bằng cách tích hợp&nbsp;<strong>loa stereo</strong>&nbsp;và công nghệ&nbsp;<strong>Bang &amp; Olufsen audio</strong>&nbsp;và&nbsp;<strong>Realtek High Definition Audio</strong>&nbsp;để mang đến âm thanh chất lượng cao.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính All in One (AIO)</a>&nbsp;được cài đặt sẵn hệ điều hành&nbsp;<strong>Windows 11 Pro</strong>, cho phép người dùng trải nghiệm những tính năng mới nhất của Windows và đảm bảo an toàn, bảo mật.</p><p>•&nbsp;Máy tính để bàn HP EliteOne 840 G9 được thiết kế với hình dáng đẹp mắt, tinh tế và hiện đại. Vỏ máy được làm bằng chất liệu nhôm cao cấp, giúp tăng độ bền của sản phẩm.&nbsp;<strong>Bàn phím</strong>&nbsp;<strong>và</strong>&nbsp;<strong>chuột đi kèm</strong>&nbsp;được thiết kế nhỏ gọn, tiện lợi và dễ sử dụng.</p><p>•&nbsp;Máy tính để bàn HP EliteOne 840 G9 cũng được trang bị với đầy đủ các cổng giao tiếp cần thiết như:&nbsp;LAN (RJ45), HDMI,&nbsp;Display port,&nbsp;SuperSpeed USB Type-A và&nbsp;SuperSpeed USB Type-C.</p>',
    15000.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025638',
    'Lenovo IdeaCentre AIO 3 24IAP7 i3',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/lenovo-ideacentre-aio-3-24iap7-i3-f0gh00fuvn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Máy tính để bàn Lenovo IdeaCentre AIO 3 24IAP7 i3 23.8 inch (F0GH00FUVN)</strong></a><strong>&nbsp;tích hợp màn hình lớn với khả năng hiển thị nội dung sắc nét cùng bộ vi xử lý Intel thế hệ 12 mạnh mẽ, đáp ứng tốt cho cả công việc lẫn giải trí của người dùng.</strong></h3><p>•&nbsp;Lenovo IdeaCentre AIO 3 24IAP7 có màn hình&nbsp;<strong>23.8 inch</strong>&nbsp;với độ phân giải&nbsp;<strong>Full HD (1920 x 1080)</strong>, cung cấp hình ảnh sắc nét và rõ ràng. Tấm nền&nbsp;<strong>IPS</strong>&nbsp;giúp tăng cường góc nhìn, kết hợp cùng công nghệ&nbsp;<strong>Anti Glare</strong>&nbsp;giảm thiểu sự chói lóa và ánh sáng phản chiếu từ màn hình, giúp bạn có trải nghiệm xem hình ảnh tốt hơn.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-lenovo\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn Lenovo</a>&nbsp;được trang bị bộ vi xử lý&nbsp;<strong>Intel Core i3 1215U</strong>&nbsp;có tốc độ xử lý cao lên đến&nbsp;<strong>4.40 GHz</strong>, đảm bảo hoạt động mượt mà đối với các tác vụ văn phòng hay giải trí cơ bản.&nbsp;Card đồ họa&nbsp;<strong>Intel UHD Graphics</strong>&nbsp;giúp máy tính xử lý đồ họa cơ bản một cách nhanh chóng và hiệu quả.</p><p>•&nbsp;Chiếc&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn AIO</a>&nbsp;này sở hữu bộ nhớ&nbsp;<strong>RAM 4 GB DDR4</strong>&nbsp;đáp ứng nhu cầu&nbsp;sử dụng các tác vụ như duyệt web, xem phim, chơi game nhẹ và chạy ứng dụng văn phòng.&nbsp;Bạn có thể nâng cấp lên tối đa&nbsp;<strong>16 GB</strong>&nbsp;để xử lý nhiều tác vụ cùng một lúc một cách dễ dàng.</p><p>•&nbsp;Với ổ SSD dung lượng&nbsp;<strong>256 GB</strong>, IdeaCentre AIO 3 24IAP7 có tốc độ đọc và ghi cao, đảm bảo thời gian khởi động nhanh và khởi chạy các ứng dụng nhanh hơn. Máy hỗ trợ khe cắm&nbsp;<strong>HDD SATA 2.5 inch</strong>&nbsp;tối đa&nbsp;<strong>1 TB</strong>&nbsp;để bạn có thêm dung lượng lưu trữ khi cần.</p><p>•&nbsp;Thiết bị được cài đặt sẵn&nbsp;<strong>Windows 11</strong>&nbsp;với&nbsp;giao diện người dùng hiện đại và tinh tế, cũng như cung cấp nhiều tính năng mới, cải tiến về hiệu suất để mang lại trải nghiệm sử dụng máy tính tốt hơn cho người dùng.</p><p>•&nbsp;<strong>HD webcam</strong>&nbsp;giúp người dùng thực hiện các cuộc gọi video một cách tiện lợi, đảm bảo chất lượng hình ảnh cũng như tham gia các hoạt động trực tuyến một cách dễ dàng.</p><p>•&nbsp;Lenovo IdeaCentre AIO 3 có lối thiết kế hiện đại với&nbsp;<strong>viền màn hình siêu mỏng</strong>&nbsp;ở 3 cạnh, tông&nbsp;<strong>màu trắng</strong>&nbsp;tao nhã phù hợp với nhiều kiến trúc nội thất khác nhau, từ nhà riêng cho đến văn phòng làm việc.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn</a>&nbsp;cũng có nhiều cổng giao tiếp như: LAN (RJ45), HDMI 1.4, USB 2.0 và USB 3.2, hỗ trợ người dùng kết nối với các thiết bị ngoại vi một cách dễ dàng.</p>',
    14000.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025712',
    'HP AIO 22 dd2002d i5 1235U/8GB/512GB/21.5\"',
    '<h3><strong>Nếu bạn đang cần một trợ thủ đắc lực sở hữu đầy đủ mọi ưu điểm từ cấu hình mạnh mẽ đến màn hình lớn, ngoại hình đẹp mắt,&nbsp;</strong><a href=\"https://www.thegioididong.com/may-tinh-de-ban/hp-aio-22-dd2002d-i5-6k7g1pa\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>máy tính để bàn HP AIO 22 dd2002d i5 (6K7G1PA)</strong></a><strong>&nbsp;sẽ là sản phẩm&nbsp;</strong><a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>All-in-one</strong></a><strong>&nbsp;mà bạn không nên bỏ lỡ, cực kỳ phù hợp cho mọi đối tượng là sinh viên, dân văn phòng hay thậm chí là người dùng sáng tạo.</strong></h3><p>• Mang trên mình bộ vi xử lý Intel&nbsp;<strong>Core i5 1235U</strong>&nbsp;mạnh mẽ kết hợp với card&nbsp;<strong>Intel UHD Graphics</strong>&nbsp;giúp bạn vận hành tốt mọi tác vụ học tập - văn phòng từ cơ bản đến nâng cao hay chỉnh sửa hình ảnh, giải trí với các tựa game nhẹ nhàng. Nếu muốn xử lý khối lượng công việc nhiều hơn, bạn hoàn toàn có thể lắp thêm thanh RAM khác và kích hoạt Dual-Channel để nâng cấp lên card Iris Xe.</p><p>• Bộ nhớ&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-ram-8-gb\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">RAM 8 GB</a>&nbsp;cho phép người dùng xử lý công việc trên nhiều cửa sổ ứng dụng cùng lúc nhưng vẫn đảm bảo trơn tru, hạn chế tình trạng giật lag. Ổ cứng&nbsp;<strong>512 GB SSD</strong>&nbsp;mang đến không gian lưu trữ ổn định khi tải các tệp tài liệu, học tập cần thiết đồng thời gia tăng tốc độ khởi động máy chỉ trong vài giây.&nbsp;</p><p>• Làm việc tốt hơn trên kích thước màn hình&nbsp;<strong>21.5 inch</strong>&nbsp;cho phép bạn quan sát bao quát nội dung được hiển thị trên máy, độ sáng&nbsp;<strong>250 nits</strong>&nbsp;cùng độ phân giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;cung cấp chất lượng khung ảnh sắc nét ở nhiều điều kiện ánh sáng khác nhau với gam màu sắc chuẩn xác trên từng chi tiết. Thời gian làm việc trên máy lâu dài nhưng vẫn bảo vệ tốt cho thị lực của người dùng nhờ màn hình&nbsp;<strong>Anti Glare</strong>, giảm thiểu độ chói sáng ở những nơi ánh sáng cao.</p><p>•&nbsp;Công nghệ&nbsp;<strong>High Definition (HD) Audio</strong>&nbsp;cho chất âm to rõ, chân thực trên từng thước phim hay bản nhạc.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-hoc-tap-van-phong\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn học tập</a>&nbsp;được bao bọc bởi chiếc áo màu trắng tinh khôi, toát lên vẻ đẹp tinh tế và sang trọng khi đặt ở mọi vị trí khác nhau, cân nặng&nbsp;<strong>5.7 kg</strong>&nbsp;dễ dàng bưng bê và lắp đặt cố định ở không gian văn phòng, bàn lễ tân nhà hàng, khách sạn,...</p><p>• Tính năng&nbsp;<strong>mở khóa bằng khuôn mặt</strong>&nbsp;tích hợp với&nbsp;<strong>Camera IR</strong>&nbsp;hồng ngoại hiện đại được trang bị trên chiếc&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn</a>&nbsp;này giúp bạn mở khóa nhanh chóng và an toàn hơn rất nhiều so với các kiểu bảo mật truyền thống dù ở những nơi có điều kiện ánh sáng thấp.</p><p>• Mặt sau&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-hp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn HP</a>&nbsp;được trang bị đa dạng các cổng kết nối như USB 2.0, Jack 3.5 mm, LAN (RJ45), HDMI và USB 3.2 cho khả năng kết xuất và truyền tải dữ liệu đến các thiết bị ngoại vi nhanh chóng, dễ dàng hơn.</p>',
    21500.00,
    0.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P202572',
    'Asus S500SD i5 12400/8GB/256GB/Bàn phím/Chuột/Win1',
    '<h3><strong>Bạn đang tìm kiếm một chiếc&nbsp;</strong><a href=\"https://www.thegioididong.com/may-tinh-de-ban-pc\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>PC</strong></a><strong>&nbsp;mạnh mẽ, đáp ứng nhu cầu làm việc và giải trí hàng ngày? Tham khảo ngay&nbsp;</strong><a href=\"https://www.thegioididong.com/may-tinh-de-ban/asus-s500sd-i5-512400050w\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>PC Asus S500SD i5 12400 (512400050W)</strong></a><strong>&nbsp;với ngoại hình tối giản cùng những thông số cấu hình ấn tượng.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-asus\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">PC Asus</a>&nbsp;được trang bị bộ vi xử lý&nbsp;<strong>Intel Core i5 12400</strong>&nbsp;với tốc độ xung nhịp lên đến&nbsp;<strong>4.40 GHz,</strong>&nbsp;cho phép xử lý các tác vụ đa nhiệm và xử lý dữ liệu phức tạp một cách mạnh mẽ và nhanh chóng, từ các ứng dụng văn phòng cho đến thiết kế, chơi game.</p><p>• Card tích hợp&nbsp;<strong>Intel UHD Graphics 730</strong>&nbsp;có khả năng xuất nội dung với độ phân giải lên đến 4K, cung cấp đủ sức mạnh để xử lý các tác vụ đồ họa thông thường và các ứng dụng văn phòng như Word, Excel, PowerPoint.</p><p>• Nhờ bo mạch chủ&nbsp;<strong>Intel B660&nbsp;</strong>với các tính năng bảo vệ và quản lý điện năng thông minh để tối ưu hiệu suất và tiết kiệm điện năng. Bộ nguồn&nbsp;<strong>300 W</strong>&nbsp;cung cấp đủ điện năng cho toàn bộ các linh kiện và đảm bảo độ ổn định trong quá trình hoạt động.</p><p>•&nbsp;PC được trang bị bộ nhớ&nbsp;<strong>RAM 8 GB DDR4</strong>&nbsp;và hỗ trợ nâng cấp lên tới&nbsp;<strong>64 GB</strong>, cho phép bạn tăng tốc độ xử lý và cải thiện hiệu suất hệ thống. Từ đó hỗ trợ bạn làm việc đa nhiệm mượt mà, vừa mở ứng dụng làm việc vừa nghe nhạc đều trơn tru.</p><p>•&nbsp;Ổ cứng&nbsp;<strong>SSD 256 GB</strong>&nbsp;với khe cắm ổ&nbsp;<strong>SSD M.2&nbsp;PCIe 4.0</strong>&nbsp;mở rộng cung cấp đủ không gian lưu trữ cho tất cả các tệp và dữ liệu học tập, công việc của bạn, tốc độ truy xuất dữ liệu giúp tối ưu tốc độ xử lý của hệ thống.</p><p>•&nbsp;Với nhiều cổng giao tiếp như: HDMI, USB-A, USB-C, LAN,..., PC cho phép kết nối với các thiết bị ngoại vi khác nhau. Máy đi kèm&nbsp;<strong>bàn phím</strong>&nbsp;và&nbsp;<strong>chuột</strong>, đồng thời được cài đặt sẵn hệ điều hành&nbsp;<strong>Windows 11</strong>&nbsp;để bạn có thể bắt đầu sử dụng máy ngay khi mua về.</p><p>•&nbsp;Với thiết kế&nbsp;<strong>vỏ nhựa</strong>&nbsp;<strong>màu đen&nbsp;</strong>chắc chắn và kích thước tổng thể&nbsp;<strong>09.46 x 29.27 x 33.96 cm</strong>, PC sẽ phù hợp với nhiều không gian khác nhau.</p>',
    14500.00,
    10.00,
    'PC',
    20
  );
INSERT INTO
  `products` (
    `product_id`,
    `product_name`,
    `product_description`,
    `product_price`,
    `product_sale_price`,
    `product_type`,
    `product_quantity`
  )
VALUES
  (
    'P2025897',
    'Asus ExpertCenter AIO A3402WBAK i5',
    '<h3><a href=\"https://www.thegioididong.com/may-tinh-de-ban/asus-expertcenter-aio-a3402wbak-i5-wa066w\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\"><strong>Máy tính để bàn&nbsp;Asus ExpertCenter AIO A3402WBAK i5 1235U 23.8 inch (WA066W)</strong></a><strong>&nbsp;là một giải pháp hoàn hảo cho những bạn muốn tiết kiệm không gian với một thiết bị được tích hợp đầy đủ các tính năng của máy tính, đáp ứng các nhu cầu của học tập, làm việc và giải trí khác nhau.</strong></h3><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-asus\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn Asus</a>&nbsp;được trang bị CPU&nbsp;<strong>Intel Core i5 1235U</strong>&nbsp;với tốc độ xung nhịp tối đa lên đến&nbsp;<strong>4.40 GHz</strong>, cho phép bạn xử lý các tác vụ văn phòng hay giải trí đa phương tiện một cách mượt mà, hiệu quả. Ngoài ra, máy còn đi kèm với card đồ họa&nbsp;<strong>Intel UHD Graphics</strong>&nbsp;giúp hiển thị hình ảnh sắc nét.</p><p>•&nbsp;Để đáp ứng các nhu cầu sử dụng đa nhiệm, Asus ExpertCenter AIO được trang bị bộ nhớ&nbsp;<strong>RAM 8 GB DDR4</strong>&nbsp;và có khả năng nâng cấp lên đến&nbsp;<strong>32 GB</strong>. Việc nâng cấp RAM sẽ giúp máy hoạt động mượt mà và xử lý tốt các tác vụ đa nhiệm cũng như ứng dụng nặng.</p><p>•&nbsp;Ổ cứng SSD dung lượng&nbsp;<strong>512 GB</strong>&nbsp;giúp tăng tốc độ vận hành của hệ thống, bạn sẽ không còn phải chờ đợi quá lâu khi khởi động máy hay mở các ứng dụng.</p><p>•&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban-aio\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">Máy tính để bàn AIO</a>&nbsp;này được trang bị hệ điều hành&nbsp;<strong>Windows 11 Home</strong>&nbsp;cho bạn trải nghiệm sử dụng máy tính đơn giản, hiệu quả và an toàn hơn.</p><p>•&nbsp;Màn hình&nbsp;<strong>23.8 inch</strong>&nbsp;độ phân giải&nbsp;<strong>Full HD</strong>&nbsp;với thông số&nbsp;<strong>sRGB 100%</strong>&nbsp;giúp hiển thị hình ảnh sắc nét và chân thực. Đặc biệt, màn hình còn hỗ trợ công nghệ chống chói&nbsp;<strong>Anti Glare</strong>&nbsp;giúp bạn dễ dàng quan sát nội dung một cách nhanh chóng và thuận tiện.</p><p>•&nbsp;Ngoài ra,&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-de-ban\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(47, 128, 237);\">máy tính để bàn</a>&nbsp;còn được tích hợp công nghệ&nbsp;<strong>SonicMaster</strong>&nbsp;giúp tăng cường âm thanh, đem lại trải nghiệm giải trí tuyệt vời hơn.</p><h3>• Máy có nhiều cổng giao tiếp thông dụng: USB-A, USB-C, HDMI, LAN,...</h3>',
    32000.00,
    0.00,
    'PC',
    20
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: repair_schedule
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: whitelist
# ------------------------------------------------------------

INSERT INTO
  `whitelist` (
    `id_whitelist`,
    `ip_whitelist`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    '192.168.1.140',
    '2023-04-20 11:05:55',
    '2023-05-17 14:02:05'
  );
INSERT INTO
  `whitelist` (
    `id_whitelist`,
    `ip_whitelist`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    '192.168.1.6',
    '2023-04-20 14:49:57',
    '2023-05-20 18:23:28'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

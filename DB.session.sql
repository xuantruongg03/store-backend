CREATE DATABASE computer_store;

USE computer_store;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_sale_price DECIMAL(10, 2) DEFAULT 0,
    product_type VARCHAR(255) NOT NULL,
    product_quatity INT
);

CREATE TABLE product_details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    detail_name VARCHAR(255) NOT NULL,
    detail_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(400) DEFAULT NULL,
    code VARCHAR(45) DEFAULT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    number_phone VARCHAR(255) NOT NULL,
    notes VARCHAR(255) DEFAULT NULL,
    payment VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE banners (
    banner_id INT AUTO_INCREMENT PRIMARY KEY,
    banner_name VARCHAR(255) NOT NULL,
    banner_image VARCHAR(255) NOT NULL
);

CREATE TABLE repair_schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address VARCHAR(255) NOT NULL,
    number_phone VARCHAR(255) NOT NULL,
    repair_date VARCHAR(255) NOT NULL,
    problem VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE whitelist (
    id_whitelist INT AUTO_INCREMENT PRIMARY KEY,
    ip_whitelist VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO
    `computer_store`.`whitelist` (`id_whitelist`, `ip_whitelist`)
VALUES
    ('1', '192.168.1.2');

CREATE TABLE blacklist (
    id_blacklist INT AUTO_INCREMENT PRIMARY KEY,
    ip_blacklist VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO
    products (
        product_id,
        product_name,
        product_description,
        product_price,
        product_sale_price,
        product_type,
        product_quatity
    )
VALUES
    (
        1,
        'iMac 24 inch 2021 4.5K M1/512GB/8GB/8-core GPU',
        'iMac 24 inch 2021 4.5K Retina M1 8-core được cải tiến thiết kế mới mẻ, trẻ trung nâng tầm mọi không gian cùng với hiệu năng vượt trội từ bộ vi xử lý (CPU) M1 8-core và màn hình Retina 4.5K hiển thị ảnh tươi mới, rực rỡ.',
        39999,
        0,
        'PC',
        20
    ),
    (
        2,
        'Laptop HP 15s fq2662TU',
        'Laptop HP 15s fq2662TU i3 (6K795PA) sẽ là sự lựa chọn phù hợp cho học sinh, sinh viên muốn tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình ổn định, đáp ứng tốt mọi nhu cầu cơ bản cùng một mức giá lý tưởng, dễ dàng tiếp cận',
        10500,
        20,
        'Laptop',
        10
    ),
    (
        3,
        'Chuột Không dây Bluetooth Silent Rapoo M650 Lucky Cat',
        'Nổi bật với thiết kế đậm chất Xuân 2023 cùng độ nhạy cao, chuột Không dây Bluetooth Silent Rapoo M650 hứa hẹn sẽ là món phụ kiện đáng đầu tư, đáp ứng hầu hết các yêu cầu khi làm việc và học tập hàng ngày của bạn.',
        400,
        0,
        'Accessory',
        20
    ),
    (
        4,
        'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen',
        'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen với chân đế gaming vững vàng ngay bên dưới phím Space Bar đem đến sự vững vàng, chống trượt khi chơi game.',
        790,
        0,
        'Accessory',
        20
    ),
    (
        5,
        'Laptop Lenovo Ideapad 3 15IAU7',
        'Laptop Lenovo Ideapad 3 15IAU7 i3 (82RK005LVN) sẽ là một người bạn đồng hành đắc lực cho các bạn học sinh, sinh viên hay dân văn phòng với ngoại hình thanh lịch, hiện đại cùng hiệu năng mạnh mẽ đến từ con chip Intel Gen 12 tân tiến. ',
        11490,
        0,
        'Laptop',
        20
    ),
    (
        6,
        'Laptop MacBook Pro 16 M1 Pro 2021',
        'Không còn quá xa lạ với sự đẳng cấp đến từ các sản phẩm của nhà Apple bởi lối thiết kế dẫn đầu xu hướng sang trọng, thời thượng và sức mạnh cấu hình ngoài mong đợi, nhưng còn đặc biệt hơn khi chiếc laptop MacBook Pro 16 M1 Pro 2021 này sẽ là phiên bản nâng cấp với con chip Apple M1 Pro mạnh mẽ, xử lý ấn tượng các tác vụ chuyên sâu.
 Sức mạnh bộc phá với CPU phiên bản nâng cấp vượt trội. MacBook M1 Pro là phiên bản nâng cấp vượt trội với tốc độ xử lý tăng 70% và hiệu năng gấp 1.7 lần so với dòng M1 tiền nhiệm, sở hữu 200 GB/s memory bandwidth chinh phục mọi tác vụ từ cơ bản đến chuyên sâu với hiệu năng đỉnh cao dẫn đầu so với các dòng sản phẩm cùng phân khúc đồng thời kéo dài thời lượng pin nhờ 10 nhân CPU gồm 8 nhân hiệu suất cao và 2 nhân tiết kiệm điện ấn tượng cùng 33.7 tỷ bóng bán dẫn.
 Đi kèm là 16 lõi GPU đáp ứng mượt mà các ứng dụng văn phòng phổ biến như Word, Excel, Powerpoint,... đến những phần mềm chỉnh sửa video, thiết kế 2D, 3D “nặng ký” của nhà Adobe một cách chuyên nghiệp nhất. 
 Nâng cao khả năng đa nhiệm mượt mà với bộ nhớ RAM 16 GB, bạn hoàn toàn có thể mở nhiều cửa sổ ứng dụng cùng lúc nhưng vẫn đảm bảo máy hoạt động ổn định, thao tác chuyển đổi qua lại giữa các layer trơn tru, suôn sẻ hơn mà không xảy ra tình trạng giật lag hay đơ máy giữa chừng. ',
        57490,
        10,
        'Laptop',
        20
    ),
    (
        7,
        'Laptop MacBook Pro 14 M1 Pro 2021',
        'Không còn quá xa lạ với sự đẳng cấp đến từ các sản phẩm của nhà Apple bởi lối thiết kế dẫn đầu xu hướng sang trọng, thời thượng và sức mạnh cấu hình ngoài mong đợi, nhưng còn đặc biệt hơn khi chiếc laptop MacBook Pro 16 M1 Pro 2021 này sẽ là phiên bản nâng cấp với con chip Apple M1 Pro mạnh mẽ, xử lý ấn tượng các tác vụ chuyên sâu. Sức mạnh bộc phá với CPU phiên bản nâng cấp vượt trội. MacBook M1 Pro là phiên bản nâng cấp vượt trội với tốc độ xử lý tăng 70% và hiệu năng gấp 1.7 lần so với dòng M1 tiền nhiệm, sở hữu 200 GB/s memory bandwidth chinh phục mọi tác vụ từ cơ bản đến chuyên sâu với hiệu năng đỉnh cao dẫn đầu so với các dòng sản phẩm cùng phân khúc đồng thời kéo dài thời lượng pin nhờ 10 nhân CPU gồm 8 nhân hiệu suất cao và 2 nhân tiết kiệm điện ấn tượng cùng 33.7 tỷ bóng bán dẫn. Đi kèm là 16 lõi GPU đáp ứng mượt mà các ứng dụng văn phòng phổ biến như Word, Excel, Powerpoint,... đến những phần mềm chỉnh sửa video, thiết kế 2D, 3D “nặng ký” của nhà Adobe một cách chuyên nghiệp nhất. Nâng cao khả năng đa nhiệm mượt mà với bộ nhớ RAM 16 GB, bạn hoàn toàn có thể mở nhiều cửa sổ ứng dụng cùng lúc nhưng vẫn đảm bảo máy hoạt động ổn định, thao tác chuyển đổi qua lại giữa các layer trơn tru, suôn sẻ hơn mà không xảy ra tình trạng giật lag hay đơ máy giữa chừng. ',
        42000,
        20,
        'Laptop',
        20
    ),
    (
        8,
        'Chuột Không dây Bluetooth Silent Logitech Signature M650',
        'Chuột Không dây Bluetooth Silent Logitech Signature M650 sở hữu kiểu dáng công thái học cùng độ phân giải lớn, đáp ứng tốt gần như mọi nhu cầu từ sử dụng cơ bản tới những tác vụ chuyên nghiệp của người dùng.
 • Thiết kế gọn đẹp, vừa tay, màu sắc thời thượng, lịch lãm, viền bên được lót thêm miếng cao su giúp cầm và sử dụng chuột chắc chắn hơn.
 
 • Chuột không dây này có thể kết nối được với phần lớn các máy tính hiện nay nhờ tương thích với các hệ điều hành phổ biến: Windows và macOS.
 
 • Độ phân giải lên tới 4000 DPI, cho phản hồi cực kỳ nhanh chóng và chính xác.
 
 • Kích thước chuột cỡ vừa (size M), phù hợp với kích cỡ tay của phần đông người dùng (chiều dài tay khoảng 17.5 cm - 19 cm).
 
 • Phím nhấn và con lăn được chế tác chỉn chu, cuộn siêu nhanh, click dễ dàng. Thêm vào đó, công nghệ SilentTouch giúp giảm hiệu quả tiếng ồn khi nhấp chuột, cho phép bạn tập trung hơn vào công việc.
 
 • Kết nối nhanh chóng và tiện lợi qua 2 cách: Bluetooth và đầu thu USB, cho người dùng đa dạng sự lựa chọn. Với 2 cách kết nối này đều cho phép bạn thoải mái di chuyển chuột Logitech này ở phạm vi khá xa, lên tới khoảng 10 m, linh động hơn trong quá trình sử dụng.',
        680,
        5,
        'Accessory',
        20
    ),
    (
        9,
        'Router Wifi Chuẩn Wifi 6 Asus AX53U',
        'RT-AX53U phù hợp chuẩn Wifi 802.11ax.
 Tốc độ mạng siêu nhanh với băng tần 2.4 GHz đạt 574 Mbps, băng tần 5 GHz có tốc độ lên tới 1201 Mbps.
 Công nghệ MU-MIMO và kỹ thuật OFDMA giúp phân bổ hiệu quả tín hiệu đến các kênh, giao tiếp với nhiều thiết bị cùng lúc.
 Cung cấp Wifi ổn định cho 30 user trong bán kính phủ sóng 300 m2.
 Cải thiện phạm vi phủ sóng với 4 ăng-ten 2 dBi.
 Giao thức IPv6 cho trải nghiệm internet thêm an toàn. 
 Bảo mật cấp độ doanh nghiệp - AiProtection miễn phí trọn đời do Trend Micro™ cung cấp,
 Dễ dàng cài đặt và sử dụng cùng ứng dụng ứng dụng ASUS Router.',
        12000,
        0,
        'Accessory',
        20
    ),
    (
        10,
        'Bàn phím có dây Gaming Asus TUF K1 ',
        'Bàn phím có dây Gaming Asus TUF K1 với thiết kế có phần kê cổ tay tiện dụng, có thể tháo rời để mang lại sự thoải mái dài lâu.
 • Bàn phím được trang bị các phím bấm có độ phản hồi êm ái với mỗi lần nhấn.
 
 • Các phím bấm này được đặt trong một khung chống thấm nước 300 ml, được gia công bằng một lớp phủ chuyên dụng và được chứng nhận đáp ứng hoạt động trong môi trường khắc nghiệt.
 
 • Bàn phím gaming được thiết kế với ghi nhận 19 phím bấm cùng lúc (NKRO), nhờ đó đảm bảo độ chính xác vượt trội và không bị bỏ lỡ lần nhấn phím nào.
 
 • Bàn phím Asus có năm vùng chiếu sáng riêng biệt và các thanh RGB nổi bật ở cả hai bên bàn phím, người dùng có thể lựa chọn toàn bộ phổ màu để tùy chỉnh riêng từng vùng, nhờ đó giúp bạn điều khiển dàn máy của mình sáng theo đúng ý muốn.
 
 • Núm chỉnh âm lượng chuyên dụng ở góc trên bên phải, Asus TUF K1 giúp bạn điều khiển âm thanh trong game một cách nhanh chóng và dễ dàng. Bạn có thể dễ dàng vặn núm mà vẫn bám sát từng hành động trên màn hình.
 
 • Phần mềm ASUS Armoury Crate hợp nhất các cơ chế điều khiển hệ thống và đèn để bạn có thể nhanh chóng điều chỉnh các cài đặt thiết yếu trong một tiện ích duy nhất.',
        900,
        0,
        'Accessory',
        20
    ),
    (
        11,
        'Asus AIO V241EAT i3 1115G4/4GB/512GB/23.8" ',
        'Bạn quan tâm chiếc máy tính nguyên bộ đầy đủ tính năng, đáp ứng mọi nhu cầu văn phòng với thiết kế tiện lợi, nhỏ gọn. Máy tính Asus AIO V241EAT (BA057W) là sự lựa chọn hoàn hảo dành cho bạn.
 • Máy tính bàn Asus mang CPU Intel Core i3 1115G4 cùng card tích hợp Intel UHD Graphics đảm bảo mọi tác vụ văn phòng hay xem phim, giải trí,... diễn ra trơn tru.
 
 • Máy tính để bàn Intel core i3 được trang bị RAM 4 GB cho khả năng đa nhiệm tốt. SSD 512 GB cho người dùng không gian lưu trữ đủ dùng, thời gian phản hồi cực nhanh.
 
 • Màn hình cảm ứng 23.8 inch thuận tiện cho người dùng thao tác trên màn hình. Công nghệ Wide View cung cấp góc nhìn rộng mở cùng độ phủ màu đạt 100% sRGB mang lại màu sắc chuẩn xác, đắm chìm.
 
 • Máy tính để bàn học tập - văn phòng có thiết kế sang trọng, tinh tế nhưng gọn gàng, phù hợp cho mọi không gian làm việc.
 
 • Máy tính để bàn có HD webcam cho phép tham gia các cuộc họp trực tuyến, gọi video với hình ảnh rõ nét.
 
 • Đa dạng cổng giao tiếp với 2 x HDMI, 4 x USB 3.2, Jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0.
 
 • Công nghệ âm thanh SonicMaster trên máy tính All-in-One đem lại không gian thư giãn âm nhạc tốt hơn bao giờ hết.',
        18990,
        5,
        'PC',
        20
    ) -- --------------------------------------------------------
INSERT INTO
    product_images (product_id, file_path)
VALUES
    (
        1,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1673919740/image_products/bfq1ehycy6k2htresswr.jpg'
    ),
    (
        1,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432204/image_products/s0w0dl1xo8dspgcmjnqh.jpg'
    ),
    (
        1,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432211/image_products/hbiwnxrfpy2zwnq1cvug.jpg'
    ),
    (
        1,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432208/image_products/cipewpr0peju2j0prw4c.jpg'
    ),
    (
        1,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432252/image_products/ps1lnweeb0027ng3udae.jpg'
    ),
    (
        1,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432205/image_products/dj7p3swdisl6p6xzxkaj.jpg'
    ),
    (
        2,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675426447/image_products/qwhv5yzm3gxvaa5mwnyo.jpg'
    ),
    (
        2,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675426445/image_products/yvlxk7ct3z4v2l7pidtc.jpg'
    ),
    (
        2,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675426444/image_products/yys7rfg5xftogvcrhr1a.jpg'
    ),
    (
        2,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675426446/image_products/mqh9qayyltidfpv9lxsd.jpg'
    ),
    (
        2,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675426447/image_products/aqlj8dtf7ygnqbvsnpxl.jpg'
    ),
    (
        3,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675430231/image_products/do23zex04bo9izqf8frd.jpg'
    ),
    (
        3,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675430241/image_products/cc3xpxch6l4p6rbnx6la.jpg'
    ),
    (
        3,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675430232/image_products/garizdxpxfrzqbrwtdtg.jpg'
    ),
    (
        3,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675430240/image_products/izifbxlftir9jlaazd0g.jpg'
    ),
    (
        4,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432683/image_products/irnuyzadtav9nhtrm1op.jpg'
    ),
    (
        4,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432690/image_products/xl54tqmlmbnvsejc6j5p.jpg'
    ),
    (
        4,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432699/image_products/lzq8zoqigzrwbgzqw7nb.jpg'
    ),
    (
        4,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432694/image_products/rdjl7dycvxxaeu27bhs5.jpg'
    ),
    (
        4,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675432696/image_products/vdqnxqby0x1hn3ldjuig.jpg'
    ),
    (
        5,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675433334/image_products/hw86wx4xc5mtcgjruf8o.jpg'
    ),
    (
        5,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675433330/image_products/siz0rci13yewgsr2ojvi.jpg'
    ),
    (
        5,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675433323/image_products/sqvhuia4zbok6acjlskp.jpg'
    ),
    (
        5,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675433322/image_products/jijtnpbflzpw8uit2wdn.jpg'
    ),
    (
        5,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675433325/image_products/bocxlzajyx4ofhuli3by.jpg'
    ),
    (
        5,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675433330/image_products/l5tatcekn1cr8e90j0ce.jpg'
    ),
    (
        6,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475137/image_products/bevagjle5lsihmutha6a.jpg'
    ),
    (
        6,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475138/image_products/nbkvefd19vwmcv8pkyn9.jpg'
    ),
    (
        6,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475136/image_products/pva0nsbfjuxlhbcayd3n.jpg'
    ),
    (
        6,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475136/image_products/g8iotvh29ezhxp7qwwxo.jpg'
    ),
    (
        6,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475136/image_products/tciuzpcr2jyukrycty2b.jpg'
    ),
    (
        6,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475135/image_products/r4v3kmqi1cz82d4vmdew.jpg'
    ),
    (
        7,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475973/image_products/z8388voisabouyjpeayt.jpg'
    ),
    (
        7,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475971/image_products/zpwohjbblyizaeqcdtqb.jpg'
    ),
    (
        7,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475971/image_products/ytyxy5b8mt4zgm7gwvoj.jpg'
    ),
    (
        7,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475972/image_products/rdosonvy40slrc3ir9v9.jpg'
    ),
    (
        7,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675475971/image_products/xdcpf4om7xrfgx4890mh.jpg'
    ),
    (
        8,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675476854/image_products/d3rkp38qlaplimxqyao3.jpg'
    ),
    (
        8,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675476854/image_products/xcgguoaphtywx40c7ze7.webp'
    ),
    (
        8,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675476855/image_products/oxkqy0w4p4acmt3xjbqu.jpg'
    ),
    (
        8,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675476854/image_products/kpflemtdjusgppofdvk1.jpg'
    ),
    (
        9,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477197/image_products/s5wd85smjiqt78p8hph4.jpg'
    ),
    (
        9,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477201/image_products/evuqfgq24b0berddjovw.jpg'
    ),
    (
        9,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477195/image_products/jdweswdj4xygzwkqnihi.jpg'
    ),
    (
        9,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477198/image_products/ufl0yxihemsyvayv6guy.jpg'
    ),
    (
        10,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477486/image_products/npjpemrokkt00aydakg1.jpg'
    ),
    (
        10,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477488/image_products/pho6wzqvrbnbmhnm9bfr.jpg'
    ),
    (
        10,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675477486/image_products/jbwak7beu4wonqxhrqiq.jpg'
    ),
    (
        11,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1676116330/image_products/wauswu7ztdvcs84xkahf.jpg'
    ),
    (
        11,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1676116331/image_products/msblot3mtw0nmi9dw0tc.jpg'
    ),
    (
        11,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1676116330/image_products/mdehu2lchmrvujlzjtyn.jpg'
    ),
    (
        11,
        'https://res.cloudinary.com/dcweof28t/image/upload/v1676116328/image_products/ubdxlhue0wbegrafthl7.jpg'
    )
INSERT INTO
    banners (banner_id, banner_name, banner_image)
VALUES
    (
        1,
        'Sắm Acer chất phất cả năm',
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675406874/image_products/kwwkptowmyxz8lv4qtel.png'
    ),
    (
        2,
        'Giảm phụ kiện đến 50%',
        'https://res.cloudinary.com/dcweof28t/image/upload/v1675493146/image_products/prlhpujkbmvr1zavu7uh.webp'
    )
INSERT INTO
    product_items (product_id, detail_name, detail_value)
VALUES
    (1, 'CPU', 'Apple M1'),
    (1, 'RAM', '8GB'),
    (1, 'Màn hình', '24 inch 4.5K'),
    (1, 'Card đồ họa', '8 core GPU'),
    (1, 'Hệ điều hành', 'MacOS'),
    (
        1,
        'Cổng kết nối',
        'LAN (RJ45), Jack 3.5 mm, 2 x Thunderbolt, 2 x USB 3'
    ),
    (
        1,
        'Kích thước, khối lượng',
        'Dài 461 mm - Rộng 547 mm - Dày 147 mm - Nặng 4.48 kg'
    ),
    (1, 'Năm ra mắt', '2021'),
    (2, 'Màn hình	', '15.6" Full HD (1920 x 1080)'),
    (
        2,
        'Ổ cứng',
        '256 GB SSD NVMe PCIe (Có thể tháo ra)'
    ),
    (2, 'Card màn hình', 'Card tích hợp Intel UHD'),
    (2, 'CPU', 'i3 1115G4 - 3GHz'),
    (
        2,
        'RAM',
        '4 GB DDR4 - 2 khe (1 khe 4 GB + 1 khe rời) - 3200 MHz'
    ),
    (
        2,
        'Cổng kết nối',
        'Jack tai nghe 3.5 mm - 1x SuperSpeed USB Type-C HDMI - 2x SuperSpeed USB A'
    ),
    (2, 'Thiết kế', 'Vỏ nhựa'),
    (
        2,
        'Kích thước, khối lượng',
        'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.7 kg'
    ),
    (2, 'Hệ điều hành', 'Windows 11 Home SL'),
    (2, 'Thời điểm ra mắt', '2021'),
    (
        3,
        'Cách kết nối',
        'Bluetooth, Đầu thu USB Receive'
    ),
    (
        3,
        'Tương thích',
        'macOS (MacBook, iMac), Windows'
    ),
    (3, 'Khoảng cách kết nối', '10m'),
    (3, 'Độ phân giải', '1300 DPI'),
    (3, 'Trọng Lượng', '60g'),
    (3, 'Loại pin', '1 viên AAA'),
    (4, 'Số phím', '108 Phím'),
    (4, 'Tương thích', 'Windows'),
    (4, 'Cách kết nối', 'USB')
    (4, 'Đèn Led', 'RGB'),
    (4, 'Xuất sứ', 'Đài Loan'),
    (4, 'Hãng sx', 'MSI'),
    (5, 'ROM', '256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)'),
    (5, 'CPU', 'i3 1215U 1.2GHz'),
    (5, 'RAM', '8 GB DDR4 2 khe (1 khe 8 GB + 1 khe rời) 3200 MHz'),
    (5, 'Màn hình', '15.6 " Full HD (1920 x 1080)'),
    (5, 'Card đồ họa', 'Card tích hợp Intel UHD'),
    (5, 'Cổng kết nối', 'HDMI, Jack tai nghe 3.5 mm, 1 x USB 2.0, 1 x USB 3.2, USB Type-C (hỗ trợ truyền dữ liệu, Power Delivery 3.0 và DisplayPort 1.2)'),
    (5, 'Hệ điều hành', 'Windows 11 Home SL'),
    (5, 'Thiết kế', 'Vỏ nhựa'),
    (5, 'Kích thước, khối lượng', 'Dài 359.2 mm - Rộng 236.5 mm - Dày 19.9 mm - Nặng 1.63 kg'),
    (5, 'Thời điểm ra mắt', '2022'),
    (6, 'CPU', 'Apple M1 Pro 200GB/s'),
    (6, 'RAM', '16GB'),
    (6, 'ROM', '1TB SSD'),
    (6, 'Card đồ họa', 'Card tích hợp 16 nhân GPU'),
    (6, 'Màn hình', '16.2" Liquid Retina XDR display (3456 x 2234) 120Hz'),
    (6, 'Cổng kết nối', 'HDMI, Jack tai nghe 3.5 mm, 3 x Thunderbolt 4 USB-C'),
    (6, 'Đặc biệt', 'Có đèn bàn phím'),
    (6, 'Hệ điều hành', 'MacOS'),
    (6, 'Thiết kế', 'Kim loại nguyên khối'),
    (6, 'Kích thước, khối lượng', 'Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.1 kg'),
    (6, 'Thời điểm ra mắt', '10/2021'),
    (7, 'CPU', 'Apple M1 Pro 200GB/s'),
    (7, 'RAM', '16GB'),
    (7, 'ROM', '512 SSD'),
    (7, 'Card đồ họa', 'Card tích hợp 14 nhân GPU'),
    (7, 'Cổng kết nối', 'HDMI, 3 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm'),
    (7, 'Đặc biệt', 'Có đèn bàn phím'),
    (7, 'Hệ điều hành', 'MacOS'),
    (7, 'Kích thước, khối lượng', 'Dài 312.6 mm - Rộng 221.2 mm - Dày 15.5 mm - Nặng 1.6 kg'),
    (7, 'Thời điểm ra mắt', '10/2021'),
    (8, 'Loại pin', '1 viên AAA'),
    (8, 'Cách kết nối', 'Đầu thu USB Receiver Bluetooth'),
    (8, 'Khoảng cách kết nối', '10m'),
    (8, 'Tương thích', 'macOS (MacBook, iMac), Windows'),
    (8, 'Độ phân giải', '4000 DPI'),
    (8, 'Hãng', 'Logitech'),
    (8, 'Trọng Lượng', '137g'),
    (8, 'Sản xuất tại', 'Trung Quốc'),
    (9, 'Độ phủ sóng', '15 - 20m'),
    (9, 'Băng tần', '1201 Mbps (băng tần 5GHz), 574 Mbps (băng tần 2.4GHz)'),
    (9, 'Truy cập tối đa', '30 user'),
    (9, 'Số ăng-ten', '4 ăng-ten ngoài'),
    (9, 'Tốc độ', '1201 Mbps (băng tần 5GHz)574 Mbps (băng tần 2.4GHz)'),
    (9, 'Cổng kết nối', '1201 Mbps (băng tần 5GHz)574 Mbps (băng tần 2.4GHz)'),
    (9, 'Hãng', 'Asus'),
    (9, 'Nút bấm', '1 nút Reset, 1 nút WPS, Nút Mở/Tắt nguồn'),
    (9, 'Xuất sứ', 'Trung Quốc'),
    (10, 'Số phím', '108 Phím'),
    (10, 'Tương thích', 'Windows'),
    (10, 'Cách kết nối', 'USB'),
    (10, 'Đèn led', 'RGB'),
    (10, 'Thương Hiệu', 'Asus'),
    (10, 'Xuất sứ', 'Trung Quốc'),
	(11, 'CPU', 'i3 - 1115G4 - 3.00 GHz'),
	(11, 'RAM', '4 GB, DDR4, 3200 MHz, 2 khe'),
	(11, 'ROM', 'Hỗ trợ thêm 1 khe cắm HDD SATA (Nâng cấp tối đa 1TB), 512 GB SSD (Có thể tháo ra, lắp thanh khác tối đa 1TB), Chuẩn PCIe/NVMe'),
	(11, 'Màn hình', '23.8 inch Full HD'),
	(11, 'Card đồ họa', 'Intel UHD'),
	(11, 'Kết nối', 'LAN (RJ45), USB 2.0, Jack 3.5 mm, 4 x USB 3.2, 2 x HDMI'),
	(11, 'Hệ điều hành', 'Windows 11 Home SL'),
	(11, 'Kích thước', 'Dài 540 mm - Rộng 409 mm - Dày 165 mm - Nặng 5.4 kg')

INSERT INTO whitelist (ip_whitelist)
VALUES ('192.168.1.2')
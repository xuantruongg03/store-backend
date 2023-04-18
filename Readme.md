# I. Giới thiệu sản phẩm

# II. Công nghệ sử dụng

# III. Các chức năng
## Server side rendering
    1. Đăng nhập 
    2. Xem danh sách sản phẩm
    3. Thêm/Sửa/Xóa/Cập nhật danh sách sản phẩm
    4. Thêm/Sửa/Xóa Banner quảng cáo
    5. Xem đơn đặt hàng
    6. Xem lịch sửa chữa tại nhà
    7. Xem thông tin khách hàng
## API
    1. Lấy tất cả sản phẩm
    2. Lấy sản phẩm theo loại
    3. Lấy sản phẩm theo id
    4. Đăngký/ Đăng nhập
    5. Đặt lịch sữa chữa
    6. Thêm sản phẩm vào giỏ hàng
    7. Lấy tất cả sản phẩm trong giỏ hàng tương ứng với người dùng
    8. Lấy banner quảng cáo

# IV. Đường dẫn demo
    1. Source:
        1. Front-End: 
        2. Back-End
    2. Demo: 

# V. Hướng dẫn sử dụng
### Link API
    1. Lấy tất cả sản phẩm: /api/v1/get-product-all
    2. Lấy sản phẩm theo loại: /api/v1/get-product-type?type=${type}
    3. Lấy sản phẩm theo ID: /api/v1/get-product-info?product_id=${product_id}
    4. Lấy tất cả banner quảng cáo: /api/v1/get-banners
    5. Lấy sản phẩm trong giỏ hàng theo ID khách hàng: /api/v1/cart/get-cart?customer_id=${customer_id}
    6. Thêm sản phẩm vào giỏ hàng theo ID khách hàng: /api/v1/add-to-cart
    7. Xóa sản phẩm trong giỏ hàng: /api/v1/cart/delete-product-cart?customer_id=${customer_id}&product_id=${product_id}
    8. Đặt mua sản phẩm: /api/v1/buy
    9. Đăng nhập: /api/v1/login
    10. Đăng ký: /api/v1/register
    11. Cập nhật thông tin user: /api/v1/update-user
    12. Đặt lịch sửa chữa: /api/v1/booking
    13. Trả về trạng thái đăng nhập khi Token hợp lệ: /api/v1/check-token

# VI. Cài đặt

## **Cơ sở dữ liệu (MySQL)**

``sh

    CREATE DATABASE computer_store;

    USE computer_store;

    CREATE TABLE products (
        product_id INT AUTO_INCREMENT PRIMARY KEY,
        product_name VARCHAR(255) NOT NULL,
        product_description TEXT,
        product_price DECIMAL(10, 2) NOT NULL,
        product_sale_price DECIMAL(10, 2) DEFAULT 0,
        product_type VARCHAR(255) NOT NULL,
        product_quatity INT,
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
        password VARCHAR(255) NOT NULL,
        avatar VARCHAR(400) DEFAULT NULL
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
        firt_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        address VARCHAR(255) NOT NULL,
        number_phone VARCHAR(255) NOT NULL,
        notes VARCHAR(255) DEFAULT NULL,
        payments VARCHAR(255) NOT NULL,
        quantity INT NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    );

    CREATE TABLE cart (
        cart_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        product_id INT NOT NULL,
        quantity INT NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    );

    CREATE TABLE banners (
        banner_id INT AUTO_INCREMENT PRIMARY KEY,
        banner_name VARCHAR(255) NOT NULL,
        banner_image VARCHAR(255) NOT NULL,
    );

    CREATE TABLE repair_schedule (
        schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
        firt_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        address VARCHAR(255) NOT NULL,
        number_phone VARCHAR(255) NOT NULL,
        repair_date DATE NOT NULL,
        problem VARCHAR(255) NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
    CREATE TABLE whitelist (
        id INT AUTO_INCREMENT PRIMARY KEY,
        token VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )

``

# Diagram
![Database computer store](src/public/img/db/computer_store.png)

<!-- build: npx webpack -->
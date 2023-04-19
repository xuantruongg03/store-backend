const pool = require("../../config/connectDatabase");
const fs = require("fs");
const Document = require("pdfkit");
const PdfTable = require("voilab-pdf-table");

const getOrder = async (req, res) => {
  const [rows, feilds] = await pool.query(
    `SELECT orders.order_id, order_items.product_id, products.product_name, orders.total_amount, order_items.first_name, order_items.last_name, 
    order_items.address, order_items.number_phone, order_items.payment, order_items.notes, orders.order_date, products.product_price, 
    products.product_sale_price
    FROM (orders inner join order_items on orders.order_id = order_items.order_id)
    inner join products on order_items.product_id = products.product_id`
  );
  res.render("order", { data: rows });
};

const exportBill = async (req, res) => {
  const order_id = req.params.order_id;
  try {
    const [rows, feilds] = await pool.query(
      `SELECT orders.order_id, order_items.product_id, products.product_name, orders.total_amount, order_items.first_name, order_items.last_name, 
          order_items.address, order_items.number_phone, order_items.payment, order_items.notes, orders.order_date, products.product_price, 
          products.product_sale_price
          FROM (orders inner join order_items on orders.order_id = order_items.order_id)
          inner join products on order_items.product_id = products.product_id where orders.order_id = ${order_id}`
    );
    const order = rows;
    let total_price = 0;
    const array = [];
    for (let i = 0; i < order.length; i++) {
      const element = order[i];
      let total =
        element.product_price * element.total_amount -
        (element.product_sale_price / 100) *
          element.product_price *
          element.total_amount;
      let formattedAmount = (total * 1000).toLocaleString() + " VNĐ";
      total_price += total;
      array.push({
        id: i + 1,
        product_name: element.product_name,
        quantity: Number(element.total_amount).toFixed(),
        sale: element.product_sale_price,
        price: formattedAmount,
      });
    }

    const date = new Date();
    const day = date.getDate();
    const month = date.getMonth() + 1;
    const year = date.getFullYear();

    const doc = new Document();
    doc.pipe(fs.createWriteStream(`order-${order.order_id}.pdf`));
    doc.pipe(res);
    doc.font("src/public/font/arial.ttf");
    doc
      .image("src/public/img/logo/logo.png")
      .moveUp()
      .moveUp()
      .moveUp()
      .moveUp();
    doc
      .fontSize(20)
      .text("HÓA ĐƠN BÁN HÀNG", { align: "center", fontWeight: "600" });
    doc.fontSize(14).text("(E-INVOICE)", { align: "center" });

    doc
      .fontSize(10)
      .text("Ngày " + day + ", tháng " + month + ", năm " + year, {
        align: "center",
      });
    doc.moveDown();

    //Thông tin người bán hàng
    doc.rect(20, 155, 570, 0.2).stroke();
    doc.moveDown();
    doc.moveDown();
    doc.fontSize(14).text("THÔNG TIN NGƯỜI BÁN HÀNG");
    doc.moveDown();
    doc.fontSize(10).text("SIÊU THỊ ĐIỆN TỬ COMPUTER CENTRAL");
    doc.moveDown();
    doc
      .fontSize(10)
      .text(
        "Địa chỉ: 170 An Dương Vương, Phường Nguyễn Văn Cừ, Thành Phố Quy Nhơn, Tỉnh Bình Định"
      );
    doc.moveDown();
    doc.fontSize(10).text("Điện thoại: 0981793201");
    doc.moveDown();
    doc.fontSize(10).text("Email: computercentralqn@gmail.com");
    doc.moveDown();
    doc.moveDown();
    doc.rect(20, 295, 570, 0.2).stroke();

    // Thông tin người mua hàng
    doc.moveDown();
    doc.fontSize(14).text("THÔNG TIN NGƯỜI MUA HÀNG");
    doc.moveDown();
    doc
      .fontSize(10)
      .text("Tên người mua: " + order[0].first_name + " " + order[0].last_name);
    doc.moveDown();
    doc.fontSize(10).text("Số điện thoại: " + order[0].number_phone);
    doc.moveDown();
    doc.fontSize(10).text("Địa chỉ: " + order[0].address);
    doc.moveDown();
    doc.text("Hình thức thanh toán: " + order[0].payment, { align: "left" });
    doc.moveDown();
    doc.text("Ghi chú: " + order[0].notes, { align: "left" });
    doc.moveDown();
    doc.rect(20, 460, 570, 0.2).stroke();
    doc.moveDown();
    doc.moveDown();

    // Thông tin sản phẩm
    doc.fontSize(14).text("THÔNG TIN ĐƠN HÀNG");
    doc.moveDown();
    const table = new PdfTable(doc.fontSize(10), {
      bottomMargin: 30,
    });
    table
      .addPlugin(
        new (require("voilab-pdf-table/plugins/fitcolumn"))({
          column: "id",
        })
      )
      .setColumnsDefaults({
        headerBorder: ["B", "T", "L", "R"],
        headerPadding: [10, 10, 10, 10],
        headerBorderOpacity: 0.5,
        padding: [10, 10, 10, 10],
        border: ["L", "R", "B"],
        borderOpacity: 0.5,
      })
      .addColumns([
        {
          id: "id",
          header: "STT",
          width: 25,
        },
        {
          id: "product_name",
          header: "Tên sản phẩm",
          width: 180,
        },
        {
          id: "quantity",
          header: "Số lượng",
          width: 65,
        },
        {
          id: "sale",
          header: "Giảm giá(%)",
          width: 80,
        },
        {
          id: "price",
          header: "Thành tiền",
          width: 100,
        },
      ])
      .onPageAdded(function (tb) {
        tb.addHeader();
      });

    table.addBody(array);
    doc.moveDown();
    doc
      .fontSize(10)
      .text("Tổng tiền: " + (total_price * 1000).toLocaleString() + " VNĐ", {
        align: "right",
      });
    doc.moveDown();
    doc.end();

    await pool.execute(`delete from order_items where order_id = ${order_id}`);
    await pool.execute(`delete from orders where order_id = ${order_id}`);
    res.redirect("/cms/get-orders");
  } catch (error) {
    console.log(error);
  }
};

const deleteOrder = async (req, res) => {
    try {
        const order_id = req.params.order_id;
        await pool.execute(`delete from order_items where order_id = ${order_id}`);
        await pool.execute(`delete from orders where order_id = ${order_id}`);
        res.redirect("back");
    } catch (error) {
        console.log(error);
    }
}

module.exports = { getOrder, exportBill, deleteOrder };

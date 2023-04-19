(()=>{var e={525:e=>{e.exports=e=>{const t=[];e.map((e=>{t.push(e.product_id)}));const r=[...new Set(t)],s=[];return r.map((t=>{const r=e.filter((e=>e.product_id===t)),o={product_id:r[0].product_id,product_name:r[0].product_name,product_description:r[0].product_description,product_price:r[0].product_price,product_sale_price:r[0].product_sale_price,product_type:r[0].product_type,product_quantity:r[0].product_quantity},a=[],n=[];r.map((e=>{n.every((t=>t.image_id!==e.image_id))&&n.push({image_id:e.image_id,file_path:e.file_path}),a.every((t=>t.detail_id!==e.detail_id))&&a.push({detail_id:e.detail_id,detail_name:e.detail_name,detail_value:e.detail_value})})),o.product_images=n,o.product_details=a,s.push(o)})),s}},187:(e,t,r)=>{const s=r(893),o=r(77);e.exports={checkIpInWhitelist:async(e,t,r)=>{const[a,n]=await s.query("SELECT * FROM `whitelist`");let d=!1;a.forEach((e=>{e.ip_whitelist===o.address()&&(d=!0,r())})),d||t.send(`\n    <div style = "text-align: center">\n    <h1>403 Forbidden</h1>\n    <p>IP address ${o.address()} is not in whitelist</p>\n    </div>\n      `)}}},72:e=>{e.exports=(e,t,r)=>{t.setHeader("Access-Control-Allow-Origin","*"),t.setHeader("Access-Control-Allow-Credentials","true"),t.setHeader("Access-Control-Allow-Methods","GET,HEAD,OPTIONS,POST,PUT"),t.setHeader("Access-Control-Allow-Headers","Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers "),t.header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept, Authorization"),r()}},333:(e,t,r)=>{const s=r(344);r(142).config(),e.exports={CreateJWT:e=>{const t=process.env.JWT_SECRET;return s.sign(e,t,{expiresIn:"1h"})},VerifyJWT:(e,t,r)=>{const o=e.headers.authorization;if(!o)return t.status(401).json({message:"Unauthorized"});const a=o.split(" ")[1],n=process.env.JWT_SECRET;let d=null;try{d=s.verify(a,n)}catch(e){return t.status(401).json({message:"Unauthorized"})}e.user=d,r()},CheckLogin:(e,t,r)=>{const o=e.headers.authorization;if(!o)return t.status(401).json({message:"Login Fail",login:!1});try{const e=o.split(" ")[1],t=process.env.JWT_SECRET;let r=null;r=s.verify(e,t)}catch(e){return t.status(401).json({message:"Not logged in"})}e.login=!!data,e.user=data,r()}}},293:(e,t,r)=>{const s=r(518).v2,{CloudinaryStorage:o}=r(652),a=r(738);r(142).config(),s.config({cloud_name:process.env.CLOUDINARY_NAME,api_key:process.env.CLOUDINARY_KEY,api_secret:process.env.CLOUDINARY_SECRET});const n=a({storage:new o({cloudinary:s,allowedFormats:["jpg","png"],params:{folder:"image_products"}})});e.exports=n},893:(e,t,r)=>{const s=r(418);r(142).config();const o=s.createPool({host:process.env.HOST_DB,user:process.env.USER_DB,password:process.env.PASSWORD_DB,database:process.env.DATABASE_DB});o.getConnection(((e,t)=>{console.log("Connected to database")})),e.exports=o},913:(e,t,r)=>{const s=r(893);e.exports={getBanner:async(e,t)=>{const[r,o]=await s.execute("SELECT * FROM banners");return t.status(200).json({message:"ok",data:{banner:r}})}}},823:(e,t,r)=>{const{CreateJWT:s}=r(333),o=r(893),a=r(344);r(142).config();const n=r(96);e.exports={login:async(e,t)=>{try{let{username:r,password:a}=e.body,d=null;const[c,i]=await o.execute(`SELECT * FROM customers WHERE username = '${r}'`);n.compare(a,c[0].password,((e,r)=>e?t.status(500).json({message:"Internal server error"}):r?(d=s({customer_id:c[0].customer_id}),t.status(200).json({state:!0,token:d,data:{customer_id:c[0].customer_id,first_name:c[0].first_name,last_name:c[0].last_name,avatar:c[0].avatar}})):t.status(401).json({message:"Invalid password"})))}catch(e){t.status(500).json("Thông tin đăng nhập sai!")}},checkUser:async(e,t)=>{let{username:r}=e.body;if(void 0===r)return t.status(400).json({message:"username is undefined"});const[s,a]=await o.execute(`SELECT * FROM customers WHERE username = '${r}'`);return s.length>0?t.status(200).json({message:"Have a user",state:!0}):t.status(200).json({message:"Don't have user",state:!1})},checkToken:async(e,t)=>{const r=e.headers.authorization;if(!r)return t.status(401).json({message:"Not logged in",login:!1});const s=r.split(" ")[1],n=process.env.JWT_SECRET;try{let e=a.verify(s,n).customer_id;const[r,d]=await o.execute(`SELECT * FROM customers WHERE customer_id = '${e}'`);return t.status(200).json({login:!0,data:{customer_id:r[0].customer_id}})}catch(e){return t.status(401).json({message:"Not logged in"})}}}},980:(e,t,r)=>{const s=r(893);e.exports={register:async(e,t)=>{let{username:r,password:o,first_name:a,last_name:n,gender:d,email:c}=e.body;if((await s.execute(`SELECT * FROM customers WHERE username = '${r}'`))[0].length>0)return t.status(200).json({message:"Username already exists",state:!1});try{return await s.execute(`INSERT INTO customers (first_name, last_name, gender, email, username, password) VALUES\n          ('${a}', '${n}', '${d}', '${c}', '${r}', '${o}')`),t.status(200).json({message:"Success",state:!0})}catch(e){return t.status(500).json({message:e,state:!1})}}}},414:(e,t,r)=>{const s=r(893);e.exports={booking:async(e,t)=>{const{first_name:r,last_name:o,gender:a,address:n,number_phone:d,repair_date:c,problem:i,email:u}=e.body,{customer_id:p}=e.user;try{await s.execute(`INSERT INTO repair_schedule (customer_id, first_name, last_name, gender, address, number_phone, email, repair_date, problem)\n            VALUES (${p}, '${r}', '${o}', '${n}', '${a}', '${d}', '${u}', '${c}', '${i}')`)}catch(e){return t.status(500).json({message:"error"})}return t.status(200).json({message:"ok"})}}},574:(e,t,r)=>{const s=r(893);e.exports={addToCart:async(e,t)=>{let{customer_id:r,product_id:o,quantity:a}=e.body;if(!r||!o||!a)return t.status(400).json({message:"error"});const[n,d]=await s.execute(`SELECT * FROM cart WHERE customer_id = ${r} and product_id = ${o}`);return n.length>0?(await s.execute(`UPDATE cart SET quantity = quantity + ${a} WHERE customer_id = ${r} and product_id = ${o}`),t.status(200).json({message:"ok"})):(await s.execute(`INSERT INTO cart (customer_id, product_id, quantity) VALUES (${r}, ${o}, ${a})`),t.status(200).json({message:"ok"}))},buy:async(e,t)=>{let{customer_id:r,total_amount:o,product_id:a,first_name:n,last_name:d,address:c,number_phone:i,notes:u,payment:p}=e.body;const l=new Date;try{await s.execute(`INSERT INTO orders (customer_id, order_date, total_amount) \n              VALUES (${r}, ${l.toLocaleDateString()}, ${o})`);const[e,m]=await s.execute("SELECT * FROM orders"),_=e[e.length-1].order_id;return await s.execute(`INSERT INTO order_items (order_id, product_id, first_name, last_name, address, number_phone, notes, payment)\n        VALUES (${_}, ${a}, '${n}', '${d}', '${c}', '${i}', '${u}', '${p}')`),await s.execute(`UPDATE products SET product_quantity = product_quantity - ${o} WHERE product_id = ${a}`),t.status(200).json({message:"ok"})}catch(e){return t.status(400).json({message:"error"})}},getCart:async(e,t)=>{try{let{customer_id:r}=e.user,[o,a]=await s.execute(`SELECT products.product_name, products.product_price, cart.quantity, cart.cart_id, cart.product_id\n      FROM cart inner join products on cart.product_id = products.product_id where customer_id = ${r}`);return t.status(200).json({message:"ok",data:o})}catch(e){return t.status(500).json({message:"error"})}},deleteProductCart:async(e,t)=>{let{customer_id:r,product_id:o}=e.body;try{return await s.execute(`DELETE FROM cart WHERE product_id = ${o} and customer_id = ${r}`),t.status(200).json({message:"ok"})}catch(e){return t.status(400).json({message:"error"})}}}},294:(e,t,r)=>{const s=r(893),o=r(525),a=r(344);r(142).config(),e.exports={getAllProducts:async(e,t)=>{const[r,n]=await s.execute("SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\n        inner join product_details on products.product_id = product_details.product_id");let d=e.login||!1,c=null;const i=e.headers.authorization;if(i)try{const e=process.env.JWT_SECRET,t=i.split(" ")[1],r=a.verify(t,e);c=r.customer_id,d=!!r}catch(e){c=null,d=!1}const u=o(r);return t.status(200).json({message:"Success",data:u,login:d,customer_id:c})},getProductsType:async(e,t)=>{const{type:r}=e.query,[a,n]=await s.execute("SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\n          inner join product_details on products.product_id = product_details.product_id where product_type = ?",[r]),d=o(a);return t.status(200).json({message:"Success",data:d})},getInforProduct:async(e,t)=>{let{search:r}=e.query,a=null;if(void 0===r)return t.status(400).json({message:"Error: product_id is undefined"});try{const[e,n]=await s.execute("SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\n                  inner join product_details on products.product_id = product_details.product_id where products.product_id = ?",[r]);return a=o(e),t.status(200).json({message:"ok",data:a})}catch(e){return t.status(400).json({message:"Error"})}}}},268:(e,t,r)=>{const s=r(893),o=r(184);e.exports={getUser:async(e,t)=>{try{const{customer_id:r}=e.user,[o,a]=await s.query(`SELECT * FROM customers WHERE customer_id = ${r}`);return t.status(200).json({message:"Success",data:o})}catch(e){return t.status(500).json({message:"Internal Server Error"})}},updateUser:async(e,t)=>{try{let{first_name:r,last_name:o,avatar:a}=e.body;const{customer_id:n}=e.user;return await s.execute(`UPDATE customers SET first_name = '${r}', last_name = '${o}', avatar = '${a}' WHERE customer_id = ${n}`),t.status(200).json({message:"ok"})}catch(e){return t.status(500).json({message:"Internal Server Error"})}},getCapcha:async(e,t)=>{const{username:r,email:a}=e.body;if(console.log(r,a),!r||!a)return t.status(400).json({message:"Not found username or email"});const[n,d]=await s.query(`SELECT * FROM customers WHERE username = '${r}' AND email = '${a}'`);if(console.log(n),n.length<=0)return t.sendStatus(401).json({message:"Not found username"});try{const e=n[0].email;let a=o.createTransport({service:"gmail",port:465,secure:!0,logger:!0,debug:!0,secureConnection:!1,auth:{user:"computercentralqn@gmail.com",pass:"wcsbpirhrvoqddhe"},tls:{rejectUnAuthorized:!0}}),d=Math.floor(1e5+9e5*Math.random());await s.execute(`UPDATE customers SET code = '${d}' WHERE username = '${r}' AND email = '${e}'`);let c={from:"computercentralqn@gmail.com",to:`${e}`,subject:"Verification Code",text:`Your verification code is: <p style = "font-weight: bold; font-size: 20px; letter-spacing: 3px">${d}</p>`,html:`Your verification code is: <p style = "font-weight: bold; font-size: 20px; letter-spacing: 3px">${d}</p>`};a.sendMail(c,(function(o,a){if(!o)return setTimeout((()=>{s.execute(`UPDATE customers SET code = null WHERE username = '${r}' AND email = '${e}'`)}),12e4),t.status(200).json({message:"ok"});t.send(500)}))}catch(e){return console.log(e),t.status(500).json({message:"Internal Server Error"})}},changePassword:async(e,t)=>{const{code:r,password:o,email:a,username:n}=e.body,d=o;if(!(r&&o&&a&&n))return t.status(400).json({message:"Not found code or password or email or username"});try{const[e,o]=await s.query(`SELECT * FROM customers WHERE username = '${n}' AND email = '${a}'`);return e[0].code===r?(await s.execute(`UPDATE customers SET password = '${d}' WHERE username = '${n}' AND email = '${a}'`),t.status(200).json({message:"ok"})):t.status(400).json({message:"Code is not correct"})}catch(e){return console.log(e),t.status(500).json({message:"Internal Server Error"})}},changeEmail:async(e,t)=>{const{customer_id:r}=e.user,{capcha:o,newEmail:a,oldEmail:n}=e.body;if(!r)return t.status(400).json({message:"Not found customer_id"});try{const[e,o]=await s.query(`SELECT email FROM customers WHERE customer_id = '${r}'`);return e[0].email===n?(await s.execute(`UPDATE customers SET email = '${a}' WHERE customer_id = ${r}`),t.status(200).json({message:"ok"})):t.status(400).json({message:"Old email is not correct"})}catch(e){return console.log(e),t.status(500).json({message:"Internal Server Error"})}},forgotPassword:async(e,t)=>{}}},384:(e,t,r)=>{const s=r(893);e.exports={getBanner:async(e,t)=>{let[r]=await s.execute("SELECT * FROM banners");return t.render("getBanners",{data:r})},postBanner:async(e,t)=>{const{name:r}=e.body,o=e.file.path;return await s.execute(`INSERT INTO banners (banner_name, banner_image) VALUES ('${r}', '${o}')`),t.redirect("/web/get-banners")},postBannerPage:(e,t)=>t.render("postBanner"),deleteBanner:async(e,t)=>{const{banner_id:r}=e.query;return await s.execute(`DELETE FROM banners WHERE banner_id = ${r}`),t.redirect("/web/get-banners")}}},216:(e,t,r)=>{const s=r(893);e.exports={getBookings:async(e,t)=>{const[r,o]=await s.execute("SELECT * FROM repair_schedule");return t.render("getBookings",{data:r})},exportBill:async(e,t)=>{const{schedule_id:r}=e.params,[o,a]=await s.execute("SELECT * FROM repair_schedule");return t.render("exportBill",{data:o})},deleteRepair:async(e,t)=>{const{schedule_id:r}=e.params;return await s.execute("DELETE FROM repair_schedule WHERE schedule_id = ?",[r]),t.redirect("/web/getBookings")}}},9:(e,t,r)=>{const s=r(893);e.exports={getCustomers:async(e,t)=>{const[r,o]=await s.execute("SELECT * FROM customers");return t.render("getCustomer",{data:r})},deleteCustomer:async(e,t)=>{const{id:r}=e.params;return await s.execute("DELETE FROM customers WHERE customer_id= ?",[r]),t.redirect("/web/get-customer")}}},687:(e,t,r)=>{const s=r(893),o=r(231),a=r(645),n=r(558);e.exports={getOrder:async(e,t)=>{const[r,o]=await s.query("SELECT orders.order_id, order_items.product_id, products.product_name, orders.total_amount, order_items.first_name, order_items.last_name, \n    order_items.address, order_items.number_phone, order_items.payment, order_items.notes, orders.order_date, products.product_price, \n    products.product_sale_price\n    FROM (orders inner join order_items on orders.order_id = order_items.order_id)\n    inner join products on order_items.product_id = products.product_id");t.render("order",{data:r})},exportBill:async(e,t)=>{const d=e.params.order_id;try{const[e,c]=await s.query(`SELECT orders.order_id, order_items.product_id, products.product_name, orders.total_amount, order_items.first_name, order_items.last_name, \n          order_items.address, order_items.number_phone, order_items.payment, order_items.notes, orders.order_date, products.product_price, \n          products.product_sale_price\n          FROM (orders inner join order_items on orders.order_id = order_items.order_id)\n          inner join products on order_items.product_id = products.product_id where orders.order_id = ${d}`),i=e;let u=0;const p=[];for(let e=0;e<i.length;e++){const t=i[e];let r=t.product_price*t.total_amount-t.product_sale_price/100*t.product_price*t.total_amount,s=(1e3*r).toLocaleString()+" VNĐ";u+=r,p.push({id:e+1,product_name:t.product_name,quantity:Number(t.total_amount).toFixed(),sale:t.product_sale_price,price:s})}const l=new Date,m=l.getDate(),_=l.getMonth()+1,g=l.getFullYear(),E=new a;E.pipe(o.createWriteStream(`order-${i.order_id}.pdf`)),E.pipe(t),E.font("src/public/font/arial.ttf"),E.image("src/public/img/logo/logo.png").moveUp().moveUp().moveUp().moveUp(),E.fontSize(20).text("HÓA ĐƠN BÁN HÀNG",{align:"center",fontWeight:"600"}),E.fontSize(14).text("(E-INVOICE)",{align:"center"}),E.fontSize(10).text("Ngày "+m+", tháng "+_+", năm "+g,{align:"center"}),E.moveDown(),E.rect(20,155,570,.2).stroke(),E.moveDown(),E.moveDown(),E.fontSize(14).text("THÔNG TIN NGƯỜI BÁN HÀNG"),E.moveDown(),E.fontSize(10).text("SIÊU THỊ ĐIỆN TỬ COMPUTER CENTRAL"),E.moveDown(),E.fontSize(10).text("Địa chỉ: 170 An Dương Vương, Phường Nguyễn Văn Cừ, Thành Phố Quy Nhơn, Tỉnh Bình Định"),E.moveDown(),E.fontSize(10).text("Điện thoại: 0981793201"),E.moveDown(),E.fontSize(10).text("Email: computercentralqn@gmail.com"),E.moveDown(),E.moveDown(),E.rect(20,295,570,.2).stroke(),E.moveDown(),E.fontSize(14).text("THÔNG TIN NGƯỜI MUA HÀNG"),E.moveDown(),E.fontSize(10).text("Tên người mua: "+i[0].first_name+" "+i[0].last_name),E.moveDown(),E.fontSize(10).text("Số điện thoại: "+i[0].number_phone),E.moveDown(),E.fontSize(10).text("Địa chỉ: "+i[0].address),E.moveDown(),E.text("Hình thức thanh toán: "+i[0].payment,{align:"left"}),E.moveDown(),E.text("Ghi chú: "+i[0].notes,{align:"left"}),E.moveDown(),E.rect(20,460,570,.2).stroke(),E.moveDown(),E.moveDown(),E.fontSize(14).text("THÔNG TIN ĐƠN HÀNG"),E.moveDown();const h=new n(E.fontSize(10),{bottomMargin:30});h.addPlugin(new(r(432))({column:"id"})).setColumnsDefaults({headerBorder:["B","T","L","R"],headerPadding:[10,10,10,10],headerBorderOpacity:.5,padding:[10,10,10,10],border:["L","R","B"],borderOpacity:.5}).addColumns([{id:"id",header:"STT",width:25},{id:"product_name",header:"Tên sản phẩm",width:180},{id:"quantity",header:"Số lượng",width:65},{id:"sale",header:"Giảm giá(%)",width:80},{id:"price",header:"Thành tiền",width:100}]).onPageAdded((function(e){e.addHeader()})),h.addBody(p),E.moveDown(),E.fontSize(10).text("Tổng tiền: "+(1e3*u).toLocaleString()+" VNĐ",{align:"right"}),E.moveDown(),E.end(),await s.execute(`delete from order_items where order_id = ${d}`),await s.execute(`delete from orders where order_id = ${d}`),t.redirect("/web/get-orders")}catch(e){console.log(e)}},deleteOrder:async(e,t)=>{try{const r=e.params.order_id;await s.execute(`delete from order_items where order_id = ${r}`),await s.execute(`delete from orders where order_id = ${r}`),t.redirect("back")}catch(e){console.log(e)}}}},75:(e,t,r)=>{const s=r(525),o=r(893),a=r(302);e.exports={getProducts:async(e,t)=>{const[r,a]=await o.execute("SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\n    inner join product_details on products.product_id = product_details.product_id"),n=s(r);return t.render("getProducts",{data:n})},deleteImageProduct:async(e,t)=>{const r=e.params.id;return await o.execute(`DELETE FROM product_images WHERE image_id = ${r}`),t.redirect("back")},deleteProduct:async(e,t)=>{const r=e.params.id;return await o.execute("DELETE FROM `product_images` where product_id = ?",[r]),await o.execute("DELETE FROM `product_details` where product_id = ?",[r]),await o.execute("DELETE FROM `products` where product_id = ?",[r]),t.redirect("/web/get-products")},postProductsPage:(e,t)=>t.render("postProduct"),createNewProduct:async(e,t)=>{const{type:r,name:s,infomation:a,price:n,quantity:d,sale:c,nameDetails:i,valueDetails:u}=e.body;let p=[];i.map((e=>{p.push({detail_name:e,detail_value:u[i.indexOf(e)]})}));const l=[],m=e.files;for(const e of m){const{path:t}=e;l.push(t)}await o.execute(`INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)\n      VALUES ('${s}', '${a}', ${n}, ${c}, '${r}', ${d});`);const[_,g]=await o.execute("SELECT max(product_id) as product_id FROM products"),E=_[0].product_id;return l.length>0&&l.map((e=>{o.execute(`INSERT INTO product_images (product_id, file_path)\n                    VALUES (${E} ,'${e}')`)})),p.length>0&&p.map((e=>{o.execute(`INSERT INTO product_details (product_id, detail_name, detail_value)\n              VALUES (${E}, '${e.detail_name}', '${e.detail_value}')`)})),t.redirect("/cms")},updateProductGet:async(e,t)=>{const[r,a]=await o.execute(`SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\n      inner join product_details on products.product_id = product_details.product_id where products.product_id = ${e.params.id}`),n=s(r);return t.render("updateProduct",{data:n[0]})},updateProductPost:async(e,t)=>{try{const{type:r,name:s,infomation:a,price:n,quantity:d,sale:c,key:i,value:u,id_detail:p,valueDetails:l}=e.body,m=e.params.id,_=e.body.nameDetails||[];await o.execute(`UPDATE products SET product_name = '${s}', product_description = '${a}', \n        product_price = ${n}, product_sale_price = ${c}, product_type = '${r}', \n        product_quantity = ${d} WHERE product_id = ${m}`),_.length>0&&_.map((e=>{let t=e,r=l[_.indexOf(e)];o.execute(`INSERT INTO product_details(product_id, detail_name, detail_value)\n                VALUES (${m}, '${t}', '${r}\n            ')`)}));const g=[];for(let e=0;e<i.length;e++){let t=p[e],r=i[e],s=u[e];g.push({detail_id:t,detail_name:r,detail_value:s})}g.map((e=>{o.execute(`UPDATE product_details SET detail_name = '${e.detail_name}', detail_value = '${e.detail_value}' WHERE detail_id = ${e.detail_id}`)}));const E=[],h=e.files;for(const e of h){const{path:t}=e;E.push(t)}return E.length>0&&E.map((e=>{o.execute(`INSERT INTO product_images (product_id, file_path)\n                      VALUES (${m} ,'${e}')`)})),t.redirect("/web")}catch(e){console.log(e)}},postProductExcel:async(e,t)=>{const r=e.file;try{const e=a.readFile(r.path),t=e.Sheets[e.SheetNames[0]];a.utils.sheet_to_json(t).forEach((async e=>{const{product_name:t,product_description:r,product_price:s,product_sale_price:a,product_type:n,product_quantity:d}=e,c=e.product_details.split("; "),i=[],u=e.product_images.split(", ");c.forEach((e=>{const t=e.split(": ");i.push({detail_name:t[0],detail_value:t[1]})})),await o.execute(`INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)\n              VALUES ('${t}', '${r}', ${s}, ${a}, '${n}', ${d});`);const[p,l]=await o.execute("SELECT max(product_id) as product_id FROM products"),m=p[0].product_id;u.map((e=>{o.execute(`INSERT INTO product_images (product_id, file_path)\n                      VALUES (${m} ,'${e}')`)})),i.map((e=>{o.execute(`INSERT INTO product_details (product_id, detail_name, detail_value)\n                    VALUES (${m}, '${e.detail_name}', '${e.detail_value}')`)}))}))}catch(e){console.log(e)}return t.redirect("/cms")},createNewProductExcel:(e,t)=>t.render("postProductExcel")}},674:(e,t,r)=>{const s=r(860),{VerifyJWT:o}=r(333),a=r(72),n=r(294),d=r(268),c=r(574),i=r(980),u=r(823),p=r(913),l=r(414);let m=s.Router();e.exports=e=>(m.get("/get-product-all",n.getAllProducts),m.get("/get-product-type",n.getProductsType),m.get("/get-product-info",n.getInforProduct),m.get("/get-user",o,d.getUser),m.post("/update-user",o,d.updateUser),m.post("/get-capcha",d.getCapcha),m.post("/change-password",d.changePassword),m.post("/forgot-password",d.forgotPassword),m.post("/add-to-cart",o,c.addToCart),m.get("/cart/get-cart",o,c.getCart),m.post("/cart/delete-product-cart/",o,c.deleteProductCart),m.post("/buy",o,c.buy),m.post("/register",i.register),m.post("/login",u.login),m.post("/check-user",u.checkUser),m.get("/check-token",u.checkToken),m.get("/get-banners",p.getBanner),m.post("/booking",o,l.booking),e.use("/api/v1",a,m))},694:(e,t,r)=>{const s=r(860),o=r(293),a=r(75),n=r(9),d=r(687),c=r(384),i=r(216),{checkIpInWhitelist:u}=r(187);let p=s.Router();const l=r(738)({dest:"uploads/"});e.exports=e=>(p.get("/",a.getProducts),p.get("/post-product",a.postProductsPage),p.post("/create-new-product",o.array("image",10),a.createNewProduct),p.post("/post-product-excel",l.single("file"),a.postProductExcel),p.get("/post-product-excel",a.createNewProductExcel),p.get("/update-product/:id",a.updateProductGet),p.post("/update-product/:id",o.array("image",10),a.updateProductPost),p.get("/delete-product/:id",a.deleteProduct),p.get("/delete-image-product/:id",a.deleteImageProduct),p.get("/get-customer",n.getCustomers),p.get("/get-orders",d.getOrder),p.get("/export-bill/:order_id",d.exportBill),p.get("/delete-order/:order_id",d.deleteOrder),p.get("/get-banners",c.getBanner),p.get("/post-banner",c.postBannerPage),p.post("/post-banner",o.single("banner"),c.postBanner),p.get("/delete-banner",c.deleteBanner),p.get("/get-bookings",i.getBookings),p.get("/export-bill-repair/:schedule_id",i.exportBill),p.get("/delete-repair/:schedule_id",i.deleteRepair),e.use("/cms",u,p))},96:e=>{"use strict";e.exports=require("bcrypt")},518:e=>{"use strict";e.exports=require("cloudinary")},710:e=>{"use strict";e.exports=require("cookie-parser")},142:e=>{"use strict";e.exports=require("dotenv")},860:e=>{"use strict";e.exports=require("express")},644:e=>{"use strict";e.exports=require("express-handlebars")},231:e=>{"use strict";e.exports=require("fs")},77:e=>{"use strict";e.exports=require("ip")},344:e=>{"use strict";e.exports=require("jsonwebtoken")},470:e=>{"use strict";e.exports=require("morgan")},738:e=>{"use strict";e.exports=require("multer")},652:e=>{"use strict";e.exports=require("multer-storage-cloudinary")},418:e=>{"use strict";e.exports=require("mysql2/promise")},184:e=>{"use strict";e.exports=require("nodemailer")},423:e=>{"use strict";e.exports=require("path")},645:e=>{"use strict";e.exports=require("pdfkit")},558:e=>{"use strict";e.exports=require("voilab-pdf-table")},432:e=>{"use strict";e.exports=require("voilab-pdf-table/plugins/fitcolumn")},302:e=>{"use strict";e.exports=require("xlsx")}},t={};function r(s){var o=t[s];if(void 0!==o)return o.exports;var a=t[s]={exports:{}};return e[s](a,a.exports,r),a.exports}(()=>{const e=r(860),t=r(423),s=r(470);r(142).config();const o=r(644),a=r(694),n=r(674),d=r(710),c=e(),i=process.env.PORT||8080;c.use(e.static(t.join("/","./public"))),c.use(s("combined")),c.use(e.urlencoded({extended:!0})),c.use(e.json()),c.use(d()),c.engine("hbs",o.engine({extname:".hbs",helpers:{math:function(e,t,r){return{"+":(e=parseFloat(e))+(r=parseFloat(r)),"-":e-r,"*":e*r,"/":e/r,"%":e%r}[t]}}})),c.set("view engine","hbs"),c.set("views",t.join("/",".src/resources/views")),a(c),n(c),c.listen(i,(()=>{console.log("Server is running on port "+i)}))})()})();
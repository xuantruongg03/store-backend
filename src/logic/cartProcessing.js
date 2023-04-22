const processing = (rows) => {
    const id = [];
    rows.map((element) => {
      id.push(element.cart_id);
    });
    const uniqueId = [...new Set(id)];
    const result = [];
    uniqueId.map((element) => {
        const cart = rows.filter((item) => item.cart_id === element);
        const ob = {
            customer_id: cart[0].customer_id,
            product_id: cart[0].product_id,
            product_name: cart[0].product_name,
            product_price: cart[0].product_price,
            quantity: cart[0].quantity,
        }
        const product_images = [];
        cart.map((item) => {
            if (
                product_images.every(
                  (itemImage) => itemImage.image_id !== item.image_id
                )
              ) {
                product_images.push({
                  image_id: item.image_id,
                  file_path: item.file_path,
                });
              }
        })
        ob.product_images = product_images;
        result.push(ob);
    });
    return result;
  };
  
  module.exports = processing;
  
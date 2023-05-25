const processing = (rows) => {
  const id = [];
  rows.map((element) => {
    id.push(element.product_id);
  });
  const uniqueId = [...new Set(id)];
  let totalProductLike = 0;
  const result = [];
  uniqueId.map((element) => {
    const product = rows.filter((item) => item.product_id === element);
    product[0].like === 1 ? totalProductLike++ : totalProductLike;
    const ob = {
      product_id: product[0].product_id,
      product_name: product[0].product_name,
      product_description: product[0].product_description,
      product_price: product[0].product_price,
      product_sale_price: product[0].product_sale_price,
      product_type: product[0].product_type,
      product_quantity: product[0].product_quantity,
      product_like: product[0].like === 1 ? true : false,
    };
    const product_details = [];
    const product_images = [];

    product.map((item) => {
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
      if (
        product_details.every(
          (itemImage) => itemImage.detail_id !== item.detail_id
        )
      ) {
        product_details.push({
          detail_id: item.detail_id,
          detail_name: item.detail_name,
          detail_value: item.detail_value,
        });
      }
    });
    ob.product_images = product_images;
    ob.product_details = product_details;
    result.push(ob);
  });
  return result;
};

module.exports = processing;

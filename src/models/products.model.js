const getAllProducts = () => {
  return db.query("SELECT * FROM products");
};

const getAllProductsPaginated = (page, limit) => {
  page = Number(page);
  limit = Number(limit);

  return db.query(`SELECT * FROM products LIMIT ? OFFSET ?`, [
    limit,
    (page - 1) * limit,
  ]);
};

const getAllFeaturedProducts = () => {
  return db.query(`SELECT * FROM products WHERE featured = 1`);
};

const getProductById = (productId) => {
  return db.query("SELECT * FROM products WHERE id = ? ", [productId]);
};

const getProductByCategoryId = (categoryId) => {
  return db.query("SELECT * FROM products WHERE categories_id = ? ", [
    categoryId,
  ]);
};

const insertNewProduct = ({
  title,
  description,
  price,
  image,
  featured,
  categories_id,
}) => {
  return db.query(
    `
    INSERT INTO products(title, description, price, image, featured, categories_id)
    VALUES(?, ?, ?, ?, ?, ?);`,
    [title, description, price, image, featured, categories_id]
  );
};

const updateProduct = (
  productId,
  { title, description, price, image, featured, categories_id }
) => {
  return db.query(
    `
    UPDATE products 
    SET title = ?, description = ?, price = ?, image = ?, featured = ?, categories_id = ?
    WHERE id = ?;`,
    [title, description, price, image, featured, categories_id, productId]
  );
};

const deleteProduct = (productId) => {
  return db.query(
    `
    DELETE FROM products
    WHERE products.id =?`,
    [productId]
  );
};
module.exports = {
  getAllProducts,
  getProductById,
  insertNewProduct,
  updateProduct,
  deleteProduct,
  getAllProductsPaginated,
  getProductByCategoryId,
  getAllFeaturedProducts,
};

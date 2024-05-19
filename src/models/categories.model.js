const getAllCategories = () => {
  return db.query("SELECT * FROM categories");
};
const insertNewCategory = (title) => {
  return db.query(
    `
INSERT INTO categories (title) VALUES (?);`,
    [title]
  );
};
const getCategoryById = (categoryId) => {
  return db.query(
    `
    SELECT * FROM categories
    WHERE categories.id = ?`,
    [categoryId]
  );
};
const updateCategory = (categoryId, title) => {
  return db.query(
    `
    UPDATE categories
    SET title = ?
    WHERE categories.id = ?`,
    [title, categoryId]
  );
};
const deleteCategory = (categoryId) => {
  return db.query(
    `
    DELETE FROM categories
    WHERE categories.id = ?`,
    [categoryId]
  );
};

module.exports = {
  getAllCategories,
  insertNewCategory,
  getCategoryById,
  updateCategory,
  deleteCategory,
};

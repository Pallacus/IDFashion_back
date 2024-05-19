const selectAllOrders = () => {
  return db.query("SELECT * FROM orders");
};

const selectOrderById = (orderId) => {
  return db.query("SELECT * FROM orders WHERE id = ?", orderId);
};

const selectOrdersByCode = (orderCode) => {
  return db.query("SELECT * FROM orders WHERE code = ?", orderCode);
};

const selectAllWithNames = () => {
  return db.query(`
  SELECT o.*, u.name AS user_name, u.last_name AS user_last_name 
  FROM orders o
  JOIN users u ON o.users_id = u.id`)
}

const insertOrder = ({ code, quantity, users_id, products_id }) => {

  return db.query(
    "INSERT INTO orders (code, quantity,users_id, products_id) VALUES (?,?,?,?)",
    [code, quantity, users_id, products_id]
  );
};

const updateOrder = (orderId, { code, quantity, users_id, products_id }) => {
  return db.query(
    "UPDATE orders SET code = ?, quantity = ?, users_id = ?, products_id = ? WHERE id = ? ",
    [code, quantity, users_id, products_id, orderId]
  );
};

const deleteOrderById = (orderId) => {
  return db.query("DELETE FROM orders WHERE id = ?", [orderId]);
};

module.exports = {
  selectAllOrders,
  selectOrderById,
  selectOrdersByCode,
  insertOrder,
  updateOrder,
  deleteOrderById,
  selectAllWithNames
};

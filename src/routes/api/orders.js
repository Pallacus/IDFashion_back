const router = require("express").Router();
const OrdersModel = require("../../models/orders.model");
const { checkToken, checkAdminRole, } = require("../../helpers/users.middlewares");
const dayjs = require('dayjs');

// GET /orders
router.get("/", async (req, res) => {
  try {
    const [result] = await OrdersModel.selectAllOrders();
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET withNames /orders/names
router.get('/names', async (req, res) => {
  try {
    const [result] = await OrdersModel.selectAllWithNames();
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /orders/CODE
router.get("/:orderCode", async (req, res) => {
  const code = req.params.orderCode;

  try {
    const [result] = await OrdersModel.selectOrdersByCode(code);

    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// POST /orders/new
router.post("/new", async (req, res) => {
  try {
    const [order] = await OrdersModel.insertOrder(req.body);
    const [[result]] = await OrdersModel.selectOrderById(order.insertId);

    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

//  POST /orders/cart
router.post('/cart', checkToken, async (req, res) => {

  const arrCart = req.body;
  const orderCode = ('ORD' + dayjs().unix());

  const ordersInserted = [];
  const ordersFailed = [];

  for (const line of arrCart) {

    const newOrder = {
      code: orderCode,
      quantity: line.quantity,
      users_id: req.user.id,
      products_id: line.product.id
    }

    try {

      const [order] = await OrdersModel.insertOrder(newOrder);

      const [[result]] = await OrdersModel.selectOrderById(order.insertId);

      ordersInserted.push(newOrder);

    } catch (error) {
      ordersFailed.push(newOrder)
    }

  }

  if (ordersFailed.length === 0) {
    return res.json(orderCode);
  }

  return res.json('Error', orderCode, ordersInserted, ordersFailed);

});


//TODO borrar pedidos
/**
 * TODO TERMINAR BORRADO DE PEDIDOS
 * ? Se deben poder anular pedidos
 * ! Yo lo dejaría para gestión de devolución que nuestra app ahora mismo no lo haría.
 */
//DELETE /orders/CODE
router.delete("/:order_id", checkToken, checkAdminRole, async (req, res) => {
  try {
    const [order] = await OrdersModel.deleteOrderById(req.params.order_id);
    res.json(order);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

module.exports = router;

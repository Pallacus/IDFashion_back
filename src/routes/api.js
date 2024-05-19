const { checkToken } = require("../helpers/users.middlewares");

const router = require("express").Router();

router.use("/categories", require("./api/categories"));
router.use("/comments", require("./api/comments"));
router.use("/favorites", require("./api/favorites"));
router.use("/orders", require("./api/orders"));
router.use("/products", require("./api/products"));
router.use("/emails",require("./api/emails"));
router.use("/users", require("./api/users"));

module.exports = router;

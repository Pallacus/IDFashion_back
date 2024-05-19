const ProductModel = require("../../models/products.model");
const UsersModel = require("../../models/users.model");
const { checkProduct } = require("../../helpers/product.middlewares");
const {
  checkToken,
  checkAdminRole,
} = require("../../helpers/users.middlewares");
const { sendMail } = require("../../helpers/utils");

const router = require("express").Router();

// GET /products
router.get("/", async (req, res) => {
  try {
    const [result] = await ProductModel.getAllProducts();
    res.json(result);
  } catch (error) {
    res.json({ Fatal: error.message });
  }
});

// GET /products/featured
router.get("/featured", async (req, res) => {
  try {
    const [result] = await ProductModel.getAllFeaturedProducts();
    res.json(result);
  } catch (error) {
    res.json({ Fatal: error.message });
  }
});

// GET /products/paginated?page=1&limit=16
router.get("/paginated", async (req, res) => {
  let { page = 1, limit = 16 } = req.query;
  try {
    const [products] = await ProductModel.getAllProductsPaginated(page, limit);
    res.json(products);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /products/PRODUCTID
router.get("/:productId", checkProduct, async (req, res) => {
  try {
    res.json(req.product);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /products/category/CATEGORYID
router.get("/category/:categoryId", async (req, res) => {
  try {
    const [result] = await ProductModel.getProductByCategoryId(
      req.params.categoryId
    );
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// POST /products/new
router.post("/new", checkToken, checkAdminRole, async (req, res) => {
  try {
    const [result] = await ProductModel.insertNewProduct(req.body);
    const [products] = await ProductModel.getProductById(result.insertId);
    res.json(products[0]);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

//PUT /products/update/PRODUCTID
router.put(
  "/update/:productId",
  checkProduct,
  checkToken,
  checkAdminRole,
  async (req, res) => {
    const {
      params: { productId },
      body,
    } = req;
    try {
      const [[beforeProduct]] = await ProductModel.getProductById(productId);
      await ProductModel.updateProduct(productId, body);
      const [[product]] = await ProductModel.getProductById(productId);
      res.json(product);
      if (beforeProduct.price > product.price) {
        const [users] = await UsersModel.selectUsersByFavoriteProduct(
          product.id
        );
        let usersEmail = "";
        for (const user of users) {
          usersEmail += `${user.email},\n`;
          sendMail(
            user.email,
            `Your favorite product ${product.title} has a price reduction`,
            `<h1 style="margin-bottom:40px">Make the most out of it, ${user.name} ${user.last_name}!</h1>
            <h4>${product.title} has lowered the price!</h4>
            <p style="margin-bottom:40px"><strong>Now just ${product.price} €!</strong></p>
             `,
            product.image,
            `https://idfashionproject.web.app/products/${product.id}`
          );
        }
        sendMail(
          "idfashioninfo71@gmail.com",
          `Bajada de precio de ${product.title}`,
          `Se ha informado a los siguientes usuarios:\n${usersEmail}`
        );
      }
    } catch (error) {
      console.log(error);
      res.json({ fatal: error.message });
    }
  }
);

//DELETE /products/PRODUCTID
router.delete(
  "/:productId",
  checkProduct,
  checkToken,
  checkAdminRole,
  async (req, res) => {
    const { productId } = req.params;
    try {
      await ProductModel.deleteProduct(productId);
      res.json(req.product);
    } catch (error) {
      res.json({ fatal: error.message });
    }
  }
);

module.exports = router;

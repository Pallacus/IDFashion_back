const {
  getAllCategories,
  insertNewCategory,
  getCategoryById,
  updateCategory,
  deleteCategory,
} = require("../../models/categories.model");
const { checkCategory } = require("../../helpers/category.middlewares");
const {
  checkToken,
  checkAdminRole,
} = require("../../helpers/users.middlewares");

const router = require("express").Router();

// GET /categories
router.get("/", async (req, res) => {
  try {
    const [categories] = await getAllCategories();
    res.json(categories);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});
// GET /categories/CATEGORYID
router.get('/:categoryId', async (req, res) => {
  try {
    const [categories] = await getCategoryById(req.params.categoryId);
    res.json(categories[0]);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /categories
router.get("/:categoryId", async (req, res) => {
  try {
    const [[category]] = await getCategoryById(req.params.categoryId);
    res.json(category);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// POST /categories/new
router.post("/new", checkToken, checkAdminRole, async (req, res) => {
  const { title } = req.body;
  try {
    const [result] = await insertNewCategory(title);
    const [categories] = await getCategoryById(result.insertId);
    res.json(categories[0]);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

//PUT /categories/update/CATEGORYID
router.put(
  "/update/:categoryId",
  checkCategory,
  checkToken,
  checkAdminRole,
  async (req, res) => {
    const {
      params: { categoryId },
      body: { title },
    } = req;
    try {
      await updateCategory(categoryId, title);
      const [categories] = await getCategoryById(categoryId);
      res.json(categories[0]);
    } catch (error) {
      res.json({ fatal: error.message });
    }
  }
);

//DELETE /categories/CATEGORYID
router.delete(
  "/:categoryId",
  checkCategory,
  checkToken,
  checkAdminRole,
  async (req, res) => {
    const { categoryId } = req.params;
    try {
      const [categories] = await getCategoryById(categoryId);
      if (categories.length === 0) {
        return res.json({ fatal: `Esta categoría no existe.` });
      }
      await deleteCategory(categoryId);
      res.json(categories[0]);
    } catch (error) {
      res.json({ fartal: error.message });
    }
  }
);

module.exports = router;

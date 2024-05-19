//const { getAllComments, insertNewComment, getCommentById, updateComment, deleteComment, getCommentsByProductId } = require('../../models/comments.model');
const CommentsModel = require("../../models/comments.model");
const { checkComment } = require("../../helpers/comment.middlewares");
const {
  checkUserRole,
  checkToken,
  checkAdminRole,
} = require("../../helpers/users.middlewares");

const router = require("express").Router();

// GET /comments
router.get("/", async (req, res) => {
  try {
    const [result] = await CommentsModel.getAllComments();
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

router.get("/:comentId", async (req, res) => {
  try {
    const [result] = await CommentsModel.getCommentById(
      req.params.comentId
    );
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /comments/product/PRODUCTID
router.get('/product/:productId', async (req, res) => {
  const { params: { productId } } = req;
  try {
    const [result] = await CommentsModel.getCommentsByProductId(productId);
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// POST /comments/new
router.post("/new", checkToken, checkUserRole, async (req, res) => {
  try {
    const [result] = await CommentsModel.insertNewComment(req.body);
    const [comments] = await CommentsModel.getCommentById(result.insertId);
    res.json(comments[0]);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

/**
 * TODO: ValorAR SI NECESITAMOS ESTAS FUNCIONES
 */
//PUT /comments/update/COMMENTID
router.put("/update/:commentId", checkComment, async (req, res) => {
  const {
    params: { commentId },
    body,
  } = req;
  try {
    await CommentsModel.updateComment(commentId, body);
    const [comments] = await CommentsModel.getCommentById(commentId);
    res.json(comments[0]);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

//DELETE /comments/COMMENTID
router.delete("/:commentId", checkComment, async (req, res) => {
  const { commentId } = req.params;
  try {
    await CommentsModel.deleteComment(commentId);
    res.json(req.product);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

module.exports = router;

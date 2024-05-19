const Comment = require('../models/comments.model');

const checkComment = async (req, res, next) => {
    const { commentId } = req.params;
    try {
        const [comments] = await Comment.getCommentById(commentId);
        if (comments.length === 0) {
            return res.json({ fatal: `No existe este comentario.` });
        }
        req.product = comments[0];
        next()
    } catch (error) {
        res.json({ fatal: error.message });
    }
}

module.exports = { checkComment };
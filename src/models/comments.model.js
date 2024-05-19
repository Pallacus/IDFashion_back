const getAllComments = () => {
    return db.query('SELECT * FROM comments');
}
const getCommentById = (commentId) => {
    return db.query(`
    SELECT * FROM comments
    WHERE comments.id = ?`,
        [commentId]);
}
const getCommentsByProductId = (products_id) => {
    return db.query(`
    SELECT c.*, u.name AS author, u.last_name AS author_last_name
    FROM e_commerce.comments AS c
    JOIN e_commerce.users AS u ON c.users_id = u.id
    WHERE c.products_id = ?;`, [products_id]);
}
/* const getCommentsByProductId = (productId) => {
    return db.query(`
    SELECT * FROM comments
    WHERE products_id = ?;`,
        [productId]);
} */

const insertNewComment = ({ text, users_id, products_id }) => {
    return db.query(`
    INSERT INTO comments(text, users_id, products_id) VALUES(?, ?, ?);`,
        [text, users_id, products_id]);
}
const updateComment = (commentId, { text, users_id, products_id }) => {
    return db.query(`
    UPDATE comments
    SET text = ?, users_id = ?, products_id  = ? WHERE id = ?;`,
        [text, users_id, products_id, commentId]);
}
const deleteComment = (commentId) => {
    return db.query(`
    DELETE FROM comments
    WHERE comments.id = ?`,
        [commentId]);
}

module.exports = { getAllComments, getCommentById, getCommentsByProductId, insertNewComment, updateComment, deleteComment };

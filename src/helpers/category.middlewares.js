const Category = require('../models/categories.model');

const checkCategory = async (req, res, next) => {
    const { categoryId } = req.params;
    try {
        const [categories] = await Category.getCategoryById(categoryId);
        if (categories.length === 0) {
            return res.json({ fatal: `No existe ninguna categoria con este id.` });
        }
        req.product = categories[0];
        next()
    } catch (error) {
        res.json({ fatal: error.message });
    }
}

module.exports = { checkCategory };
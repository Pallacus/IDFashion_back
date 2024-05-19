const router = require("express").Router();
const bcrypt = require("bcryptjs");

const UsersModel = require("../../models/users.model");
const { checkUser } = require("../../helpers/users.middlewares");
const { createToken } = require("../../helpers/utils");

// GET /users
router.get("/", async (req, res) => {
  try {
    const [result] = await UsersModel.selectAllUsers();
    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /users/email/:emailUser
router.get("/email/:emailUser", async (req, res) => {
  try {
    const [[user]] = await UsersModel.selectUserByEmail(req.params.emailUser);
    res.json(user)
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// GET /users/USERID
router.get("/:userId", checkUser, async (req, res) => {
  try {
    res.json(req.user);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// POST /users/new                           REGISTRO
router.post("/new", async (req, res) => {
  req.body.password = bcrypt.hashSync(req.body.password, 8);

  try {
    const [user] = await UsersModel.insertUser(req.body);
    const [[result]] = await UsersModel.selectUserById(user.insertId);

    res.json(result);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

// POST /users/login                           LOGIN
router.post("/login", async (req, res) => {
  const { email, password } = req.body;
  try {
    const [[user]] = await UsersModel.selectUserByEmail(email);

    if (!user) {
      return res.json({ fatal: "Email y/o contraseña incorrectos" });
    }

    const comparePassword = bcrypt.compareSync(password, user.password);

    if (!comparePassword) {
      return res.json({ fatal: "Email y/o contraseña incorrectos" });
    }

    res.json({
      success: "Login correcto",
      token: createToken(user),
    });
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

//PUT /users/update/USERID
router.put("/update/:userId", checkUser, async (req, res) => {
  const {
    params: { userId },
    body,
  } = req;
  try {
    await UsersModel.updateUser(userId, body);
    res.json(req.user);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

//DELETE /users/USERID
router.delete("/:userId", checkUser, async (req, res) => {
  const { userId } = req.params;
  try {
    await UsersModel.deleteUserById(userId);
    res.json(req.user);
  } catch (error) {
    res.json({ fatal: error.message });
  }
});

module.exports = router;

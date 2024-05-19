const jwt = require("jsonwebtoken");

const UsersModel = require("../models/users.model");

const checkUser = async (req, res, next) => {
  const { userId } = req.params;
  try {
    const [users] = await UsersModel.selectUserById(userId);

    if (users.length === 0) {
      return res.json({ fatal: `No existe ningún usuario con este id.` });
    }
    req.user = users[0];
    next();
  } catch (error) {
    res.json({ fatal: error.message });
  }
};

const checkToken = async (req, res, next) => {
  if (!req.headers.authorization) {
    return res
      .status(401)
      .json({ fatal: "Debes incluir el token de autenticación" });
  }
  const token = req.headers.authorization;

  let obj;
  try {
    obj = jwt.verify(token, process.env.SECRET_KEY);
  } catch (error) {
    return res.status(401).json({ fatal: "El token es incorrecto" });
  }
  const [[user]] = await UsersModel.selectUserById(obj.id);
  req.user = user;

  next();
};

const checkAdminRole = (req, res, next) => {
  if (req.user.role !== "admin") {
    return res
      .status(401)
      .json({ fatal: "No tienes permisos de administrador" });
  }
  next();
};

const checkUserRole = (req, res, next) => {
  if (req.user.role !== "user") {
    return res
      .status(401)
      .json({ fatal: "No tienes permisos de usuario, debes registrarte" });
  }
  next();
};

module.exports = {
  checkUser,
  checkToken,
  checkAdminRole,
  checkUserRole,
};

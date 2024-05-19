const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");

const createToken = (user) => {
  //el token es un objeto de datos codificados
  const obj = {
    id: user.id,
    role: user.role,
  };

  return jwt.sign(obj, process.env.SECRET_KEY);
};

const sendMail = (to, subject, text, image = "", url = '') => {
  let transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 465,
    secure: true,
    auth: {
      user: "idfashioninfo71@gmail.com",
      pass: "bmgp ayga ulvn xjko",
    },
  });

  // Definimos el email
  let mailOptions = {
    from: "idfashioninfo71@gmail.com",
    to,
    subject,
    html: text,
  };
  if (image) {
    mailOptions.attachments = [
      {
        filename: "image.png",
        path: image,
        cid: "unique@nodemailer.com", //same cid value as in the html img src
      },
    ];
    mailOptions.html += `<a href="${url}"><img src="cid:unique@nodemailer.com"/></a>`;
  }
  // Enviamos el email
  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log("Correo enviado");
    }
  });
};

module.exports = {
  createToken,
  sendMail,
};

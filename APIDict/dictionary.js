const express = require('express');
const mysql2 = require('mysql2');
//lien quan den insert into
const bodyParser = require('body-parser');
//B2:tao ra ung dung web su dung thu vien express

require("dotenv").config();

const connection = require("./connection/dbConnect");
const app = express();
app.use(bodyParser.json());


function mysqlConnect() {
  global.connection = mysql2.createConnection(connection);
  global.connection.connect(function(err) {
    if(err) {
      console.log("Loi ket noi db");
      setTimeout(mysqlConnect, 2000);
    }
    console.log("Da ket noi db");
  });

  global.connection.on("error", function(err) {
    if(err.code == "PROTOCOL_CONNECTION_LOST") {
      mysqlConnect();
    } else {
      throw err;
    }
  })

}

mysqlConnect();

const routerDict = require("./router/dictionaryRouter");

app.use("/dict", routerDict);


const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Sever dang chay cong ${port}`);
});

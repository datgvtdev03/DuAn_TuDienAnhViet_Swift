const express = require("express");
const router = express.Router();

const {
  searchDictAnhViet,
} = require("../controller/dictionaryController");
const connection = require("../connection/dbConnect");

router.get("/dictionaryen", searchDictAnhViet);

module.exports = router;


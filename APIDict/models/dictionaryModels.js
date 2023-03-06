"dictionary strict";

const dictionarys = function(dict) {
  this.idx = dict.idx;
  this.word = dict.word;
  this.detail = dict.detail;
};

//tu tieng anh sang tieng viet
dictionarys.search = function(word, kq) {
    connection.query("SELECT * FROM `tbl_edict` WHERE word LIKE ? LIMIT 50", [[word + '%']], function(err, res) {
    // console.log("model: " + 55555555);
    if(err) {
      kq(null, err);
    } else {
      kq(res, null);
    }
  });
};

module.exports = dictionarys;
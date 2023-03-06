const dict = require("../models/dictionaryModels");

exports.searchDictAnhViet = async(req, res) => {
    console.log("Keyyyy: " + JSON.stringify(req.query));
    console.log("Keyyyy: " + JSON.stringify(req.query.word));
    let word = req.query.word;

    dict.search(word, function(err, dict) {
        if (err) {
            return res.status(403).send(err);
        }
        res.json(dict);
    });
};

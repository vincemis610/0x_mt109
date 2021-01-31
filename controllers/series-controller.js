const seriesModel = require('../models/series-model');

let seriesController = () => {};

seriesController.listSeries = (req, res, next) => {
    let sql = '';
    if (req.query.id) {
        sql = `s.id = ${req.query.id}`
    }
    seriesModel.listSeries(sql, (err, rows) => {
        if (err) throw err;
        if (sql != '') {
            rows[0].actores = JSON.parse(rows[0].actores);
        }
        
        res.json(rows);
    })
}

module.exports = seriesController;
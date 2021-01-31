const seriesController = require('../controllers/series-controller')

module.exports = (app) => {
    app.get("/getSeries:id?", seriesController.listSeries);
}
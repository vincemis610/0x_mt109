const db = require("../config/DBconfig");

let seriesModel = () => {};

seriesModel.listSeries = (sql, cb) => {
    if ( sql == '') {
        db.query(`SELECT * FROM series`, cb);
    } else {
        db.query(`SELECT s.nombreSerie,  CONCAT('[',GROUP_CONCAT(DISTINCT(JSON_OBJECT("name",a.nameActor))),']') AS actores from series AS s 
        JOIN episodios AS e on e.idSerie = s.id  
        JOIN actores AS a ON a.id = e.idActor 
        WHERE ${sql} group by e.idSerie;`, cb)
    }
    
}

module.exports = seriesModel;
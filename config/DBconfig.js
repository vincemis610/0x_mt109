var mysql = require('mysql');

var dbOptions = {
    host: "localhost",
    port: 3306,
    user: "root",
    password: "123",
    database: "tvcompany"
};

var pool;
 
connectDB = () => {
    if (!pool) {
        pool = mysql.createPool(dbOptions);

        pool.getConnection((err) => {
            if (err) {
                console.log(err);
            } else {
                console.log('DB Connected');
            }
        });
    }
    return pool;
}
 
module.exports = connectDB();
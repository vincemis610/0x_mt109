const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
var port = process.env.PORT;

const app = express();

app.use(morgan('dev'));

app.use(bodyParser.urlencoded({
    limit: '50mb',
    extended: false
}));
app.use(bodyParser.json());

app.options((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'token, Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    return res.status(200).end;
    next();
});

app.get('/', (req, res) => {
    res.send('Testing')
})

require('./routes')(app);

app.listen(3000, () => {
    console.log('Listen in port 3000')
});

module.exports = app;

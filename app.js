const express = require('express');
const bodyparser = require('body-parser');
const mysql = require('mysql');
const database = require('./db');
const app = express();


const childrenRoutes = require('./api/routes/childrens');
const parentRoutes = require('./api/routes/parents');
const applicationRoutes = require('./api/routes/applications');

app.use(bodyparser.json());

app.use((req,res,next) => {
    res.header('Access-Control-Allow-Origin','*');
    res.header('Access-Control-Allow-Headers',
               'Origin,X-Requested-With,Content-Type,Accept,Authorization');
    if(req.method === 'OPTIONS'){
        res.header('Access-Control-Allow-Methods','PUT,DELETE,PATCH,POST,GET');
        return res.status(200).json({});
    }
    next();
});

app.use('/childrens',childrenRoutes);
/* app.use('/parents',parentRoutes);
 */app.use('/applications',applicationRoutes);

app.use((req,res,next) =>{
    const error = new Error('Not Found .');
    error.status = 404;
    next(error);
});

app.use((error,req,res) => {
    res.status(error.status || 500)
       .json({
           error: error.message
       });
});

module.exports = app;
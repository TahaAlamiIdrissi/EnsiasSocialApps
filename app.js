const express = require('express');
const bodyparser = require('body-parser');
const app = express();


const childrenRoutes = require('./api/routes/childrens');
const applicationRoutes = require('./api/routes/applications');
const parentRoutes = require('./api/routes/parent');
const tutorRoutes = require('./api/routes/tutor');

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
app.use('/applications',applicationRoutes);
app.use('/parents',parentRoutes);
app.use('/tutors',tutorRoutes);

app.use((req,res,next) =>{
    const error = {
        message: 'Not Found !',
        status: 404
    }
    res.status(error.status || 500)
       .json({
           error: error.message,
           status: error.status
       });
});
/* app.use((error,req,res,next) => {

}); */

module.exports = app;
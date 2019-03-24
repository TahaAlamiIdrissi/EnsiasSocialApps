const express = require('express');
const router = express.Router();
const mysqlConnect = require('../../db');


/* 
*   Get All Parents 
*/

router.get('/',(req,res,next) => {
    mysqlConnect.query('SELECT * FROM ')
})

module.exports = router;
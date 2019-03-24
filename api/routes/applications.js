const express = require('express');
const router = express.Router();
const mysqlConnect = require('../../db');


/* 
**GETTING ALL CHILDS /applications
*/
router.get('/',(req,res,next) => {
    mysqlConnect.query('SELECT * FROM apps',(err,rows,fields) => {
        if(!err){
            res.status(200)
            .json({
             message : 'GET/ All APPLICATIONS ',
             applications : rows,
         })
        }else{
            console.log(err);
        }
    });

});

/* 
**GET APPLICATION BY ID
 */

 router.get('/:appId',(req,res,next) => {
     mysqlConnect.query('SELECT * FROM apps WHERE id = ?',[req.params.appId],
        (err,rows,fields) => {
            if(!err){
                res.status(200)
                   .json({
                    message : 'GET/ A SINGLE APP BY ID ',
                    application : rows,
                    allApps : `http://localhost:3000/applications`
                })
            }else{
                console.log(err);
            }
        });
 });

module.exports = router;
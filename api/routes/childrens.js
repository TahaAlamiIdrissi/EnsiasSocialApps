const express = require('express');
const router = express.Router();
const mysqlConnect = require('../../db');


/* 
**GETTING ALL CHILDS /childrens
*/
router.get('/',(req,res,next) => {
    mysqlConnect.query('SELECT * from children',(err,rows,fields) => {
        if(!err){
            res.send(rows);
        }else{
            console.log(err);
        }
    });

});
/* 
**GETTING a specific child /childrens/:id
*/
router.get('/:childId',(req,res,next) => {
    mysqlConnect.query('SELECT * FROM children where id = ?',[req.params.childId]
                        ,(err,rows,fields) => {
                            if(!err)
                                res.send(rows);
                            else
                                console.log(err);
                        });
});

router.get('/childrens/:parentId',(req,res,next) => {
    mysqlConnect.query(`SELECT * FROM children WHERE id IN
                       (SELECT  id FROM enrollments WHERE user_id = ? ) `,[req.params.parentId]
                       ,(err,rows,fields) => {
                           if(!err){
                                res.send(rows);
                                console.log("GET childrens/:parentId"+rows)
                            }
                            else
                                console.log(err);
                       });
});
/* router.get('/:parentId/childrens',(req,res,next) => {
    mysqlConnect.query(`SELECT * FROM children WHERE id IN
                       (SELECT  id FROM enrollments WHERE user_id = ?)`,[req.params.parentId]
                       ,(err,rows,fields) => {
                           if(!err)
                                res.send(rows);
                            else
                                console.log(err);
                       });
}); */

module.exports = router;
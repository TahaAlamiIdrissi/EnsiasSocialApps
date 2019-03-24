const express = require('express');
const router = express.Router();
const mysqlConnect = require('../../db');
const childfunc = require('../functions/childFunctionalities');

/* 
**GETTING ALL CHILDS /childrens
*/
router.get('/',(req,res,next) => {
   childfunc.getAllChilds()
            .then(docs => {
                const response = {
                    count: docs.length,
                    childrens: docs.map((doc) =>{
                         return {
                             doc,
                             request: {
                                 type: 'GET',
                                 url: `http://localhost:3000/childrens/${doc.id}`
                             }
                         }
                    })
                }
                res.status(200)
                   .json(response);
            })
            .catch(err => {
                console.error(err);
                res.status(500)
                   .json(err);
            });

});


router.get('/:childId',(req,res,next) => {
    const id = req.params.childId;
    childfunc.getChildById(id)
             .then(doc => {
                const response = {
                    count : doc.length,
                    children:  doc,
                    request: {
                        type: 'GET',
                        url: `http://localhost:3000/childrens`
                    }
                }
                res.status(200)
                   .json(response);
            })
            .catch(err => {
                console.error(err);
                res.status(500)
                   .json(err);
            });

})

module.exports = router;
const express = require('express');
const router = express.Router();
const childfunc = require('../functions/childFunctionalities');

/* 
**GETTING ALL CHILDS /childrens

we use the functions that we've defined in /functions/..
to work on the rows 
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
});
router.get('/parent/:parentId',(req,res,next) => {
    const id = req.params.parentId;
    childfunc.getParentChilds(id)
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

router.get('/tutor/:tutorId',(req,res,next) => {
    const id = req.params.parentId;
    childfunc.getParentChilds(id)
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

module.exports = router;
const express = require('express');
const router = express.Router();
const parentFunc = require('../functions/parentFunctionalities');

router.get('/',(req,res,next) => {
    parentFunc.getAllParents()
              .then(docs => {
                  const response = {
                      count: docs.length,
                      parents: docs.map(doc => {
                          return {
                              doc,
                              request: {
                                  type: 'GET',
                                  url: `http://localhost:3000/parents/${doc.id}`
                              }
                          }
                      })
                  }
                  res.status(200)
                     .json(Array.of(response));
              })
              .catch(err => {
                  console.log(err);
                  res.status(500)
                     .json(err);
              });
});


router.get('/:parentId',(req,res,next) => {
    const id = req.params.parentId;

    parentFunc.getParentById(id)
              .then(docs => {
                  const response = {
                      parents : docs.map(doc => {
                          return {
                            parent:doc,
                            request: {
                                type: 'GET',
                                url: `http://localhost:3000/parents`
                            }
                          }
                      })
                  }
                  res.status(200)
                     .json(Array.of(response));
              })
              .catch(err => {
                  console.log(err);
                  res.status(500)
                     .json(err);
              });
})

router.post('/',(req,res,next) => {
    parentFunc.createParent(req.body)
              .then(
                  res.status(200)
                    .json({
                        message: 'Inserted Successfully',
                        request: {
                            type: 'POST',
                            url: `http://localhost:3000/parents/${req.body.id}`
                        }
                    })
              )
              .catch(err => {
                  console.log(err);
                  res.status(500)
                     .json(err);
              });
})

module.exports = router;
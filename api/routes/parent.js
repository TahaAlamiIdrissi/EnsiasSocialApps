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
                     .json(response);
              })
              .catch(err => {
                  console.log(err);
                  res.status(500)
                     .json(err);
              });
});




module.exports = router;
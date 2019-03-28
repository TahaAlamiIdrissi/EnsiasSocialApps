const express = require('express');
const router = express.Router();
const appFunc = require('../functions/appFunctionalities');


/* 
**GETTING ALL CHILDS /applications
*/
router.get('/',(req,res,next) => {
    appFunc.getAllapps()
           .then(docs => {
                const response = {
                    count: docs.length,
                    applications: docs.map(doc => {
                        return {
                            doc,
                            request: {
                                type: 'GET',
                                url: `http://localhost:3000/applications/${doc.id}`
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

/* 
**GET APPLICATION BY ID /applications/:appId
 */

 router.get('/:appId',(req,res,next) => {
     const id = req.params.appId;
     appFunc.getAppById(id)
            .then(doc => {
                const response = {
                    count : doc.length,
                    application : doc,
                    request: {
                        type: 'GET',
                        url: `http://localhost:3000/applications`
                    }
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

 /* 
 ** GET APPlICATIONS BY RATING
 */
router.get('/rate/desc',(req,res,next) => {
    appFunc.getAppByRate()
           .then(docs => {
               const response = {
                   count: docs.length,
                   applications: docs.map(doc => {
                       return {
                           doc,
                           request: {
                               type: 'GET',
                               url : `http://localhost:3000/applications/${doc.id}`
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


 /* 
 ** GET APPLICATIONS BY VIEWS
 */
router.get('/views/desc',(req,res,next) => {
    appFunc.getAppByViews()
           .then(docs => {
               const response = {
                   count: docs.length,
                   applications: docs.map(doc => {
                       return {
                           doc,
                           request: {
                            type: 'GET',
                            url : `http://localhost:3000/applications/${doc.id}`
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
})

 
module.exports = router;
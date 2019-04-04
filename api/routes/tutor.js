const express = require('express');
const router = express.Router();
const tutorFunc = require('../functions/tutorFunctionalities');


//GET ALL THE TUTORS
router.get('/',(req,res,next) => {
    tutorFunc.getAllTutors()
             .then(docs => {
                 const response = {
                     count: docs.length,
                     tutors: docs.map(doc => {
                         return {
                             doc,
                             request: {
                                 type: 'GET',
                                 url: `http://localhost:3000/tutors/${doc.id}`
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
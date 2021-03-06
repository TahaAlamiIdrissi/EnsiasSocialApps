const mysqlConnect = require('../../db');




/* 
* This function will return a promise with all the rows if the resolver method has been
* executed or the error if the reject method ..
*/

function getAllChilds(){
    return new Promise((resolve, reject) => {
        // The Promise constructor should catch any errors thrown on
        // this tick. Alternately, try/catch and reject(err) on catch.

        const query_str =`SELECT * FROM children`;
        mysqlConnect.query(query_str,(err, rows, fields) => {
            // Call reject on error states,
            // call resolve with results
            if (err) 
                return reject(err);
            
            resolve(rows);
        });
    });
}

function getChildById(id){
    return new Promise((resolve,reject) => {
        const query_str =`SELECT * FROM children WHERE id = ? `;
        const query_param = [id];

        mysqlConnect.query(query_str,query_param,(err,rows,fields) => {
            if (err) {
                return reject(err);
            }
            resolve(rows);
        });

    });
}

function getParentChilds(id){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * 
                           FROM children 
                           WHERE id IN ( SELECT id 
                                         FROM enrollments 
                                         WHERE user_id 
                                         in (SELECT id 
                                             FROM users 
                                             WHERE type='parent' 
                                             AND id = ? ) )`;
        const query_param = [id];

        mysqlConnect.query(query_str,query_param,(err,rows,fields) => {
            if(err)
                return reject(err);
            
            resolve(rows);
        });
    });
}

function getTutorChilds(id){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * FROM children 
                           WHERE id IN(SELECT id FROM enrollments
                                       WHERE user_id IN (SELECT id FROM users
                                                         WHERE type like 'tuteur' and id = ?))`;
        const query_param = [id];

        mysqlConnect.query(query_str,query_param,(err,rows,fields) => {
            if(err)
                return reject(err);
            
            resolve(rows);
        });
    })
}

function createChild(child){
    return new Promise((resolve,reject) => {
        const query_str = `INSERT INTO children SET ?`
        mysqlConnect.query(query_str,child,(err,rows,fields) => {
           if(err)
                return reject(err);
            
            resolve(rows); 
        });
    });
}
module.exports = {
    getAllChilds ,
    getChildById,
    getParentChilds,
    getTutorChilds,
    createChild
};
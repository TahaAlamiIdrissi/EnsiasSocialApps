const mysqlConnect = require('../../db');

// Get All the parent 
function getAllParents(){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * 
                         FROM users 
                         WHERE type like 'parent' `;
        mysqlConnect.query(query_str,(err,rows,fields) =>{
            if(err)
                return reject(err);
            
            resolve(rows);
        });
    });
}
// Get a parent by hes id 
function getParentById(id){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * 
                           FROM users
                           WHERE type like 'parent' AND id = ?`;
        const query_param = [id];
        mysqlConnect.query(query_str,query_param,(err,rows,fields) => {
            if(err)
                return reject(err);
            
            resolve(rows);
        });
    });
}

module.exports = {
    getAllParents,
    getParentById
}
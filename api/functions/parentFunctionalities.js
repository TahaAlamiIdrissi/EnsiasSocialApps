const mysqlConnect = require('../../db');


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

function getParentById(id){
    return new Promise((reslove,reject) => {
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
const mysqlConnect = require('../../db');


function getAllParents(){
    return new Promise((resolve,reject) => {
        const query_str=`SELECT * 
                         FROM users 
                         WHERE type like 'parent' `;
        mysqlConnect.query(query_str,(err,rows,fields) =>{
            if(err)
                return reject(err);
            
            resolve(rows);
        })
    });
}

module.exports = {
    getAllParents
}
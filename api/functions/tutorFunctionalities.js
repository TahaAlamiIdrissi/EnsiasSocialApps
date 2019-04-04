const mysqlConnect = require('../../db');

function getAllTutors(){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * 
                           FROM users
                           WHERE type like 'tuteur'`;
        mysqlConnect.query(query_str,(err,rows,fields) => {
            if(err)
                return reject(err);
            
            resolve(rows);
        });
    });
}


function getTutorById(id){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT *
                           FROM users
                           WHERE type like 'tuteur' AND id=?`;
        const query_param = [id];

        mysqlConnect.query(query_str,query_param,(err,rows,fields) => {
            if(err)
                return reject(err);
                
            resolve(rows);
        })
    });
}


module.exports = {
    getAllTutors,
    getTutorById
}
const mysqlConnect = require('../../db');

function getAllapps(){
    return new Promise((resolve,reject ) => {
        const query_str = `SELECT * FROM apps`;

        mysqlConnect.query(query_str,(err,rows,fields) => {
            if(err)
                return reject(err);

            resolve(rows);
        });
    });
}

function getAppById(id){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * FROM apps WHERE id = ?`;
        const query_param = [id];

        mysqlConnect.query(query_str,query_param,(err,rows,fields) => {
            if(err)
                return reject(err);
            
            resolve(rows);
        });
    });
}



module.exports = {
    getAllapps
}

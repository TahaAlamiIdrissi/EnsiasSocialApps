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

/* now we have to get the most rated apps and the most viewed 
 so we have to add two fields 
    -> one is called rate 
    -> another one called viewed
 */

 /* 
    SELECT * FROM apps WHERE rate >= (SELECT MAX(rate) FROM apps) ORDER BY
 */

module.exports = {
    getAllapps,
    getAppById
}

const mysqlConnect = require('../../db');


/* 
*This function will return a promise with all the rows if the resolver method has been
* executed or the error if the reject method ..
*/
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
//applications/rate/desc
function getAppByRate(){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * FROM apps ORDER BY rate DESC`;

        mysqlConnect.query(query_str,(err,rows,fields) => {
            if(err)
               return reject(err);

            resolve(rows);
        });
    });
}

//applications/views/desc

function getAppByViews(){
    return new Promise((resolve,reject) => {
        const query_str = `SELECT * FROM apps ORDER BY views DESC`;

        mysqlConnect.query(query_str,(err,rows,fiekds) => {
            if(err)
                return reject(err);

            resolve(rows);
        });
    });
}

module.exports = {
    getAllapps,
    getAppById,
    getAppByRate,
    getAppByViews
}

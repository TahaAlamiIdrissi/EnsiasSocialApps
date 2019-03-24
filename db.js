const mysql = require('mysql');

/* 
*       Establishing a mysql DB connection
*/

const mysqlConnect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'esapps'
});

mysqlConnect.connect((err) => {
    if(err)
        console.log('db connection failed \n Error :'+JSON.stringify(err,undefined,2));
    else
        console.log('DB connection succeded.');
})
/* ******************************************* */

module.exports = mysqlConnect;
var con = require('../../config/connection');


module.exports ={
    save : function (title , from , body , userName , cb) {
            let sql = "insert into online_test.notification values (?,?,?,?)";
            con.query(sql , [title , from , body , userName] , cb)
    }
}
var con = require('../../config/connection');

module.exports ={
   save : function (user_name , deadline , positionId , callback) {
       var sql = "insert into online_test.exams_process (user_name , deadline , positionId) VALUES (?,?,?)";
       con.query(sql , [user_name , deadline , positionId] , callback)

   },
    LastInsertedId : function (callback) {
       con.query("select last_insert_id()" , callback)

    }
};
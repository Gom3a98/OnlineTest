var con = require('../../config/connection');



module.exports={
    getExams:function(userName,processID,callback){
        var query= "select * from online_test.exams_process where user_name ='"+userName+"' and epid ='"+processID+"'";
        con.query(query,callback);
    },


}
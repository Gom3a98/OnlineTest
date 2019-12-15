var con = require('../../config/connection');



module.exports={
    getExams:function(processID,callback){
        var query= "select * from online_test.exams_process where epid ='"+processID+"'";
        con.query(query,callback);
    },


}
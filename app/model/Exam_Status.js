var con = require('../../config/connection');

module.exports={
    UpdateScore:function(examID,ProcessID,score,callback){
        var query = "UPDATE online_test.exam_status SET score= '" + score +"' , isFinished='1' WHERE process_id= '"+ProcessID+"' and examId= '"+examID+"'";
        console.log(query);
        con.query(query,callback);
    }
}
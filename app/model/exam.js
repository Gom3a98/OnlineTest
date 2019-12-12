var con = require('../../config/connection');

module.exports={
    GetAllExams:function (callback) {
        //SELECT * FROM question INNER JOIN answer ON question.qid=answer.qid;
        con.query("select * from exams",callback)
    },
    ExamWithQ_A:function (ID,callback) {
        var query="SELECT * from online_test.question JOIN online_test.answer  ON question.qid = answer.qid  where question.examID="+ID;
    con.query(query,callback);
    },
    insertExam:function(examTitle,examDuration,callback){
        var query= "insert into online_test.exams (examTitle,Duration) values('"+examTitle+"','"+examDuration+"')";
        con.query(query,callback);
    },

    DeleteExam:function(id,callback){
        var query = "DELETE FROM online_test.exams WHERE examID = "+id;
        con.query(query,callback);
    },
    UpdateExam:function(id,examTitle,examDuration,callback){
        var query = "UPDATE online_test.exams SET examTitle= '" + examTitle +"', Duration= '"+examDuration+"' WHERE examID="+id;
        con.query(query,callback);
    },
}

var con = require('../../config/connection');

module.exports={
    Question: function (callback) {

        con.query("select *  from question",callback);
    },
    Answer: function (callback) {

        con.query("select *  from answer",callback);
    },
    Exams:function (callback) {
        //SELECT * FROM question INNER JOIN answer ON question.qid=answer.qid;
        con.query("select * from exams",callback)
    },
    question:function (callback) {
        //SELECT * FROM question INNER JOIN answer ON question.qid=answer.qid;
        con.query("select * from exams",callback)
    },
    answer:function (callback) {
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
insertQuestion:function(examID,QuestionBody,callback){
    var query= "insert into online_test.question (questionBody,examID) values('"+QuestionBody+"','"+examID+"')";
    con.query(query,callback);
},
insertAnswerBasedOnQuestionID:function(QuestionBody,AnswerBody,correct,callback){
    var query= "insert into online_test.answer (AnswerBody,correct,qid) select '"+AnswerBody + "' , '"+correct+"' , qid from online_test.question where questionBody= '"+QuestionBody+"'";
    con.query(query,callback);
},
insertAnswer:function(QuestionBody,AnswerBody,correct,callback){
    var query =  "insert into online_test.answer (AnswerBody,correct,qid) values ('"+AnswerBody+"','"+correct+"','"+QuestionBody+"')";
    con.query(query,callback);
},
DeleteExam:function(id,callback){
    var query = "DELETE FROM online_test.exams WHERE examID = "+id;
    con.query(query,callback);
},
DeleteQuestion:function(id,callback){
    var query = "DELETE FROM online_test.question WHERE qid = "+id;
    con.query(query,callback);
},
DeleteAnswer:function(id,callback){
    var query = "DELETE FROM online_test.answer WHERE aid = "+id;
    con.query(query,callback);
},
UpdateExam:function(id,examTitle,examDuration,callback){
    var query = "UPDATE online_test.exams SET examTitle= '" + examTitle +"', Duration= '"+examDuration+"' WHERE examID="+id;
    console.log(query)
    con.query(query,callback);
},
UpdateQuestion:function(id,oldQuestionID,newquestionBody,callback){
    var query = "UPDATE online_test.question SET questionBody= '" + newquestionBody +"' WHERE qid= '"+oldQuestionID+"' and examID= '"+id+"'";
    console.log(query)
    con.query(query,callback);
},
UpdateAnswer:function(Answerid,AnswerBody,correct,callback){
    var query = "UPDATE online_test.answer SET AnswerBody= '" + AnswerBody +"' , correct= '"+correct+"' WHERE aid= '"+Answerid+"'";
    console.log(query)
    con.query(query,callback);
}
}

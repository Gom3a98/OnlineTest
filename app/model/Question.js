var con = require('../../config/connection');

module.exports = {
    GetAllQuestions: function (callback) {
        con.query("select *  from question",callback);
    },
    insertQuestion:function(examID,QuestionBody,callback){
        var query= "insert into online_test.question (questionBody,examID) values('"+QuestionBody+"','"+examID+"')";
        con.query(query,callback);
    },
    DeleteQuestion:function(questionBody,callback){
        const query = "DELETE FROM online_test.question WHERE questionBody = " + questionBody;
        con.query(query,callback);
    },
    UpdateQuestion:function(id,oldQuestionBody,newquestionBody,callback){
        var query = "UPDATE online_test.question SET questionBody= '" + newquestionBody +"' WHERE questionBody= '"+oldQuestionBody+"' and examID= '"+id+"'";
        con.query(query,callback);
    },
};
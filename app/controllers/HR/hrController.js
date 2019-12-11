var con = require("../../../config/connection");
var Position = require("../../model/Position");
var exams = require("../../model/exam");

var create = function(request , response){
    response.render("hr/createFormForNewPosition")
}
var store = function(request , response){
    var title = request.body.title;
    var availability= request.body.availability;
    var description = request.body.description;
    Position.savePosition(title,description,availability,(err, result)=> {
        if (err) throw err;
        response.redirect("/HR/hrDashboard");
    });

};
var ViewDashBoard = (request,response)=>{
    response.render('hr/MainDashboard');
}
var listExams=(req,res,next)=>{
    exams.Exams((err,result)=>{
        res.send(result);
    })
}
var examDetails= (req,res,next)=>{
    console.log(req.body)
    exams.ExamWithQ_A(req.body.id,(err,result)=>{
        console.log(result)
        res.send(result)
    })
}
var CreateExam=(req,res,next)=>{
    console.log(req.body)
    exams.insertExam(req.body.ExamTitle,req.body.ExamDuration,(err,result)=>{
        console.log(err)
        console.log(result)
        if(err)
            res.send('0')
        else
            res.send('1')
    })
}
var deleteExam=(req,res,next)=>{
    id=req.body.ID;
    console.log(console.log(req.body.id))
    exams.DeleteExam(id,(err,result)=>{
        
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')

    })
}
var updateExam = (req,res,next)=>{
    var id=req.body.ID;
    var Examtitle=req.body.Examtitle;
    var ExamDuration=req.body.ExamDuration;

    exams.UpdateExam(id,Examtitle,ExamDuration,(err,result)=>{
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')

    })
}



var CreateQuestion=(req,res,next)=>{
    var examID=req.body.examID;
    var QuestionBody=req.body.QuestionBody
    var AnswerBody= req.body.AnswerBody
    var Correct=req.body.Correct
    exams.insertQuestion(examID,QuestionBody,(err,result)=>{
        console.log(err)
        console.log("/////////////")
        console.log(result)
        exams.insertAnswerBasedOnQuestionID(QuestionBody,AnswerBody, Correct,null);
        if(err)
            res.send('0')
        else
            res.send('1')
    })
}
var updateQuestion=(req,res,next)=>{
    console.log(req.body)
    id=req.body.ID;
    oldQuestionID=req.body.oldQuestionID;
    newQuestion=req.body.newQuestion;
    exams.UpdateQuestion(id,oldQuestionID,newQuestion,(err,result)=>{
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')
    })
}
var deleteQuestion=(req,res,next)=>{
    oldQuestionID=req.body.oldQuestionID;
    exams.DeleteQuestion(oldQuestionID,(err,result)=>{
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')
    })
}

var createAnswer=(req,res,next)=>{
    var AnswerBody = req.body.AnswerBody ;
    var Correct =req.body.Correct;
    var QuestionID = req.body.questionID;
    console.log(req.body)
    exams.insertAnswer(QuestionID,AnswerBody,Correct,(err,result)=>{
    if(err||result.affectedRows==0)
        res.send('0')
    else
        res.send('1')
    })
}
var deleteAnswer=(req,res,next)=>{
    var id=req.body.ID;
    exams.DeleteAnswer(id,(err,result)=>{
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')
    })
}
var updateAnswer=(req,res,next)=>{
    var Answerid=req.body.ID;
    var AnswerBody=req.body.AnswerBody;
    var correct =req.body.correct;
    exams.UpdateAnswer(Answerid,AnswerBody,correct,(err,result)=>{
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')
    })
}
module.exports = {
    create : create,
    store : store,
    ViewDashBoard : ViewDashBoard,
    listExams:listExams,
    examDetails:examDetails,
    CreateExam:CreateExam,
    CreateQuestion:CreateQuestion,
    deleteExam:deleteExam,
    deleteQuestion:deleteQuestion,
    deleteAnswer:deleteAnswer,
    updateExam:updateExam,
    updateQuestion:updateQuestion,
    createAnswer:createAnswer,
    updateAnswer:updateAnswer

}

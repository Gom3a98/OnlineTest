var examProcess = require('../../model/exam_process');
var question = require('../../model/Question');
var answer = require('../../model/Answer');
var exam = require('../../model/exam')
var studnetAnswer = require('../../model/sudentAnswer');
var Async = require('async');
var jsonUtils = require("../../../config/json_utils");
var ExamStatue= require('../../model/Exam_Status');


module.exports={
    startExam: function (req, res, next) {
		var arr = req.url.split('/');
		var CondUserName = arr[2];
		var ProcessID = arr[3];
		var examID = arr[4];
		var deadline ,duration,examTitle;
		examProcess.getExams(ProcessID, (err, result) => {
			console.log(result)
			var arr = [];
			console.log(result)
			deadline=result[0].deadline;
			Async.waterfall([function a(callback) {
				exam.getExam(examID, (err, result) => {
					console.log(result)
					duration=result[0].Duration;
					examTitle=result[0].examTitle;
					callback(null, result)
				})
			},function A(amr,callback) {
					question.getQuestionRandom(examID, (err, result) => {
						arr.push(result);
						callback(null, result)
					})
				},
				function B(QUE, callback) {
					var arr2=[]
					QUE.forEach((element, index) => {
						answer.selectCorrectAnswer(element.qid, (err, result) => {
							arr2.push(result)
							if (index == QUE.length - 1) {arr.push(arr2);callback(null, QUE);}
						})
					})
				}, function C(QUE, callback) {
					var arr3 = []
					QUE.forEach((element, index) => {
						answer.selectWrongAnswer(element.qid, (err, result) => {
							arr3.push(result)
							if (index == QUE.length - 1) {arr.push(arr3);callback(null, arr);}
						})
					})
				}
			], function (err, result) {
				res.render('exam/exam', { "result": jsonUtils.encodeJSON(arr) ,"deadline":deadline,'duration':duration,'examTitle':examTitle,'CondUserName':CondUserName,'ProcessID':ProcessID,'examID':examID})
			})

		})
    },
    SaveAnswer:function(req,res,next){
        var QuestionBody=req.query.questioBody;
        var AnswerBody= req.query.answerBody;
        var studnetName=req.query.CondUserName;
        var correct=req.query.correct ;
        var examTitle=req.query.examTitle;
        
        studnetAnswer.insertAnswer(studnetName,QuestionBody,AnswerBody,correct,examTitle,null)
    },
    SaveScore:function(req,res,next){
        var score=req.query.score;
        var ProcessID=req.query.ProcessID ;
        var examID = req.query.examID;
        console.log(req.query)
        ExamStatue.UpdateScore(examID,ProcessID,score,null);

    }

}
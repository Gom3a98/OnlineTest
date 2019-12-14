var con = require("../../../config/connection")
var Student = require("../../Model/Student");
var Position = require("../../model/Position");
var Applicant = require("../../model/Applicants")
var formidable = require('formidable');
var examProcess = require('../../model/exam_process');
var question = require('../../model/Question');
var answer = require('../../model/Answer');
var exam = require('../../model/exam')
const fs = require('fs-extra');
//new
var Async = require('async');
var jsonUtils = require("../../../config/json_utils");


var Authentication = async (req, res) => {

	if (!req.session.userName)
		return false;
	else
		return true;
}

module.exports = {
	signupGet: (req, res, next) => {
		res.render('user/userSignUp', { title: 'Sign Up' });
	},
	signupPost: (req, res, next) => {
		req.body.password = Student.hashfun(req.body.password);
		req.body.name = (req.body.email).split("@")[0];
		Student.createStudent(req, function (err) {
			if (err) throw err;
			req.session.userName = req.body.name;
			res.redirect("/profile")
		});
	},
	loginPost: (req, res, next) => {

		var username = req.body.username;

		var x = Student.findStudentByUserName(username, (err, result) => {

			if (result.length == 1 && Student.compare(req.body.password, result[0].password)) {
				req.session.userName = username;
				req.session.studentId = result[0].id;
				res.redirect('/profile');
			}
			else
				res.redirect('/login')

		});
	},
	loginGet: (req, res, next) => {
		req.session.destroy();
		res.render('user/login', { title: 'Login' })
	},
	showProfile: async (req, res, next) => {

		if (await Authentication(req, res)) {
			Position.getAllPositions(function (err, results) {
				console.log("results");
				res.render("user/profile", {
					username: req.session.userName,
					positions: results

				});
			});
		}
		else
			res.redirect('/login')
		//Authentication(req,res).then(res.send('Welcome back, ' + req.session.userName + '!'));

	},

	uploadCV: function (req, res, next) {
		var form = new formidable.IncomingForm();
		form.parse(req, function (err, fields, files) {

			var oldpath = files.filetoupload.path;
			var newpath = 'F:/Level 4 Term 1/IA Project/OnlineTestV1/public/CVS/' + req.session.userName + ".pdf";
			var absPath = req.session.userName + ".pdf";
			//gomath path:F:\Level 4 Term 1\IA Project\OnlineTestV1\public\CVS

			fs.removeSync(newpath, null);
			fs.move(oldpath, newpath, function (err) {
				if (err) throw err;
				Student.addCV(absPath, req.session.userName, null);
				Applicant.saveApplication()
				res.write('File uploaded and moved!');
				res.end();
			});
		})
	},
	checkUserName: function (req, res, next) {
		var userName = req.query.userName;
		console.log(userName[0])
		Student.searchCandUserName(userName[0], (err, result) => {
			if (err) throw err;
			console.log(result)
			if (result.length == 0)
				res.send('1');
			else
				res.send('0');
		})
	},
	startExam: function (req, res, next) {
		var arr = req.url.split('/');
		var CondUserName = arr[2];
		var ProcessID = arr[3];
		var examID = arr[4];
		var deadline ;
		examProcess.getExams(CondUserName, ProcessID, (err, result) => {
			var arr = [];
			console.log(result)
			deadline=result[0].deadline;
			Async.waterfall([
				function A(callback) {
					question.getQuestionRandom(examID, (err, result) => {
						arr.push(result);
						callback(null, result)
					})
				},
				function B(QUE, callback) {
					var arr2=[]
					QUE.forEach((element, index) => {
						answer.selectCorrectAnswer(element.qid, (err, result) => {
							arr.push(result)
							if (index == QUE.length - 1) {callback(null, QUE);}
						})
					})
				}, function C(QUE, callback) {
					var arr3 = []
					//console.log('QUE------------')
					//console.log(QUE)
					QUE.forEach((element, index) => {
						answer.selectWrongAnswer(element.qid, (err, result) => {
							arr.push(result)
							//console.log(arr3)
							if (index == QUE.length - 1) {callback(null, arr);}
						})
					})
				}
			], function (err, result) {
				//console.log(arr)
				console.log(deadline)
				console.log("///////////////////")
				res.render('exam/exam', { "result": jsonUtils.encodeJSON(arr) ,"deadline":deadline})
				//res.send(result);
			})

		})
	},

};


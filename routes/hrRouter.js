var express = require('express');
var router = express.Router();
var HR = require("../app/controllers/HR/hrController");
var positionController = require("../app/controllers/HR/PositionController");
var ExamController = require("../app/controllers/HR/ExamController");
var QuestionController = require("../app/controllers/HR/QuestionController");
var SearchController = require("../app/controllers/HR/SearchController");
/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
router.get('/createPositionForm' , positionController.create);
router.post('/store' , positionController.store);

router.get('/hrDashboard' , HR.ViewDashBoard);

router.get('/hrDashboard/listExams',ExamController.listExams);
router.post('/hrDashboard/examDetails',ExamController.examDetails);
router.post('/hrDashboard/insertExam',ExamController.CreateExam);
router.post('/hrDashboard/deleteExam',ExamController.deleteExam);
router.post('/hrDashboard/updateExam',ExamController.updateExam);

router.post('/hrDashboard/insertQuestion',QuestionController.CreateQuestion);
router.post('/hrDashboard/deleteQuestion',QuestionController.deleteQuestion);
router.post('/hrDashboard/updateQuestion',QuestionController.updateQuestion);

router.post('/hrDashboard/insertAnswer',QuestionController.createAnswer);
router.post('/hrDashboard/deleteAnswer',QuestionController.deleteAnswer);
router.post('/hrDashboard/updateAnswer',QuestionController.updateAnswer);

router.get('/hrDashboard' , HR.ViewDashBoard);
router.get('/ListApplicants' , HR.ListApplicants);
router.get('/SendMail/:id' , HR.SendMail);

router.get('/searchStudentEmail',SearchController.searchCanEmail);
router.get('/searchStudentName',SearchController.searchCandUserName);
router.get('/searchExamTitle',SearchController.searchExamTitle);
router.get('/searchExamDuration',SearchController.serachExamDuration);
router.get('/searchExamQuestion',SearchController.searchExamQuestion);


module.exports = router;

var express = require('express');
var router = express.Router();
var HR = require("../app/controllers/HR/hrController")

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
router.get('/createPositionForm' , HR.create);
router.post('/store' , HR.store);

router.get('/hrDashboard' , HR.ViewDashBoard)

router.get('/hrDashboard/listExams',HR.listExams)
router.post('/hrDashboard/examDetails',HR.examDetails)
router.post('/hrDashboard/insertExam',HR.CreateExam)
router.post('/hrDashboard/deleteExam',HR.deleteExam)
router.post('/hrDashboard/updateExam',HR.updateExam)

router.post('/hrDashboard/insertQuestion',HR.CreateQuestion)
router.post('/hrDashboard/deleteQuestion',HR.deleteQuestion)
router.post('/hrDashboard/updateQuestion',HR.updateQuestion)

router.post('/hrDashboard/insertAnswer',HR.createAnswer)
router.post('/hrDashboard/deleteAnswer',HR.deleteAnswer)
router.post('/hrDashboard/updateAnswer',HR.updateAnswer)

router.get('/hrDashboard' , HR.ViewDashBoard);
router.get('/ListApplicants' , HR.ListApplicants);
router.get('/SendMail/:id' , HR.SendMail);


router.get('/searchStudentEmail',HR.searchCanEmail)
router.get('/searchStudentName',HR.searchCandUserName)
router.get('/searchExamTitle',HR.searchExamTitle)
router.get('/searchExamDuration',HR.serachExamDuration)
router.get('/searchExamQuestion',HR.searchExamQuestion)


router.get('/Test',(req,res,next)=>{
  res.render('exam/examList')
})


module.exports = router;

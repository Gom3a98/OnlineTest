var express = require('express');
var router = express.Router();
var examProcess=require('../app/controllers/user/examProcessController')
var user = require("../app/controllers/user/UserController")
var ExamProcessController = require("../app/controllers/GeneralControllers/ExamProcessController");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.get('/login', user.loginGet);
router.post('/login', user.loginPost);



router.get('/signup',user.signupGet);
router.post('/signup',user.signupPost);

router.get('/profile',user.showProfile);

router.post("/fileupload" , user.uploadCV);

router.get('/checkUserName',user.checkUserName);

router.get("/ListExams/:user_name/:process_id" , ExamProcessController.ListExams);

router.get('/checkUserName',user.checkUserName)
router.get('/startExam/:canName/:processID/:examid',examProcess.startExam)
router.get('/SaveAnswer',examProcess.SaveAnswer)
router.get('/SaveScore',examProcess.SaveScore);
router.get('/checkForAvailability/:pid/:pref',examProcess.checkForAvailability)
router.get('/test',(req,res,next)=>{
  console.log("hiii")
  res.redirect('/profile')
  //res.render('user')
})

module.exports = router;

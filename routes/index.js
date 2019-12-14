var express = require('express');
var router = express.Router();

var user = require("../app/controllers/user/UserController")
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.get('/login', user.loginGet);
router.post('/login', user.loginPost);



router.get('/signup',user.signupGet);
router.post('/signup',user.signupPost);

router.get('/profile',user.showProfile)

router.post("/fileupload" , user.uploadCV)

router.get('/checkUserName',user.checkUserName)
router.get('/startExam/:canName/:processID/:examid',user.startExam)
module.exports = router;

var express = require('express');
var router = express.Router();

var HR = require("../controllers/HR/hrController")
var user = require("../controllers/user/UserController")
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.get('/login', user.loginGet);
router.post('/login', user.loginPost);



router.get('/signup',user.signupGet);
router.post('/signup',user.signupPost);

router.get('/profile',user.showProfile)

router.get('/createPositionForm' , HR.create);
router.post('/store' , HR.store);

router.get('/hrDashboard' , HR.ViewDashBoard)
module.exports = router;

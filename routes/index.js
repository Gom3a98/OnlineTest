var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var user = require("../controllers/user/UserController")
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.get('/login', function(req, res, next) {
  res.render('login', { title: 'Login' });
});
router.post('/auth', user.login);
router.get('/home', function(request, response) {
	if (request.flash("loggedin") ) {
		response.send('Welcome back, ' + request.flash("username") + '!');
	} else {
		response.send('Please login to view this page!');
	}
	response.end();
});
module.exports = router;

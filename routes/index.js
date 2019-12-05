var express = require('express');
var router = express.Router();
var mysql = require('mysql');

var controller = require('../controller/userController')
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'hello' });
  

});
router.get('/signup',controller.signupGet);
router.post('/signup',controller.signupPost);
module.exports = router;

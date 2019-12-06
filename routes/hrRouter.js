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
module.exports = router;

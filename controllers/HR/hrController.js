var con = require("../../config/connection")
var create = function(request , response){
    response.render("hr/createFormForNewPosition")
}
var store = function(request , response){
    var title = request.body.title;
    var availability= request.body.availability;
    var description = request.body.description;
    var sql = "INSERT INTO online_test.position (title , description , availability) VALUES ('"+title+"','"+description+"','"+availability+"')" ;
    con.query(sql, function (err, result) {
      if (err) throw err;
      response.redirect("/hrDashboard");
    })
}
var ViewDashBoard = (request,response)=>{
    response.render('hr/MainDashboard');
}
module.exports = {
    create : create,
    store : store,
    ViewDashBoard : ViewDashBoard
}
var con = require("../../../config/connection");
var Position = require("../../model/Position");

var create = function(request , response){
    response.render("hr/createFormForNewPosition")
}
var store = function(request , response){
    var title = request.body.title;
    var availability= request.body.availability;
    var description = request.body.description;
    Position.savePosition(title,description,availability,(err, result)=> {
        if (err) throw err;
        response.redirect("/HR/hrDashboard");
    });

};
var ViewDashBoard = (request,response)=>{
    response.render('hr/MainDashboard');
}
module.exports = {
    create : create,
    store : store,
    ViewDashBoard : ViewDashBoard
}
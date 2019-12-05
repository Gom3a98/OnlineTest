var con = require('../../config/connection'); 

var create = function(request , response){
    response.render("createFormForNewPosition")
}
var store = (request , response)=>{
    var title = request.body.title;
    var availability= request.body.availability;
    var description = request.body.description;
    var sql = "INSERT INTO position VALUES ('"+title+"','"+description+"','"+availability+"')" ;
    con.query(sql, function (err, result) {
      if (err) throw err
      console.log("1 record inserted")
    })
}

module.exports = {
    create : create,
    store : store
}
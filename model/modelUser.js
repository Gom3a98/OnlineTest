var con = require('../config/connection'); 


var signup = (user)=>{
    var sql = "INSERT INTO student (user_name, email,password,phone_number) VALUES ('"+user.name+"','"+user.email+"','"+user.password+"','"+user.phone+"')" ;
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("1 record inserted");
    });
}

module.exports={
    signup:signup
}
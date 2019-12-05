var con = require("../../config/connection")
var login =function(request, response, next) {
    var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		con.query('SELECT * FROM student WHERE user_name = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
                request.flash("username" , username)

				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('/home');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
        });
       
	} else {
		response.send('Please enter Username and Password!');
		response.end();
    }
    
}

var signupGet = (req,res,next)=>{
    res.render('user/userSignUp');
};

var signupPost = (req,res,next)=>{
	var sql = "INSERT INTO student (user_name, email,password,phone_number) VALUES ('"+req.body.name+"','"+req.body.email+"','"+req.body.password+"','"+req.body.phone+"')" ;
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("1 record inserted");
    });
    res.redirect('/');
}
module.exports={
    signupGet:signupGet,
    signupPost:signupPost,
    login : login

}


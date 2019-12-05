var con = require("../../config/connection")
var loginGet = (req,res,next)=>{
    res.render('user/login', { title: 'Login' })
};

var loginPost =function(request, response, next) {
    var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		con.query('SELECT * FROM student WHERE user_name = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				console.log(username)
                request.flash("username" , username);
				response.redirect('/profile');
			} else {
				response.redirect('/login');
			}
			response.end();
        });
       
	} 
    
}
var showProfile =(req,res,next)=>{
	var username = req.flash("username")
	if (req.flash("username") ) {
		res.send('Welcome back, ' + username + '!');
	} else {
		res.redirect('/login');
		
	}
	res.end();
}
var signupGet = (req,res,next)=>{
    res.render('user/userSignUp',{ title: 'Sign Up' });
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
	loginPost : loginPost,
	loginGet:loginGet,
	showProfile:showProfile

}


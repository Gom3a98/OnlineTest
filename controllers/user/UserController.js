var myConnection = require("../../config/connection")
var login =function(request, response, next) {
    var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		myConnection.con.query('SELECT * FROM student WHERE user_name = ? AND password = ?', [username, password], function(error, results, fields) {
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


module.exports  ={
    login : login
}
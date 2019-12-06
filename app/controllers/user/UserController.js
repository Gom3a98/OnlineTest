var con = require("../../../config/connection")
var Student = require("../../Model/Student")
var Authentication= (req,res)=>{
	if (req.flash("username"))
	{
		res.redirect('/login');
	}
};
module.exports={
	signupGet: (req,res,next)=>{
		res.render('user/userSignUp',{ title: 'Sign Up' });
	},
	signupPost: (req,res,next)=>{
		Student.createStudent(req,function (err) {
			if (err) throw err;
			res.redirect('/');
		});
	},
	loginPost :(request, response, next)=> {
		var username = request.body.username;
		var password = request.body.password;
		var x =   Student.findStudentByUserNameAndPassword(username,password,()=>{
			request.flash("username" , username);
			request.flash("user_id" , );
			response.redirect('/profile');
		});
	},
	loginGet:(req,res,next)=>{
		res.render('user/login', { title: 'Login' })
	},
	showProfile:(req,res,next)=>{
		if (Authentication(req,res) ) {
			res.send('Welcome back, ' + username + '!');
		} else {
			res.redirect('/login');

		}
		res.end();
	}

};


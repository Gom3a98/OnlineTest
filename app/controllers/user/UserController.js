var con = require("../../../config/connection")
var Student = require("../../Model/Student")
var Authentication= async(req,res)=>{
	
	if (!req.session.userName)
		return false;
	else
		return true;
}
module.exports={
	signupGet: (req,res,next)=>{
		res.render('user/userSignUp',{ title: 'Sign Up' });
	},
	signupPost: (req,res,next)=>{
		req.body.password=Student.hashfun(req.body.password);
		Student.createStudent(req,function (err) {
			if (err) throw err;
			res.redirect('/');
		});
	},
	loginPost :(req, res, next)=> {
		
		var username = req.body.username;
		
		var x =   Student.findStudentByUserName(username,(err,result)=>{
			
			if(result.length==1&&Student.compare(req.body.password,result[0].password))	
				{
					req.session.userName = username;
					res.redirect('/profile');
				}
				else
					res.redirect('/login')
		});
	},
	loginGet:(req,res,next)=>{
		req.session.destroy();
		res.render('user/login', { title: 'Login' })
	},
	showProfile:async(req,res,next)=>{
		console.log(req.session);
		if(await Authentication(req,res))
			res.send('Welcome back, ' + req.session.userName + '!');
		else
			res.redirect('/login')
		//Authentication(req,res).then(res.send('Welcome back, ' + req.session.userName + '!'));
		
		} 
};


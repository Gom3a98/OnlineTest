var Student = require("../../Model/Student");
var Position = require("../../model/Position");
var Applicant = require("../../model/Applicants")
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
			req.session.userName = req.body.name;
			res.redirect("/profile")
		});
	},

	loginPost :(req, res, next)=> {
		
		var username = req.body.username;
		
		var x =   Student.findStudentByUserName(username,(err,result)=>{
			
			if(result.length==1&&Student.compare(req.body.password,result[0].password))	
				{
					req.session.userName = username;
					req.session.studentId = result[0].id;
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

        if(await Authentication(req,res)) {
            Position.getAllPositions(function (err , results) {
                console.log("results");
                res.render("user/profile", {
                    username: req.session.userName,
                    positions : results

                });
            });
        }
        else
            res.redirect('/login')
        //Authentication(req,res).then(res.send('Welcome back, ' + req.session.userName + '!'));

        },
	uploadCV : function(req, res){
		var studentId = req.session.studentId;
		var positionId = req.body.posId;
		Applicant.saveApplication(studentId , positionId , ()=>{
			res.redirect("/profile");
		});
	}
};


var con = require("../../../config/connection")
var Student = require("../../Model/Student")
var Position = require("../../model/Position")
var formidable = require('formidable');
//var fs = require('fs');
const fs = require('fs-extra');



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
	uploadCV : function(req, res,next){
		var form = new formidable.IncomingForm();
		form.parse(req, function (err, fields, files) {

		var oldpath = files.filetoupload.path;
      var newpath = 'D:/fci/4th year/Level 4 Term 1/IS345 - Internet Applications/project2/OnlineTest/public/CVS/' +req.session.userName+".pdf";
	  fs.removeSync(newpath,null); 
	  fs.move(oldpath, newpath, function (err) {
		if (err) throw err;
		Student.addCV(newpath,req.session.userName,null);
        res.write('File uploaded and moved!');
        res.end();
      });
	})
}


};


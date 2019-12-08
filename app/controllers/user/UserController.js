var con = require("../../../config/connection")
var Student = require("../../Model/Student")
var Position = require("../../model/Position")
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
	uploadCV : function(req, res){
		message = '';
		console.log(req);
		/*
		if(req.method == "POST"){
			var post  = req.body;
			var name= post.user_name;
			var pass= post.password;
			var fname= post.first_name;
			var lname= post.last_name;
			var mob= post.mob_no;

			if (!req.files)
				return res.status(400).send('No files were uploaded.');

			var file = req.files.uploaded_image;
			var img_name=file.name;

			if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){

				file.mv('public/images/upload_images/'+file.name, function(err) {

					if (err)

						return res.status(500).send(err);
					var sql = "INSERT INTO `users_image`(`first_name`,`last_name`,`mob_no`,`user_name`, `password` ,`image`) VALUES ('" + fname + "','" + lname + "','" + mob + "','" + name + "','" + pass + "','" + img_name + "')";

					var query = db.query(sql, function(err, result) {
						res.redirect('profile/'+result.insertId);
					});
				});
			} else {
				message = "This format is not allowed , please upload file with '.png','.gif','.jpg'";
				res.render('index.ejs',{message: message});
			}
		} else {
			res.render('index');
		}
*/
	}
};


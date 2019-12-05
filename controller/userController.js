var UserModel = require('../model/modelUser')

var signupGet = (req,res,next)=>{
    res.render('userSignUp');
};

var signupPost = (req,res,next)=>{
    UserModel.signup(req.body);
    res.redirect('/');
}
module.exports={
    signupGet:signupGet,
    signupPost:signupPost
}
var Applicant = require("../../model/Applicants");
var ViewDashBoard = (request,response)=>{
    response.render('hr/MainDashboard');

};
var ListApplicants = (req , res)=>{
    Applicant.getAllPositions((err , results )=>{
        //res.send(results);
        res.render("hr/Applications" , {results : results})
    })
};
var SendMail = (req ,res )=> {
    var nodemailer = require('nodemailer');
    var Student = require("../../model/Student");
    var email = "";
    Student.getStudentById(req.param("id"),(err ,results)=>{
        var transporter = nodemailer.createTransport({
            service: 'yahoo',
            auth: {
                user: 'hhr49@yahoo.com',
                pass: 'zohtozvwxwbmltuz'
            }

        });
        var mailOptions = {
            from: 'hhr49@yahoo.com',
            to: results[0].email,
            subject: 'Approval of the Application you Applied',
            text: 'Congratolation MR.'+results[0].user_name+'! you are have been selected to do the exam to reqruit to our job'
        };

        transporter.sendMail(mailOptions, function(error, info){
            if (error) {
                console.log(error);
                res.send({message:"Error Ocurred : "+error})
            } else {
                console.log('Email sent: ' + info.response);
                res.send(json({message : "Sent"}));

            }
        });

    });

};



module.exports = {
    ViewDashBoard : ViewDashBoard,
    ListApplicants:ListApplicants,
    SendMail:SendMail
};


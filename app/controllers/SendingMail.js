var nodemailer = require('nodemailer');
var SendMail = (To , Subject , Body)=>{

    var transporter = nodemailer.createTransport({
        service: 'yahoo',
        auth: {
            user: 'hhr49@yahoo.com',
            pass: 'zohtozvwxwbmltuz'
        }

    });
    var mailOptions = {
        from: 'hhr49@yahoo.com',
        to: To,
        subject: Subject ,
        text: Body
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

};

module.exports = {
    SendMail : SendMail
}
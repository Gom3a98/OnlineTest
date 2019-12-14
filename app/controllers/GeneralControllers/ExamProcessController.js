var Exam_Process = require("../../model/Exam_Process");
var Exam_Status = require("../../model/Exam_Status");
Async  = require("async");
var Sender = require("../SendingMail");
module.exports ={
    approval : function (req , res) {
        var exam_listIds = req.body.exam_listIds.split("|");
        var UserNameAndPositionId = req.body.Ids.split("|");
        var user_name = UserNameAndPositionId[0];
        var position_id = UserNameAndPositionId[1];
        var deadline = req.body.deadline;

        Exam_Process.save(user_name , deadline ,position_id , ()=>{
            Exam_Process.LastInsertedId(( err , result)=>{
                    Exam_Status.save(exam_listIds ,result[0]["last_insert_id()"],  ()=>{

                    });
            })
        });

        let To = "";
        let Subject = "Congratulation !! you are Accepted For " + position_id + " Position";
        let Body = "Hello Mr."+user_name+"\nYou are Selected To Position "+position_id + "And here is he exams that you should\n" +
            " Take Respectly To To Full Acceptence ";
        Sender.SendMail(To , Subject , Body);

    }
}
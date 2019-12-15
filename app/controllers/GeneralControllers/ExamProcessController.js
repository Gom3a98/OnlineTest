var Exam_Process = require("../../model/Exam_Process");
var Exam_Status = require("../../model/Exam_Status");
var Student =  require("../../model/Student");
Async  = require("async");
var Sender = require("../SendingMail");
module.exports ={
    ListExams:(req, res)=>{
        var user_name = req.param("user_name");
        var process_id = req.param("process_id");
        Exam_Process.findById(process_id , (err , result)=>{
            res.render("exam/examList" , {Process :result})
        });

    },
    approval : function (req , res) {
        var exam_listIds = req.body.exam_listIds.split("|");
        var UserNameAndPositionId = req.body.Ids.split("|");
        var user_name = UserNameAndPositionId[0];
        var position_id = UserNameAndPositionId[1];
        var deadline = req.body.deadline;

        var processId ;
        Exam_Process.save(user_name , deadline ,position_id , ()=>{
            Exam_Process.LastInsertedId(( err , result)=>{
                    Exam_Status.save(exam_listIds ,result[0]["last_insert_id()"],  ()=>{

                    });
            })
        });
        Exam_Process.LastInsertedId(( err , results)=>{
            var x = results [0]["last_insert_id()"];
            console.log(x);
            Student.findStudentByUserName(user_name , (err  , result)=>{
                var  To = result[0].email;
                let Subject = "Congratulation !! you are Accepted";
                let Body = "Hello Mr."+user_name+"\nhere is your exams that you should\n" +
                    " Take Respectly To To Full Acceptance\n ";
                Body+="http://localhost:3000/ListExams/"+user_name+"/"+x;
                Sender.SendMail(To , Subject , Body, res);
            });

        })



    }
}
var ExamProcess = require("../../model/Exam_Process")
module.exports = {
    ListExams:(req, res)=>{
        var user_name = req.param("user_name");
        var process_id = req.param("process_id");
        ExamProcess.findById(process_id , (err , result)=>{
            res.render("exam/examList" , {Process :result})
        });

    }
};
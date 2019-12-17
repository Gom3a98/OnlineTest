var exams = require("../../model/exam");

var listExams=(req,res,next)=>{
    exams.GetAllExams((err,result)=>{
        res.render("hr/ExamManager" ,{results:result})
       // res.send(result);
    })
}
var examDetails= (req,res,next)=>{
    exams.ExamWithQ_A(req.body.id,(err,result)=>{
        res.send(result)
    })
}
var CreateExam=(req,res,next)=>{
    exams.insertExam(req.body.ExamTitle,req.body.ExamDuration,(err,result)=>{
        if(err)
            res.send('0')
        else
            res.send('1')
    })

};
var deleteExam=(req,res,next)=>{
    id=req.body.ID;
    console.log(console.log(req.body.id))
    exams.DeleteExam(id,(err,result)=>{

        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')

    })
}
var updateExam = (req,res,next)=>{
    var id=req.body.ID;
    var Examtitle=req.body.Examtitle;
    var ExamDuration=req.body.ExamDuration;

    exams.UpdateExam(id,Examtitle,ExamDuration,(err,result)=>{
        if(err||result.affectedRows==0)
            res.send('0')
        else
            res.send('1')

    })
}

module.exports ={
    listExams:listExams,
    examDetails:examDetails,
    CreateExam:CreateExam,
    deleteExam:deleteExam,
    updateExam:updateExam
}
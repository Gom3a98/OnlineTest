var Applicant = require("../../model/Applicants");
var ExamProcess = require("../../model/exam_process");
var ExamStatus = require("../../model/Exam_Status");
var ViewDashBoard = (request,response)=>{
    response.render('hr/MainDashboard');

};
var ListApplicants = (req , res)=>{
    Applicant.getAllPositions((err , results )=>{
        //res.send(results);
        res.render("hr/Applications" , {results : results})
    })
};
var candidateProgress = (req, res)=>{
    ExamProcess.getAllProcesses((err , results)=>{
       res.render("hr/CandidateProgress", {results:results})
    })
};
var getStatusOfCandidate = (req , res)=>{
    ExamStatus.getExamStatusByProcessId(req.param("processId") , (err , results)=>{
        res.send(results)
    })
};




module.exports = {
    ViewDashBoard : ViewDashBoard,
    ListApplicants:ListApplicants,
    candidateProgress:candidateProgress,
    getStatusOfCandidate:getStatusOfCandidate
};


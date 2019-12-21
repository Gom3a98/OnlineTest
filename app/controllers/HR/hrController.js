var Applicant = require("../../model/Applicants");
var ExamProcess = require("../../model/exam_process");
var ExamStatus = require("../../model/Exam_Status");
var Notification  = require("../../model/Notification");
var Authentication = async (req, res) => {

    if (!req.session.userName && !req.session.type)
        return false;
    else
        return true;
}
var ViewDashBoard = async (req,res)=>{
    if (await Authentication(req, res)) {
        Notification.getByUserName(req.session.userName , function (err, results) {
            res.render('hr/MainDashboard', {
                username: req.session.userName,
                Notifications : results
            });
        });
    }
    else
        res.redirect('/login')
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


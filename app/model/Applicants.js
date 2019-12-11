con = require("../../config/connection");

module.exports ={
    saveApplication : function (studentId , positionId , callback) {
        var sql = "INSERT INTO online_test.applicants " +
            "(studentId ,  positionId ) VALUES " +
            "('"+studentId+"','"+positionId+"')" ;
        con.query(sql ,callback)

    },
    getAllPositions : (callback)=>{
        let sql = "select * from online_test.student st inner join online_test.applicants app on st.id = app.studentId inner join online_test.position pos on app.positionId = pos.id";
        con.query(sql , callback)
    }
};
con = require("../../config/connection");

module.exports ={
    savePosition : function (title , description , availability , callback) {
        var sql = "INSERT INTO online_test.position " +
            "(title , description , availability) VALUES " +
            "('"+title+"','"+description+"','"+availability+"')" ;
        con.query(sql ,callback)

    },
    getAllPositions : (callback)=>{
        let sql = "SELECT * FROM online_test.position where pid not in (SELECT positionId from online_test.applicants)";
        con.query(sql , callback)
    }
};


con = require("../../config/connection");

module.exports ={
    savePosition : function (title , description , availability , callback) {
        var sql = "INSERT INTO online_test.position " +
            "(title , description , availability) VALUES " +
            "('"+title+"','"+description+"','"+availability+"')" ;
        con.query(sql ,callback)

    }
};


var con = require('../../config/connection');


module.exports ={
    save : (exam_listIds , processId , callback)=>{
        var sql  = "insert into online_test.exam_status (examId , process_id ,preference ) values";
        for (var x = 0; x < exam_listIds.length;x++)
        {
            if (x!=exam_listIds.length-1)
                sql+= "("+exam_listIds[x]+","+ processId+","+(x+1)+"),";
            else
                sql+= "("+exam_listIds[x]+","+ processId+","+(x+1)+")";
        }
        con.query(sql ,callback)
    }
};


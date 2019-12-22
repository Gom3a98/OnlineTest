var con = require('../../config/connection');

module.exports={
    selectAllNotfications:function(userName,callback){
        var query ="select * from notifications where userName ='"+userName+"'";
        con.query(query,callback);
    },
    selectNotifcationDetails:function(userName,id,callback){
        var query ="select * from notifications where notfiID = '"+id+"' and userName = '"+userName+"'";
        con.query(query,callback);
    }
}
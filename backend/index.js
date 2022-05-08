const express= require("express");
const app = express();
const port = 3000;

app.use(express.json())

let  status = "0";

app.get("/",function(req,res){
    console.log("Request received");
    res.send("The value to LED status is : " + status);
}   
 );

 app.get("/LED",function(req,res)
 { 
     console.log("Request received");
     if(status=="0")
     {
        res.send("0");
     }
     else
     {
        res.send("1"); 
     }
 });

app.post("/LED",function(req,res)
{
    status=req.body.status;
    console.log(req.body);
    console.log(status);
    res.send("The request is successfull");
}
);
app.listen(process.env.PORT || port,()=> console.log("Server started"));
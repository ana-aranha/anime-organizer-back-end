import express from "express";
//import cors from "cors";
var app = express();
//app.use(cors());
app.use(express.json());
app.get("/status", function (req, res) {
    res.send("Ok");
});
app.listen(4000, function () {
    console.log("Server listening on port 4000.");
});

import express from "express";
import { Request, Response } from "express";
//import cors from "cors";
import connection from "./db/database.js";
import myAnimesRouters from "./routers/myAnimesRouter.js"

const app = express();
//app.use(cors());
app.use(express.json());

app.get("/status", (req: Request, res: Response): void => {
	res.send("Ok");
});

app.use(myAnimesRouters)

app.listen(4000, () => {
	console.log(`Server listening on port 4000.`);
});

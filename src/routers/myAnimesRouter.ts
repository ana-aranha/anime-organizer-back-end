import express from "express";
const router = express.Router()
import {getMyAnimes,postNewAnime,editAnime,deleteAnime} from "../controllers/myAnimesController.js"

router.get("/myanimes", getMyAnimes)
router.post("/myanimes", postNewAnime)
router.put("/myanimes/edit/:animeId", editAnime)
router.delete("/myanimes/delete/:animeId", deleteAnime)

export default router
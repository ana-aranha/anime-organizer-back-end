import { Request, Response } from "express";
import connection from "../db/database.js";
import {Anime} from "../protocols/Anime.js"
import {QueryResult} from "pg"

async function getMyAnimes(req: Request, res: Response): Promise<Response<Anime, Record<string, Anime>>> {
	const statusId = req.query.statusId as string
	
	if(statusId){
		const animesFiltered: QueryResult<Anime> = await connection.query(`SELECT animes.id, animes."animeId", status.name AS status FROM users JOIN animes ON users.id = animes."userId" JOIN status ON status.id = animes."statusId" WHERE users.id = 1 AND status.id = $1 AND animes."deletedAt" IS NULL;`,[statusId])
		return res.send(animesFiltered.rows);
	}

	const animes: QueryResult<Anime> = await connection.query(`SELECT animes.id, animes."animeId", status.name AS status FROM users JOIN animes ON users.id = animes."userId" JOIN status ON status.id = animes."statusId" WHERE users.id = 1 AND animes."deletedAt" IS NULL;`)
	res.send(animes.rows);
}

function postNewAnime(req: Request, res: Response): void{
	const anime = req.body as Anime

	connection.query(`INSERT INTO animes ("userId","animeId", "statusId") VALUES ($1, $2,$3);`,[anime.userId,anime.animeId,anime.statusId])
	res.sendStatus(202);
}

function editAnime(req: Request, res: Response): void {
	const animeId = req.params.animeId
	const statusId = req.query.statusId as string

	connection.query(`UPDATE animes SET "statusId"=$1 WHERE id = $2 AND "userId"=1;`,[statusId,animeId])
	res.sendStatus(200);
}

function deleteAnime(req: Request, res: Response): void{
	const animeId = req.params.animeId

	connection.query(`UPDATE animes SET "deletedAt"=NOW() WHERE id = $1 AND "userId"=1;`,[animeId])
	res.sendStatus(200);
}

export{getMyAnimes,postNewAnime,editAnime,deleteAnime}


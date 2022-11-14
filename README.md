
# Anime Organizer

Project plans to create an application that organizes your list of anime into categories (watching, completed, plan to watch and dropped),using the Anilist database as a base (https://github.com/AniList/ApiV2-GraphQL-Docs).


# How to run for development

1 - Clone this repository;

2 - Install all dependencies;

3- Create a PostgreSQL database with the given dump.sql;

4- run "npm run dev" to start application


# routes (CRUD)

1 - Create : POST a body with "userId","animeId", "statusId" in the route http://localhost:4000/myanimes . 

2- Read: GET an array of animes in http://localhost:4000/myanimes . For an array filtered by status GET by passing an number between 1 and 4 by query param: http://localhost:4000/myanimes?statusId=NUMBER

3- Update: send an UPDATE request to http://localhost:4000/myanimes/edit/NUMBER?statusId=NUMBER specifying the id of the anime to be edited by params and the new id of the status via query.

4- Delete: send an delete request to http://localhost:4000/myanimes/delete/NUMBER specifying the id of the anime to be deleted by params

# Important informations

1 - Soon the users CRUD will be implemented. For now the routes in the list refer to a test user, "KonoDioDa", which you will see the information in the users table. Once implemented, routes will be verified via bearer authorization; 

2 - There is still no front connection and validation of the "animeId" due to an unfixed bug of cors in the application. In order to confirm a valid id for future application you can test with the application front test of the graphQL API given in https://github.com/ana-aranha/Anilist-graphQL-test.



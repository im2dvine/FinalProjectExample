import {Query} from "./index";

const all = async () => Query(`
    select chirps.id, chirps.content, chirps.location, users.name
    from chirps
    join users on chirps.userid = users.id;
`);

const one = async (id: string) =>  Query(`
    select chirps.content, chirps.location, users.name
    from chirps
    join users on chirps.userid = users.id
    where chirps.id = ?;
`, [id]);

const post = async (userid: string, content: string) => Query(`
    insert into chirps (userid, content) values (?, ?)
`, [userid, content]);

const put = async (id: string, newContent: string) => Query(`
    UPDATE chirps
    SET content = ?
    WHERE chirps.id = ?;
`, [newContent, id]);

const destroy = async (id: string) => Query(`
    DELETE FROM chirps WHERE chirps.id = ?;
`, [id]);

export default {
    all,
    one,
    post,
    put,
    destroy
}
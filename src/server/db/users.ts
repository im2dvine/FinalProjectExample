import {Query} from "./index";

const post = async (name: string, comment: string) => Query(`
    insert into users (name, email) values (?, ?)
`, [name, comment]);

export default {
    post
}
import { Query } from './index';

const all = () => Query("SELECT * FROM recycleCenters")
const one = (id: string) => Query(`SELECT * FROM recycleCenters WHERE recycleCenters.id = ?`, [id])

// export const all = async () => {
//     return new Promise((resolve, reject) => {

//         Connection.query('SELECT * from recycleCenters', (err, results) => {
//             if (err) {
//                 return reject(err);
//             }
//             resolve(results);
//         });
//     });

// }

export default {
    all,
    one
}
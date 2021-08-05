import * as mysql from 'mysql';
import config from '../config';

import RecycleCenters from './recycleCenters';


// export const Connection = mysql.createConnection(config.mysql);

// Connection.connect(err => {
//     if(err) console.log(err);
// });

const pool = mysql.createPool(config.mysql)

export const Query = <T = any>(query: string, values?: any) => {
    const sql = mysql.format(query, values);

    return new Promise<T>((resolve, reject) => {
        pool.query(sql, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results)
            }
        })
    })
}

export default {
    RecycleCenters
}
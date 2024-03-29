import * as mysql from "mysql";
import Chirps from "./queries/chirps";
import Users from './queries/users';
import RecycleCenters from './queries/recyclecenters'

const Connection = mysql.createConnection({
    host: 'localhost',
    user: 'captainPlanet',
    password: 'onebottleatatime',
    database: 'recycle',
    port: 3306
});

export const Query = (query: string, values?: Array<string | number>) => {
    return new Promise<Array<any>>((resolve, reject) => {
        Connection.query(query, values, (err, results) => {
            if (err) return reject(err);
            resolve(results);
        });
    });
};

export default {
    Chirps,
    Users,
    RecycleCenters
}
        

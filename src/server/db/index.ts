import * as mysql from "mysql";
import config from "../config";

const pool = mysql.createPool(config.mysql);

export const Query = <T = any>(query: string, value?: {} | any) => {
  return new Promise<T>((resolve, reject) => {

    const sql = mysql.format(query, value);
    // console.log(sql); if it needs to be Debugged

    pool.query(sql, value, (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve(result);
      }
    });
  });
};

import recycleCenters from './queries/recyclecenters';
export default {
    recycleCenters
}
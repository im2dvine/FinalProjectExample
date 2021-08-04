import { Query } from "../";

const all = () =>
  Query(
    `SELECT recycleCenters.id, recycleCenters.name, recycleCenters.addr, recycleCenters.hours, county.name as county FROM recycleCenters JOIN county ON county.id = recycleCenters.countyid`
  );
const one = (id: string) =>
  Query(
    `SELECT recycleCenters.id, recycleCenters.name, recycleCenters.addr, recycleCenters.hours, county.name as county FROM recycleCenters JOIN county ON county.id = recycleCenters.countyid WHERE recycleCenters.id = ?`,
    [id]
  );
const getMaterials = (id: string) => Query(`CALL spcenterMaterials(?)`, [id]);

export default {
  all,
  one,
  getMaterials,
};

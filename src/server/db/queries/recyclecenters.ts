import { Query } from "../";

const all = () => Query("Select * from recycleCenters");
const one = (id: string) =>
  Query(`SELECT * FROM recycleCenters WHERE recycleCenters.id = ?`, [id]);
const getMaterials = (id: string) => Query(`CALL spcenterMaterials(?)`, [id]);

export default {
  all,
  one,
  getMaterials,
};

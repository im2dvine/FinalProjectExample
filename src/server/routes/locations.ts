import { Router } from "express";
import db from "../db";

const router = Router();

// Get request to /api/locations have to start at 3 
router.get("/:id?", async (req, res) => {
  const id = req.params.id;
  if (id) {
    try {
      const recycleCenter = await db.RecycleCenters.one(id);
      const materials = await db.RecycleCenters.getMaterials(id);
      const centerAndMaterials = {
        center: recycleCenter[0],
        materials: materials[0],
      };

      res.json(centerAndMaterials);
    } catch (err) {
      console.log(err);
      res.status(500).json({ msg: "hey", err });
    }
  } else {
    try {
      const recycleCenters = await db.RecycleCenters.all();
      // const materials = (id) => db.recycleCenters.getMaterials(id);

    //   let centersArr: Array<any> = [];
    //   await recycleCenters.map((center) => {
    //     const materials = db.recycleCenters.getMaterials(center.id);
    //     centersArr.push({ ...center, materials: [materials] });
    //   });
      res.json(recycleCenters);
    } catch (err) {
      console.log(err);
      res.status(500).json({ msg: "hey", err });
    }
  }
});

export default router;

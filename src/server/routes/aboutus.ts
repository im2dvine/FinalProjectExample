import { Router } from 'express' ;

const router = Router();

router.get('/aboutus', (req, res) => {
    res.json({ msg: 'TEST LOCAL'})
})
export default router;

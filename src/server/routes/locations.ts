import { Router } from 'express';

const router = Router();

// Get request to /api/locations
router.get('/locations', (req, res) => {
    res.json({ msg: 'TEST LOCAL'})
})

export default router;
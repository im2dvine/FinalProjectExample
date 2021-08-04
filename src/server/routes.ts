import * as express from 'express';

const router = express.Router();

router.get('/api/hello', (req, res, next) => {
    res.json('Test Page for First Typescript & Express');
});

export default router;
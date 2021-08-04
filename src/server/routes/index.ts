import { Router} from 'express' ;
import locationsRouter from './locations';
import commentsRouter from './comments';
import aboutusRouter from './aboutus'
const router = Router();

router.use('/locations', locationsRouter)
router.use('/comments', commentsRouter)
router.use('/', aboutusRouter)
export default router;
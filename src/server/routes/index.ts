import { Router} from 'express' ;
import locationsRouter from './locations';
import commentsRouter from './comments';
import aboutusRouter from './aboutus'
const router = Router();

router.use('/', locationsRouter)
router.use('/', commentsRouter)
router.use('/', aboutusRouter)
export default router;
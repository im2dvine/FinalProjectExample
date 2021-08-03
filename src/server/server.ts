import * as express from 'express';
import * as morgan from 'morgan';
import apiRouter from './routes';

const app = express();

app.use(express.json());
app.use(express.static('public'));
<<<<<<< HEAD

=======
app.use(morgan('dev'));
>>>>>>> 73c94bea7c4597c6437089ce00c8811c34b25f86
app.use('/api', apiRouter);

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server listening on port: ${port}`));

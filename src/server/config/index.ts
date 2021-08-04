import * as dotenv from 'dotenv';

dotenv.config();

export default {
    mysql: {
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        host: 'localhost',
        database: process.env.DB_SCHEMA
    }
}
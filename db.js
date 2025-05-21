//db.js
const oracledb = require('oracledb');
require('dotenv').config();

async function getConnection(){
  try{
    const connection = await oracledb.getConnection({
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      connectString: process.env.DB_CONNECT_STRING
    });
    return connection;
  } catch (err) {
    console.error('Oracle 연결 실패:', err.message);
    throw err;
  }
}

module.exports = {getConnection};

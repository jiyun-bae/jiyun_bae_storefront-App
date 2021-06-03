var express = require('express');
var router = express.Router();
const path = require('path');
const mysql = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'user',
  password : 'Xptmxm1212!@',
  database : 'store_db'
});
connection.connect();
// connection.end();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/api/products/all', (req,res) => {
  connection.query('SELECT * from products', (error, rows) => {
    if (error) throw error;
    console.log('products info is: ', rows);
    res.send(rows);
  });
});

router.get('/api/products/:id', (req,res) => {
  if(req.params.id.includes('[')){
    let _query='(';
    JSON.parse(req.params.id).forEach((e, idx) => {
      if(JSON.parse(req.params.id).length-1 !== idx){
        _query += `${e}, `
      }else{
        _query += `${e})`
      }
    });
    connection.query(`SELECT * from products where products_id in ${_query}`, (error, rows) => {
      if (error) throw error;
      console.log('products info is: ', rows);
      res.send(rows);
    });
  } else {
    connection.query(`SELECT * from products where products_content='${req.params.id}'`, (error, rows) => {
      if (error) throw error;
      console.log('products info is: ', rows);
      res.send(rows);
    });
  }
});

router.get('/api/video/getVideos/', (req,res) => {
  res.sendFile(path.join(__dirname, "..", "public", "images", "main_video.mp4"))
});

router.get('/api/assets/:name', (req,res) => {
  res.sendFile(path.join(__dirname, "..", "public", "images", req.params.name))
});

router.get('/documents/:id', (req,res) => {
  res.json({id: req.params.id});
});

module.exports = router;

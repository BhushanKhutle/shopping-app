const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

// MySQL Connection
const db = mysql.createConnection({
  host: 'mysql',       // service name from k8s
  user: 'root',
  password: 'rootpassword',
  database: 'shopdb'
});

db.connect(err => {
  if (err) {
    console.error('❌ DB connection error:', err);
    return;
  }
  console.log('✅ Connected to MySQL');
});

// Routes
app.get('/products', (req, res) => {
  const category = req.query.category;
  let query = 'SELECT * FROM products';
  let params = [];

  if (category) {
    query += ' WHERE category = ?';
    params.push(category);
  }

  db.query(query, params, (err, results) => {
    if (err) return res.status(500).send({ error: 'DB error' });
    res.json(results);
  });
});

app.get('/products/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM products WHERE id = ?', [id], (err, results) => {
    if (err || results.length === 0) {
      return res.status(404).send({ error: 'Product not found' });
    }
    res.json(results[0]);
  });
});

app.listen(port, () => {
  console.log(`🚀 Backend running on http://localhost:${port}`);
});


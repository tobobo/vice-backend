module.exports = 
  port: Number(process.env.PORT or 8888)
  clients: [
    /localhost:.*/
  ]
  db:
    url: 'mongodb://localhost/sample-db'
  session:
    secret: 'illlklklklk'
    cookie_secret: 'slfklksdjf'
    cookie_domain: 'localhost'

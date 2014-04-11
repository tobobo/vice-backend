module.exports = 
  port: Number(process.env.PORT or 8888)
  clients: [
    /localhost:.*/,
    'vice-frontend.s3-website-us-west-1.amazonaws.com'
  ]
  db:
    url: process.env.VICE_DATABASE_URL or 'mongodb://localhost/vice-backend'
  session:
    secret: 'illlklklklk'
    cookie_secret: 'slfklksdjf'
    cookie_domain: 'localhost'

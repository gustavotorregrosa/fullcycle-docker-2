import mysql from 'mysql'

export let connection = mysql.createConnection({
    host     : 'mysql',
    user     : 'gustavo',
    password : 'gustavo',
    database : 'fullcycle'
})

connection.connect(() => {
    connection.query('CREATE TABLE people (name VARCHAR(255));')
})
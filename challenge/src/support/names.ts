import { connection } from "./connection";

export const getNames = () => new Promise<string[]>((success, reject) => {
    const people: string[] = []
    connection.query('select * from people', async function (error, results: {name: string}[], fields) {
        if (error) console.log({error});

        if(results != undefined){
            for(let person of results){
                people.push(person.name)
            }
        }
    
        success(people)
    });
})

export const saveName = (name: string) => new Promise((success, reject) => {
    if(!name || name == 'favicon.ico'){
        return reject('Name invalid')
    }
    connection.query("insert into people (name) values ('"+name+"')", () => {
        success('OK')
    })
})





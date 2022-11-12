import express, { Request, Response } from 'express'
import { connection } from './support/connection'
import { getNames, saveName } from './support/names'

const app = express()

app.get('/:name?', async (request: Request, response: Response) => {
   
    const name = request.params.name

    try {
        await saveName(name)
    } catch (error) {
        console.log({error})
    }

    const names: string[] = await getNames()
    let myHTML = "<h1>Full Cycle Rocks!</h1>"
    myHTML += "<ul>"
        names.map(n => myHTML += "<li>"+n+"</li>")
    myHTML += "</ul>"
    response.send(myHTML)
})

app.listen(3000)


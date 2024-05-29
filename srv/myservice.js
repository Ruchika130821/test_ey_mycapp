const cds = require("@sap/cds");
const {employees} = cds.entities("anubhav.db.master");
module.exports = (srv) => {
    srv.on('hello',(req,res) => {
        return "Hello"+ req.data.name + "Welcome to cap";
    });
    srv.on("READ","ReadEmployeeSrv", async (req,res) =>
       
     {
        const tx = cds.tx(req);
        let data= await tx.run(SELECT.from(employees).limit(5));
        for (let i = 0; i < data.length; i++) {
            const element = data[i];
            element.nameMiddle = element.nameFirst + " " + element.nameLast;
        }
        return data;
        //  return {
            // "ID":"Dummy",
            // "nameFirst":"Cristiano",
            // "nameLast":" Ronaldo"

        //  };
    });
}
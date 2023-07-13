import { Router } from "express";
import dotenv from "dotenv";
import conexion from "../config/data.js";

const Bodegas = Router();
dotenv.config();

/** -------------------- BODEGAS METODO GET --------------------- */

Bodegas.get("/:id?", (req,res)=>{
   
    let sql=(req.params.id)
    ?[`SELECT * FROM bodegas WHERE id=${req.params.id}`]
    :[`SELECT * FROM bodegas ORDER BY nombre`];

    conexion.query(...sql,
        (err,data,fils)=>{
            console.log(err);
            console.table(data);
            res.send(data);
        })
});

/** -------------------- BODEGAS METODO POST --------------------- */

Bodegas.post("/", (req, res)=>{
    conexion.query(
        `INSERT INTO bodegas SET ?`,
        req.body,
        (err,data,fils)=>{
            console.log(err)
            console.table(data);
            console.log(data);
            res.status(200).send(data);
        }
    )
})

/** -------------------- BODEGAS EXPORT --------------------- */

export default Bodegas;
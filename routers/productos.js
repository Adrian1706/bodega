import { Router } from "express";
import dotenv from "dotenv";
import conexion from "../config/data.js";

const Productos = Router();
dotenv.config();

/** -------------------- PRODUCTOS METODO GET --------------------- */

Productos.get("/:id?",(req,res)=>{

    conexion.query(`SELECT p.id,p.nombre,SUM(i.cantidad) AS Total
    FROM productos p
    INNER JOIN inventarios i ON p.id = i.id_producto
    GROUP BY p.id
    ORDER BY Total DESC;`,
    (err, data, fils)=>{
        console.log(err);
        console.table(data);
        res.status(200).send(data)
    })
})

export default Productos;
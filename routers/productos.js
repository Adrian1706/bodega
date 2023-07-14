import { Router } from "express";
import dotenv from "dotenv";
import conexion from "../config/data.js";

const Productos = Router();
dotenv.config();

/** -------------------- PRODUCTOS METODO GET --------------------- */

Productos.get("/:id?",(req,res)=>{
    let sql = (req.params.id)
    ?[`SELECT * FROM productos WHERE id=${req.params.id}`]
    :[`SELECT * FROM productos ORDER BY nombre`]
    conexion.query(...sql,
     (err,data,fils)=>{
         console.log(err);
         console.table(data);
         res.send(data);
     }
    )

 })

/** -------------------- PRODUCTOS METODO POST --------------------- */

Productos.post('/', (req, res) => {
    let insertId;  

    conexion.query(
      `INSERT INTO productos SET ?`,
      req.body,
      (err, data, fils) => {
        if (err) {
          console.log(err);
          res.status(500).send('Error al insertar el producto en la base de datos');
          return;
        }
        insertId = data.insertId;
        console.table(data);
   
        conexion.query(
          `INSERT INTO inventarios SET ?`,
          {
            id_bodega: 11,
            id_producto: insertId,
            cantidad: 2,
            created_by: req.body.created_by,
            update_by: req.body.created_by,
          },
          (err, data, fils) => {
            if (err) {
              console.log(err);
              res.status(500).send('Error al insertar el inventario en la base de datos');
              return;
            }
            console.table(data);
            res.status(200).send(data);
          }
        );
      }
    );
  });


export default Productos;
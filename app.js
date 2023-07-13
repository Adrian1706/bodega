import express from 'express';
import dotenv from "dotenv";
import Bodegas from "./routers/bodegas.js";

dotenv.config();

const appExpress=express();

appExpress.use(express.json());
appExpress.use("/bodegas", Bodegas);

const config=JSON.parse(process.env.SERVER_CONFIG);
appExpress.listen(config,()=>{
    console.log(`http://${config.hostname}:${config.port}`)
})
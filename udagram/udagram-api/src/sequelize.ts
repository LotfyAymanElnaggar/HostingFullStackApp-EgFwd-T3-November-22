import { Sequelize } from "sequelize-typescript";
import { config } from "./config/config";

export const sequelize = new Sequelize(`postgres://${config.username}:${config.password}@${config.host}:${Number(config.db_port)}/${config.database}`);

// {
//   username: config.username,
//   password: config.password,
//   database: config.database,
//   host: config.host,
//   port: Number(config.db_port),
//   dialect: "postgres",
//   storage: ":memory:",
// }

import { DataSource, DataSourceOptions } from 'typeorm'
import { SeederOptions } from 'typeorm-extension'
import { Task } from './orm/entities/task.entity'

const options: DataSourceOptions & SeederOptions = {
  type: 'sqlite',
  database: 'database/db.sqlite3',
  synchronize: false,
  logging: false,
  entities: [Task],
  subscribers: [],
  migrations: [],
  seeds: [],
}

export const AppDataSource = new DataSource(options)

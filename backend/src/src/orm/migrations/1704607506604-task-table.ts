import {
  Column,
  MigrationInterface,
  QueryRunner,
  Table,
  TableColumn,
} from 'typeorm'
import { Task } from '../entities/task.entity'

const tableName: string = Task.name.toLowerCase()

export class TaskTable1704607506604 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    const columns = queryRunner.connection
      .getMetadata(Task)
      .ownColumns.map((column) => {
        const columnOptions: PropertyDecorator = Column({ ...column })
        return new TableColumn({
          ...columnOptions,
          name: column.propertyName,
          type: column.type.toString(),
        })
      })
    await queryRunner.createTable(new Table({ name: tableName, columns }))
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable(tableName)
  }
}

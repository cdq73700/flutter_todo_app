import {
  Column,
  Entity,
  PrimaryColumnOptions,
  PrimaryGeneratedColumn,
} from 'typeorm'
import { PrimaryGeneratedColumnUUIDOptions } from 'typeorm/decorator/options/PrimaryGeneratedColumnUUIDOptions'
import { TaskModelSchemas } from 'swagger/v1/typescript/model/taskModelSchemas'

const primaryGeneratedColumnOptions: PrimaryGeneratedColumnUUIDOptions &
  PrimaryColumnOptions = {
  name: 'id',
  type: 'uuid',
}

@Entity({ name: 'task' })
export class Task implements TaskModelSchemas {
  @PrimaryGeneratedColumn('uuid', primaryGeneratedColumnOptions)
  id: string | undefined

  @Column({ name: 'name', type: 'varchar' })
  name: string | undefined

  @Column({ name: 'status', type: 'numeric' })
  status: number

  @Column({
    name: 'created_at',
    type: 'datetime',
    default: () => 'CURRENT_TIMESTAMP',
  })
  readonly createdAt: Date | undefined

  @Column({ name: 'updated_at', type: 'datetime' })
  updatedAt: Date | undefined

  constructor(name, status = 0) {
    this.id = undefined
    this.name = name
    this.status = status
    this.updatedAt = new Date(Date.now())
  }
}

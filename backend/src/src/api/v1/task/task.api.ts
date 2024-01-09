import { Injectable } from '@nestjs/common'
import { DeleteResult, InsertResult, Repository } from 'typeorm'
import { AppDataSource } from 'src/data-source'
import { Task } from 'src/orm/entities/task.entity'
import { ResponseTaskSchema } from 'swagger/v1/typescript/model/responseTaskSchema'
import { TaskSchema } from 'swagger/v1/typescript/model/taskSchema'

@Injectable()
export class TaskApi {
  private repository: Repository<Task> = AppDataSource.getRepository(Task)
  async retrieveTaskList(): Promise<ResponseTaskSchema> {
    const response: Array<Task> = await this.repository.find({})

    const data: Array<TaskSchema> = response.map((item) => {
      const createdAt = item.createdAt.toISOString()
      const updatedAt = item.updatedAt.toISOString()
      return { ...item, createdAt, updatedAt }
    })

    return { success: true, data }
  }

  async postTask(name: string): Promise<ResponseTaskSchema> {
    const task = new Task(name)
    const response: InsertResult = await this.repository.insert(task)

    return await this.retrieveTaskById(response.generatedMaps[0].id)
  }

  async retrieveTaskById(id: string): Promise<ResponseTaskSchema> {
    const response: Task = await this.repository.findOneBy({ id })

    const createdAt = response.createdAt.toISOString()
    const updatedAt = response.updatedAt.toISOString()
    const data: Array<TaskSchema> = [{ ...response, createdAt, updatedAt }]

    return { success: true, data }
  }

  async putTaskById(
    id: string,
    name: string,
    status: number
  ): Promise<ResponseTaskSchema> {
    await this.repository.update(id, {
      name,
      status,
    })

    return await this.retrieveTaskById(id)
  }

  async deleteTaskById(id: string): Promise<boolean> {
    const response: DeleteResult = await this.repository.delete(id)

    return response.affected === 1
  }
}

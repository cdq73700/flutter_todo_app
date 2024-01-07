import { Injectable } from '@nestjs/common'
import { ResponseTaskSchema } from 'swagger/v1/typescript/model/responseTaskSchema'
import { TaskApi } from './task.api'
import { DeleteTaskByIdDto, PostTaskDto, RetrieveTaskByIdDto } from './task.dto'

@Injectable()
export class TaskService {
  constructor(private readonly taskApi: TaskApi) {}

  async retrieveTaskList(): Promise<ResponseTaskSchema> {
    const tasks: ResponseTaskSchema = await this.taskApi.retrieveTaskList()
    return tasks
  }

  async postTask(dto: PostTaskDto): Promise<ResponseTaskSchema> {
    const { name } = dto
    const tasks: ResponseTaskSchema = await this.taskApi.postTask(name)

    return tasks
  }

  async retrieveTaskById(
    dto: RetrieveTaskByIdDto
  ): Promise<ResponseTaskSchema> {
    const { id } = dto
    const tasks: ResponseTaskSchema = await this.taskApi.retrieveTaskById(id)

    return tasks
  }

  async putTaskById(paramDto, bodyDto): Promise<ResponseTaskSchema> {
    const { id } = paramDto
    const { name, status } = bodyDto
    const tasks: ResponseTaskSchema = await this.taskApi.putTaskById(
      id,
      name,
      status
    )

    return tasks
  }

  async deleteTaskById(dto: DeleteTaskByIdDto): Promise<boolean> {
    const { id } = dto
    const response = await this.taskApi.deleteTaskById(id)

    return response
  }
}

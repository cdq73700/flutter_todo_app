import {
  Body,
  Controller,
  Delete,
  Get,
  HttpStatus,
  InternalServerErrorException,
  NotFoundException,
  Param,
  Post,
  Put,
  Res,
} from '@nestjs/common'
import { Response } from 'express'

import { TaskService } from './task.service'
import {
  DeleteTaskByIdDto,
  PostTaskDto,
  PutTaskByIdBodyDto,
  PutTaskByIdParamDto,
  RetrieveTaskByIdDto,
} from './task.dto'

@Controller('api/v1')
export class TaskController {
  constructor(private readonly taskService: TaskService) {}

  @Get('task')
  async retrieveTaskList(@Res() res: Response): Promise<void> {
    try {
      const tasks = await this.taskService.retrieveTaskList()
      res.status(HttpStatus.OK).json(tasks)
    } catch (error) {
      throw new InternalServerErrorException(error)
    }
  }

  @Post('task')
  async postTask(
    @Body() postTaskDto: PostTaskDto,
    @Res() res: Response
  ): Promise<void> {
    try {
      const tasks = await this.taskService.postTask(postTaskDto)
      if (!tasks.data.length) {
        throw new NotFoundException('task not found')
      }
      res.status(HttpStatus.CREATED).json(tasks)
    } catch (error) {
      if (error instanceof NotFoundException) {
        throw error
      } else {
        throw new InternalServerErrorException(error)
      }
    }
  }

  @Get('task/:id')
  async retrieveTaskById(
    @Param() retrieveTaskByIdDto: RetrieveTaskByIdDto,
    @Res() res: Response
  ): Promise<void> {
    try {
      const tasks = await this.taskService.retrieveTaskById(retrieveTaskByIdDto)
      if (!tasks.data.length) {
        throw new NotFoundException('task not found')
      }
      res.status(HttpStatus.OK).json(tasks)
    } catch (error) {
      if (error instanceof NotFoundException) {
        throw error
      } else {
        throw new InternalServerErrorException(error)
      }
    }
  }

  @Put('task/:id')
  async putTaskById(
    @Param() putTaskByIdParamDto: PutTaskByIdParamDto,
    @Body() putTaskByIdBodyDto: PutTaskByIdBodyDto,
    @Res() res: Response
  ): Promise<void> {
    try {
      const tasks = await this.taskService.putTaskById(
        putTaskByIdParamDto,
        putTaskByIdBodyDto
      )
      if (!tasks.data.length) {
        throw new NotFoundException('task not found')
      }
      res.status(HttpStatus.OK).json(tasks)
    } catch (error) {
      if (error instanceof NotFoundException) {
        throw error
      } else {
        throw new InternalServerErrorException(error)
      }
    }
  }

  @Delete('task/:id')
  async deleteTaskById(
    @Param() deleteTaskByIdDto: DeleteTaskByIdDto,
    @Res() res: Response
  ): Promise<void> {
    try {
      const response = await this.taskService.deleteTaskById(deleteTaskByIdDto)
      if (!response) {
        throw new NotFoundException('task not found')
      }
      res.status(HttpStatus.NO_CONTENT).json({})
    } catch (error) {
      if (error instanceof NotFoundException) {
        throw error
      } else {
        throw new InternalServerErrorException(error)
      }
    }
  }
}

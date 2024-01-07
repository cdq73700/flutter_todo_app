import { Module } from '@nestjs/common'
import { TaskController } from './task.controller'
import { TaskService } from './task.service'
import { TaskApi } from './task.api'

@Module({
  controllers: [TaskController],
  providers: [TaskService, TaskApi],
})
export class TaskModule {}

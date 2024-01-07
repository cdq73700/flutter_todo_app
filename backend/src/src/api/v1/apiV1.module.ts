import { Module } from '@nestjs/common'
import { HealthModule } from './health/health.module'
import { TaskModule } from './task/task.module'

@Module({
  imports: [HealthModule, TaskModule],
})
export class ApiV1Module {}

import { Controller, Get, HttpStatus, Res } from '@nestjs/common'
import { Response } from 'express'
import { HealthService } from './health.service'
import { HealthSchema } from 'swagger/v1/typescript/model/healthSchema'

@Controller('api/v1')
export class HealthController {
  constructor(private readonly healthService: HealthService) {}

  @Get('health')
  checkHealth(@Res() res: Response): void {
    const data: string = this.healthService.checkHealth()
    const response: HealthSchema = {
      success: true,
      data,
    }
    res.status(HttpStatus.OK).json(response)
  }
}

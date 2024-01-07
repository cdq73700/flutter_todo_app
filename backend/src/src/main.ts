import 'reflect-metadata'

import { NestFactory } from '@nestjs/core'
import { AppModule } from './app.module'
import { HttpExceptionFilter } from './httpException.filter'
import { AppDataSource } from './data-source'

async function bootstrap() {
  await AppDataSource.initialize()
  const app = await NestFactory.create(AppModule)
  app.useGlobalFilters(new HttpExceptionFilter())
  await app.listen(4000)
}
bootstrap()

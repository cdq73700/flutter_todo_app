import { IsNumber, IsString } from 'class-validator'

export class PostTaskDto {
  @IsString()
  name: string
}

export class RetrieveTaskByIdDto {
  @IsString()
  id: string
}

export class PutTaskByIdParamDto {
  @IsString()
  id: string
}

export class PutTaskByIdBodyDto {
  @IsString()
  name: string

  @IsNumber()
  status: number
}

export class DeleteTaskByIdDto {
  @IsString()
  id: string
}

import { DataSource } from 'typeorm'
import { Seeder } from 'typeorm-extension'
import { Task } from '../entities/task.entity'

export default class ProfileSeeder implements Seeder {
  public async run(dataSource: DataSource): Promise<any> {
    const repository = dataSource.getRepository(Task)

    const list = Array.from({ length: 15 }).map(
      (_, index) => new Task(`Test ${index + 1}`, Math.random() >= 0.5 ? 1 : 0)
    )

    await repository.insert(list)
  }
}

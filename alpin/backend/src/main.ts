import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as process from 'node:process';
import 'dotenv/config';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  console.log('Listen at port localhost:', process.env.PORT);
  const app = await NestFactory.create(AppModule);

  // add Swagger for rest endpoints
  const config = new DocumentBuilder()
    .setTitle('Alpin')
    .setDescription('Alpin rest api')
    .setVersion(process.env.VERSION || '9.9.9')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  await app.listen(process.env.PORT || 3000);
}

bootstrap().catch((error) => {
  console.error(error);
  process.exit(1);
});

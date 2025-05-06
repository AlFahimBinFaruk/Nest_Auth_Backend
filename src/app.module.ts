import { Module } from '@nestjs/common';
import {TypeOrmModule} from '@nestjs/typeorm';
import { UserModule } from './user/user.module';
import { AuthModule } from './auth/auth.module';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';


@Module({
  imports:[
    ConfigModule.forRoot({
      isGlobal:true,
    }),
    TypeOrmModule.forRoot({
      type:'sqlite',
      database:'db.sqlite',
      entities:[__dirname+'/**/*.entity.{ts,js}'],
      synchronize:true
    }),
    UserModule,
    AuthModule
  ],
  providers:[AppService],
  controllers:[AppController]
})
export class AppModule {}

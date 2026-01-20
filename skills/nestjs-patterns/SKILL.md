---
name: nestjs-patterns
description: NestJS best practices, module architecture, DTOs, Guards, Interceptors, and common patterns. Use when building or reviewing NestJS backend services.
---

# NestJS Patterns

## Module Structure

```
src/modules/users/
├── users.module.ts
├── users.controller.ts
├── users.service.ts
├── dto/
│   ├── create-user.dto.ts
│   └── update-user.dto.ts
├── entities/
│   └── user.entity.ts
└── guards/
    └── user-owner.guard.ts
```

## Key Patterns

### Module Definition

```typescript
@Module({
  imports: [PrismaModule],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
```

### DTOs with Validation

```typescript
import { IsEmail, IsString, MinLength } from 'class-validator'

export class CreateUserDto {
  @IsEmail()
  email: string

  @IsString()
  @MinLength(8)
  password: string
}
```

### Service Pattern

```typescript
@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async create(dto: CreateUserDto) {
    return this.prisma.user.create({ data: dto })
  }

  async findOne(id: string) {
    const user = await this.prisma.user.findUnique({ where: { id } })
    if (!user) throw new NotFoundException()
    return user
  }
}
```

### Controller Pattern

```typescript
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  @HttpCode(HttpStatus.CREATED)
  create(@Body() dto: CreateUserDto) {
    return this.usersService.create(dto)
  }

  @Get(':id')
  @UseGuards(JwtAuthGuard)
  findOne(@Param('id') id: string) {
    return this.usersService.findOne(id)
  }
}
```

### Guards

```typescript
@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {}

@Injectable()
export class ResourceOwnerGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest()
    return request.user.id === request.params.id
  }
}
```

### Custom Decorators

```typescript
export const CurrentUser = createParamDecorator(
  (data: string, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest()
    return data ? request.user?.[data] : request.user
  },
)

// Usage: @CurrentUser() user or @CurrentUser('id') id
```

## Forbidden Patterns

- Business logic in controllers
- Returning sensitive data (passwords)
- No validation on inputs
- Hardcoded secrets
- Skipping error handling

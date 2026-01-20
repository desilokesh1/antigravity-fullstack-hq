---
name: prisma-workflow
description: Prisma ORM best practices, schema design, migrations, seeding, and query optimization for PostgreSQL. Use when working with database schemas, migrations, or Prisma queries.
---

# Prisma Workflow

## Schema Design

```prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  role      Role     @default(USER)
  posts     Post[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@index([email])
}

model Post {
  id        String   @id @default(cuid())
  title     String
  content   String?
  published Boolean  @default(false)
  author    User     @relation(fields: [authorId], references: [id], onDelete: Cascade)
  authorId  String

  @@index([authorId])
}

enum Role {
  USER
  ADMIN
}
```

## Migration Workflow

1. Edit `schema.prisma`
2. `npx prisma migrate dev --name descriptive_name`
3. Review generated SQL in `prisma/migrations/`
4. Test on development
5. `npx prisma migrate deploy` for production

### Good Migration Names

```bash
npx prisma migrate dev --name add_user_role
npx prisma migrate dev --name create_posts_table
npx prisma migrate dev --name add_index_on_email
```

## Query Patterns

### Select Specific Fields

```typescript
const user = await prisma.user.findUnique({
  where: { id },
  select: { id: true, email: true, name: true }
})
```

### Include Relations

```typescript
const user = await prisma.user.findUnique({
  where: { id },
  include: { posts: true }
})
```

### Pagination

```typescript
const users = await prisma.user.findMany({
  skip: (page - 1) * limit,
  take: limit,
  orderBy: { createdAt: 'desc' }
})
```

### Transactions

```typescript
await prisma.$transaction([
  prisma.user.update({ where: { id }, data: { balance: { decrement: 100 } } }),
  prisma.order.create({ data: { userId: id, amount: 100 } })
])
```

## Performance Tips

- Always index foreign keys
- Use `select` to fetch only needed fields
- Use `take` for large tables
- Batch operations with `createMany`
- Use transactions for related operations

## Prisma Service (NestJS)

```typescript
@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    await this.$connect()
  }
}
```

---
name: nextjs-app-router
description: Next.js App Router best practices, Server Components, Server Actions, routing patterns, and data fetching strategies. Use when building Next.js applications with the App Router.
---

# Next.js App Router Patterns

## Project Structure

```
app/
├── (auth)/                 # Route Group
│   ├── login/page.tsx
│   ├── register/page.tsx
│   └── layout.tsx
├── (dashboard)/
│   ├── layout.tsx
│   ├── page.tsx
│   └── [projectId]/
│       └── page.tsx
├── api/
│   └── webhooks/route.ts
├── layout.tsx
├── page.tsx
├── loading.tsx
├── error.tsx
└── not-found.tsx
```

## Server vs Client Components

### Decision Tree

- Need interactivity (onClick, useState)? -> 'use client'
- Need browser APIs? -> 'use client'
- Otherwise -> Server Component (default)

### Server Component

```tsx
// No directive needed - Server Component by default
import { prisma } from '@/lib/db'

export default async function UsersPage() {
  const users = await prisma.user.findMany()
  return <UserList users={users} />
}
```

### Client Component

```tsx
'use client'

import { useState } from 'react'

export function Counter() {
  const [count, setCount] = useState(0)
  return <button onClick={() => setCount(c => c + 1)}>{count}</button>
}
```

## Server Actions

```tsx
// lib/actions/users.ts
'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'

export async function createUser(formData: FormData) {
  const email = formData.get('email') as string
  
  await prisma.user.create({ data: { email } })
  
  revalidatePath('/users')
  redirect('/users')
}
```

### Using in Forms

```tsx
import { createUser } from '@/lib/actions/users'

export function CreateUserForm() {
  return (
    <form action={createUser}>
      <input name="email" type="email" required />
      <button type="submit">Create</button>
    </form>
  )
}
```

## Data Fetching

### Parallel Fetching

```tsx
export default async function Dashboard() {
  const [user, posts] = await Promise.all([
    getUser(),
    getPosts()
  ])
  
  return <DashboardView user={user} posts={posts} />
}
```

### Streaming with Suspense

```tsx
import { Suspense } from 'react'

export default function Page() {
  return (
    <div>
      <h1>Dashboard</h1>
      <Suspense fallback={<Loading />}>
        <SlowComponent />
      </Suspense>
    </div>
  )
}
```

## Caching

```tsx
// Revalidate every 60 seconds
fetch(url, { next: { revalidate: 60 } })

// No caching
fetch(url, { cache: 'no-store' })

// Static (default)
fetch(url)
```

## Protected Routes

```tsx
// app/(dashboard)/layout.tsx
import { redirect } from 'next/navigation'
import { auth } from '@/lib/auth'

export default async function DashboardLayout({ children }) {
  const session = await auth()
  if (!session) redirect('/login')
  
  return <div>{children}</div>
}
```

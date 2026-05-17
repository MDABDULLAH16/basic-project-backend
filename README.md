Diagram link: [database](https://lucid.app/lucidchart/ec373326-9b9d-485f-95de-46473f3bf493/edit?viewport_loc=487%2C-532%2C1252%2C545%2C0_0&invitationId=inv_2cc60d8a-067b-40c1-817a-d10a688d88c7)
<img width="1108" height="245" alt="image" src="https://github.com/user-attachments/assets/d4cc555e-c716-4c96-8260-f9fda632b7df" />


# Prisma ORM Essential Q&A

### 1. What is Prisma ORM and why is it used in backend development?
**Prisma ORM** is a modern, open-source object-relational mapper for Node.js and TypeScript. 

It is used in backend development because:
* **Type Safety:** It automatically generates TypeScript types based on your database schema, preventing runtime database errors.
* **Developer Experience:** It provides advanced auto-completion (IntelliSense) inside your code editor.
* **Productivity:** It replaces complex, raw SQL queries with clean, readable JavaScript/TypeScript methods.

---

### 2. What is the difference between `findUnique()` and `findFirst()` in Prisma?

| Feature | `findUnique()` | `findFirst()` |
| :--- | :--- | :--- |
| **Search Criteria** | Can only search by unique fields (e.g., `id`, `@unique` attributes). | Can search by any non-unique criteria (e.g., `status: "active"`). |
| **Performance** | Faster, because it utilizes database unique indexes directly. | Slightly slower, as it scans tables linearly until a match is found. |
| **Output** | Returns exactly **one** record or `null`. | Returns the **first** record that matches the criteria or `null`. |

---

### 3. What is Prisma Migration and why is `prisma migrate dev` used?
* **Prisma Migration** is a tool that tracks and translates changes made in your `schema.prisma` file into executable SQL migration files to keep your database structure in sync.
* **`prisma migrate dev`** is used in your local development environment to:
  1. Detect changes made inside `schema.prisma`.
  2. Generate a human-readable SQL file tracking the change history.
  3. Execute that SQL code directly against your local database.
  4. Automatically trigger `prisma generate` to update your application's TypeScript types.

---

### 4. Explain the difference between `select` and `include` in Prisma with examples.
Both parameters are used to shape the returned query object, but they handle relational and field data differently:

* **`select`:** Used to choose **specific fields** to return. It excludes all other fields.
* **`include`:** Used to bring in **related models (joins)**. It returns all scalar fields of the main model plus the relational data.

#### Examples:

```typescript
// Example 1: Using select (Returns ONLY name and email)
const userWithSelect = await prisma.user.findUnique({
  where: { id: 1 },
  select: { name: true, email: true } 
});

// Example 2: Using include (Returns ALL User fields + their related posts)
const userWithInclude = await prisma.user.findUnique({
  where: { id: 1 },
  include: { posts: true } 
});
 
 
```

### 5. What is the purpose of the Prisma schema file (schema.prisma) and what are its main sections?
The `schema.prisma` file is the **core configuration file** for your entire Prisma setup. Its primary purpose is to act as the single source of truth for your database structure, configuration, and data models.

Its main sections are:

1. **`datasource`**
   Defines how Prisma connects to your database. It specifies the database provider (e.g., `postgresql`, `mysql`, `sqlite`) and the connection URL (usually pointing to an environment variable).
   ```prisma
   datasource db {
     provider = "postgresql"
     url      = env("DATABASE_URL")
   }
   
generator
Specifies which client ecosystem should be generated from your schema. The most common provider is prisma-client-js which creates the TypeScript/JavaScript query client for your application code.

Code snippet
```prisma
generator client {
  provider = "prisma-client-js"
}
```

3. **`model`**
   Defines your application's data structures (which map directly to database tables or collections). Inside models, you specify individual column fields, data types (e.g., `String`, `Int`, `Boolean`), modifiers (e.g., `?` for optional), attributes (e.g., `@id`, `@unique`), and relations between tables.
   ```prisma
   model User {
     id    Int    @id @default(autoincrement())
     email String @unique
     name  String
   }

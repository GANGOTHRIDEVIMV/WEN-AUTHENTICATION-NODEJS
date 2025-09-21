# Node.js Authentication Assignment

## Features
- Register with password hashing (bcryptjs)
- Login & JWT token generation
- Protected route (/profile)
- In-memory user storage (no database)

## Setup
1. Install dependencies:
```
npm install
```
2. Run the server:
```
npm start
```
Server runs at http://localhost:3000

## API Endpoints
### POST /api/auth/register
Body:
```json
{"username":"alice","password":"12345"}
```
### POST /api/auth/login
Body:
```json
{"username":"alice","password":"12345"}
```
Returns JWT token.

### GET /api/auth/profile
Header:
```
Authorization: Bearer <JWT_TOKEN>
```
Response:
```json
{"message": "Welcome alice"}
```

## Notes
- `.env` contains PORT & JWT_SECRET
- node_modules & .env are ignored by Git
- Use curl or Postman to test endpoints.

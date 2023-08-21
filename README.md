[![Language](https://img.shields.io/badge/language-Swift%205.7.2-skyblue.svg)](https://swift.org)
![UI](https://img.shields.io/badge/UI-SwiftUI-blue.svg)
![UI](https://img.shields.io/badge/UI-UIKit-red.svg)
![Xcode](https://img.shields.io/badge/Xcode-14.2+-green)
![Version](https://img.shields.io/badge/iOS-15.0-yellow)

![Vapor](https://img.shields.io/badge/Vapor_framework-4.77.1-purple)
![Vapor](https://img.shields.io/badge/Vapor_toolbox-18.7.1-purple)
![DBeaver](https://img.shields.io/badge/DBeaver-23.1.1-brown)
![Docker](https://img.shields.io/badge/Docker-4.21.1-cyan)


# ShareTodo
Swift와 Vapor로 만든 REST-API로 Todo앱 만들기 1인 프로젝트 입니다. (Last Update: 2023.08.13)
- Design - Carki
- Client - Carki
- Server - Carki

# Index

- Version
  - iOS 15.0+
- [BackEnd](#backend)
  - [Authentication API](#authentication-api)
    - [Register API](#register-api)
    - [Login API](#login-api)

# BackEnd
### Server 
- Local (Until Internal Test Period)
### DB 
- Postgres
### DB GUI
- DBeaver

---

# Authentication API
- Register API
- Login API

## Register API
  
##### RequestModel
```JSON
{
   "ID": UUID,
   "userID": String,
   "password": String,
   "nickName": String?
}
```

##### ResponseModel
```JSON
{
   "message": String,
   "data": {
      "userID": String,
      "nickName": String?
   }
}
```
---

## Login API

##### RequestModel
```JSON
{
   "userID": String,
   "password": String,
}
```

##### ResponseModel
```JSON
{
   "message": String,
   "data": {
      "id": UUID,
      "nickName": String,
      "userId": String,
      "token": String
   }
}
```
https://github.com/ios-carki/ShareTodo/assets/44957712/dd7f2325-d299-435f-9609-68d8e0bf12ee

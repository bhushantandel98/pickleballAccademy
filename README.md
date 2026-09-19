# Flutter Clean Architecture + BLoC + Dio Login

## Structure

lib/
- core/
- common/
- features/
  - auth/
    - data/
    - domain/
    - presentation/
- app.dart
- main.dart

## API

Base URL:
http://localhost:8080/

Endpoint:
POST auth/login

Request:
{
  "id": "",
  "password": ""
}

Expected response:
{
  "token": "abc123",
  "user": {
    "id": "1",
    "name": "Bhushan",
    "email": "user@test.com"
  }
}

If your backend returns a different response, update:
lib/features/auth/data/models/login_response_model.dart

## Run

flutter pub get
flutter run

## Localhost

iOS Simulator/Desktop:
http://localhost:8080/

Android Emulator:
http://10.0.2.2:8080/

Physical device:
Use your computer LAN IP, e.g. http://192.168.1.10:8080/

Change only:
lib/core/constants/api_constants.dart

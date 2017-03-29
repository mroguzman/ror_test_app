# Selectra Test

## How to run the application

1. Create database, run migrations and seeds.

  `$ rails db:setup`

2. Execute the Rails server.

  `$ rails s`

## Request example for the API

```sh
$ curl -X POST -H "Content-Type: application/json" -d '{"location_id": 1, "time": "14:30", "day_of_week": "Monday" }' "http://localhost:3000/api/schedule"
```

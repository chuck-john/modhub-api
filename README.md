# ModHub API

## Endpoints
* `POST /garages`
* `DELETE /garages`
* `GET /makes`
* `GET /models`
* `GET /modes`
* `GET /trims`
* `POST /sessions`
* `DELETE /sessions`
* `POST /users`
* `PUT /users`
* `DELETE /users`
* `POST /vehicles`
* `DELETE /vehicles`

## Responses
### Collection
```json
{
  "data": [
    {
      "attributes": {
        "id": 1,
        "name": "ABARTH"
      },
      "id": "1",
      "type": "make"
    }
  ]
}
```

### Errors
```json
{
  "email": [
    "has already been taken"
  ]
}
```

## Contributing
### Stack
* Ruby 3.x
* Rails 6.x

### Seed Database
WARNING: The automobile data CSV contains ~10,000 rows. Importing will likely take a few minutes to complete.

1. Download automobile file data [here](https://drive.google.com/file/d/1mFDVznruknHyLoA8wXuCFWyuSmQnAywX/view?usp=sharing)
1. Place file in `db` directory named `automobiles.csv`
1. Run `$ rake db:seed` at the project root

### Default User
* email: `tester@modhub.com`
* password: `password`

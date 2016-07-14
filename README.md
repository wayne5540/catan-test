# Catan Test


## Usage

Make sure you've installed ruby-2.3.0 and bundler

### Start server

```sh
$ git clone git@github.com:wayne5540/catan-test.git
$ cd catan-test
$ bundle install
$ rails s
```

### Endpoints

#### Create new game

**Request:** 
`POST http://localhost:3000/games`

**Response**

```json
{
  "id": 23,
  "token": "otUyUcditVcBng5yw2XpHwux",
  "status": "in_process",
  "created_at": "2016-07-13T11:43:19.476Z",
  "updated_at": "2016-07-13T11:43:19.476Z",
  "player_token": "vdf7dy9rmgsA883DhYQRMRUG"
}
```

#### Get game status

**Request:** 
`GET http://localhost:3000/games/:token`

**Response**

```json
{
  "token": "otUyUcditVcBng5yw2XpHwux",
  "status": "in_process"
}
```

#### List all nodes

**Request:** 
`GET http://localhost:3000/games/:token/nodes?player_token=vdf7dy9rmgsA883DhYQRMRUG`

**Response**

```json
[
  {
    "id": 55,
    "position": 0,
    "level": 0,
    "player": null
  },
  {
    "id": 56,
    "position": 1,
    "level": 0,
    "player": null
  },
  {
    "id": 57,
    "position": 2,
    "level": 0,
    "player": null
  },
  {
    "id": 58,
    "position": 3,
    "level": 0,
    "player": null
  },
  {
    "id": 59,
    "position": 4,
    "level": 0,
    "player": null
  },
  {
    "id": 60,
    "position": 5,
    "level": 0,
    "player": null
  },
  {
    "id": 61,
    "position": 6,
    "level": 0,
    "player": null
  }
]
```


#### Place token on the node

**Request:** 
`PATCH/PUT http://localhost:3000/games/:token/nodes/:id?player_token=vdf7dy9rmgsA883DhYQRMRUG`

**Response**

```json
{
  "id": 61,
  "position": 6,
  "level": 1,
  "player": {
    "token": "vdf7dy9rmgsA883DhYQRMRUG"
  }
}
```


#### Roll the dice

**Request**
`POST http://localhost:3000/games/:token/actions/roll_dice?player_token=vdf7dy9rmgsA883DhYQRMRUG`

**Response**

```json
{
  "dice_point": 6,
  "player_score": {
    "vdf7dy9rmgsA883DhYQRMRUG": {
      "wood": 0,
      "brick": 0,
      "metal": 1,
      "stone": 0
    }
  }
}
```


## TODO


* Add other players into game
* Authencate player, don't response player token everywhere
* Endpoint for players
* Check players' resource when they place token or update token on the node
* Trade resources with other players
* Game master - check if game over or not
* Add test
* Better error handling and message


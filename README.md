# Boris Bike

```
User stories

As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working


```

## Domain Model

|Noun        | Owner or property |
| --------   | ------------------| 
| Bike       | Owner    | 
| Docking Station | Owner | 

|Action        | Owned by ? |
| --------   | ------------------| 
| release bike  | docking station  | 
| bike working | bike | 

|Action        | Property it reads or changes |
| --------   | ------------------| 
| release bike  | array of bikes, bikes | 
| bike working | bike | 


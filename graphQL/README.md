## On GraphiQL interface, both books and coffee can now be queried as

#### query

> > {
> > book(id:"A1111"){

    author,
    rating

}
}

#### Response

> > {
> > "data": {

    "book": {
      "author": "Herman Melville",
      "rating": 10
    }

}
}

#### Query

> > {
> > coffee(id:1001){

    coffeeName,
    pricePerCup

}
}

#### Response

> > {
> > "data": {

    "coffee": {
      "coffeeName": "Colombian",
      "pricePerCup": 7.99
    }

}
}

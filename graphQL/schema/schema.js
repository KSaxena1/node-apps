const graphql = require("graphql");
const axios = require("axios");
const _ = require("lodash");

const {
  GraphQLObjectType,
  GraphQLString,
  GraphQLInt,
  GraphQLFloat,
  GraphQLSchema
} = graphql;

//create object for books
const bookType = new GraphQLObjectType({
  name: "Book",
  fields: {
    bookId: { type: GraphQLString },
    title: { type: GraphQLString },
    author: { type: GraphQLString },
    rating: { type: GraphQLInt },
    qtyAtHand: { type: GraphQLInt }
  }
});

const coffeeType = new GraphQLObjectType({
  name: "Coffee",
  fields: {
    coffeeId: { type: GraphQLInt },
    coffeeName: { type: GraphQLString },
    pricePerCup: { type: GraphQLFloat },
    qtyAvailForCups: { type: GraphQLInt }
  }
});

const RootQuery = new GraphQLObjectType({
  name: "RootQueryType",
  fields: {
    book: {
      type: bookType,
      args: { id: { type: GraphQLString } },
      resolve(parentValue, args) {
        //console.log(args.id);
        return axios
          .get(` http://localhost:4000/api/book/${args.id}`)
          .then(resp => resp.data);
        //return _.find(users, { id: args.id });
      }
    },
    coffee: {
      type: coffeeType,
      args: { id: { type: GraphQLString } },
      resolve(parentValue, args) {
        //console.log(args.id);
        return axios
          .get(` http://localhost:4000/api/coffee/${args.id}`)
          .then(resp => resp.data);
        //return _.find(users, { id: args.id });
      }
    }
  }
});

module.exports = new GraphQLSchema({
  query: RootQuery
});

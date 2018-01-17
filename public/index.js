/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      yelpRestaurants: [],
      restaurantUsers: [],
      restaurantUsersReviewed: [],
      restaurantUsersNotReviewed: []
    };
  },
  mounted: function() {
    axios.get("/restaurant_users").then(
      function(response) {
        this.restaurantUsers = response.data;
        this.restaurantUsersReviewed = response.data
          .filter(x => x.ratings !== "")
          .sort(function(a, b) {
            return b.ratings - a.ratings;
          });
        this.restaurantUsersNotReviewed = response.data.filter(
          x => x.ratings === ""
        );
        console.log(this.restaurantUsersReviewed);
        console.log(this.restaurantUsersNotReviewed);
      }.bind(this)
    );
    axios.get("/yelps").then(
      function(response) {
        this.yelpRestaurants = response.data;
        console.log("yelp", this.yelpRestaurants);
      }.bind(this)
    );
  }
};

var createReviewPage = {
  template: "#createReview-page",
  data: function() {
    return {
      restaurantId: "",
      images: "",
      ratings: "",
      review: "",
      value: "",
      cost: "",
      food_type: "",
      speed: "",
      drink_list: "",
      newRestaurantVisible: false,
      restaurants: [],
      errors: []
    };
  },

  mounted: function() {
    axios.get("/restaurants").then(
      function(response) {
        this.restaurants = response.data;
        console.log(this.restaurants);
      }.bind(this)
    );
  },

  methods: {
    submit: function() {
      var params = {
        restaurant_id: this.restaurantId,
        images: this.images,
        ratings: this.ratings,
        review: this.review,
        value: this.value,
        cost: this.cost,
        food_type: this.food_type,
        speed: this.speed,
        drink_list: this.drink_list
      };
      axios
        .post("/restaurant_users", params)

        .then(function(response) {
          router.push("/createReview");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/createReview", component: createReviewPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

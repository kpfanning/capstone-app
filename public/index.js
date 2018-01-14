/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
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
  }
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});

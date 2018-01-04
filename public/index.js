/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      restaurantUsers: []
    };
  },
  mounted: function() {
    axios.get("/restaurant_users").then(
      function(response) {
        this.restaurantUsers = response.data;
        console.log(this.restaurantUsers);
      }.bind(this)
    );
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/", component: HomePage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#app",
  router: router
});

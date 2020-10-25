import Vue from "vue";
import Home from "../Home.vue";
import router from "../router/index";
import Buefy from "buefy";
import "buefy/dist/buefy.css";

Vue.use(Buefy);

var pages = new Vue({
  el: "#pages",
  router,
  render: (h) => h(Home),
});
	
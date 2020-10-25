import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/createProfile",
    name: "CreateNewProfile",
    component: () => import("../views/CreateNewProfile.vue"),
  },
  {
    path: "/loadProfile",
    name: "LoadProfile",
    component: () => import("../views/LoadProfile.vue"),
  },
  {
    path: "/files/:id",
    name: "FolderFiles",
    component: () => import("../views/FolderFiles.vue"),
  },
  {
    path: "/folders/:id",
    name: "Folder",
    component: () => import("../views/Folder.vue"),
  },
  {
    path: "/gasket",
    name: "Gasket",
    component: () => import("../views/Gasket.vue"),
  },
  {
    path: "/about",
    name: "About",
    component: () => import("../views/About.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;

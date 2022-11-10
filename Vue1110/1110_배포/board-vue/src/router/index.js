import Vue from "vue";
import VueRouter from "vue-router";
import AppMain from "@/views/AppMain";
import AppUser from "@/views/AppUser";
// import HomeView from "../views/HomeView.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "main",
    component: AppMain,
  },
  {
    path: "/user",
    name: "user",
    component: AppUser,
  },
  {
    path: "/board",
    name: "board",  
    component: () =>
      import( "@/views/AppBoard"),
      redirect: "/board/list",
      children:[
        {
          path: "list",
          name: "boardlist",
          component: ()=> import("@/components/board/BoardList"),
        }
      ]
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;

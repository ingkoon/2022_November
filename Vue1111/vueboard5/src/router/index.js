import Vue from "vue";
import VueRouter from "vue-router";
import HomeView from "../views/HomeView.vue";
import BoardView from "@/views/BoardView";
import BoardDetail from "@/components/BoardDetail";
import BoardWrite from "@/components/BoardWrite";
import BoardList from "@/components/BoardList";
// import BoardUpdate from "@/components/BoardUpdate";

Vue.use(VueRouter);

const routes = [
  {
    path: "/", //localhost:8081/detail/aricleno
    name: "home",
    component: HomeView,
  },
  {
    path: "/board",
    name: "board",
    component: BoardView,
    redirect: "/board/list",
    children: [
      {
        path: "list",
        name: "list",
        component: BoardList,
      },
      {
        path: "detail/:articleNo",
        name: "detail",
        component: BoardDetail,
      },
      {
        path: "write",
        name: "write",
        component: BoardWrite,
      },
    ],
  },
  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;

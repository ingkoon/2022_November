import Vue from "vue";
import VueRouter from 'vue-router'
import AppMain from "@/views/AppMain";
import AppUser from "@/views/AppUser";

Vue.use(VueRouter);

// export default new Vuex.Store({
//   state: {},
//   getters: {},
//   mutations: {},
//   actions: {},
//   modules: {},
// });
const routes=[
    {
        path: "/",
        name:"main",
        component:AppMain,
    },
    {
        path: "/user",
        name:  "user",
        component: AppUser,
    },
    {
        path: "/board",
        name: "board",
        component: ()=> import("@/views/AppBoard"),
        redirect: "/board/list",
        children: [
            {
                path: "/list",
                name: "list",
                component: ()=>("@/components/BoardList"),
            },
            {
                path: "/write",
                name: "write",
                component: ()=>("@/components/BoardWrite"),
            },
            {
                path: "view/:articleno",
                name: "boardview",
                component: ()=>("@/components/BoardView"),
            },
            {
                path: "modify/:articleno",
                name: "boardmodify",
                component: ()=>("@/components/BoardModify"),
            },
            {
                path: "delete/:articleno",
                name: "boarddelete",
                component: ()=>("@/components/BoardDelete"),
            }
        ]
    }
]

 const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
 });

 export default router;
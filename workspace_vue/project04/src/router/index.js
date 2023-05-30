import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/welcome',
    name: 'welcome',
    component: () => import(/* webpackChunkName: "wel", webpackPrefetch:true */ '../views/WelcomeView.vue')
  },
  {
    path: '/databinding/html',
    name: 'dataBindingHtml',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingHtmlView.vue')
  },
  {
    path: '/databinding/input',
    name: 'dataBindingInput',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingInputView.vue')
  },
  {
    path: '/databinding/select',
    name: 'dataBindingSelect',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingSelectView.vue')
  },
  {
    path: '/databinding/check',
    name: 'dataBindingCheck',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingCheckView.vue')
  },
  {
    path: '/databinding/attribute',
    name: 'dataBindingAttribute',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingAttributeView.vue')
  },
  {
    path: '/databinding/list',
    name: 'dataBindingList',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingListView.vue')
  },
  {
    path: '/databinding/class',
    name: 'dataBindingClass',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingClassView.vue')
  },
  {
    path: '/databinding/style',
    name: 'dataBindingStyle',
    component: () => import(/* webpackChunkName: "databinding", webpackPrefetch:true */ '../views/1_databinding/DataBindingStyleView.vue')
  },
  {
    path: '/event/click',
    name: 'eventClick',
    component: () => import(/* webpackChunkName: "event", webpackPrefetch:true */ '../views/2_event/EventClickView.vue')
  },
  {
    path: '/event/change',
    name: 'eventChange',
    component: () => import(/* webpackChunkName: "event", webpackPrefetch:true */ '../views/2_event/EventChangeView.vue')
  },
  {
    path: '/event/key',
    name: 'eventKey',
    component: () => import(/* webpackChunkName: "event", webpackPrefetch:true */ '../views/2_event/EventKeyView.vue')
  },
  {
    path: '/memolist',
    name: 'memoList',
    component: () => import(/* webpackChunkName: "memo", webpackPrefetch:true */ '../views/3_memo/MemoListView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router

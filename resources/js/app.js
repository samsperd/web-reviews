/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
import vuetify from './plugins/vuetify' // path to vuetify export
import InfiniteLoading from 'vue-infinite-loading';
import InstagramEmbed from 'vue-instagram-embed';
import 'material-design-icons-iconfont/dist/material-design-icons.css'

Vue.use(InstagramEmbed);
Vue.use(InfiniteLoading, { /* options */ });

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('menus', require('./components/Menus.vue').default);
Vue.component('first-layout', require('./layouts/default.vue').default);
Vue.component('browseorsearch', require('./layouts/searchorbrowse.vue').default);

Vue.component('welcome', require('./pages/welcome.vue').default);
Vue.component('terms', require('./pages/terms.vue').default);
Vue.component('privacy', require('./pages/privacy.vue').default);
Vue.component('contact', require('./pages/add_to_business.vue').default);
Vue.component('donate', require('./pages/donate.vue').default);
Vue.component('categories', require('./pages/categories.vue').default);
Vue.component('category', require('./pages/category.vue').default);
Vue.component('postlist', require('./pages/postlist.vue').default);
Vue.component('viewer', require('./pages/view.vue').default);
Vue.component('nolistfound', require('./pages/nopostfound.vue').default);
Vue.component('browse', require('./pages/browse.vue').default);
Vue.component('searched', require('./pages/search.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    vuetify,
});

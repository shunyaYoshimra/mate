import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default new Vuex.Store({
})
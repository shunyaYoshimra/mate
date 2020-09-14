import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default new Vuex.Store({
  state: {
    comments: []
  },
  mutations: {
    fetchComments(state, id) {
      state.comments = []
      axios.get(`/api/comments?id=${id}`).then((res) => {
        for (var i = 0; i < res.data.comments.length; i++) {
          state.comments.push(res.data.comments[i])
        }
      }, (error) => {
        console.log(error)
      })
    },
  }
})
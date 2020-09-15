import Vue from 'vue/dist/vue.esm'
import axios from 'axios'

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

const events = new Vue({
  el: '#events',
  data: {
    id: null,
  },
  methods: {
    deleteEvent(id) {
      if (confirm('このイベントを中止します。よろしいですか？？')) {
        axios.delete(`/events/${id}`)
        this.id = id
      }
    }
  }
})

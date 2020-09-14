import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import LikeButton from '../components/likeButton.vue'

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

new Vue({
  el: '#posts',
  components: { LikeButton },
  data: {
    id: null,
    postId: null
  },
  methods: {
    showComment(id) {
      this.postId = id
      console.log(id)
    },
    hideComment(id) {
      this.postId = null
    },
    deletePost(id) {
      if (confirm('この投稿を削除します。よろしいですか？？')) {
        axios.delete(`/posts/${id}`)
        this.id = id
      }
    }
  }
})
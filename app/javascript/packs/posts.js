import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import Store from '../store/store'
import LikeButton from '../components/likeButton.vue'
import CommentsArea from '../components/commentsArea.vue'

const token = document.getElementsByName("csrf-token")[0].getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

new Vue({
  el: '#posts',
  store: Store,
  components: { LikeButton, CommentsArea },
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
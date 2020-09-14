<template>
  <div>
    <transition name="fade" mode="out-in">
      <div v-if="isLiked" key="liked" @click="deleteLike()">
        <span class="right">
          <i class="material-icons red-text text-lighten-3">favorite</i>
          {{ count }}
        </span>
      </div>
      <div v-else key="unlike" @click="registerLike()">
        <span class="right">
          <i class="material-icons grey-text">favorite</i>
          {{ count }}
        </span>
      </div>
    </transition>
  </div>
</template>

<script>
import axios from "axios";
const token = document
  .getElementsByName("csrf-token")[0]
  .getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;

export default {
  props: ["userId", "postId"],
  data() {
    return {
      likeList: []
    };
  },
  computed: {
    count() {
      return this.likeList.length;
    },
    isLiked() {
      if (this.likeList.length === 0) {
        return false;
      }
      return Boolean(this.findLikeId());
    }
  },
  created: function() {
    this.fetchLikeByPostId().then(result => {
      this.likeList = result;
    });
  },
  methods: {
    fetchLikeByPostId: async function() {
      const res = await axios.get(`/api/likes/?post_id=${this.postId}`);
      if (res.status !== 200) {
        process.exit();
      }
      return res.data;
    },
    registerLike: async function() {
      const res = await axios.post("/api/likes", { post_id: this.postId });
      if (res.status !== 201) {
        process.exit();
      }
      this.fetchLikeByPostId().then(result => {
        this.likeList = result;
      });
    },
    deleteLike: async function() {
      const likeId = this.findLikeId();
      const res = await axios.delete(`/api/likes/${likeId}`);
      if (res.status !== 200) {
        process.exit();
      }
      this.likeList = this.likeList.filter(n => n.id !== likeId);
    },
    findLikeId: function() {
      const like = this.likeList.find(like => {
        return like.user_id === this.userId;
      });
      if (like) {
        return like.id;
      }
    }
  }
};
</script>

<style scoped>
.right {
  transform: translateY(-20px);
}
</style>
<template>
  <div class="comment">
    <input class="comment-form" type="text" placeholder="コメント" v-model="content" />
    <button class="btn-floating btn-small pulse indigo" @click="createComment()">
      <i class="material-icons">add</i>
    </button>
    <transition-group name="fade">
      <div v-for="comment in comments" :key="comment.id">
        <div class="comment-area">
          <small>{{ comment.username }}</small>
          <small class="right">{{ comment.created_at | moment }}</small>
          <p>{{ comment.content }}</p>
        </div>
        <hr />
      </div>
    </transition-group>
  </div>
</template>

<script>
import axios from "axios";
import Store from "../store/store";
import { mapState } from "vuex";
import moment from "moment";
const token = document
  .getElementsByName("csrf-token")[0]
  .getAttribute("content");
axios.defaults.headers.common["X-CSRF-Token"] = token;
export default {
  filters: {
    moment: function(date) {
      return moment(date).format("YYYY/MM/DD HH:mm");
    }
  },
  props: ["postid"],
  data() {
    return {
      content: ""
    };
  },
  computed: {
    ...mapState(["comments"])
  },
  mounted() {
    this.$store.commit("fetchComments", this.postid);
  },
  methods: {
    createComment() {
      axios
        .post(`/api/comments?id=${this.postid}`, {
          comment: { content: this.content }
        })
        .then(res => {
          this.comments.unshift(res.data.comment);
          this.content = "";
        });
    }
  }
};
</script>

<style scoped>
.comment {
  padding: 0 10px;
}
</style>
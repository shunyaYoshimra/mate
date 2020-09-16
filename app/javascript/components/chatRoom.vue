<template>
  <div>
    <div class="message-area">
      <transition-group name="fade">
        <div v-for="message in messages" :key="message.id">
          <div :class=" messageStyle(message.user_id) ? 'current-user': 'other-user' " class="card">
            <div class="card-content">
              {{message.content}}
              <p>
                <small>{{ message.created_at | moment }}</small>
              </p>
            </div>
          </div>
        </div>
      </transition-group>
    </div>
    <div class="row center message_form">
      <div class="input-field inline">
        <div class="col">
          <textarea
            id="message-form"
            class="materialize-textarea"
            v-model="messageContent"
            cols="30"
            rows="10"
            placeholder="メッセージ"
          ></textarea>
        </div>
        <div class="col">
          <button class="btn-floating pulse pink" @click="createMessage()">
            <i class="material-icons">add</i>
          </button>
        </div>
      </div>
    </div>
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
  props: ["roomid", "userid"],
  data() {
    return {
      messageContent: ""
    };
  },
  computed: {
    ...mapState(["messages"]),
    messageStyle() {
      return function(id) {
        if (id === this.userid) {
          return true;
        }
      };
    }
  },
  mounted() {
    this.$store.commit("fetchMessages", this.roomid);
  },
  methods: {
    createMessage() {
      axios
        .post(`/api/messages?id=${this.roomid}`, {
          message: { content: this.messageContent }
        })
        .then(
          res => {
            this.messages.push(res.data.message);
            this.messageContent = "";
          },
          error => {
            console.log(error);
          }
        );
    }
  }
};
</script>

<style scoped>
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
.fade.enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-move {
  transition: transform 0.5s;
}
.card {
  width: 60%;
}
.current-user {
  margin-left: auto;
  background-color: #f5f5f5;
}
.message_form {
  position: fixed;
  bottom: 100px;
  width: 100%;
  z-index: 20;
}
.message-area {
  margin-bottom: 150px;
}
</style>
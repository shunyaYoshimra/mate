import Vue from 'vue/dist/vue.esm'
import ChatRoom from '../components/chatRoom.vue'
import Store from '../store/store'

var chatRoom = new Vue({
  store: Store,
  components: { ChatRoom },
  el: '#chat-room',
})
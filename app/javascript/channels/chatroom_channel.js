// import consumer from "./consumer"

// consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//   received(data) {
//     messagesContainer.insertAdjacentHTML('beforeend', data);
//   },


//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });


// import consumer from "./consumer";

// const initChatroomCable = () => {
//   const messagesContainer = document.getElementById('messages');
//   if (messagesContainer) {
//     const id = messagesContainer.dataset.chatroomId;

//     consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//       received(data) {
//         console.log(data); // called when data is broadcast in the cable
//       },
//     });
//   }
// }

// export { initChatroomCable };


// consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//   received(data) {
//     messagesContainer.insertAdjacentHTML('beforeend', data);
//   }
// });

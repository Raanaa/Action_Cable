
(function() {
  App.room = App.cable.subscriptions.create("RoomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {

        
         var div = document.createElement("div");
         var str1 = "Join  : ";
         var str2 = data['title'];

         var res = str1.concat(str2);
         var size = res.fontsize(5);
         var bold = size.bold();
         
         div.innerHTML = bold.link(data['chat_room_url']);
         document.getElementById("messagestitle").appendChild(div);

        


    }
  });

}).call(this);






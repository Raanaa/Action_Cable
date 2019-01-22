
(function() {
  var cable_chatroom_id, chatroom_regex, new_id;
  chatroom_regex = /(\d*).$/g;
  cable_chatroom_id = document.URL;
 

  App.room = App.cable.subscriptions.create ({
    channel: "RoomMessageChannel",
    id: parseFloat(cable_chatroom_id.match(chatroom_regex)[0])
  }, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {

      
         var div = document.createElement("div");
         var str1 = data['user_name'] + " at " + data['date'] + " says : ";
         var str2 = data['body'];
         var bold = str2.bold();
         var size = bold.fontsize(5);
         
         var result = str1 + "<br />" + size + "<br />"+"_________________________________________________________________" +"<br />" +"<br />" ;

          div.innerHTML =  result 
          document.getElementById("messages").appendChild(div);
        

        

    }
  });

}).call(this);



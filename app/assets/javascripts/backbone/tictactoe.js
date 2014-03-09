#= require_self

var Tictactoe = Backbone.View.extend({

  data: null,
  finished: null,
  waiting_ai: null,

  events: {
    "click .square":          "play",
  },

  initialize: function() {
    this.data = [["","",""],["","",""],["","",""]];
    this.waiting_ai = false;
    this.finished = false;
  },

  play: function(event) {
    var square = $(event.target);
    
    if( this.waiting_ai || this.finished ) return;
    if( square.html() != "" ) return;

    this.waiting_ai = true;

    this.addPiece(square, 0);

    $.post( "/play", { board_data: this.data}, _.bind(function( data ) {
      console.log(data);
      if( data.finish ) {
        if(data.user_lost) {
          $('.board .bg-danger').show();
        }
        this.finished = true;

      }
      var square = $('.square[data-row='+data.result[0]+'][data-column='+data.result[1]+']')
      this.addPiece(square, 1)
      this.waiting_ai = false;
    }, this) );
  },

  addPiece: function(square, player){
    this.data[square.data('row')][square.data('column')] = player;
    square.html(this.fromPlayerToPiece(player));

    square.addClass("piece_" + this.fromPlayerToPiece(player) );

  },

  fromPlayerToPiece: function(player){
    return (player ? 'O' : 'X');
  }


});


$( document ).ready(function() {
  new Tictactoe({el: $('.board')})
});

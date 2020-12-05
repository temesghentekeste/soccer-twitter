$(function () {
  console.log('JQuery is loading properly');

 $('.vote').on("click", ".upvote, .downvote",  function() {
   var opinion_id = $(this).parent().data("id"),
       is_upvote = $(this).hasClass("upvote");
       console.log((`#vote-actions-${opinion_id} .score`), is_upvote);

   $.ajax({
     url: "/opinion/vote",
     method: "POST",
     data: { opinion_id: opinion_id, upvote: is_upvote},
     success: function(){
           console.log('Success ...');
     }
   })
 })
})

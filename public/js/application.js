$(document).ready(function() {

$(".post-response-button").on("click", function(event) {
  event.preventDefault();
  $postId = $("article > div").attr("id");
  var $pathname = "/posts/" + $postId + "/responses/new"
  location.href=$pathname;
})

$(".responder").on("click", function(event) {
  event.preventDefault();
  // var $pathname = $postId + "/responses/new"
  $responseId = $(this).parent().parent().parent().parent().attr("id");
  $postId = $("article > div").attr("id");
  location.href = "/responses/" + $responseId + "/responses/new";
})

// binding on favorite button
$(".check-img").on("click", function(event) {
  event.preventDefault();
  $postId = $("article > div").attr("id")
  $faveId = $(this).parent().attr("id");
  postFavorite($faveId, $postId);
  // showFavorite($faveId);
})

// binding on upvote button
  $(".vote-img").on("click", function(event) {
    event.preventDefault();
    $respId = $(this).parent().parent().parent().attr("id");
    addVote($respId);
  })

});

function goToPostResponse(id) {
  $.ajax({
    method: "GET",
    url: "/posts/" + id + "/responses/new",
    success: function(response) {
      console.log("going")
    },
  })
}

function goToResponse(respId, postId) {
  $.ajax({
    method: "GET",
    url: "/",
    success: function(response){
      console.log(response);
    }
  })
}



function postFavorite(responseId, postId) {
  $.ajax({
    method: "POST",
    url: "/responses/" + responseId + "/favorite/new",
    data: {response_id: responseId, post_id: postId},
    success: function(response) {
      showFavorite($faveId);
      // console.log(response);
    }
  })
}

function showFavorite(id) {
  $("#" + id + " > .check-img").attr("src", "/img/check.png");
}


function addVote(voteId) {
  $.ajax({
    method: "Post",
    url: "/posts/votes/new",
    data: {response_id: voteId },
    success: function(response) {
     updateVote(response, voteId);
    }
  })
}

function updateVote(response, id) {
  if (response == "failure") {
    console.log("failed");
  } else {
    $("#" + id + " > div > p .response-vote").html(response["voteTally"]);
  }
}

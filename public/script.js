


function addvideo(video) {
  var videoCard = '<figcacption class="figcaption"><div class="fig-header">' + video.title + '</div><figure>';
      videoCard += '<iframe width="292" height="219" src="' + video.url + '" frameborder="0" allowfullscreen></iframe>';
      videoCard += '</figure><div class="vid-details">Details' + video.description + '</div>';
      videoCard += '<button id="editVid" data-id="' + video.id + '">Edit</button>';
      videoCard += '<button id="displayBig" data-id="' + video.id + '">View</button></figcacption>';
  $('#vids').prepend(videoCard);
}



function getVideos() {
  $.ajax({
    type: 'GET',
    url: '/videos',
    dataType: 'json'
}).done(function(data){
  $.each(data, function(index, item){
    addvideo(item)
  })
 })
}



  //  $(vids).append('iframe width="560" height="315" src="http://www.youtube.com/embed/"' + value.url + '" frameborder="0" allowfullscreen></iframe>');
  //  })
  // }



//   }).done(function(video){
//     $.each(data, function(index, item){
//       vids.append('<iframe src=" ' + value.url + '"</iframe>')
//     });
//   });
// }

// function createVideo(){
//   $.ajax({
//     type:'POST'
//     url: '/videos',
//     dataType: 'json',
//     data: {video: }
//   })
// }


$(document).ready(function(){
 
  // $('#todo-list').on('click', '.destroy', deleteItem);
});
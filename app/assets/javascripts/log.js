$(function() {

  function imageHTML(url){
    var html = `<div id="edit-avatar-image">
                  <p class="avatar-text">新しいプロフィール写真</p>
                  <img class="edit-avatar-image top-space" src="${url}" width="120" height="120">
                </div>`;
    return html;
  };

  $(document).on("click", ".btn-circle-flat", function(){
    $(this).parent().css("display", "none");
  });

  $(document).on("change", ".edit-avatar", function(e){
    $("#edit-avatar-image").remove();
    var file = e.target.files[0];
    if (file){
      var blobUrl = window.URL.createObjectURL(file);
      var html = imageHTML(blobUrl);
      $(".edit-acount-avatar").append(html);
    };
  });

});

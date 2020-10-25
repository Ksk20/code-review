$(document).on('turbolinks:load', function() {
    $('#getBookInfo').click( function( e ) {
        e.preventDefault();
        const isbn = $("#isbn").val();
        const url = "https://api.openbd.jp/v1/get?isbn=" + isbn;

        $.getJSON( url, function( data ) {
          var result = data[0];
          if( result == null ) {
            alert("データが見つかりません");
          } else {
            var summary = result.summary;
            if( summary.cover == "" ){
              $("#thumbnail").html('<img src=\"\" />');
            } else {
              $("#thumbnail").html('<img src=\"' + summary.cover + '\" style=\"border:solid 1px #000000\" />');
            }
            $("#title").text(summary.title);
            $("#publisher").text(summary.publisher);
            $("#volume").text(summary.volume);
            $("#series").text(summary.series);
            $("#author").text(summary.author);
            $("#pubdate").text(summary.pubdate);
            $("#cover").text(summary.cover);
            $("#description").text(result.onix.CollateralDetail.TextContent[0].Text);
            //form内に設定
            $("#book-name").val(summary.title + ","+summary.author+","+summary.publisher);
            $("#image_url").val(summary.cover);
          }
        });
    });
});
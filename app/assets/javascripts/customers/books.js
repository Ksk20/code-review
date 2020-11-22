
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

　　$('#getEssayInfo').click( function( e ) {
      e.preventDefault();
      const naid = $("#naid").val();
      　$.ajax({
         url:"http://ci.nii.ac.jp/naid/" + naid + ".rdf",
         type:'GET',
         dataType : 'xml',
        })
      //.then(function(data) {
      //  console.log("success")
      // console.log(data)
      //})
      .done(function(data) {
        // console.log(data, typeof data)
        // const xmlDoc = $.parseXML( data );
        // console.log('xmlDoc', xmlDoc)
        const $xml = $( data );
        // console.log('$xml', $xml)
        const $title = $xml.find("dc\\:title");
        $( "#essay_title" ).append( $title[0].innerHTML );
        const $publisher = $xml.find("dc\\:publisher");
        $( "#essay_publisher" ).append( $publisher[0].innerHTML );
        const $publishername = $xml.find("prism\\:publicationName");
        $( "#essay_publicationName" ).append( $publishername[0].innerHTML );
        const $volume = $xml.find("prism\\:volume")[0];
        $( "#essay_volume" ).append( $volume );
        const $number = $xml.find("prism\\:number")[0];
        //console.log($($number).text())
        $( "#essay_number" ).append( $number.innerHTML );
        const $creator = $xml.find("dc\\:creator");
        $( "#essay_creator" ).append( $creator[0].innerHTML );
        const $date = $xml.find("dc\\:date");
        $( "#essay_pubdate" ).append( $date[0].innerHTML );
        const $type = $xml.find("rdf\\:type");
        //console.log($($type).text())
        $( "#essay_cover" ).append( $type.innerHTML );
        const $description = $xml.find("dc\\:description");
        $( "#essay_description" ).append( $description[0] );
        const $link = $xml.find("rdfs\\:seeAlso");
        //console.log($xml.find("rdfs\\:seeAlso"))
        //console.log($xml.find("rdfs\\:seeAlso")[0].attributes[0].nodeValue)
        //console.log($xml.find("rdfs\\:seeAlso")[0]['attributes'][0]['nodeValue'])
        $( "#essay_link" ).append( $link[0].attributes[0].nodeValue);

        //form内に設定
        $("#book-name").val($title[0].innerHTML+ "、"+$creator[0].innerHTML+"／著、"+$publisher[0].innerHTML+ "、刊行物名:"+$publishername[0].innerHTML+"、"+$date[0].innerHTML);

      })
      .fail(function(data) {
        console.log("fail")
        console.log(data["responseText"])
          // JSONデータを受信した後に実行する処理、中の処理は非同期で行われる
         var essay_result = data[0];
          if( essay_result == null ) {
            alert("データが見つかりません");
          } else {
            var summary = essay_result.summary;
          }

      　});
　  });
});
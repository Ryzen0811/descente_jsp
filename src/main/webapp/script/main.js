$(document).ready(function () {
  $(function () {
    $.ajax({
      url: "./json/shoes.json",
      dataType: "json",
      success: function (data) {
        if (data.length > 0) {
          for (var i in data) {
            var title = data[i].title;
            var price = data[i].price;
            var url = data[i].url;

            $(".box")
              .eq(i)
              .append(
                '<div><a href="#"><img src="img/' +
                  data[i].url +
                  '" alt="' +
                  title +
                  '"/></a></div>'
              );
            $(".box")
              .eq(i)
              .append('<h5><a href="#">' + data[i].title + "</a></h5>");
            $(".box")
              .eq(i)
              .append("<span>" + data[i].price + "</span>");
          }
        }
      },
    });
  });
});

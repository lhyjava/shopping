var div;
var input;
function simgclick(obj) {
	var name = $(obj).attr("src");
	div.remove();
	input.val(name);
}

function imgselect(obj) {
	input = $(obj);
	$(this).focus(false);
	div = $("<div><div>");
	$("body").append(div);
	div.css("width", "100%");
	div.css("height", "100%");
	div.css("position", "fixed");
	div.css("top", "0px");
	div.css("left", "0px");
	div.css("background-color", "gray");

	$.ajax({
		url : 'getallimageforajax.htm',
		type : 'post',
		async : true,
		data : {

		},
		success : function(data) {
			var retobj = JSON.parse(data);
			var arr = retobj.imagelist;
			for (var i = 0; i < arr.length; i++) {
				var img = $("<img onclick='simgclick(this);'></img>");
				img.attr("src", "img1/"+arr[i]);
				img.css("width", "200px");
				img.css("height", "200px");
				img.css("padding", "3px");
				div.append(img);
			}
		}
	});

	div.show();

}

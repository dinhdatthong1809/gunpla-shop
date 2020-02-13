/**
 * click image to browsing files
 */

$(document).ready(function() {
	$('#txtHinh').attr("onchange", "readURL(this);");
	
	$("#btnTaiHinh").click(function() {
	    $("#txtHinh").focus().click();
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#userAvatar').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

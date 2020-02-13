/**
 * click image to browsing files
 */

$(document).ready(function() {
	$('#txtHinh').attr("onchange", "readURL(this, '#productImage');");
	$('#txtHinh2').attr("onchange", "readURL(this, '#productImage2');");
	$('#txtHinh3').attr("onchange", "readURL(this, '#productImage3');");
	
	$("#btnTaiHinh").click(function() {
	    $("#txtHinh").focus().click();
	});
	$("#btnTaiHinh2").click(function() {
		$("#txtHinh2").focus().click();
	});
	$("#btnTaiHinh3").click(function() {
		$("#txtHinh3").focus().click();
	});
});

function readURL(input, imgId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $(imgId).attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

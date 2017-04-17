// JavaScript Document


function faq_open(el)
{
    var $con = $(el).closest("li").find(".con_inner");
	var $con2 = $(el).closest('li').find('.icon_onoff');
    if($con.is(":visible")) {
        $con.slideUp();
		$con2.removeClass('off');
    } else {
        $("#faq_con .con_inner:visible").css("display", "none");
		$con2.addClass('off');
        $con.slideDown(
            function() {
                // 이미지 리사이즈
                //$con.viewimageresize2();
            }
        );
    }

    return false;
}
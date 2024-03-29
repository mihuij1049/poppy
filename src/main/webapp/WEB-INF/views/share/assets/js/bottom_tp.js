
/** 검색탭 영역 시작! */
// 검색 쿠키 값 가져오기 메서드 정의
$(".click-searchtab").click(function() {
	// 검색 쿠키 값 가져오기 메서드 정의
	var getCookie = function(name) {
		var value= document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value? value[2] : null;
	}
	// 쿠키 값 가져오기
	var searchGoods = getCookie("searchGoods");
	searchGoods = unescape(searchGoods);
	console.log(searchGoods);
	// 가져온 쿠키값을 배열에 담기
	var searchList = [];
	searchGoods.split(",");
	// 배열에 담긴 검색어를 화면에 뿌려주기
	for (var i = 0; i<searchList.length; i++) {
		var temp = $("<p></p>");
		temp.text(searchList[i]);
		$("#recent-search").append(temp);
	}
	
    $(".container").toggleClass("searchtab-open");
})
/** 검색탭 영역 끝! */

/** 신상품/인기상품 */

	$("#new-good").click(function() {
		$(".panel-title-new").addClass("box2");
	});
$("#best-good").click(function() {
	$(".panel-title-best").addClass("box2");
});


/** 카테고리탭 초기화 */

$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title-new").removeClass("box2");
    $(".panel-title-new").addClass("box1");
})

$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title-best").removeClass("box2");
    $(".panel-title-best").addClass("box1");
})

$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title1").removeClass("box2");
    $(".panel-title1").addClass("box1");
    $(".arrow-down11").removeClass("rotate1");
    $('.panel-collapse').collapse('hide');
})
$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title2").removeClass("box2");
    $(".panel-title2").addClass("box1");
    $(".arrow-down22").removeClass("rotate2");
    $('.panel-collapse').collapse('hide');
})
$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title3").removeClass("box2");
    $(".panel-title3").addClass("box1");
    $(".arrow-down33").removeClass("rotate3");
    $('.panel-collapse').collapse('hide');
})
$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title4").removeClass("box2");
    $(".panel-title5").addClass("box1");
    $(".arrow-down44").removeClass("rotate4");
    $('.panel-collapse').collapse('hide');
})
$('#myModal').on('hidden.bs.modal', function() {
	$(".panel-title5").removeClass("box2");
    $(".panel-title5").addClass("box1");
    $(".arrow-down55").removeClass("rotate5");
    $('.panel-collapse').collapse('hide');
})
/** 카테고리탭 초기화 종료 */

/** 카테고리탭 이미지 회전 */
$(function() {
    $(".collapse").collapse({ toggle: false })
});
$(function() {
    $("#accordion-toggle1").on('click', function() {
        $(".arrow-down11").toggleClass("rotate1");
        $(".panel-title1").toggleClass("box2");
        
    });
});
$(function() {
    $("#accordion-toggle2").on('click', function() {
        $(".arrow-down22").toggleClass("rotate2");
        $(".panel-title2").toggleClass("box2");
    });
});

$(function() {
    $("#accordion-toggle3").on('click', function() {
        $(".arrow-down33").toggleClass("rotate3");
        $(".panel-title3").toggleClass("box2");
    });
});

$(function() {
    $("#accordion-toggle4").on('click', function() {
        $(".arrow-down44").toggleClass("rotate4");
        $(".panel-title4").toggleClass("box2");
    });
});

$(function() {
    $("#accordion-toggle5").on('click', function() {
        $(".arrow-down55").toggleClass("rotate5");
        $(".panel-title5").toggleClass("box2");

    });
});
/** 카테고리탭 이미지회전 끝! */

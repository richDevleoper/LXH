$(function(){
    //전체 메뉴
    $('.btn-gnb').click(function(){
        $('.dimmed, #total-menu').show();
        $("header").addClass("on");
    })

    $('#total-menu .btn-close, .dimmed').click(function(){
        $('.dimmed, #total-menu').hide();
        $("header").removeClass("on");
    })

    //좌측 메뉴
    $('#page-left .has-depth').click(function(){
        $(this).toggleClass('active').siblings('.depth2').slideToggle();
    })

    //조직도
    $('#orgSelAll').change(function() {          
        ($('#orgSelAll').is(":checked"))?$("#org-tree").jstree().check_all(true):$("#org-tree").jstree().uncheck_all(true);
    }); 

//    $('#org-tree').jstree({
//        "plugins" : ['checkbox','search'],
//        "search" : {
//            "show_only_matches" : true,
//            "show_only_matches_children" : true,
//        },
//    })
//    .on("check_node.jstree uncheck_node.jstree", function (e, data) {  								
//        if (e.type == "uncheck_node") {
//            $("#orgSelAll").prop( "checked", false );                
//        }
//        else if (e.type == "check_node") {					
//            if ($(this).jstree().get_json('#', {flat:true}).length === $(this).jstree().get_checked(true).length)
//                $("#orgSelAll").prop( "checked", true ); 					
//        }
//    }); 

    // tree 목록형 공통
    /*$('.tree-list').jstree({
        "plugins" : ['search'],
        "search" : {
            "show_only_matches" : true,
            "show_only_matches_children" : true,
        },
    });*/

    // tree 체크형 공통
    $('.tree-check').jstree({
        "plugins" : ['checkbox','search'],
        "search" : {
            "show_only_matches" : true,
            "show_only_matches_children" : true,
        },
    })
    .on("check_node.jstree uncheck_node.jstree", function (e, data) {  								
        if (e.type == "uncheck_node") {
            $("#orgSelAll").prop( "checked", false );                
        }
        else if (e.type == "check_node") {					
            if ($(this).jstree().get_json('#', {flat:true}).length === $(this).jstree().get_checked(true).length)
                $("#orgSelAll").prop( "checked", true ); 					
        }
    }); 

    // tabulator
    $(".tabulator-data-tree-control-collapse").parent().css("border-color","#a72b2a");
   
    $('.btn-org').click(function(){
    })

    $('.org-modal .btn-cancel, .org-modal .btn-close, .modal-dimmed').click(function(){
        $('.modal-dimmed, .org-modal').hide();
    });

    // tab
    $(".tab-group > .tab-btn > button").on('click',function() {
        var $idx = $(this).index();

        $(this).addClass("on").siblings().removeClass("on");
        $(this).closest(".tab-group").children(".tab-inr").find(" > .tab-box:eq("+ $idx +")").addClass("on").siblings().removeClass("on");
    });

    // list-table.toggle
    $(".list-wrap.toggle li thead tr").on('click',function() {
        $(this).parents("li").toggleClass("active");
        $(this).parent().next("tbody").find(".toggle-box").stop().slideToggle('400');
    });

    // input[file]
    $(".input-text.file input[type=file]").on('change',function(){
        var file = $(this).val();
        $(this).parent().find(".file-path input[type=text]").val(file);
    });

    // file delete
    $(".file-path button").on('click',function() {
        $(this).parent().siblings("input[type=file]").val("");
        $(this).parent().find("input[type=text]").val("");
    });

    //file-list delete
    $(".file-list .file-path button").on('click',function() {
        $(this).closest("li").remove();
    });

    // themb-box
    $(".themb-box button").on('click',function() {
        $(this).parents(".themb-box").remove();
    });

    // datapicker
    $(".datepicker").datepicker();
    if($(".datepicker1").length>0){
    	$(".datepicker1").datepicker(); // 한 페이지 내 같은 아이디의 객체가 있을 경우 각각 나눠서 이벤트 생성
    }
    
    $(document).on('click','.input-date i',function() {
        $(this).parent().find("input").datepicker("show");
    });
})

function org_search(){
    var text = $('#org-form input').val();
    $('#org-tree').jstree(true).search(text);
}

//modal open
$(document).on('click', 'modal_trigger', function() {
    $(".modal_close").trigger("click");

    var name = $(this).attr("data-targer");
    var modal_name = modal(name);
    $("body").append(mosdal_name);

    $("#" + name+",.dim").stop().fadeIn('fast').css({"margin-top":"-" + $("#" + name).height()/2 + "px"});
    $("#" + name).attr("tabindex","0").focus();
});

//modal close
$(document).on('click', 'modal_close, .modal.popup > button.close', function() {
    var popup = $(this).parents('.modal.popup');

    popup.next(".dim").stop().fadeout('fast');
    popup.stop().fadeOut('fast',function() {
        popup.next(".dim").remove();
        popup.remove();
    });
});




$(function() {
    // 조직 버튼
    $('.btn-organization').click(function(){
    	console.log('btn-organization');
        $('.modal-dimmed, .organization-modal').show();
    })

    // 직잭 버튼
    $('.btn-position').click(function(){
    	console.log('btn-position');
        $('.modal-dimmed, .position-modal').show();
    })

    //직책도
    $('#positionSelAll').change(function() {          
        ($('#positionSelAll').is(":checked"))?$("#position-tree").jstree().check_all(true):$("#position-tree").jstree().uncheck_all(true);
    }); 

    $('#position-tree').jstree({
        "plugins" : ['checkbox','search'],
        "search" : {
            "show_only_matches" : true,
            "show_only_matches_children" : true,
        },
    })
    .on("check_node.jstree uncheck_node.jstree", function (e, data) {  								
        if (e.type == "uncheck_node") {
            $("#positionSelAll").prop( "checked", false );                
        }
        else if (e.type == "check_node") {					
            if ($(this).jstree().get_json('#', {flat:true}).length === $(this).jstree().get_checked(true).length)
                $("#positionSelAll").prop( "checked", true ); 					
        }
    }); 

    // 도움말 Full Process여부
    $('#btnAdviceFullProcess').click(function() {
        $('.modal-dimmed, .advice-full-process-modal').show();
    })

    // 도움말 과제리더벨트
    $('#btnAdviceReaderBelt').click(function() {
        $('.modal-dimmed, .advice-reader-belt-modal').show();
    })

    // 도움말 키워드
    $('#btnAdviceKeyword').click(function() {
        $('.modal-dimmed, .advice-keyword-modal').show();
    })

    // 도움말 산출 Logic
    $('#btnAdviceLogic').click(function() {
        $('.modal-dimmed, .advice-logic-modal').show();
    })



})

// 직책조회 모달
$(document).on('click', '.btn-member-position-search-modal', function() {
    console.log('직책조회');
    $('.modal-dimmed, .member-position-search-modal').show();
})

//사원조회 모달
$(document).on('click', '.btn-member-search-modal', function() {
    console.log('사원조회');
    $('.modal-dimmed, .member-search-modal').show();
})

// 관련쪽지조회 모달
$(document).on('click', '.btn-psmg-search-modal', function() {
    console.log('관련쪽지조회');
    $('.modal-dimmed, .psmg-search-modal').show();
})

//// 팀멤버 추가
//$(document).on('click', '.btn-team-member-add', function() {
//    let oParent = $(this).closest('tr')
//    let oClone = oParent.clone();
//    oClone.find('input').val('');
//    oClone.find('th > label').text('팀멤버');
//    oClone.find('td:nth-child(3), td:nth-child(4), td:nth-child(5), td:nth-child(6)').text('');
//    oClone.find('.btn-team-member-add').text('삭제');
//    oClone.find('.btn-group button').removeClass('btn-team-member-add').addClass('btn-team-member-remove');
//
//    oParent.after(oClone);
//})
//
//// 팀멤버 삭제
//$(document).on('click', '.btn-team-member-remove', function() {
//    $(this).closest('tr').remove();
//})

// 체크박스 (전체선택)
$(document).ready(function () {
    $("#ch_all").on("click", function () {
        if ($("input:checkbox[id='ch_all']").prop("checked")) {
            $("input[type=checkbox]").prop("checked", true);
        } else {
            $("input[type=checkbox]").prop("checked", false);
        }
    });
});


$('.ch_all').on('click', function () {
	var get_id = $(this).attr('id');
	if($("input:checkbox[id='"+get_id+"']").prop("checked")){
		$(this).parentsUntil('.list-table').find("input[type=checkbox]").prop("checked", true);
	} else {
		$(this).parentsUntil('.list-table').find("input[type=checkbox]").prop("checked", false);
	}
});





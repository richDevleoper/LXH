
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

    $('#org-tree').jstree({
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

    // tree 목록형 공통
    $('.tree-list').jstree({
        "plugins" : ['search'],
        "search" : {
            "show_only_matches" : true,
            "show_only_matches_children" : true,
        },
    });

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
        $('.modal-dimmed, .org-modal').show();
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
    $(document).on('click','.input-date i',function() {
        $(this).parent().find("input").datepicker("show");
    });
})

function org_search(){
    var text = $('#org-form input').val();
    $('#org-tree').jstree(true).search(text);
}

function getQueryStringObject() {
    var a = window.location.search.substr(1).split('&');
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=', 2);
        if (p.length == 1)
            b[p[0]] = "";
        else
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
}
const qString = getQueryStringObject();

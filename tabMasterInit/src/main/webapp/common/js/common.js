$(function () {

    // 검색박스
    $('#header .lnb .lnb-sch').on('click',function (e) {
        e.stopPropagation();
        if(!$('#header .lnb .lnb-search-key').is(':visible')) $('#header .lnb .lnb-search-key').eq(0).show();
        $('.all-cate-top-wrap').removeClass('on');
    });
    $('body').on('click',function () {
        $('#header .lnb .lnb-search-key').hide();
    });
    $('#header .lnb .lnb-search-key .ft .aright').on('click',function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('#header .lnb .lnb-search-key').hide();
    });
    $('#header .lnb .lnb-search-key .tab > a').on('click',function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('#header .lnb .lnb-search-key').hide();
        if($(this).index() == 1) {
            $('#header .lnb .lnb-search-key').eq(1).show();
        }else{
            $('#header .lnb .lnb-search-key').eq(0).show();
        }
    });

    // 전체카테고리
    var idx;
    $(document).on('mouseenter','.lnb-list-wrap a',function (e) {
        $('.lnb-list-wrap li').removeClass('on');
        $(this).parents('li').addClass('on');
        $('.lnb-sub-wrap div').hide();
        idx = $(this).parents('li').index();
        $('.lnb-sub-wrap').show();
        $('.lnb-sub-wrap div').eq(idx).show();
        e.stopPropagation();
    });
    $(document).on('mouseleave','.all-cate-top-wrap',function (e) {
        $('.lnb-list-wrap li').removeClass('on');
        $('.lnb-sub-wrap>div').hide().eq(0).show();
        $('.all-cate-top-wrap').removeClass('on');
        e.stopPropagation();
    });
    $(document).on('mouseenter','.lnb-sub-wrap',function (e) {
        $('.lnb-list-wrap li').removeClass('on');
        $('.lnb-list-wrap li').eq(idx).addClass('on');
        $('.lnb-sub-wrap div').hide();
        $('.lnb-sub-wrap div').eq(idx).show();
        e.stopPropagation();
    });
    $('#header .nav .nav-menu-wrap>li:first-child>a').on('click',function (e) {
        $('.all-cate-top-wrap').toggleClass('on');
        $('.lnb-list-wrap li:first-child').addClass('on');
        $('#header .lnb .lnb-search-key').hide();
        e.stopPropagation();
        return false;
    });

    // 셀렉트박스 플러그인
    $('select').selectric();

    // 상단고정 메뉴
    if($('#header .nav').size() > 0) {
        var fixedOffset = $('#header .nav').offset().top;
        $(window).scroll(function(){
            var sticky = $('html'),
                scroll = $(window).scrollTop();
            if (scroll >= fixedOffset) sticky.addClass('fixed');
            else sticky.removeClass('fixed');
        });

        // 퀵메뉴 업
        $('#footer .right-quick-wrap .bottom-nav-wrap button').on('click',function () {
            $(window).scrollTop(0);
        });

        // 퀵메뉴 최근본상품
        $('#quick-slide-wrap').owlCarousel({
            autoWidth: true,
            mouseDrag:false,
            onInitialized  : callback_quick_slide,
            onTranslated : callback_quick_slide
        });
        function callback_quick_slide(event) {
            var element   = event.target;
            var items     = $('#quick-slide-wrap .owl-dot').size();
            var item      = event.item.index + 1;
            $('#footer .right-quick-wrap .recently-goods-wrap .slide-page-nav').html('');
            for (var i=0; i< items; i++) {
                var page_item = document.createElement('a');
                page_item.innerHTML = '<span>'+(i + 1)+'</span>';
                if ((i + 1) == item) {page_item.className = 'on'}
                $('#footer .right-quick-wrap .recently-goods-wrap .slide-page-nav').append(page_item);
            }
        }
        $(document).on('click','#footer .right-quick-wrap .recently-goods-wrap .slide-page-nav a',function (e) {
            e.preventDefault();
            $("#quick-slide-wrap").trigger("to.owl.carousel", $(this).index());
        });
    }

    // 팝업 버튼으로 호출
    $('.pop-call').on('click',function (e) {
        e.preventDefault();
        var obj = $(this).data('popup');
        $(obj).bPopup();
    });
    // 팝업 닫기
    $('.pop-wrap [class*=btn][class*=close]').on('click',function () {
        $(this).closest('.pop-wrap').bPopup().close();
    });

    // 인풋 파일
    var uploadFile = $('.ui-file .btn-upload');
    uploadFile.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $(this).siblings('.ipt-name').val(filename);
    });


    // 아코디언
    $('.accordion .accordion-t .btn-accordion').on('click',function (e) {
        e.preventDefault();
        $('.accordion').find('.accordion-t').removeClass('on');
        $(this).closest('.accordion-t').addClass('on');
    })
});
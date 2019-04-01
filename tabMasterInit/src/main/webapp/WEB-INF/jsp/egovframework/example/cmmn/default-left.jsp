<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>

	var sideMenu = {
		
		click : function() {
			var that = this;
			
			// left메뉴를 클릭할때 하이라이트 및 탭 관련 메서드 실행
			$("li > a").click(function() {
				var $this = $(this);
				
				that.active($this);
				tabFn.tabInit($this);
			});
			
			// 1depth 메뉴를 열린상태에서 다시 누를때 하이라이트를 삭제하는 기능 
			$(".lnb").on("click","dl > dt",function() {
				var $this = $(this);
				
				if ($this.hasClass("select") == false) {
					$this.removeClass("select")
				} else {
					$("dl > dt").removeClass("select");
					$this.addClass("select");
				}
				
			});
		},
		
		// left메뉴의 하이라이트를 구성하는 메서드
		active : function($liAtag) {
			
			$liAtag.closest("dl").find("li").removeClass("on");
			$liAtag.closest("dl").find("dt").removeClass("select");
			
			$liAtag.parent().addClass("on");
			$liAtag.closest("dd").prev().addClass("select");
		}
	}
	
	$(function() {
		
		sideMenu.click();
	})
</script>

<aside class="lnb">
    <h3>교육</h3>
    <dl>
        <dt class="sub-tit"><a href="#" class="ellipsis">취업반</a></dt>
        <dd>
            <ul id="step1">
                <li>
                    <a href="#" data-url="step3/page17" data-code="page17" class="ellipsis">17기</a>
                    <button type="button" class="btn-bookmark"><span class="blind">즐겨찾기</span></button>
                </li>
                <li>
                    <a href="#" data-url="step3/page18" data-code="page18" class="ellipsis">18기</a>
                    <button type="button" class="btn-bookmark"><span class="blind">즐겨찾기</span></button>
                </li>
                <li>
                    <a href="#" data-url="step3/page19" data-code="page19" class="ellipsis">19기</a>
                    <button type="button" class="btn-bookmark"><span class="blind">즐겨찾기</span></button>
                </li>
            </ul>
        </dd>
        <dt class="sub-tit"><a href="#" class="ellipsis">초급반</a></dt>
        <dd>
            <ul id="step2">
                <li>
                    <a href="#" data-url="step2/page11" data-code="page11" class="ellipsis">11기</a>
                    <button type="button" class="btn-bookmark"><span class="blind">즐겨찾기</span></button>
                </li>
                <li>
                    <a href="#" data-url="step2/page12" data-code="page12" class="ellipsis">12기</a>
                    <button type="button" class="btn-bookmark"><span class="blind">즐겨찾기</span></button>
                </li>
                <li>
                    <a href="#" data-url="step2/page13" data-code="page13" class="ellipsis">13기</a>
                    <button type="button" class="btn-bookmark"><span class="blind">즐겨찾기</span></button>
                </li>
            </ul>
        </dd>
    </dl>
    <div class="lnb-control">
        <button type="button" class="btn-lnb-hide"><span class="ico-arr-left-01"></span></button>
    </div>
</aside>
<!--// lnb -->
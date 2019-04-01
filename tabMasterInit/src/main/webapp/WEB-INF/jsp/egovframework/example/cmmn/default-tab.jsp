<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>
	var tabFn = {
		
		tabArr : [],		
	
		tabInit : function($leftAtag) {
			
			// 배열안의 데이터를 확인하여 하이라이트 처리 및 탭생성 
			if ($.inArray($leftAtag.data("code"),this.tabArr) > -1) {
				
				this.tabToggle($leftAtag.data("code"));
			} else {
				
				if (this.tabArr.length >=5 ){
					alert("5개 이상은 만들 수 없습니다.")
				} else {
					this.tabAdd($leftAtag);
				}
			}
			
		},
		
		// 탭생성 메서드
		tabAdd : function($leftAtag) {
			var tabLi = document.createElement("li"),
				tabA = document.createElement("a"),
				tabBtn = document.createElement("button");
				tabDiv = document.createElement("div")
				
			tabA.setAttribute("href", "#");				
			tabBtn.setAttribute("type", "button");
			
			tabA.textContent = $leftAtag.text();
			
			// 데이터-탭 속성 삽입
			tabLi.setAttribute("data-tab", $leftAtag.data("code"));
			
			tabLi.appendChild(tabA);
			tabLi.appendChild(tabBtn);
			
			$("#tabList").append(tabLi);
			
			tabDiv.setAttribute("id", $leftAtag.data("code"));
			
			// content.jsp에서 사용할 div 생성
			$("#tabCon").append(tabDiv);
			
			// 배열에 데이터 추가
			this.tabArr.push($leftAtag.data("code"));
			
			// 만들어진 탭 하이라이트 처리
			this.tabToggle($leftAtag.data("code"));
			
			// 탭 생성과 동시에 content의 div영역에 내용 추가, default-content.jsp에서 진행
			contentFn.pageLoad($leftAtag);
			
		},
		
		// 탭 하이라이트, content내용 전환, content제목 전환 메서드
		tabToggle : function(leftDataCode) {
			var dataTab 	= $("[data-tab=" + leftDataCode +"]");
			var $dataCode 	= $("[data-code=" + leftDataCode +"]");

			var navTitle		= $dataCode.text(),
				navTiltleFront 	= $dataCode.closest("dd").prev().children().text();
			
			$("#tabList > li").removeClass("on");
			dataTab.addClass("on");
			
			// 탭을 이동시킬때 원하는 content내용만 출력되도록 한다.
			$("#tabCon > div").hide();
			$("#" + leftDataCode).show();
			
			// 페이지 변경시 nav 제목 변경
			$(".page-nav-wrap a:eq(1)").text(navTiltleFront);
			$(".page-nav-wrap a:eq(2)").text(navTitle);
			
			// 페이지 변경시 content 제목 변경
			$(".tit").text(navTiltleFront + " " + navTitle);
			
		},
		
		// 탭을 눌렀을때의 기능
		tabEvent : function() {
			var that = this;
			
			// 탭을 눌렀을때 하이라이트 처리
			$("#tabList").on("click","li > a",function() {
				var dataTab = $(this).parent().data("tab");
				
				that.tabToggle(dataTab);
				sideMenu.active($("[data-code=" +dataTab + "]"))
				
			});
			
			// 탭의 x버튼을 눌렀을때 탭이 삭제되는 메서드 호출
			$("#tabList").on("click","li > button",this.tabRemove);
		},
		
		// 탭 삭제 메서드
		tabRemove : function() {
			var deleteTab = $(this).parent("li").data("tab");
			
			tabFn.tabArr.splice(tabFn.tabArr.indexOf(deleteTab),1);
			
			$(this).parent("li").remove();
			
			// cotent.jsp에 있는 div 삭제
			$("#" + deleteTab).remove();
			
			// 탭 삭제시 하이라이트 이동
			if ($(this).parent().hasClass("on")) {
				var lastTab = $("#tabList > li:last").data("tab");
					$lastTab = $("[data-code=" + lastTab +"]");
				
				tabFn.tabToggle(lastTab);
				sideMenu.active($lastTab);
			}
		},
	}
	$(function() {
		tabFn.tabEvent();
	})
	
</script>

<div class="tab tab_v1 tab_v2">
    <ul id="tabList">
   <!-- <li class="on">
   			<a href="#">18기</a>
   			<button type="button"></button>
   		</li>
        <li>
	        <a href="#">17기</a>
	        <button type="button"></button>
	    </li> -->
    </ul>
</div>

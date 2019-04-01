<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	var contentFn = {
			
		pageLoad : function($leftAtag) {
			
			var url = $leftAtag.data("url"),
				code = $leftAtag.data("code");
			
			// content내용을 구성할 페이지를 호출하는 ajax
			$.ajax({
				type  	 : "POST",
				dataType : "html",
				url 	 : url + ".do",
				data 	 : "",
				success  : function(data) {
					$("#" + code).append(data);		
				}
			});
		}
	}
</script>

<div style="position:relative;margin-top:20px;">
    <div class="page-nav-wrap" style="top: 10px;right: 0;">
        <span class="ico-home-01"></span>
        <span class="ico-arr-right-02"></span>
        <a href="#">교육</a>
        <span class="ico-arr-right-02"></span>
        <a href="#">취업반</a>
        <span class="ico-arr-right-02"></span>
        <a href="#">18기</a>
    </div>
</div>

<h2 class="tit">취업반 18기</h2>

<div id="tabCon" class="table-wrap type2 mgt-20">
	<!-- 본문내용 작성   -->
</div>
    
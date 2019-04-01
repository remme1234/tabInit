<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
  		<tiles:insertAttribute name="header"/>
  	</head>
  	<body>
		<div id="wrapper" class="ui-tbl">
			<tiles:insertAttribute name="nav"/>
			<div id="container" class="ui-tbl-row">
				<tiles:insertAttribute name="left"/>	
				 <div class="contents" style="padding-top:0">
					<tiles:insertAttribute name="tab"/>
				 	<tiles:insertAttribute name="content"/>
				</div>	
			</div>
			<tiles:insertAttribute name="footer"/>
		</div>
	</body>
</html> 
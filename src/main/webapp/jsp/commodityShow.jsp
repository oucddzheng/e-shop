<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/lib/css/css.css" rel="stylesheet" />
<link type="text/css" href="<%=request.getContextPath()%>/lib/css/commodityShow.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/js.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/wb.js" type="text/javascript" charset="utf-8"></script>
<title>展示商品</title>
<script type="text/javascript">
$(document).ready(function() {
   /* var jsonmodel = '${commodityInformationModel}';	
   jsonmodel = eval('('+jsonmodel+')');   */
   /* var jsonmodel = ${commodityInformationModel}
   var stringjsonmodel = jsonmodel[0];  */
   /*  alert(jsonmodel[0].page) */
 selectCommodityInformation(1 , 6);
})
function selectCommodityInformation(pageNumber , pageSize) {
	
	var jsonmodel = '${commodityInformationModel}';	//这行代码这样写是有危险的，因为直接从域中取下来的对象是一个
													//java对象，在往 js对象 jsonmodel 赋值的时候很有可能发生赋值失败，比如java 
													//对象中有一个属性是list集合 这个list集合中的内容就不能赋过来
													//正确的做法是，将java对象，转成json对象的字符串，然后在存到域中，这样取下来就是一个字符串，字符串再赋给js变量
													//或者是从域中直接将对应的对象属性取出后再赋给js变量
	 jsonmodel = eval('('+jsonmodel+')');  
	/* var page = jsonmodel[0].page;
	var rows = jsonmodel[0].rows; */
	var secondCommodityClassificationId = jsonmodel[0].secondCommodityClassificationId;
	 /* alert(jsonmodel[0].page)
	 alert(secondCommodityClassificationId);  */
	$.ajax({
		url : "<%=request.getContextPath()%>/sysCommodityInformationAction/selectCommodityInformationAndPicture.do",
		type : "POST",
		data : {"page":pageNumber , "rows" : pageSize , "secondCommodityClassificationId" : secondCommodityClassificationId},
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
		success : function(data) {
			showCommodityInformation(data)
		}
	});
}

function showCommodityInformation(data) {
	var commodityInformationList = data.commodityInformationList;
	var last = data.lastPage;
	var pageNumber =data.pageNumber;
	/* var pageNumber = 1; 这个变量取后台操作 */ 
	var pageSize = 6;

	var s = "";
	
	/* alert(commodityInformationList[0].commodityPrice);
	alert(commodityTotal)
	alert(pageNumber);
	alert(pageSize); */
	/* var commodityInformation = commodityInformationList[0]; */
	/* alert(commodityInformation.commodityPictureList[0].url)
	alert(commodityInformation.commodityPictureList[8].url) */
    /* s += ("<img class='commodity' alt='这是一张图片' src='"
			+ commodityInformation.commodityPictureList[9].url + "'>");
    $("#init").html(s);  */
 	for (var i = 0; i < commodityInformationList.length; i++) {
		var commodityInformation = commodityInformationList[i];

		// 			alert(pageSize);
		// 			$("#C" + i).html(
		// 					"<img class='commodity'src='"+rows[i].url+"'>"
		// 							+ "<p><span class='cname'>" + info.ciName
		// 							+ "</span>&nbsp&nbsp;;简介：" + info.descr
		// 							+ "&nbsp;价格：" + info.price + "&nbsp;&nbsp;库存："
		// 							+ info.inventory + "</p>");
	 
		 s += ("<a href='/situ-shopping-web/sysCommodityInformationAction/commodityIntroductionShowDispach.do?id="+commodityInformation.id+"'>"
				   +"<div class='showGetC'>"
				       +"<img class='commodity' src='"+ commodityInformation.commodityPictureList[0].url + "'>" 
				       +"<p>"
				           +"<span class='cname'>" + commodityInformation.commodityName + "</span>"
				           +"&nbsp&nbsp&nbsp价格：" + commodityInformation.commodityPrice 
				           +"&nbsp&nbsp库存" + commodityInformation.commodityStock 
					   +"</p>" 
					+"</div>"
			  +"</a>") 
	}
	/* var last = Math.ceil(commodityTotal / pageSize);
	s +=   ("<br style='clear:both'>")
	s +=   ("<div style='float:right;font-size:18px'><p>")
	s += ("<a href = 'javascript:selectCommodityInformation(1,6)' >首页</a>&nbsp;");
	s += ("<a href='javascript:selectCommodityInformation("
			+ (pageNumber == 1 ? 1 : pageNumber - 1) + ",6)' >上一页</a>&nbsp;");
	s += ("<a href='javascript:selectCommodityInformation("
			+ (pageNumber == last ? last : pageNumber + 1) + ",6)' >下一页</a>&nbsp;");
	s += ("<a href='javascript:selectCommodityInformation(" + last + ",6)' >末页</a>&nbsp;");
	s += ("(第<span id='pageNumber'>" + pageNumber + "</span>页/共" + last + "页)");
	s += ("</p></div>");  */
   /*  var last = Math.ceil(commodityTotal / pageSize); */
	s +=   ("<br style='clear:both'>")
	s +=   ("<div style='float:right;font-size:18px'>"
		       +"<p>"
		         +"<a href='javascript:selectCommodityInformation(1,"+pageSize+")' >首页</a>&nbsp;"
		         +"<a href='javascript:selectCommodityInformation("+ (pageNumber == 1 ? 1 : pageNumber - 1) + ","+pageSize+")' >上一页</a>&nbsp;"
		         +"<a href='javascript:selectCommodityInformation("+ (pageNumber == last ? last : pageNumber + 1) + ","+pageSize+")' >下一页</a>&nbsp;"
	             +"<a href='javascript:selectCommodityInformation(" + last + ","+pageSize+")' >末页</a>&nbsp;"
		         +"(第<span id='pageNumber'>" + pageNumber + "</span>页/共" + last + "页)"
		       +"</p>"
		   +"</div>");  	
	$("#init").html(s); 
}

</script>
</head>
<body>
   <div class="mianCont">
		<%@include file="/view/header2.jsp"%>
		<div class="positions">
			当前位置：<a href="<%=request.getContextPath()%>/index/toIndex.do">首页</a> &gt; <a href="">商品列表</a>
		</div>
		<div id="init" class="init"></div>

	</div>
</body>
</html>
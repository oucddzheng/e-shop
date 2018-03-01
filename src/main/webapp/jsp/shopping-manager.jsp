<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商城管理</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/demo/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	
	<script type="text/javascript">
	
	var goodsSubmission = function (titleText , url){	  //要明白这种定义一个函数的方法goodsSubmission实质就是该方法的名字
		    if($("#center-tabsid").tabs('exists' , titleText)){	    	
		    	$("#center-tabsid").tabs("select" , titleText);    	
			}else{					
				var content = "<iframe src = '" + url + 
				"'frameborder = 0 scrolling = 'auto'" + "style = 'width:100%;height:100%'> </iframe>" 
				$("#center-tabsid").tabs('add' , {
					iconCls:'icon-search',
					title: titleText,
					closable:true,				
					content:content,
				}) 			
			}	
		}	
	</script>
		
</head>
<body>
	<div class="easyui-layout" style="width:100%;height:550px;">
		<div id="p" data-options="region:'west'" title="商城管理" style="width:170px;padding:">
			<div class="easyui-accordion" fit="true" style="width:100%;height:300px;border:0px">
				<!-- <div title="用户管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">	
				</div> -->
				<div title="商品管理" data-options="iconCls:'icon-ok'" style="padding:10px;">	
				    <a href="#"  class="easyui-linkbutton c1" onclick="goodsSubmission('添加一级分类','firstCommodityClassification.jsp')" style="width:130px">添加一级分类</a>	
				    <br><br>
				     <a href="#"  class="easyui-linkbutton c1" onclick="goodsSubmission('添加二级分类','secondCommodityClassification.jsp')" style="width:130px">添加二级分类</a>	
				   <!--  <br><br>
				     <a href="#"  class="easyui-linkbutton c1" onclick="goodsSubmission('商品分类管理','commodityClassification.jsp')" style="width:130px">商品分类管理</a>	 -->
				    <br><br> 
					<a href="#"  class="easyui-linkbutton c1" onclick="goodsSubmission('添加商品','addCommodity.jsp')" style="width:130px">添加商品</a>
					 <br><br>
					<a href="#"  class="easyui-linkbutton c1" onclick="goodsSubmission('商品图片管理','commodityPictureManager.jsp')" style="width:130px">商品图片管理</a>
				    <!-- <br><br>
					<a href="#"  class="easyui-linkbutton c1" onclick="goodsSubmission('查看全部商品','searchAllCommodity.jsp')" style="width:130px">查看全部商品</a>		 -->
				</div>
				<!-- <div title="TreeMenu" data-options="iconCls:'icon-search'" style="padding:10px;">
					<p>aaa</p>
				</div> -->
			 </div>
		</div>
		<div data-options="region:'center'" title="详细信息">
		  <div id="center-tabsid" class="easyui-tabs" fit="true" style="border: 0px">
				<div title="首页" style="padding: 20px; display: none;"></div>
		  </div>
		</div>
	</div>
</body>
</html>
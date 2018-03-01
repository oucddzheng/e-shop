<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>    
<%@page import="situ.system.model.SysUserModel"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %><!-- 使用jstl要加入的指令 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>购物车</title>
<link type="text/css" href="<%=request.getContextPath()%>/lib/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/js.js"></script>

<style type="text/css">
.img {
	width: 130px;
	height: 150px;
}

#submit {
	width: 100%;
	height: 80px;
}

.submit {
	float: right;
	margin-right: 100px;
	margin-top: 30px;
	font-size: 18px;
	float: right;
}

.getit {
	width: 100%;
	height: 200px;
	margin-top: 10px;
	border: 1px solid lightgrey;
	/* 	background: yellow; */
}
body {
	background: #F8F8F8;
}
</style>
<script type="text/javascript">
 
</script>

</head>
<body>


<div class="mianCont">
		<%@include file="/view/header2.jsp"%>
		<div class="positions" style = "background:#F8F8F8">
			当前位置：<a href="<%=request.getContextPath()%>/view/index.jsp">首页</a> &gt; <a href="#">购物车</a>
		</div>
		<table style="font-size: 18px;">
			<thead style="color: grey; text-align: center;">
				<tr>
					<td><input id='checkall'  type="checkbox">全选</td>
					<td style="width: 130px;">商品图片</td>
					<td style="width: 100px;">商品名称</td>
					<td style="width: 180px;">商品描述</td>
					<td style="width: 100px;">商品单价</td>
					<td style="width: 100px;">商品库存</td>
					<td style="width: 100px;">购买数量</td>
					<td style="width: 100px;">合计</td>
					<td style="width: 100px;">操作</td>
				</tr>
			</thead>
			<tbody id="init"></tbody>
		</table>
		<div id="submit">
			<div class='submit'>
				<span>总价:</span>
				<input id='allCommodityTotalPrices' style="width: 100px; color: red; font-size: 20px; border: none" disabled="disabled" type='text' value='0'><input type='button' onclick="submit()" value='结算'>
			</div>
		</div>
</div>
	<div style="clear: both;"></div>
	<div style="height: 100px;"></div>
	<div style="height: 100px; width: 980px; margin: 0 auto;"><%@include file="/view/footer.jsp"%></div>
</body>
<script type="text/javascript">
$(document).ready(
	   /* 下面的匿名函数实质是ready函数的一个参数 */
		function(){	
		 <% if(user != null) {%>	  
		   selectCommodityFromShoppingCarByUserId(); 
		 <% }else{ %>
	     window.location.href="<%=request.getContextPath()%>/jsp/login.jsp"
	   <%} %>	
	   checkAllBind();
	   checkboxchangeAllCommodityTotalPrice();
	  }
  )

 function selectCommodityFromShoppingCarByUserId() {
		$.ajax({
			url : "/situ-shopping-web/sysShoppingCarAction/selectCommodityFromShoppingCarByUserId.do",
			type : "POST",
			data : "userId=${user.id}",
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				  show(data);  
			}
		});
   }
   function show(data) {
	var s = "";
	var commodityInShopCarList = data.commodityInShopCarList;
	var commodityInformationModelList = data.commodityInformationModelList;
	if (commodityInShopCarList.length == 0) {
	     s += "<h2 style='text-align: center;'>您的购物车空空如也&nbsp;<a href='/situ-shopping-web/view/index.jsp' style='color:red;cursor: pointer;'>去购物</a></h2>"
		$("#submit").html(s); 
		return;
	}
	 for (var i = 0; i < commodityInShopCarList.length; i++) {
		var informationInShoppingCar = commodityInShopCarList[i];
		var informationIninformationModel;
		/*这个代码写的有点问题 */
		    for(var j = 0 ; j < commodityInformationModelList.length ; j++){
		    	if(commodityInformationModelList[j].id==informationInShoppingCar.commodityId){
		    		informationIninformationModel = commodityInformationModelList[j];
		    	}		    	
		    }
	  s += ("<tr id='div"+i+"' value='"+informationInShoppingCar.id+"'>"
				 +"<th><input type='checkbox'  value='"+ informationInShoppingCar.id + "'class='checkbox 'src='"+informationInShoppingCar.id+"' name='inputcheckbox'></th>"
				 +"<th><img class='img' src='"+informationIninformationModel.commodityPictureList[0].url +"'></th>"
				 +"<th>"+ informationIninformationModel.commodityName + "</th>"
				 +"<th>"+ informationIninformationModel.commodityDescr+ "</th>"
				 +"<th>"+ parseFloat(informationIninformationModel.commodityPrice).toFixed(2) + "</th>"
				 +"<th>"+ informationIninformationModel.commodityStock+ "</th>"
				 +"<th><input type='button' value='-' onclick='sub("+ i + ")'>"
				     +"<input type='text'style='width:30px'  disabled='disabled' id='input" + i+"' value='"+informationInShoppingCar.commodityNumber+"'>"
				     +"<input type='button' value='+' onclick='add(" + i + "," + informationIninformationModel.commodityStock + ")'></th>"
				 +"<th id='price"+i+"'style='color:red;'>" + (parseFloat(informationIninformationModel.commodityPrice) * parseInt(informationInShoppingCar.commodityNumber)).toFixed(2) + "</th>"
				 +"<th><input type='button' value='删除' onclick='deleteCommodity("+ i + ")' style='width:60px;height:40px'></th>"
		    +"</tr>");  
	} 
	 $("#init").html(s);
	 $("input[name='inputcheckbox']").change(
		  function(){
			 checkboxchangeAllCommodityTotalPrice();
		}
	   )
 } 
   function sub(shoppingCarIndex) {
		var temp1 = parseInt($("#input" + shoppingCarIndex).val());
		var temp = temp1 < 2 ? temp1 : temp1 - 1;
		$("#input" + shoppingCarIndex).val(temp);
		  $.ajax({
			url : "/situ-shopping-web/sysShoppingCarAction/commodityNumberChange.do",
			type : "POST",
			data :{"id": $("#div" + shoppingCarIndex).attr("value") , "commodityNumber":temp},
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8', //防止乱码
			success : function(data) {
				var singleCommodityTotalPrice = parseFloat(data).toFixed(2);
				$("#price"+shoppingCarIndex).text(singleCommodityTotalPrice)
				checkboxchangeAllCommodityTotalPrice()
			}
		}); 
		  
	} 
   function add(shoppingCarIndex, commodityStock) {

		var temp1 = parseInt($("#input" + shoppingCarIndex).val());
		var temp = temp1 >= commodityStock ? temp1 : temp1 + 1;
		$("#input" + shoppingCarIndex).val(temp);
		$.ajax({
			url : "/situ-shopping-web/sysShoppingCarAction/commodityNumberChange.do" ,
			type : "POST",
			data : {"id": $("#div" + shoppingCarIndex).attr("value") , "commodityNumber":temp},
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				var singleCommodityTotalPrice = parseFloat(data).toFixed(2);
				$("#price"+shoppingCarIndex).text(singleCommodityTotalPrice)
				checkboxchangeAllCommodityTotalPrice()
			}
		});
		 
	}  
   /* 在全选按钮上绑定一个change事件，用来选定其他的checkbox ,checkbox本身就有change事件，还用绑吗，绑上肯定也是没错的 $("#checkall").bind("change",function() {*/
   /* 下面这样写也是没有错的 */
	function checkAllBind(){	   
	   $("#checkall").change(function() {
			if(this.checked) {
				$("input[type='checkbox']").prop("checked", true);
				checkboxchangeAllCommodityTotalPrice()
			} else {
				$("input[type='checkbox']").prop("checked", false);
				checkboxchangeAllCommodityTotalPrice()
			}
			})	   
   }
   /* 计算所有商品价格的函数 */
	function checkboxchangeAllCommodityTotalPrice() {
		var allCommodityIdchecked = "";
		$("input[name='inputcheckbox']").each(function() {
			if ($(this).is(":checked")) {
				allCommodityIdchecked += "," + $(this).val();
			}
		})
	    $.ajax({
			url : "/situ-shopping-web/sysShoppingCarAction/allCommodityTotalPrice.do",
			type : "POST",
			data : "allCommodityIdchecked=" + allCommodityIdchecked,
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				$("#allCommodityTotalPrices").val(parseFloat(data).toFixed(2))				
			}
		}
	  );  
	}  
	function deleteCommodity(commodityIndex) {
		var confirmDelete = confirm("确定删除？");
		if (!confirmDelete) {
			return false;
		}
		 $.ajax({
			url : "/situ-shopping-web/sysShoppingCarAction/deletCommodityFromShoppingCar.do",
			type : "POST",
			data : "deletedCommodityId=" + $("#div" + commodityIndex).attr("value"),
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				if (data == "删除成功") {
					location.reload();
					alert("删除成功")
				}			
			}
		}); 
	}	
	function submit() {
		var b = false;
		var allCommodityIdchecked = "";
		$("input[name='inputcheckbox']").each(function() {
			if ($(this).is(":checked")) {
				b = true;
				allCommodityIdchecked += "," + $(this).val();
			}			
		})
		if (!b) {
			alert("请选择一个商品再结算");
			return;
		}else{
			    window.location.href="/situ-shopping-web/sysShoppingCarAction/settleAccounts.do?allCommodityIdchecked="+allCommodityIdchecked;
		      }
	}

</script>
</html>
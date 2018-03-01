<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<link type="text/css" href="<%=request.getContextPath()%>/lib/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/js.js"></script>

<style> 
.img{
    display:block;
    width:50px;
    height:50px
}
</style>

</head>
<body >
   <div class="mianCont">
		<%@include file="/view/header2.jsp"%>
	</div>
  <div id = "commodityOrderShowId" style = "width: 950px; margin:auto ;margin-top:10px ">
      <h3 style = "text-align:left ;display: inline-block" >您的订单信息： </h3>
      <hr style = "height: 3px">  
      <table style="font-size: 18px; margin:auto ">
			<thead style="color: grey; text-align: center;">
				<tr>
					<td style="width: 70px;">商品图片</td>
					<td style="width: 70px;">商品名称</td>
					<td style="width: 70px;">商品单价</td>
					<td style="width: 70px;">商品数量</td>										
					<td style="width: 70px;">合计</td>
					<td style="width: 100px;">下单时间</td>
					<td style="width: 100px;">收货地址</td>
					<td style="width: 100px;">订单状态</td>					
				</tr>
			</thead>
			<tbody style="text-align: center" id="orderInformationFromDataBaseId"></tbody>
		</table>
  </div>
  <div style = "width: 950px; margin:auto ">
       
  </div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		/* 用这个函数俩获得所有订单信息 */
		selectMyOrderInformation();	
	})
	
	  function selectMyOrderInformation(){
		
		var userId = ${user.id};
		if(userId ==null){
			alert("用户Id没有找到");
			return;
		}
		$.ajax({
			"url" : "/situ-shopping-web/sysCommodityOrderAction/loadMyCommodityOrderList.do",
			type : "POST",
			data : {
				"userId":userId
			},
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				 commodityOrderInformationShow(data) 
			}
		})		
		
	}
	function commodityOrderInformationShow(Data){
		var orderInformationStr = "" ;
		for (i = 0 ; i < Data.length ; i++){
			orderInformationStr +=(
							"<tr style = 'margin-left:10px' >"
							 +"<th style = 'padding-left: 20px '><img  class='img' src='"+Data[i].commodityModdel.commodityPictureList[0].url +"'></th>"
							 +"<th style = 'width:50px' >"+ Data[i].commodityModdel.commodityName + "</th>"
							 +"<th style = 'width:50px'>"+ Data[i].commodityModdel.commodityPrice + "</th>"
							 +"<th>"+ Data[i].commodityNumber + "</th>"
							 +"<th>"+ Data[i].amountMoney + "</th>"
							 +"<th style = 'font-size:15px'>"+ Data[i].createTime + "</th>"
							 +"<th style = 'font-size:12px'>"
							    +"<span>"+Data[i].sysReceiverAddressModel.provinceName +"<span>"
							    +"<span>"+Data[i].sysReceiverAddressModel.cityName +"<span>" 
							    +"<span>"+Data[i].sysReceiverAddressModel.districtName +"<span>"
							    +"<span>"+Data[i].sysReceiverAddressModel.detailedAddress +"<span>"
							    +"<span>&nbsp"+Data[i].sysReceiverAddressModel.addressee +"<span>"
							    +"<span>&nbsp"+Data[i].sysReceiverAddressModel.telephone +"<span>"
							 +"</th>"
							 +"<th>"+ Data[i].orderStatesName + "</th>"							 
					       +"</tr>"	)
		}		
		$("#orderInformationFromDataBaseId").html(orderInformationStr);
	}
</script>


</html>
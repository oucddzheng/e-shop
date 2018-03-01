<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="format-detection" content="telephone=no" />
<meta name="" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<link type="text/css" href="<%=request.getContextPath()%>/lib/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/js.js"></script>


<style>
 	*{
 	  margin: 0;
 	  padding: 0;
 	 }
#addNewReceiverAddressId {
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2);
	display: none;
}

#addNewReceiverAddressDetailId {
	width: 500px;
	height: 400px;
	position: fixed;
	left: 50%;
	top: 25%;
	margin-left: -250px;
	border: 1px solid #000000;
	background: white;
}
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
	<!-- 添加收货地址详情 -->
	<div id="addNewReceiverAddressId">
		<div id="addNewReceiverAddressDetailId">
			<div style="background: rgba(0, 0, 0, 0.2)">
				<h2>添加收货地址
				<a href="javascript:;" style="float: right;" onclick="jQuery('#addNewReceiverAddressId').hide()" class="close">关闭</a>
				</h2>				
			</div>
			<br>
			<div style="background: white ; padding-left:50px">
				<span>收获人：</span> <br> <input id="receiverId" class="" style="" placeholder="收货人" /> <br> <span>手机号码：</span> <br>
					 <input type ="text" id="receiverTelephoneId" class="" style="" placeholder="手机号码" /> &nbsp 
					 <span id = "telephoneReminderId"></span> <br>
				<label>所在地</label>
				<div class="">
					<select id="provinceChoiceId" style="width: "
						onchange="loadingCityChoice()">
						<option value="84839edc1e9e4343abf26d62421f462e">选择省</option>
					</select> <select id="cityChoiceId" onchange="loadingDistrictChoice()">
						<option value="8486140172d5408eb6e574513ed40fc8">选择市</option>
					</select> <select id="districtChoiceId">
						<option value="a337cabbcce94cdb900d04760dbcfb04">选择区</option>
					</select>
				</div>
				<label  class="am-form-label">详细地址</label>
				<div class="">
					<textarea id="detailedAddressId" class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
					<small>100字以内写出你的详细地址...</small>
				</div>
				<div class="">
					<a id="addressSave" class="" style = "font-size:20px ; color:blue" href="javascript:void(0)"onclick="addressSave()">保存收货地址</a>
				</div>
			</div>
		</div>
	</div>
    <div id = "receiverAddressDetailId" style = "width: 950px; margin:auto ">
      <div id = "receiverAddressDeTailHeaderId" style = "margin-top:20px " >       
        <h3 style = "text-align:left ;display: inline-block" >确认收货地址 </h3>
        <a href = "#" style = " font-size:; float:right "  >管理收货地址</a>  
        <hr style = "height: 3px">  
        <div id ="addressShowId"  style = "margin-left:70px ; margin-top:20px; font-size:15px">            
              <!-- 这个地方展示的用户的收货地址详细信息 -->
        </div> 
        <div class="">
			<a style = "float:right" href="#" class="" id="" onclick="jQuery('#addNewReceiverAddressId').show()">使用新地址</a>
		</div>  
      </div>    
   </div>
  <div id = "commodityOrderShowId" style = "width: 950px; margin:auto ;margin-top:10px ">
      <h3 style = "text-align:left ;display: inline-block" >确认订单信息 </h3>
      <hr style = "height: 3px">  
      <table style="font-size: 18px; margin:auto ">
			<thead style="color: grey; text-align: center;">
				<tr>
					<td style="width: 130px;">商品图片</td>
					<td style="width: 100px;">商品名称</td>
					<td style="width: 180px;">商品描述</td>
					<td style="width: 100px;">商品单价</td>
					<td style="width: 100px;">商品库存</td>
					<td style="width: 100px;">购买数量</td>
					<td style="width: 100px;">合计</td>
				</tr>
			</thead>
			<tbody style="text-align: center" id="orderInformationId"></tbody>
		</table>
  </div>
  <div style = "width: 950px; margin:auto ">
       <div style = "float:right">
          <span>总价：&nbsp</span> <span id = "totalPrice"></span>
	        <br>
	        <a href = "#" style = "font-size:20px" onclick = "addOrder()">提交订单</a> <!--  -->
       </div>  
  </div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* 使用这个函数获得用户的用户的收货地址 */
		getUserAddressInformation();
		
		/* 使用这个函数获得用户在购物车中选中的要下单的商品 */
		/* getUserCommodityOrder(); */	
		commodityOrderInformationShow()
		/* 这个函数使用来获取省的信息 */
		getAddressInformation("0000", "provinceChoiceId");
	})
	
	
	  function addOrder(){
		
		var receivingAddressId;
		$("input[name='checkboxforcheck']").each(function(){
			if(this.checked){
				receivingAddressId = $(this).val();
			}			
 		}) 
 		$.ajax({
			"url" : "/situ-shopping-web/sysCommodityOrderAction/insertCommodityOrder.do",
			type : "POST",
			data : {
				"receivingAddressId": receivingAddressId
			},
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				if(data=="yes"){
					alert("订单提交成功")
				}else{
					alert("订单提交失败")
				}
			}
		})					
	} 
	function commodityOrderInformationShow(){
		var commodityInShoppingCarCheckedMapResult = '${commodityInShoppingCarCheckedMapResult}';
		var jsonmodel = eval('('+commodityInShoppingCarCheckedMapResult+')'); 
		var orderData = jsonmodel.commodityInShopCarCheckedList;
		var totalPrice = jsonmodel.allCommodityTotalPriceInShoppingCar;
		var orderInformationStr = ""
		for (i = 0 ; i < orderData.length ; i++){
			orderInformationStr +=(
							"<tr style = 'margin-left:10px' >"
							 +"<th style= 'padding-left:40px'><img  class='img' src='"+orderData[i].commodityModdel.commodityPictureList[0].url +"'></th>"
							 +"<th>"+ orderData[i].commodityModdel.commodityName + "</th>"
							 +"<th>"+ orderData[i].commodityModdel.commodityDescr + "</th>"
							 +"<th>"+ orderData[i].commodityModdel.commodityPrice + "</th>"
							 +"<th>"+ orderData[i].commodityModdel.commodityStock + "</th>"
							 +"<th>"+ orderData[i].commodityNumber + "</th>"
							 +"<th>"+ orderData[i].singleOrderTotalPrice + "</th>"							 
					       +"</tr>"	)
		}		
		$("#orderInformationId").html(orderInformationStr);
		$("#totalPrice").text(totalPrice);
	}
	function getUserAddressInformation(){
		var userId = ${user.id};
		if(userId ==null){
			alert("用户Id没有找到");
			return;
		}
		$.ajax({
			"url" : "/situ-shopping-web/sysReceiverAddressAction/getUserAddressInformation.do",
			type : "POST",
			data : {
				"userId":userId
			},
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				 showAddressInformation(data) 
			}
		})		
	}
	 function showAddressInformation( addressInformationArray ){
		var AddressInformationStr = "";
		for(var i = 0 ; i < addressInformationArray.length ; i++ ){
			AddressInformationStr += ("<span>"
											+"<input id = '"+"addressShowCheckBox"+addressInformationArray[i].id+"' value = '"+ addressInformationArray[i].id +"' name='checkboxforcheck' onchange='singleChoice("+addressInformationArray[i].id+")' type = 'checkbox'>"
									  +"</span>"
									  +"<span>"+addressInformationArray[i].provinceName+"</span>"
									  +"<span>&nbsp"+addressInformationArray[i].cityName+"</span>"
									  +"<span>&nbsp"+addressInformationArray[i].districtName+"</span>"
									  +"<span>&nbsp"+addressInformationArray[i].detailedAddress+"</span>"
									  +"<span>&nbsp"+addressInformationArray[i].addressee+"</span>"
									  +"<span>&nbsp收</span>"
									  +"<span>&nbsp"+addressInformationArray[i].telephone+"</span>"
									  +"<br>")								
		}
		$("#addressShowId").html(AddressInformationStr);
	} 
	 /* 这个函数用来选择地址的复选框为单选 */
	function  singleChoice(id){		
		/* $("input[type='checkbox']").prop("checked"); */
		 $("input[name='checkboxforcheck']").each(function(){
			 $(this).prop("checked",false) 
 		}) 
 		 $("#addressShowCheckBox"+id).prop("checked",true)
	}
	function getAddressInformation(parentId, selectId) {
		$.ajax({
			"url" : "/situ-shopping-web/sysBasicDataAction/selectDistrict.do", /* 注意json字符串中的key值也是可以加引号的 */
			type : "POST",
			data : {
				parentId : parentId
			},
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				showDistrictOptions(data, selectId)
			}
		})
	}
	function showDistrictOptions(district, selectId) {
		var provinceStr = "";
		for (var i = 0; i < district.length; i++) {
			provinceStr += ("<option value='" + district[i].id + "'>"
					+ district[i].districtName + "</option>")
		}
		$("#" + selectId).append(provinceStr);
	}
	/* 获取城市的信息 */
	function loadingCityChoice() {
		cityStr = "<option value='8486140172d5408eb6e574513ed40fc8'>选择市</option>";
		$("#cityChoiceId").html(cityStr);
		var provinceId = document.getElementById("provinceChoiceId").value;
		if (provinceId == "84839edc1e9e4343abf26d62421f462e") {
			return;
		}
		getAddressInformation(provinceId, "cityChoiceId");
	}
	/* 获取区的信息 */
	function loadingDistrictChoice() {
		cityStr = "<option value='a337cabbcce94cdb900d04760dbcfb04'>选择区</option>";
		$("#districtChoiceId").html(cityStr);
		var cityId = document.getElementById("cityChoiceId").value;
		if (cityId == "8486140172d5408eb6e574513ed40fc8") {
			return;
		}
		getAddressInformation(cityId, "districtChoiceId");
	}
	function addressSave() {
		var userId = ${user.id};
		if(userId ==null){
			alert("用户Id没有找到");
			return;
		}
	    //El表达式取出session域中存储的用户的id
		var addressee = $("#receiverId").val().trim(); /* 在取出字符串后将字符串的前后的空格去掉 */
		if (addressee == null || addressee == "") {
			alert("收货人不能为空")
			return;
		}
		var userAccount = '${user.userAccount}';
		if(userAccount == null || userAccount == ""){
			alert("用户信息不存在");
			return;
		}
		var telephone = $("#receiverTelephoneId").val().trim();
		if (telephone == null || telephone == "") {
			$("#telephoneReminderId").text("手机号不能为空");
			$("#telephoneReminderId").css({color:"red"});
			return false;
		}
		/* 用正则表达式来校验用户手机号 */
	    if(!(/^1[34578]\d{9}$/.test(telephone))){ 
	    	$("#telephoneReminderId").text("手机号号码格式不正确");
			$("#telephoneReminderId").css({color:"red"});
	        return false; 
	    } 
		var provinceId = $("#provinceChoiceId").val().trim()
		if (provinceId == null || provinceId == ""
				|| provinceId == "84839edc1e9e4343abf26d62421f462e") {
			alert("您没有选择省份，请选择省份")
			return;
		}
		var cityId = $("#cityChoiceId").val().trim()
		if (cityId == null || cityId == ""
				|| cityId == "8486140172d5408eb6e574513ed40fc8") {
			alert("您没有选择城市，")
			return;
		}
		var districtId = $("#districtChoiceId").val().trim();
		if (districtChoiceId == null || districtChoiceId == ""
				|| districtChoiceId == "a337cabbcce94cdb900d04760dbcfb04") {
			alert("您没有选择区")
			return;
		}
		var detailedAddress = $("#detailedAddressId").val().trim();
		if (detailedAddress == null || detailedAddress == "") {
			alert("详细地址不能为空")
			return;
		}	
			$.ajax({
				"url" : "/situ-shopping-web/sysReceiverAddressAction/addReceiverAddress.do",
				type : "POST",
				data : {
					"userId":userId,
					"addressee" : addressee,
					"telephone" : telephone,
					"provinceId" : provinceId,
					"cityId" : cityId,
					"districtId" : districtId,
					"detailedAddress" : detailedAddress,
					"creator" : userAccount,
					"updater": userAccount
				},
				dataType : "json",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					if (data.isSuccess == "yes") {
						alert("收货地址添加成功");
						getUserAddressInformation();
						$("#addNewReceiverAddressId").hide();
					}
				}
			})

	}
</script>


</html>
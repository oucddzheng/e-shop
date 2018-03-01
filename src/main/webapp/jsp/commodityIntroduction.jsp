<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<%@page import="situ.system.model.SysUserModel"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %><!-- 使用jstl要加入的指令 -->   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/commodityIntroduction.css"/>
 <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
 <script src="../js/commodityIntroduction.js" type="text/javascript" charset="utf-8"></script>
 
 <link type="text/css" href="<%=request.getContextPath()%>/lib/css/css.css" rel="stylesheet" />

 <script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/js.js"></script>
<title>商品详情页</title>

<!-- css的执行是在执行完ready方法后加载的。 -->
<script type="text/javascript">
 var  id = ${commodityIntroductionModel.id}
 
 
  $(document).ready(function(){
	
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
    	 
  });  
  function addCommodityToShoppingCar(){

	  <% SysUserModel user2 =(SysUserModel)session.getAttribute("user");%>
	  <% if(user2 != null) {%>
	     var userId = ${user.id};
	     var creator = '${user.userAccount}';
	     var updater = '${user.userAccount}'; 
	     var commodityId  = ${commodityIntroductionModel.id};	     
	     var commodityNumber = document.getElementById("text_box").value;
	     $.ajax({
		      url: "<%=request.getContextPath()%>/sysShoppingCarAction/addCommodityToShoppingCar.do",
		      type:"POST",
		      data:{"userId":userId, "commodityId":commodityId , "commodityNumber":commodityNumber , "creator":creator , "updater":updater},
		      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
		      success:function(data){
		    	   /* document.getElementById("addCommodityToShoppingCarReminder").innerText="添加成功,";  */		    	           
		        $("#addCommodityToShoppingCarReminderId").show();
		      
		      },
	          dataType:"text",
		    });
	   <% }else{ %>
	           /* window.location.href="login.jsp" */  /* 这种写法是不正确的，因为这个相对路径相对的对象不确定 */
	           window.location.href="<%=request.getContextPath()%>/jsp/login.jsp"
	   <%} %>	  
	    /*  if(userIsExist == true){ */
	    	 
	       /*  */   /* 这个地方这样写为什么不正确 */
		  /*  var commodityId  = ${commodityIntroductionModel.id};
		   var commodityNumber = document.getElementById("text_box").value;
		    alert(userId);
		   alert(commodityId);
		   alert(commodityNumber);   */
		  <%--  $.ajax({
			      url: "<%=request.getContextPath()%>/sysShoppingCarAction/addCommodityToShoppingCar.do",
			      type:"POST",
			      data:{"userId":userId, "commodityId":commodityId , "commodityNumber":commodityNumber},
			      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			      success:function(data){
			    	  
			    	           
			      },
		          dataType:"text",
			    });
		    --%>
  }
</script>

</head>
<body>

<div class = "page"  id = "pageId">
      <div class = "mianCont">
      
       <%@include file="/view/header2.jsp"%>
		<div class="positions" style = "background:#F8F8F8">
			当前位置：<a href="<%=request.getContextPath()%>/view/index.jsp">首页</a> &gt; <a href="#">购物车</a>
		</div>
      
      </div>
     
   <div style = "width: 950px; margin:auto ;margin-top:10px "> 
   
      <div class="showall">
	                <!--left -->
	                <div class="showbot">
                    <div id="showbox">
	                  <c:forEach var="commodityPictureModel" items="${commodityIntroductionModel.commodityPictureList}">
	                      <img src="${commodityPictureModel.url}" width="400" height="400" />
	     		      </c:forEach>                 
                    </div><!--展示图片盒子-->
                        <div id="showsum">
                        	<!--展示图片里边-->
                        </div>
                        <p class="showpage">
                            <a href="javascript:void(0);" id="showlast"> < </a>
                            <a href="javascript:void(0);" id="shownext"> > </a>
                        </p>
                        </div>
                        <!--conet -->
                        <div class="tb-property">
                        	<div class="tr-nobdr">
                        		<h3> ${commodityIntroductionModel.commodityName}</h3>
                        		<span>${commodityIntroductionModel.commodityDescr}</span>
                        	</div>
                        		<div class="txt">
                        			<span class="nowprice">￥<a href="">${commodityIntroductionModel.commodityPrice}</a></span>
                        			<div class="cumulative">
                        			
                        			</div>
                        		</div>
                        	<div class="txt-h">
                        	</div>
                        	<script>
                        	$(document).ready(function(){	
                          	var t = $("#text_box");      	
                        	$('#min').attr('disabled',true);
                            	$("#add").click(function(){    
                               	 t.val(parseInt(t.val())+1)
                               	 if (parseInt(t.val())!=1){
                                   	 $('#min').attr('disabled',false);
                                	}
      
                           	 })                          
                            	$("#min").click(function(){
                                	t.val(parseInt(t.val())-1);
                                	if (parseInt(t.val())==1){
                                   	 $('#min').attr('disabled',true);
                                	}
      
                            	})  
                        	});
                        	</script>  
                        	<div class="gcIpt">
                        		<span class="guT">数量</span>
                        		<input id="min" name="" type="button" value="-" />  
                        		<input id="text_box" name="" type="text" value="1"style="width:30px; text-align: center; color: #0F0F0F;"/>  
                        		<input id="add" name="" type="button" value="+" />
                        		<span class="Hgt">库存（${commodityIntroductionModel.commodityStock}）</span>
                        	</div>
                        	<div class="nobdr-btns">
                        		<button class="addcart hu" onclick= "addCommodityToShoppingCar()">加入购物车</button>                       
                
                        		<a id ="addCommodityToShoppingCarReminderId" style = "display:none ; color:blue" href = "<%=request.getContextPath()%>/jsp/commodityShoppingCar.jsp">添加成功，到购物车结算</a>
                        	</div>
                        	<div class="guarantee">
                        		<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""></a></span>
                        	</div>
                        </div>     
   
   
   </div>
           

</div>
   
</body>
</html>
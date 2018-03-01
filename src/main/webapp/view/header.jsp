<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<%@page import="situ.system.model.SysUserModel"%>
  <% SysUserModel user =(SysUserModel)session.getAttribute("user");%>
<script type="text/javascript">
  
$(function(){
    $("#kinMaxShow").kinMaxShow();
    queryProductTypeAll();
});
function queryProductTypeAll(){
    $.ajax({
      url: "<%=request.getContextPath()%>/syscommodityclassification/queryProductTypeAll.do",
      type:"POST",
      dataType:"json",
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
      success:function(data){
          setProductType(data.list);
      }
    });
}
function setProductType(list){
    for(var i = 0;i<list.length;i++){
        var first = list[i];
        $("#ProductTypeId"+i).html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+first.classificationName);
        var second = first.list;
        var s = "";
        for(var k=0;k<second.length;k++){        	
            s+=("<a href='/situ-shopping-web/sysCommodityInformationAction/selectCommodityInformationDispach.do?secondCommodityClassificationId="+second[k].id+"'>"+second[k].classificationName +"</a>");         	
        }
        $("#ProductTypeId"+i+"0").html(s);
    }
}
  function existLogin(){
	  
	  $.ajax({
	      url: "<%=request.getContextPath()%>/sysUser/removeUser.do",
	      type:"POST",
	      dataType:"text",
	      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
	      success:function(data){
	    	  alert(data);
	    	  window.location.href="index.jsp"          
	      }
	    });
	  
<%-- 	  <%session.invalidate();%> --%>
// 	  window.location.href="/situ-shopping-web/view/index.jsp"
// 	  alert("existLogin函数执行")
  }
  
  function searchCommodityInformation(){
  	var commodityName = $("#inputSearchId").val();
  	window.location.href="/situ-shopping-web/sysCommodityInformationAction/selectCommodityInformationDispachForSesrch.do?CommodityName="+commodityName;
  }  
</script>
<div class="top">
   <span>
   <% if(user != null) {%>
   <span id = "usernameId"><%= user.getUserName() %> 您好！欢迎来到**商城 </span>
   &nbsp&nbsp <a href="javascirpt:void(0)" id = "existLoginId" onclick = "existLogin()">[退出登陆]</a>&nbsp;
   <% }else{ %>
           您好！欢迎来到**商城 请&nbsp;
    <a href="../jsp/login.jsp">[登录]</a>&nbsp;
    <a href="../jsp/register.jsp">[注册]</a>
   <%} %>
   </span>
   <span class="topRight">
    <a href="../jsp/commodityShoppingCar.jsp">购物车</a>&nbsp;| 
    <a href="../jsp/myCommodityOrder.jsp">我的订单</a>&nbsp;| 
    <a href="#">我的账户</a>&nbsp;|
    <a href="#">联系我们</a>
   </span>
  </div><!--top/-->
  <div class="lsg">
   <h1 class="logo">
   <a href="<%=request.getContextPath()%>/index/toIndex.do">
   <img src="<%=request.getContextPath()%>/lib/images/logo.png" width="217" height="90" />
   </a>
   </h1>
   <form action="#" method="get" class="subBox">
    <div class="subBoxDiv">
      <input id = "inputSearchId" type="text" class="subLeft" />
      <input type="button" onclick="searchCommodityInformation()" value = "搜索" width="63" height="34" class="sub" /> <!-- src="<%=request.getContextPath()%>/lib/images/subimg.png" -->
     <div class="hotWord">
      热门搜索：
      <a href="#">冷饮杯</a>&nbsp;
      <a href="#">热饮杯</a> &nbsp;
      <a href="#">纸杯</a>&nbsp;
      <a href="#">纸巾</a>  &nbsp;
     </div><!--hotWord/-->
    </div><!--subBoxDiv/-->
   </form><!--subBox/-->
   <div class="gouwuche">
    <div class="myChunlv">
<%--      <a href="#"><img src="<%=request.getContextPath()%>/lib/images/mychunlv.jpg" width="112" height="34" /></a> --%>
    </div><!--myChunlv/-->
   </div><!--gouwuche/-->
  </div><!--lsg/-->
  <div class="pnt">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类</h2>
    <ul class="InPorNav">
    <!-- 第一个一级分类 -->
     <li><a href="#" id="ProductTypeId0"></a>
      <div class="chilInPorNav" id="ProductTypeId00" style="background:red"  >
      
      </div><!--chilLeftNav/-->
     </li>
     <!-- 第二个一级分类  -->
     <li><a href="#" id="ProductTypeId1"></a>
      <div class="chilInPorNav" id="ProductTypeId10">

      </div><!--chilLeftNav/-->
     </li>
     <!-- 第三个一级分类 -->
     <li><a href="#" id="ProductTypeId2"></a>
      <div class="chilInPorNav" id="ProductTypeId20">

      </div><!--chilLeftNav/-->
     </li>
      <!-- 第四个一级分类 -->
     <li><a href="#" id="ProductTypeId3"></a>
      <div class="chilInPorNav" id="ProductTypeId30">

      </div><!--chilLeftNav/-->
     </li>
     <!-- 第五个一级分类 -->
     <li><a href="#" id="ProductTypeId4"></a>
      <div class="chilInPorNav" id="ProductTypeId40">

      </div><!--chilLeftNav/-->
     </li>
     <!-- 第六个一级分类 -->
     <li><a href="#" id="ProductTypeId5"></a>
      <div class="chilInPorNav" id="ProductTypeId50">

      </div><!--chilLeftNav/-->
     </li>
     <!-- 第七个一级分类 -->
     <li><a href="#" id="ProductTypeId6"></a>
      <div class="chilInPorNav" id="ProductTypeId60">

      </div><!--chilLeftNav/-->
     </li>
     <!-- 第八个一级分类 -->
     <li><a href="#" id="ProductTypeId7"></a>
      <div class="chilInPorNav" id="ProductTypeId70">

      </div><!--chilLeftNav/-->
     </li>
    </ul><!--InPorNav/-->
   </div><!--pntLeft/-->
   <div class="pntRight">
    <ul class="nav">
     <li class="navCur"><a href="#">商城首页</a></li>
<!--      <li><a href="#">促销中心</a></li> -->
<!--      <li><a href="#">会员中心</a></li> -->
<!--      <li><a href="#">帮助中心</a></li> -->
     <div class="clears"></div>
     <div class="phone">TEL：010-12345678</div>
    </ul><!--nav/-->
    <div class="banner">
     <div id="kinMaxShow">
      <div>
       <a href="#"><img src="<%=request.getContextPath()%>/lib/images/ban1.jpg" height="360"  /></a>
      </div>        
      <div>
       <a href="#"><img src="<%=request.getContextPath()%>/lib/images/ban2.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="#"><img src="<%=request.getContextPath()%>/lib/images/ban3.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="#"><img src="<%=request.getContextPath()%>/lib/images/ban4.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="#"><img src="<%=request.getContextPath()%>/lib/images/ban5.jpg" height="360"  /></a>
      </div>      
     </div><!--kinMaxShow/-->
    </div><!--banner/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
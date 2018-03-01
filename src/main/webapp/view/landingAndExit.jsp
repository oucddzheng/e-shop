<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="situ.system.model.SysUserModel"%>
  <% SysUserModel user =(SysUserModel)session.getAttribute("user");%>
  <script type="text/javascript">
  
function existLogin(){
	  
	  $.ajax({
	      url: "<%=request.getContextPath()%>/sysUser/removeUser.do",
	      type:"POST",
	      dataType:"text",
	      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
	      success:function(data){
	    	  alert(data);
	    	  window.location.href="/situ-shopping-web/view/index.jsp"          
	      }
	    });	  
<%-- 	  <%session.invalidate();%> --%>
// 	  window.location.href="/situ-shopping-web/view/index.jsp"
// 	  alert("existLogin函数执行")
  }
  
<!--

//-->
</script>
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
  <span class="topRight" style = "float:right">
    <a href="../jsp/commodityShoppingCar.jsp">购物车</a>&nbsp;| 
    <a href="../jsp/myCommodityOrder.jsp">我的订单</a>&nbsp;| 
    <a href="#">我的账户</a>&nbsp;|
    <a href="#">联系我们</a>
   </span>
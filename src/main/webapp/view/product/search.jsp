<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/view/lib.jsp"%>
</head>
<body>
<div class="mianCont">
  <%@include file="/view/header2.jsp"%>
  
  <div class="positions">
   当前位置：<a href="<%=request.getContextPath()%>/index/toIndex.do">首页</a> 
   &gt; <a href="#" class="posCur">促销商品</a>
  </div><!--positions/-->
  <div class="cont">
  <div class="jilu">
<!--     总计 <span>8</span> 个记录 -->
   </div><!--jilu/-->
   <div class="contLeft">
    <img src="<%=request.getContextPath()%>/lib/images/flListimg.jpg" width="180" height="293" />
   </div><!--contLeft/-->
   <div class="contRight">
    <div class="frProList">
      <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro4.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro5.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro3.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro2.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro2.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro3.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
      <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro4.jpg" width="132" height="129" /></a></dt>
      <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
      <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
     </dl>
     <dl>
       <dt><a href="#"><img src="<%=request.getContextPath()%>/lib/images/rdPro5.jpg" width="132" height="129" /></a></dt>
       <dd>妙洁 一次性纸杯 8盎司228ml 100只/袋 20袋/箱</dd>
       <dd class="cheng">￥19.80/袋 <span>￥15.00</span></dd>
      </dl>
      <div class="clears"></div>
     </div><!--frProList-->
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
  
   <%@include file="/view/footer.jsp"%>
  
</body>
</html>
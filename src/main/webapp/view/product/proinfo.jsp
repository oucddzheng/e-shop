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
   <div class="contLeft">
    <img src="<%=request.getContextPath()%>/lib/images/flListimg.jpg" width="180" height="293" />
   </div><!--contLeft/-->
   <div class="contRight" style="border:0;">
   <div class="proBox">
   <div id="tsShopContainer">
    <div id="tsImgS"><a href="<%=request.getContextPath()%>/lib/images/01.jpg" title="Images" class="MagicZoom" id="MagicZoom"><img width="300" height="300" src="<%=request.getContextPath()%>/lib/images/01.jpg" /></a></div>
    <div id="tsPicContainer">
        <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
        <div id="tsImgSCon">
            <ul>
                <li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/01.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/01.jpg" /></li>
                <li onclick="showPic(1)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/02.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/02.jpg" /></li>
                <li onclick="showPic(2)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/03.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/03.jpg" /></li>
                <li onclick="showPic(3)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/04.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/04.jpg" /></li>
                <li onclick="showPic(4)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/05.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/05.jpg" /></li>
                <li onclick="showPic(5)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/06.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/06.jpg" /></li>
                <li onclick="showPic(6)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/07.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/07.jpg" /></li>
                <li onclick="showPic(7)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/08.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/08.jpg" /></li>
                <li onclick="showPic(8)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/09.jpg" tsImgS="<%=request.getContextPath()%>/lib/images/09.jpg" /></li>
                <li onclick="showPic(9)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/10.gif" tsImgS="<%=request.getContextPath()%>/lib/images/10.gif" /></li>
                <li onclick="showPic(10)" rel="MagicZoom"><img height="42" width="42" src="<%=request.getContextPath()%>/lib/images/11.gif" tsImgS="<%=request.getContextPath()%>/lib/images/10.gif" /></li>
            </ul>
        </div>
        <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
    </div>
    <img class="MagicZoomLoading" width="16" height="16" src="<%=request.getContextPath()%>/lib/images/loading.gif" alt="Loading..." />
    
    </div><!--tsShopContainer/-->
    <div class="proBoxRight">
     <h3 class="proTitle">17 饮料杯 250ml 41121 50个/袋</h3>
     <div>商品编号： 334011 </div>
     <div>会员价：<strong class="red">¥7.20</strong> </div>
     <div>单位：袋 </div>
     <div>库存：<strong class="red">[有货] </strong> 从上海发货</div>
     <ul class="rongliang">
      <li>100ml</li>
      <li>200ml</li>
      <li>300ml</li>
      <li>400ml</li>
      <li>500ml</li>
      <div class="clears"></div>
     </ul><!--rongliang/-->
     <div class="shuliang2">
      数量： <input type="text" value="1" />
     </div><!--shuliang2/-->
     <div class="gc">
      <a href="order.html"><img src="<%=request.getContextPath()%>/lib/images/goumai.png" width="117"  height="36" /></a>&nbsp;&nbsp;
      <a href="#"><img src="<%=request.getContextPath()%>/lib/images/shoucang.png" width="117" height="36" /></a>
     </div><!--gc/-->    
    </div><!--proRight/-->
    <div class="clears"></div>
    </div><!--proBox/-->
    <ul class="fangyuan">
      <li>商品描述</li>
      <li>商品参数</li> 
      <li>商品评论</li>
      <li>商品晒图</li>
      <div class="clears"></div>
    </ul><!--fangyuan/-->
    <div class="fangList">
    <div class="fangPar">
         乐购超市旁，未来地铁14号线沿线地段，规划中上海四大商业附中心—真如商业副中心，婚房精装电梯两房。让您一步到位<br />
    很荣幸栗见能借此机会给您问好，为您介绍此房.<br />
    超稀缺地铁双南两房，全明户型，满五唯一，业主急需资金周转特急卖。<br />
    Information of Vernal Garden 满庭芳花园 <br />
    Location:<br />
    Located close to Gubei Carrefour and the Hongqiao Airport, 15 mins drive to international schools and downtown area.<br />
    Description:<br />
    It offers a full range of accommodations including freestanding houses, semi-detached houses and condominiums. The units are very spacious, well decorated and fully furnished. Resident can enjoy a complete range of onsite <br />recreational facilities. <br />
    Facilities:<br />
    Indoor swimming door, gym, sauna, spa, squash, cafe, childrens playground, restaurant, convenience store, snooker, basketball court. <br />
    Tv Channel:<br />
    HBO，TVB，BBC，DISCOVERY，CINEMAX，
    </div><!--fangPar/-->
    <img src="<%=request.getContextPath()%>/lib/images/ban1.jpg" width="756" height="310" />
    </div><!--fangList/-->
    <div class="fangList">
     商品参数
    </div><!--fangList/-->
    <div class="fangList">
     商品评论
    </div><!--fangList/-->
    <div class="fangList">
     <img src="<%=request.getContextPath()%>/lib/images/rdPro1.jpg" width="132" height="129" /><br /><br />
     <img src="<%=request.getContextPath()%>/lib/images/rdPro2.jpg" width="132" height="129" /><br /><br />
     <img src="<%=request.getContextPath()%>/lib/images/rdPro3.jpg" width="132" height="129" /><br /><br />
     <img src="<%=request.getContextPath()%>/lib/images/rdPro4.jpg" width="132" height="129" /><br /><br />
     <img src="<%=request.getContextPath()%>/lib/images/rdPro5.jpg" width="132" height="129" /><br /><br />
    </div><!--fangList/-->
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
   
   <%@include file="/view/footer.jsp"%>
</body>
</html>
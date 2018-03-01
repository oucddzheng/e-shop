<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/demo/demo.css">
	<script type="text/javascript" src="jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.5.3/jquery.easyui.min.js"></script>	
	
	
	<script type="text/javascript">
	$(document).ready(function(){		
		$("#firstClassificationId").combobox({
   		   url:'/situ-shopping-web/syscommodityclassification/firstCommodityClassificationSelect.do',
		   valueField: 'classificationCode',
		   textField: 'classificationName' 	       
   	 }) 
	})   
	var addSecondCommodityClassification = function (){	
		
	var firstCommodityClassificationCode = $("#firstClassificationId").combobox('getValue');
	var secondCommodityClassificationName = $("#secondClassNameId").textbox('getValue');		 
	var secondCommodityClassificationDescr = $("#secondClassDescrId").textbox('getValue');
	$.ajax({		    	
    	url:"/situ-shopping-web/syscommodityclassification/secondCommodityClassificationSave.do",
        type:"post",
        data:{"classificationName" : secondCommodityClassificationName , "descr" : secondCommodityClassificationDescr ,
        	  "parentCode" : firstCommodityClassificationCode },
        contentType:"application/x-www-form-urlencoded ; charset=UTF-8",
        success: function(data){		        	
        	alert("ajax成功返回,二级分类成功提交")		        	
        },
        error: function(){
        	
        },
        dataType:"text"		    	
      })
 }
	
	
	
	</script>
<title>Insert title here</title>
</head>
<body>
      <br>
         <span>*添加二级分类</span><br><br>    
          &nbsp&nbsp  选择一级分类<select id = "firstClassificationId" class = "easyui-combobox" style="width:100px" ></select><br><br>
          &nbsp&nbsp  分类名称  <input id="secondClassNameId" class="easyui-textbox" style="width:150px;height:28px;"><br><br>          
          &nbsp&nbsp  分类描述  <input id="secondClassDescrId" class="easyui-textbox" data-options="multiline:true" value="" style="width:300px;height:50px">
          <br><br>
          &nbsp&nbsp &nbsp&nbsp  <a href="#" class="easyui-linkbutton" 
          data-options="iconCls:'icon-save', onClick: addSecondCommodityClassification">提交</a>

</body>
</html>
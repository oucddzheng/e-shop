<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商品图片管理</title>
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

function loadSecondCommodityClassification(){
	var firstCommodityClassificationCode = $("#firstClassificationId").combobox('getValue');
	$.ajax({		    	
    	url:"/situ-shopping-web/syscommodityclassification/secondCommodityClassificationSelect.do",
        type:"post",
        data:{"parentCode" : firstCommodityClassificationCode },
        contentType:"application/x-www-form-urlencoded ; charset=UTF-8",
        success: function(data){		        	
        	$("#secondClassificationId").combobox({
        	   data:data,
     		   valueField: 'classificationCode',
     		   textField: 'classificationName' 	       
        	 }) 
        },
        error: function(){           	
        },
        dataType:"json"		    	
      })
} 
function loadCommodityInformation(){
	var secondCommodityClassificationCode = $("#secondClassificationId").combobox('getValue');
	$.ajax({		    	
    	url:"/situ-shopping-web/sysCommodityInformationAction/selectCommodityInformation.do",
        type:"post",
        data:{"seconCommodityClassificationCode" : secondCommodityClassificationCode },
        contentType:"application/x-www-form-urlencoded ; charset=UTF-8",
        success: function(data){		        	
        	$("#commodityId").combobox({
        	   data:data,
     		   valueField:'id',
     		   textField: 'commodityName' 	       
        	 }) 
        },
        error: function(){           	
        },
        dataType:"json"		    	
      })	
}
function addCommodityPcture(){
    if(!$("#uploadCommodityPictureFormId").form("validate")){
		$.messager.alert("您还没有选择图片");	
		return;
		}
	var firstCommodityClassification = $("#firstClassificationId").combobox("getValue");
	var secondCommodityClassification = $("#secondClassificationId").combobox("getValue");
	var commodityId = $("#commodityId").combobox("getValue");
	if ( firstCommodityClassification == "" || secondCommodityClassification == "" || commodityId=="") {
	alert("您还没有选择商品");
	return;
	}
	var form = new FormData(document.getElementById("uploadCommodityPictureFormId"));
	form.append("commodityId",commodityId);
	$.ajax({
		url : "/situ-shopping-web/sysCommodityPictureAction/addCommodityPicture.do",
		type : "post",
		processData:false,//processData  是否只传输文本数据
		contentType:false,
		data: form,
		dataType : "text",
		success : function(data) {
		alert(data);
		},
		})	
	alert("图片上传成功")
}

</script>


</head>

<body>
        &nbsp&nbsp
	  <div>
	   <span> 
	         &nbsp&nbsp一级分类<select id = "firstClassificationId" class = "easyui-combobox" style="width:100px"  data-options="onChange:loadSecondCommodityClassification"  ></select>
	         &nbsp&nbsp二级分类<select id = "secondClassificationId" class = "easyui-combobox" data-options="onChange:loadCommodityInformation" style="width:100px" ></select>	   
	         &nbsp&nbsp选择商品<select id = "commodityId" class = "easyui-combobox" data-options="" style="width:100px" ></select>	  
	   </span> 
	   <br>
	   <br>
	   <form action="" id = "uploadCommodityPictureFormId" class = "" enctype="multipart/form-data">
	    &nbsp&nbsp上传图片 <input type="file" id="uploadCommodityPictureId" class="" name="file"  style="width:300px">	  
	    <br>
	    <br>
        <span>&nbsp&nbsp<a id = "addCommodityInformationId" class = "easyui-linkbutton" href="javascript:void(0)" data-options = "iconCls:'icon-save', onClick:addCommodityPcture">提交</a></span>   
	   </form>
	   
     </div>

</body>
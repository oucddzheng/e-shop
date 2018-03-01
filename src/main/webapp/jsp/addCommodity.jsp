<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    function addCommodityInformation(){
    	var commodityInformationFirstClass = $("#firstClassificationId").combobox("getValue");   	
    	var commodityInformationSecondClass = $("#secondClassificationId").combobox("getValue");
    	var commodityInformationName = $("#commodityNameId").textbox("getValue");
    	var commodityInformationDescr = $("#commodityDescrId").textbox("getValue");
    	var commodityInformationPrice= $("#commodityPriceId").textbox("getValue");
    	var commodityInformationNumeber = $("#commodityNumeberId").textbox("getValue");
    	var commodityInformationState = $("#commodityStateId").textbox("getValue");
    	$.ajax({		    	
        	url:"/situ-shopping-web/sysCommodityInformationAction/addCommodityInformation.do",
            type:"post",
            data:{"firstCommodityClassificationCode": commodityInformationFirstClass , "seconCommodityClassificationCode": commodityInformationSecondClass ,
            	  "CommodityName": commodityInformationName ,"CommodityDescr": commodityInformationDescr ,"CommodityPrice": commodityInformationPrice , 
            	  "CommodityStock": commodityInformationNumeber , "commodityState": commodityInformationState ,
            	  },
            contentType:"application/x-www-form-urlencoded ; charset=UTF-8",
            success: function(data){		        	            	
            },
            error: function(){           	
            },
            dataType:"json"		    	
          })
    	
    	alert("商品信息添加成功")
    }      
    </script>

</head>
<body>
   &nbsp&nbsp
	  <div>
	   <span> 
	         &nbsp&nbsp一级分类<select id = "firstClassificationId" class = "easyui-combobox" style="width:100px"  data-options="onChange:loadSecondCommodityClassification"  ></select>
	         &nbsp&nbsp二级分类<select id = "secondClassificationId" class = "easyui-combobox" data-options="" style="width:100px" ></select>	   
	   </span> 
	   <br>
	   <br>
	   <span>&nbsp&nbsp商品名称<input id="commodityNameId" class="easyui-textbox" style="width:100px" ></span>
	   <span>&nbsp&nbsp商品描述<input id="commodityDescrId" class="easyui-textbox"  data-options="multiline:true" style="width:200px;height:25px" ></span>
	   <span>&nbsp&nbsp商品价格/单位：元  <input id="commodityPriceId" class="easyui-textbox" style="width:100px" ></span>
	   <span>&nbsp&nbsp库 存 量<input id="commodityNumeberId" class="easyui-textbox" style="width:100px"></span>
	   <span>&nbsp&nbsp状态<input id="commodityStateId" class="easyui-textbox" style="width:100px"></span>
	   <br>
	   <br> 
	   <span>&nbsp&nbsp<a id = "addCommodityInformationId" class = "easyui-linkbutton" href="javascript:void(0)" data-options = "iconCls:'icon-save', onClick:addCommodityInformation">提交</a></span>
	   
	  </div>
</body>
</html>
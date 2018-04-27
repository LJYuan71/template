<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.ljyuan71.tk" prefix="dict" %> 
<%@include file="/ui/include/queryAll.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑器模板</title>
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ui/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ui/ueditor/ueditor.all.min.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
	var ueEditor;
	$(function(){
		// 实例化编辑器
		ueEditor = UE.getEditor('templateContent');
   		$.ajax({
			type  : "post",
			async : false,
			url   : '${ctx }/permissions/templatematter/queryAllJson.do',
			data  :{"limit":100},
			success : function(data) {
				if(data.rows){
					var testtable = $("select[name='matterId'] option");
					$("select[name='matterId'] option").remove();
					var entity = '<option value="" selected="selected">--请选择--</option>';
					$.each(data.rows,function(idx,obj){
						entity += '<option value="'+obj.guid+'" title="'+obj.remark+'">'+obj.matterName+'</option>';
					});
					$("select[name='matterId']").append(entity);
				}
			},
			error : function(data){
				layer.alert('程序错误!');
			}
		});
   		$("#save").click(function(){
   			var content = ueEditor.getContent();
   			var matterId = $("#matterId").val();
   			var templateName = $("#templateName").val();
   			var guid = $("#templeteinfoid").val();
   			if(guid || (content && matterId && templateName)){
   				var templateInfo = {};
   				templateInfo["matterId"] = matterId;
   				templateInfo["templateName"] = templateName;
   				templateInfo["templateContent"] = content;
   				templateInfo["guid"] = guid;
   				if(guid){
   					delete templateInfo["matterId"];
   					delete templateInfo["templateName"];
   				}
   				$.ajax({
   					type  : "post",
   					async : false,
   					url   : '${ctx }/permissions/templateinfo/save.do',
   					data  :templateInfo,
   					success : function(data) {
   						if(data.code==200){
   							$("#templateName").val("");
   							$("#matterId").val("");
   							$("#templeteinfoid").val();
   							ueEditor.execCommand('cleardoc');
							layer.msg("保存成功", {icon: 1,time: 4000});
						}else{
							layer.alert(data.message+"!", {icon: 1});
						}
   					},
   					error : function(data){
   						layer.alert('程序错误!');
   					}
   				});
   			} else {
   				layer.alert('请先完善所有信息!');
   			}
   		});
   		getAllTempletaInfo();
	})
    function chooseVar(){
		var value = $('#addVar').val();
  		if(value){
  			var insertHtml = "$"+"{"+value;
  			insertHtml +="}";
  			ueEditor.execCommand('inserthtml', insertHtml);
  		}
  		//强制变为已选择
  		$('#addVar').val('');
	}
	//templateContent addVar
	function changeMatter(){
		var matterid = $("select[name='matterId']").val();
		if(matterid){
			 //清空编辑器内容
			 ueEditor.execCommand('cleardoc');
			$.ajax({
				type  : "post",
				async : false,
				url   : '${ctx }/permissions/templatentityvar/queryAllJson.do',
				data  :{"limit":100,"matterIdEquals":matterid},
				success : function(data) {
					if(data.rows){
						var addVarOpt = $("#addVar option");
						addVarOpt.remove();
						var entity = '<option value="" selected="selected">--请选择--</option>';
						$.each(data.rows,function(idx,obj){
							entity += '<option value="'+obj.attrComment+'" title="'+obj.templateEntity.entityFullPath+'">'
							+obj.templateEntity.entityComment+"-"+obj.attrComment+'</option>';
						});
						$("#addVar").append(entity);
					}
				},
				error : function(data){
					layer.alert('程序错误!');
				}
			});
		}
	}
	//获取模板内容
   	function changeTempleta(){
   		var infoId = $("#templeteinfoid").val();
   		if(!infoId) return;
   		$.ajax({
			type:"post",
			async:false,
			url:'${ctx }/permissions/templateinfo/queryById.do',
			data:{"id":infoId},//招标公告类模板
			success:function(data){
				if(data.bean){
					$("#matterId").val(data.bean.matterId);
					changeMatter();
					ueEditor.setContent(data.bean.templateContent);
				}
			},
			error:function(data){
				
			}
		})
   	}
	//获取所有模板信息
	function getAllTempletaInfo(){
		$.ajax({
			type:"post",
			async:false,
			url:'${ctx }/permissions/templateinfo/queryAllJson.do',
			data:{"limit":100},//招标公告类模板
			success:function(data){
				$("#templeteinfoid option").remove();
				if(data.rows.length==1){
					$("#templeteinfoid").append('<option value="'+data.rows[0].guid+'">'+data.rows[0].templateName+'</option>');
					return;
				}
				var entity = '<option value="" selected="selected">--请选择--</option>';
				$.each(data.rows,function(idx,obj){
					var ss;
					entity += '<option value="'+obj.guid+'" title="'+obj.templateName+'">'+obj.templateName+'</option>';
				});
				$("#templeteinfoid").append(entity);
			},
			error:function(data){
				
			}
		})
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="col-sm-3">
		<form class="form-horizontal" method="post" id="templateInfoForm" >
			<p>--------------------------保存区域----------------------------</p>
			<div class="form-group">
				<label class="col-sm-4 control-label">模板名称:</label>
				<div class="col-sm-8">
					<input class="form-control" type="text"  name="templateName" id="templateName">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">事项:</label>
				<div class="col-sm-8">
					<select class="form-control" type="text" name="matterId" id="matterId" onchange="changeMatter();">
						<option value="">--请选择--</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">添加变量:</label>
				<div class="col-sm-8">
					<select class="form-control" id="addVar" onclick="chooseVar();">
						<option value="">--请选择--</option>
					</select>
				</div>
			</div>
			<p>--------------编辑区域(如果是保存请选中请选择选项)--------------</p>
			<div class="form-group">
				<label class="col-sm-4 control-label form-control-static">选择模板:</label>
				<div class="col-sm-8">
					<select class="form-control" type="text" name="templateinfoid" id="templeteinfoid" onchange="changeTempleta();">
						<option value="">--请选择--</option>
					</select>
				</div>
			</div>
			<p>--------------下面演示自定义标签实现数据字典--------------</p>
			<div class="form-group">
				<label class="col-sm-4 control-label">项目类别(枚举):</label>
				<div class="col-sm-8">
					<dict:dict typename="XmLeiBie" selected="3" name="XmLeiBie" tagClass="form-control"/> 
				</div>
			</div>
			<!-- checked实现默认选中，支持值和名称 -->
			<div class="form-group">
				<label class="col-sm-4 control-label">评标类型(数据库):</label>
				<div class="col-sm-8">
					<dict:dict typename="pblx" dictType="radio" checked="监理" name="pblx" /> 
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label">定标办法(数据库):</label>
				<div class="col-sm-8">
					<dict:dict typename="dbbf" dictType="checkbox" name="dbbf" id="dbbf" checked="随机抽取,先评后抽" disabled="disabled" /> 
				</div>
			</div>
			<!-- span时checked只支持值查询 -->
			<div class="form-group">
				<label class="col-sm-4 control-label">定标办法:</label>
				<div class="col-sm-8 form-control-static">
					<dict:dict typename="dbbf" dictType="span" checked="20,90" /> 
				</div>
			</div>
		</form>
		<div class="form-group">
			<p class="text-center"><button class="btn btn-info" id="save">保存模板</button></p>
		</div>
		</div>
		<div class="col-sm-9">
		 	<!-- 加载编辑器的容器 -->
		    <script id="templateContent" name="templateContent" type="text/plain" style="height:500px;width: 100%;"></script>
		</div>
    </div>
</body>
</html>
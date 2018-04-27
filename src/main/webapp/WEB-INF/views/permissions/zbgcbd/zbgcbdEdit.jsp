<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/ui/include/queryAll.jsp"%>
<html lang="zh-CN">
<head>
<title>zb_gc_bd编辑页面</title>
<!-- 配置文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ui/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/ui/ueditor/ueditor.all.min.js"></script>
<script>
	var ueEditor;
	var templateinfo = new Array();
   	$(function(){
		ueEditor = UE.getEditor('tongZhiContent');
   		//Validform表单验证
   		$("#zBGongChengBDForm").Validform();
   		var options = {
		   beforeSubmit: showRequest,  //提交前的回调函数
		   success: showResponse,      //提交后的回调函数
		   timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求
		}
		//jquery.form表单提交
		function showRequest(formData, jqForm, options){
		   	return true;  //只要不返回false，表单都会提交,在这里可以对表单元素进行验证
		};
		function showResponse(responseText, statusText){
			if (responseText.code == 200) {
				 layer.alert('保存成功！',{title:'提示'},function(index){
					parentEditCloseWin();
				});
			}else {
				//失败
				layer.alert(responseText.message+"!", {icon: 2});
			}
		};
		//表单提交
		$("#submit").click(function(){
			$("#zBGongChengBDForm").ajaxForm(options);
		});
		$.ajax({
			type:"post",
			async:false,
			url:'${ctx }/permissions/templateinfo/queryAllJson.do',
			data:{"limit":100,"matterId":'f8caf207-a325-4521-9bea-efa4ab6dd20b'},//招标公告类模板
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
   	});
   	function getZBXm(id){
   		parentOpenGet('查看招标项目','${ctx}/permissions/zbxiangmu/view.do?gcid='+id,'1200px','500px');
   	}
   	function getZBDl(id){
   		parentOpenGet('查看招标代理','${ctx}/permissions/zbdl/view.do?gcid='+id,'1200px','500px');
   	}
   	function getZBGc(id){
   		parentOpenGet('查看招标工程','${ctx}/permissions/zbgc/view.do?id='+id,'1200px','500px');
   	}
   	function getGcBD(id){
   		parentOpenGet('查看工程标段','${ctx}/permissions/zbgcbd/view.do?id='+id,'1200px','500px');
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
					ueEditor.setContent(data.bean.templateContent);
				}
			},
			error:function(data){
				
			}
		})
   	}
   	//模板变量替换
   	function replaceVar(){
   		var content = ueEditor.getContent();
   		if(!content) return;
   		$.ajax({
			type:"post",
			async:false,
			url:'${ctx }/permissions/templateinfo/replaceVar.do',
			data:{"bdGuid":'${zBGongChengBD.bdGuid}',"gcGuid":'${zBGongChengBD.gcGuid}',"templateContent":content},//招标公告类模板
			success:function(data){
				if(data.code == 200){
					ueEditor.setContent(data.content);
				}
			},
			error:function(data){
				
			}
		})
   	}
</script>
</head>

<body class="gray-bg">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<a href="javascript:getZBXm('${zBGongChengBD.gcGuid}')" class="list-group-item">招标项目</a>
					<a href="javascript:getZBDl('${zBGongChengBD.gcGuid}')" class="list-group-item">招标代理</a>
					<a href="javascript:getZBGc('${zBGongChengBD.gcGuid }');" class="list-group-item">招标工程</a>
					<a href="javascript:getGcBD('${zBGongChengBD.bdGuid}')" class="list-group-item">工程标段</a>
				</div>
			</div>
			<div class="col-sm-12">
				<label class="col-sm-1 control-label form-control-static">选择模板:</label>
				<div class="col-sm-4">
					<select class="form-control" type="text" name="templateinfoid" id="templeteinfoid" onchange="changeTempleta();">
						<option value="">--请选择--</option>
					</select>
				</div>
				<label class="col-sm-1 control-label form-control-static">操作:</label>
				<div class="col-sm-4">
					<button class="btn btn-primary btn-sm" onclick="replaceVar()">替换变量</button>
				</div>
			</div>
			<div class="col-sm-12">
			 	<!-- 加载编辑器的容器 -->
			    <script id="tongZhiContent" name="tongZhiContent" type="text/plain" style="height: 300px;"></script>
			</div>
		</div>
	</div>
</body>
</html>

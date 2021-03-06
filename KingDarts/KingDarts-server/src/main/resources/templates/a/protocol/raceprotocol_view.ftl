<!DOCTYPE html>
<html lang="cn">
<head>
<#include "./a/commons/top.ftl" />
</head>
<#escape x as x?html>
<body class="content-wrapper-body">
<#include "./a/commons/nav.ftl" />
<#include "./a/commons/bottom.ftl" />
<script src="${base}/assets/plugins/ueditor/ueditor.config.js" charset="UTF-8"></script>
<script src="${base}/assets/plugins/ueditor/ueditor.all.js" charset="UTF-8"></script>
<form method="post" name="layerForm" id="layerForm" action="${base}/a/protocol/raceprotocol_edit">
    <section class="content">
        <div class="box box-default">
            <div class="box-body">
                <section class="form-horizontal">
                    <h4 class="page-header">基础信息</h4>
                    <div class="row">
                           <div class="col-sm-9 form-group">
                                <label class="col-sm-3 control-label" for="title">主题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="title" id="title" value="${entity.title}" placeholder="请输入主题" title="请输入主题" >
                                </div>
                            </div>
                            <div class="col-sm-9 form-group">
                                <label class="col-sm-3 control-label" for="prcontent">内容</label>
                                <div class="col-sm-9">
	                                <script id="editor" name="prcontent"  type="text/plain"  style="width: 100%; height: 50%;">
								        
								    </script>
	                                <script type="text/javascript">
								        //百度UEditor
										var ue = new UE.ui.Editor();
										ue.render('editor');
										
										var html = $('<span>').html('${entity.prcontent}').text();
										ue.ready(function(){
											ue.execCommand('insertHtml', html);
										});


								    </script>
                                </div>
                            </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
    <div class="wt-layer-footer">
        <div class="col-sm-12 wt-layer-footer-content wt-btns-center">
            <input type="hidden" name="id" id="id" value="${entity.id}"/>
            <button type="button" class="btn btn-sm btn-default wt-close">关闭</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    $("document").ready(function () {
        //  设置页面标题
        WT.wt_set_navtitle('详情');
        //  关闭
        $(".wt-close").click(function () {
            WT.wt_close();
        });
    });
</script>
</body>
</#escape>
</html>

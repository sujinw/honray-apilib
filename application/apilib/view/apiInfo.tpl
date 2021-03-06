<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>{$classDoc.title}-{$titleDoc}</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="__STATIC__/hadmin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="__STATIC__/hadmin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="__STATIC__/hadmin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="__STATIC__/hadmin/css/animate.css" rel="stylesheet">
    <!--markdown-->
    <link rel="stylesheet" type="text/css" href="__STATIC__/hadmin/css/plugins/markdown/bootstrap-markdown.min.css"/>
    <!--markdown-->
    <style>
        .markdown p img {
            max-width: 100%;
        }
        .row-green {
            background-color: #f4fff4;
        }
        .row-blue {
            background-color: #e7fbff;
        }
    </style>

    <link href="__STATIC__/hadmin/css/style.css?v=4.1.0" rel="stylesheet">


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="ibox-content  ">
            <div class="text-center ">
                <h2 class="">{$classDoc.title}</h2>
            </div>
        </div>
        <div class="hr-line-dashed"></div>
        <div class="col-xs-9">
            <div class="panel-group" id="accordion">
            </div>
        </div>
        <div class="col-xs-93">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5 class="label label-primary">请求</h5>
                        <div class="hr-line-dashed"></div>
                        <!--请求列表-->
                        <ul class="folder-list" style="padding: 0">
                            {foreach name="methodDoc" item="vo" key="k" }
                                {switch name="vo.method"}
                                {case value="get"}
                                    <li><a href="#{$k}"><span class="label label-success">GET</span> {$vo.title}</a></li>
                                {/case}
                                {case value="post"}
                                    <li><a href="#{$k}"><span class="label label-warning">POST</span> {$vo.title}</a>
                                    </li>
                                {/case}
                                {case value="put"}
                                    <li><a href="#{$k}"> <span class="label label-info">PUT</span> {$vo.title}</a></li>
                                {/case}
                                {case value="delete"}
                                    <li><a href="#{$k}"><span class="label  label-danger">DELETE</span> {$vo.title}
                                        </a>
                                    </li>
                                {/case}
                                {default /}
                                {/switch}
                            {/foreach}

                        </ul>
                        <!--请求列表-->
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--methodDoc-->
    {foreach name="methodDoc" item="vo" key="k" }
        <li class="line dk"></li>
        <div id="{$k}" class="row">
            <div class="ibox float-e-margins">
                <div class="ibox-title" data-toggle="collapse" data-target="#content-{$k}">

                    {switch name="vo.method"}
                    {case value="get"}
                        <span class="label label-success" style='margin-right: 10px;'>GET</span>
                        <h5><strong>  {$vo.title}  </strong></h5>
                    {/case}
                    {case value="post"}
                        <span class="label label-success" style='margin-right: 10px;'>POST</span>
                        <h5><strong>  {$vo.title}  </strong></h5>
                    {/case}
                    {case value="put"}
                        <span class="label label-warning" style='margin-right: 10px;'>PUT</span>
                         <h5><strong>  {$vo.title}  </strong></h5>
                    {/case}
                    {case value="delete"}
                        <span class="label  label-danger" style='margin-right: 10px;'>DELETE</span>
                        <h5><strong>  {$vo.title}  </strong></h5>
                    {/case}
                    {default /}
                    {/switch}
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
            </div>


            <div id="content-{$k}" class="ibox float-e-margins">
                <!--title,desc-->
                {notempty  name="vo.url"}
                <div class="ibox-content">
                    <div class="well">
                        接口地址：{$vo.url}
                    </div>
                </div>
                {/notempty}
                <!--request-->
                {notempty  name="vo.rules"}
                <div class="ibox-title" data-toggle="collapse" data-target="#data-{$k}">
                    <h5>请求字段</h5>
                    <div class="ibox-tools">
                        <a data-toggle="collapse" data-target="#sss" class="collapse-link">
                            <i data-toggle="collapse" class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div id="data-{$k}" class="ibox-content collapse in">
                    <div class="row row-lg">
                        <div class="col-sm-12">
                            <!-- Example Toolbar -->
                            <div class="example-wrap">
                                <div class="example">

                                    <table id="dataTable-{$k}" data-mobile-responsive="true">
                                        <thead>
                                        <tr>
                                            {foreach name="fieldMaps.data" item="data" key="datak" }
                                                <th data-field="{$datak}">{$data}</th>
                                            {/foreach}
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <!-- End Example Toolbar -->
                        </div>

                    </div>
                </div>
                {/notempty}
                <!--request-->
                <!--response-->
                {notempty  name="vo.return"}
                <div class="ibox-title" data-toggle="collapse" data-target="#return-{$k}">
                    <h5>返回字段</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i data-toggle="collapse" class="fa fa-chevron-up success"></i>
                        </a>
                    </div>
                </div>
                <div id="return-{$k}" class="ibox-content">
                    <div class="row row-lg">
                        <div class="col-sm-12">
                            <!-- Example Toolbar -->
                            <div class="example-wrap">
                                <div class="example">
                                    <table id="returnTable-{$k}" data-mobile-responsive="true">
                                        <thead>
                                        <tr>
                                            {foreach name="fieldMaps.return" item="returnv" key="returnk" }
                                                <th data-field="{$returnk}">{$returnv}</th>
                                            {/foreach}
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <!-- End Example Toolbar -->
                        </div>

                    </div>
                </div>
                {/notempty}
                <!--response-->
            </div>
        </div>
    {/foreach}
    <!--methodDoc-->
</div>
<!-- 全局js -->
<script src="__STATIC__/hadmin/js/jquery.min.js?v=2.1.4"></script>
<script src="__STATIC__/hadmin/js/bootstrap.min.js?v=3.3.6"></script>


<!-- Bootstrap table -->
<script src="__STATIC__/hadmin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="__STATIC__/hadmin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="__STATIC__/hadmin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- simditor -->
<script type="text/javascript" src="__STATIC__/hadmin/js/plugins/markdown/markdown.js"></script>
<script type="text/javascript" src="__STATIC__/hadmin/js/plugins/markdown/to-markdown.js"></script>
<script type="text/javascript" src="__STATIC__/hadmin/js/plugins/markdown/bootstrap-markdown.js"></script>
<script type="text/javascript" src="__STATIC__/hadmin/js/plugins/markdown/bootstrap-markdown.zh.js"></script>

<script>
    //获取class md

    $.get("__ROOT__{$classDoc.readme}", function (data) {
        $('#markdown-class').html(markdown.toHTML(data))
    });

</script>
{foreach name="methodDoc" item="vo" key="k" }
    <script>
        (function (document, window, $) {
            'use strict';
            (function () {
                var dataTableUrl = "{:url('admin/doc/tableData',['id'=>$classDoc.id,'method'=>$k,'dataType'=>'data'])}";
                var returnTableUrl = "{:url('admin/doc/tableData',['id'=>$classDoc.id,'method'=>$k,'dataType'=>'return'])}";
                $('#dataTable-{$k}').bootstrapTable({
                    url:dataTableUrl,
                    search: true,
                    showRefresh: false,
                    showToggle: false,
                    showColumns: true,
                    iconSize: 'outline',
                    icons: {
                        refresh: 'glyphicon-repeat',
                        toggle: 'glyphicon-list-alt',
                        columns: 'glyphicon-list'
                    },
                    onLoadSuccess: function() {
                        $('#dataTable-{$k} tr').each(function(key, value){
                            var text = $(this).find('td:first-child').text()
                            if (text.indexOf('——') > -1) {
                                $(this).addClass('row-blue')
                                $(this).find('td:first-child').html(text.replace('——', '&nbsp;&nbsp;&nbsp;&nbsp;'))
                            } else if (text.indexOf('—') > -1) {
                                $(this).addClass('row-green')
                                $(this).find('td:first-child').html(text.replace('—', '&nbsp;&nbsp;'))
                            }
                        })
                    }
                });
                $('#returnTable-{$k}').bootstrapTable({
                    url:returnTableUrl,
                    search: true,
                    showRefresh: false,
                    showToggle: false,
                    showColumns: true,
                    iconSize: 'outline',
                    icons: {
                        refresh: 'glyphicon-repeat',
                        toggle: 'glyphicon-list-alt',
                        columns: 'glyphicon-list'
                    },
                    onLoadSuccess: function () {
                        $('#returnTable-{$k} tr').each(function(key, value){
                            var text = $(this).find('td:first-child').text()
                            if (text.indexOf('——') > -1) {
                                $(this).addClass('row-blue')
                                $(this).find('td:first-child').html(text.replace('——', '&nbsp;&nbsp;&nbsp;&nbsp;'))
                            } else if (text.indexOf('—') > -1) {
                                $(this).addClass('row-green')
                                $(this).find('td:first-child').html(text.replace('—', '&nbsp;&nbsp;'))
                            }
                        })
                    }
                });
            })();
        })(document, window, jQuery);
    </script>
{/foreach}  

</body>
</html>

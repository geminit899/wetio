<!DOCTYPE html>
<html>
<head>
    <title>小说管理</title>
    <script src="/js/jquery-1.10.2.js"></script>
    <script src="/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/personalIndex/_all-skins.min.css">
    <link rel="stylesheet" href="/css/personalIndex/AdminLTE.css">
    <link rel="stylesheet" href="/css/personalIndex/font-awesome.min.css">
</head>
<body style="background-color: #f6f6f6">

<#include "../util/navigation.ftl">
<#include "../util/backgroundLeftSide.ftl">

<div class="modal fade" id="Login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">来啊，快活啊。</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right" style="margin-top: 10px">账号：</div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left" style="margin-top: 7px">
                        <input id="username">
                    </div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right" style="margin-top: 10px">密码：</div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left" style="margin-top: 7px">
                        <input id="password" type="password">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="login()">登录</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

 <#-- 模态框（Modal -->
<div class="modal fade" id="error" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">错误</h4>
            </div>
            <div class="modal-body">用户名或密码错误</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="content-wrapper">
    <div class="row" style="padding-top: 70px">
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <#--搜索框-->
        <div class="col-md-8 col-sm-8 col-xs-8 form-inline">
            <div class="form-group">
                <label>书名: </label>
                <input type="text" class="form-control" id="name">
            </div>
            <button class="btn btn-primary" id="search-btn">搜索</button>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2" align="center">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newModal">新增</button>
        </div>
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
    </div>
    <div class="row" style="margin-top: 20px">
        <#--表格-->
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <table class="table table-bordered" border="1" id="table-user">
                <tr align="center">
                    <td class="success" width="10%"><label>书名</label></td>
                    <td class="success" width="10%"><label>作者</label></td>
                    <td class="success" width="45%"><label>最新章节</label></td>
                    <td class="success" width="10%"><label>状态</label></td>
                    <td class="success" width="25%"><label>操作</label></td>
                </tr>
                <#list novelList as novel>
                    <tr class="table-bordered" align="center">
                        <td>${novel.name}</td>
                        <td>${novel.author}</td>
                        <td>${novel.latestChapter}</td>
                        <#if novel.isFinished==0><td>未完结</td></#if>
                        <#if novel.isFinished==1><td>已完结</td></#if>
                        <td>
                            <button class="btn btn-warning">编辑</button>
                            <button class="btn btn-danger">删除</button>
                        </td>
                    </tr>
                </#list>
            </table>
        </div>
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
    </div>
    <#--页数文本-->
    <div class="row">
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <div class="col-md-10 col-sm-10 col-xs-10" align="center">
            <ul class="pagination">
                <li><a href="#">&lt;&lt;</a></li>
                <li><a href="#">&lt;</a></li>
                <#if pageNum == 1>
                    <li class="active"><a href="#">1</a></li>
                </#if>
                <#if pageNum == 2>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                </#if>
                <#if pageNum gt 2 && pageNum <= 7>
                    <li class="active"><a href="#">1</a></li>
                    <#list 2..pageNum as page>
                        <li><a href="#">${page}</a></li>
                    </#list>
                </#if>
                <#if pageNum gt 7>
                    <li class="active"><a href="#">1</a></li>
                    <#list 2..5 as page>
                        <li><a href="#">${page}</a></li>
                    </#list>
                    <li><a class="disabled" href="#">...</a></li>
                    <li><a href="#">${pageNum}</a></li>
                </#if>
                <li><a href="#">&gt;</a></li>
                <li><a href="#">&gt;&gt;</a></li>
            </ul>
        </div>
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
    </div>
    <#--新建用户模态框-->
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">新增小说</h4>
                </div>
                <div class="modal-body">
                    <div class="form-inline">
                        <div class="form-group">
                            <label>书名:  </label>
                            <input type="text" id="newname">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="newbutton">新建</button>
                </div>
            </div>
        </div>
    </div>

    <#--编辑用户模态框-->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabelEdit">区域小说</h4>
                </div>
                <div class="modal-body">
                    <div class="form-inline">
                        <div class="form-group">
                            <label>书名:  </label>
                            <input type="hidden" id="editid">
                            <input type="text" id="editname">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="editlbutton">更新</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<html>
<head>
    <title>旅游管理</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/personalIndex/_all-skins.min.css">
    <link rel="stylesheet" href="/css/personalIndex/AdminLTE.css">
    <link rel="stylesheet" href="/css/personalIndex/font-awesome.min.css">
</head>
<body style="background-color: #f6f6f6">

<#include "../util/navigation.ftl">
<#include "../util/backgroundLeftSide.ftl">

<div class="content-wrapper">
    <div class="row" style="padding-top: 70px">
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <#--搜索框-->
        <div class="col-md-8 col-sm-8 col-xs-8 form-inline">
            <div class="form-group">
                <label>同伴/城市/时间: </label>
                <input type="text" class="form-control" id="search">
            </div>
            <button class="btn btn-primary" id="searchButton">搜索</button>
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
            <table class="table table-bordered" border="1" id="travelTable">
                <tr align="center">
                    <td class="success" width="7%"><label>id</label></td>
                    <td class="success" width="20%"><label>同行</label></td>
                    <td class="success" width="30%"><label>旅程</label></td>
                    <td class="success" width="18%"><label>时间</label></td>
                    <td class="success" width="25%"><label>操作</label></td>
                </tr>
                <#list travelList as travel>
                    <tr class="table-bordered" align="center">
                        <td>${travel.id}</td>
                        <td>${travel.company}</td>
                        <td>${travel.way}</td>
                        <td>${travel.beginTime}</td>
                        <td>
                            <button class="btn btn-warning" onclick="edit(${travel.id})">编辑</button>
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
            <ul id="page" class="pagination">
                <#--前一页按钮-->
                <#if currentPage==1>
                    <li><a class="disabled">&lt;</a></li>
                </#if>
                <#if currentPage!=1>
                    <li><a href="/manage/travel?toPage=${currentPage-1}">&lt;</a></li>
                </#if>
                <#--页码按钮-->
                <#if pageNum<=7>
                    <#list 1..pageNum as page>
                        <#if currentPage==page>
                            <li class="active"><a>${page}</a></li>
                        </#if>
                        <#if currentPage!=page>
                            <li><a href="/manage/travel?toPage=${page}">${page}</a></li>
                        </#if>
                    </#list>
                </#if>
                <#if pageNum gt 7>
                    <#if currentPage <= 4>
                        <#list 1..5 as page>
                            <#if currentPage==page>
                                <li class="active"><a>${page}</a></li>
                            </#if>
                            <#if currentPage!=page>
                                <li><a href="/manage/travel?toPage=${page}">${page}</a></li>
                            </#if>
                        </#list>
                        <li class="disabled"><a>...</a></li>
                        <li><a href="/manage/travel?toPage=${pageNum}">${pageNum}</a></li>
                    </#if>
                    <#if currentPage gt 4 && currentPage < (pageNum-3)>
                        <li><a href="/manage/travel?toPage=1">1</a></li>
                        <li class="disabled"><a>...</a></li>
                        <li><a href="/manage/travel?toPage=${currentPage-1}">${currentPage-1}</a></li>
                        <li class="active"><a>${currentPage}</a></li>
                        <li><a href="/manage/travel?toPage=${currentPage+1}">${currentPage+1}</a></li>
                        <li class="disabled"><a>...</a></li>
                        <li><a href="/manage/travel?toPage=${pageNum}">${pageNum}</a></li>
                    </#if>
                    <#if currentPage gte (pageNum-3)>
                        <li><a href="/manage/travel?toPage=1">1</a></li>
                        <li class="disabled"><a>...</a></li>
                        <#list pageNum-4..pageNum as page>
                            <#if currentPage==page>
                                <li class="active"><a>${page}</a></li>
                            </#if>
                            <#if currentPage!=page>
                                <li><a href="/manage/travel?toPage=${page}">${page}</a></li>
                            </#if>
                        </#list>
                    </#if>
                </#if>
                <#--页码按钮-->
                <#if currentPage == pageNum>
                    <li class="disabled"><a>&gt;</a></li>
                </#if>
                <#if currentPage != pageNum>
                    <li><a href="/manage/travel?toPage=${currentPage+1}">&gt;</a></li>
                </#if>
            </ul>
        </div>
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
    </div>
</div>

<#--新建用户模态框-->
<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabelAdd">新增旅程</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>同行:</label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="companyAdd">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>目的地:  </label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="destinationAdd">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>时间:  </label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="beginTimeAdd">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="newButton">新建</button>
            </div>
        </div>
    </div>
</div>

<#--编辑用户模态框-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabelEdit">旅程</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>ID:</label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="IDEdit" disabled="disabled">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>同行:</label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="companyEdit">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>旅途:  </label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="destinationEdit">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5" align="right">
                        <label>时间:  </label>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-7" align="left">
                        &nbsp;<input type="text" id="beginTimeEdit">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="editButton">更新</button>
            </div>
        </div>
    </div>
</div>

<#--成功模态框-->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabelSuccess">成功</h4>
            </div>
            <div class="modal-body">操作成功!</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="success()">好的</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<#--失败模态框-->
<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabelError">失败</h4>
            </div>
            <div class="modal-body">操作失败!</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">好的</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script type="text/javascript">
    $("#searchButton").click(function(){
        window.location.href = "/manage/travel/search?search=" + $("#search").val();
    })
</script>

<script type="text/javascript">
    $("#newButton").click(function(){
        if($("#destinationAdd").val() == ""){
            alert("请填写目的地！");
            return;
        }

        var str = {};
        str["company"] = $("#companyAdd").val();
        str["destination"] = $("#destinationAdd").val();
        str["beginTime"] = $("#beginTimeAdd").val();

        $.ajax({                    //获得各个区域的值
            type:"post",
            async: false, //同步执行
            url:"/manage/travel/add",
            data:str,
            success:function(result){
                if (result.toString() == "success"){
                    $('#successModal').modal('show');
                }else if (result.toString() == "error"){
                    $('#errorModal').modal('show');
                }
            }
        });
    })
</script>

<script type="text/javascript">
    function success(){
        $('#successModal').modal('hide');
        $('#newModal').modal('hide');
        $('#editModal').modal('hide');
        window.location.reload();
    }
</script>

<script type="text/javascript">
    function edit(id){
        $.ajax({                    //获得各个区域的值
            type:"post",
            async: false, //同步执行
            url:"/manage/travel/getTravel",
            data:{"id":id},
            success:function(result){
                travelObject = eval(result);
                id = travelObject.id;
                company = travelObject.company;
                way = travelObject.way;
                beginTime = travelObject.beginTime;

                $("#IDEdit").val(id);
                $("#companyEdit").val(company);
                $("#destinationEdit").val(way);
                $("#beginTimeEdit").val(beginTime);

                $("#editModal").modal('show');
            }
        });
    }
</script>

<script type="text/javascript">
    $("#editButton").click(function(){
        if($("#destinationEdit").val() == ""){
            alert("请填写目的地！");
            return;
        }

        var str = {};
        str["id"] = $("#IDEdit").val();
        str["company"] = $("#companyEdit").val();
        str["destination"] = $("#destinationEdit").val();
        str["beginTime"] = $("#beginTimeEdit").val();

        $.ajax({                    //获得各个区域的值
            type:"post",
            async: false, //同步执行
            url:"/manage/travel/edit",
            data:str,
            success:function(result){
                if (result.toString() == "success"){
                    $('#successModal').modal('show');
                }else if (result.toString() == "error"){
                    $('#errorModal').modal('show');
                }
            }
        });
    })
</script>

</body>
</html>
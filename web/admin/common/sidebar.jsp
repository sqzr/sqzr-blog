<%--
  Created by IntelliJ IDEA.
  User: weiyang
  Date: 2014/9/13
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s2" uri="/struts-tags" %>
    <a class="menu-toggler" id="menu-toggler" href="#">
        <span class="menu-text"></span>
    </a>

    <div class="sidebar" id="sidebar">
        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'fixed');
            } catch (e) {
            }
        </script>
        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                <a class="btn btn-success" href="#">
                    <i class="icon-signal"></i>
                </a>

                <a class="btn btn-info" href="/admin/main_article_add.html">
                    <i class="icon-pencil"></i>
                </a>

                <a class="btn btn-warning" href="#">
                    <i class="icon-group"></i>
                </a>
            </div>
            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>

                <span class="btn btn-info"></span>

                <span class="btn btn-warning"></span>

                <span class="btn btn-danger"></span>
            </div>
        </div>
        <!-- #sidebar-shortcuts -->

        <ul class="nav nav-list">
            <li class="<s2:if test="info['menu'].contains('index')">active open</s2:if>">
                <a href="/admin/main_index.html">
                    <i class="icon-dashboard"></i>
                    <span class="menu-text"> 控制台 </span>
                </a>
            </li>
            <li class="<s2:if test="info['menu'].contains('article')">active open</s2:if>">
                <a href="#" class="dropdown-toggle">
                    <i class="icon-edit"></i>
                    <span class="menu-text"> 文章管理 </span>
                    <b class="arrow icon-angle-down"></b>
                </a>
                <ul class="submenu">
                    <li class="<s2:if test="info['menu']=='article_list'">active</s2:if>">
                        <a href="/admin/main_article_list.html">
                            <i class="icon-double-angle-right"></i>
                            文章列表
                        </a>
                    </li>

                    <li class="<s2:if test="info['menu']=='article_add'">active</s2:if>">
                        <a href="/admin/main_article_add.html">
                            <i class="icon-double-angle-right"></i>
                            添加文章
                        </a>
                    </li>
                </ul>
            </li>
            <li class="<s2:if test="info['menu'].contains('category')">active open</s2:if>">
                <a href="/admin/main_category.html">
                    <i class="icon-list"></i>
                    <span class="menu-text"> 分类管理 </span>
                </a>
            </li>
            <li class="<s2:if test="info['menu'].contains('settings')">active open</s2:if>">
                <a href="/admin/main_settings.html">
                    <i class="icon-cog"></i>
                    <span class="menu-text"> 设置 </span>
                </a>
            </li>
        </ul>
        <!-- /.nav-list -->
        <div class="sidebar-collapse" id="sidebar-collapse">
            <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
        </div>
    </div>
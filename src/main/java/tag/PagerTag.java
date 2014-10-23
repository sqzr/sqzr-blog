package tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * Created by weiyang on 2014/10/22.
 */
public class PagerTag extends SimpleTagSupport {
    private String uri;//分页要执行的action路径
    private Integer curpage;//当前页
    private Integer pagecount;//总页数
    private Integer rowcount;//总记录数
    private String separated;

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Integer getCurpage() {
        return curpage;
    }

    public void setCurpage(Integer curpage) {
        this.curpage = curpage;
    }

    public Integer getPagecount() {
        return pagecount;
    }

    public void setPagecount(Integer pagecount) {
        this.pagecount = pagecount;
    }

    public Integer getRowcount() {
        return rowcount;
    }

    public void setRowcount(Integer rowcount) {
        this.rowcount = rowcount;
    }

    // ---

    @Override
    public void doTag() throws JspException, IOException {
        //获得页面的输出流
        JspWriter out  = this.getJspContext().getOut();
        this.separated = (this.uri.indexOf("?") != -1) ? "&" : "?";
        out.println("<div class=\"dataTables_paginate paging_bootstrap\">");
        out.println("<ul class=\"pagination\">");

        if (this.curpage > 1) {
            out.println("<li class=\"prev\">");
        } else {
            out.println("<li class=\"prev disabled\">");
        }
        if (this.curpage == 1) {
            out.println("<a href=\"" + this.uri + "\">");
        } else {
            out.println("<a href=\"" + this.uri + this.separated + "page="+ String.valueOf(this.curpage - 1) + "\">");
        }
        out.println("<i class=\"icon-double-angle-left\"></i>");
        out.println("</a>");
        out.println("</li>");

        for (int i = 1; i <= this.pagecount; i++) {
            if (this.curpage == i) {
                out.println("<li class=\"active\">");
            } else {
                out.println("<li>");
            }
            if (i == 1) {
                out.println("<a href=\"" + this.uri + "\">" + i + "</a>");
            }else {
                out.println("<a href=\"" + this.uri + this.separated + "page=" + i + "\">" + i + "</a>");
            }
            out.println("</li>");
        }

        if (this.curpage  <  this.pagecount) {
            out.println("<li class=\"next\">");
        } else {
            out.println("<li class=\"next disabled\">");
        }
        out.println("<a href=\"" + this.uri + this.separated + "page=" + String.valueOf(this.curpage + 1) + "\">");
        out.println("<i class=\"icon-double-angle-right\"></i>");
        out.println("</a>");
        out.println("</li>");
        out.println("</ul>");
        out.println("</div>");
    }

}

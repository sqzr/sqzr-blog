package tag;

import org.markdown4j.Markdown4jProcessor;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by weiyang on 2014/10/12.
 */
public class MarkdownTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        StringWriter sw = new StringWriter();
        JspFragment jf=this.getJspBody();
        JspWriter out = getJspContext().getOut();
        jf.invoke(sw);
        out.println(new Markdown4jProcessor().process(sw.toString()));
    }
}

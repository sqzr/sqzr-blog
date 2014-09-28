package tag;

import com.opensymphony.xwork2.util.ValueStack;
import org.apache.struts2.components.Component;

import java.io.IOException;
import java.io.Writer;

/**
 * Created by weiyang on 2014/9/28.
 */
public class DateFormatComponent extends Component {
    private String date;
    public DateFormatComponent(ValueStack stack) {
        super(stack);
    }

    @Override
    public boolean start(Writer writer) {
        try {
            writer.write(this.date + "sb");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }

    // ---


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}

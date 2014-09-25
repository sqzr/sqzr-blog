package webException;

/**
 * Created by weiyang on 2014/9/15.
 */
public class ParameterIsEmptyException extends Exception {
    public ParameterIsEmptyException() {
        super();
    }

    public ParameterIsEmptyException(String message) {
        super(message);
    }
}

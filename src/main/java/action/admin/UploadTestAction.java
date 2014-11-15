package action.admin;

import org.apache.struts2.ServletActionContext;

import java.io.File;


/**
 * Created by weiyang on 2014/11/14.
 */
public class UploadTestAction {
    private File uploadFile;
    private String uploadFileContentType;
    private String uploadFileFileName;

    public String test() throws Exception {
        String realpath = ServletActionContext.getServletContext().getRealPath("/images");
        return "success";
    }

    public File getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(File uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getUploadFileContentType() {
        return uploadFileContentType;
    }

    public void setUploadFileContentType(String uploadFileContentType) {
        this.uploadFileContentType = uploadFileContentType;
    }

    public String getUploadFileFileName() {
        return uploadFileFileName;
    }

    public void setUploadFileFileName(String uploadFileFileName) {
        this.uploadFileFileName = uploadFileFileName;
    }
}

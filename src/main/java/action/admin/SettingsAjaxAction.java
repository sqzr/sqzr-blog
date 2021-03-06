package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.Option;
import model.User;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import service.OptionService;
import service.UserService;
import util.FileNameToProcess;
import util.JsonInfoUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/7.
 */
public class SettingsAjaxAction extends ActionSupport {
    private File uploadFile;
    private String uploadFileContentType;
    private String uploadFileFileName;
    private Map<String, Object> jsonInfo = new HashMap<String,Object>();
    private OptionService optionService;
    private UserService userService;
    private HttpSession session;
    private HttpServletRequest request;
//    private OptionInfoVo info = new OptionInfoVo();
    // vo在ajax传输的时无法接收,暂没找到解决办法
    private String type;
    private String title;
    private String url;
    private String authorname;
    private String authoremail;
    private String subtitle;
    private String description;
    private String htmlkeyword;
    private String htmldescription;
    private String facebook;
    private String twitter;
    private String googleplus;
    private String weibo;
    private String github;
    // --- 密码
    private String oldPassword;
    private String newPassword;
    private String reqNewPassword;
    // --- 设置
    private String pagenumber;

    public SettingsAjaxAction() {
        this.request = ServletActionContext.getRequest();
        this.session = request.getSession();
    }

    public String update() throws Exception {
        List<Option> options = new ArrayList<Option>();
        if ("infoTab".equals(type)) {
            // 更新基础信息
            options.add(new Option("title",title));
            options.add(new Option("url", url));
            options.add(new Option("authoremail", authoremail));
            options.add(new Option("authorname", authorname));
            options.add(new Option("subtitle",subtitle));
            options.add(new Option("description",description));
            options.add(new Option("htmlkeyword",htmlkeyword));
            options.add(new Option("htmldescription",htmldescription));
            options.add(new Option("facebook",facebook));
            options.add(new Option("twitter",twitter));
            options.add(new Option("googleplus",googleplus));
            options.add(new Option("weibo",weibo));
            options.add(new Option("github",github));
            optionService.update(options);
            this.jsonInfo = JsonInfoUtil.generate("更新成功", true);
            return "json";
        }

        if ("passwordTab".equals(type)) {
            //更新密码
            if (!this.newPassword.equals(this.reqNewPassword)) {
                this.jsonInfo = JsonInfoUtil.generate("密码修改失败,两次密码输入不相符", false);
                return "json";
            }
            //用户id
            int userId = ((User) this.session.getAttribute("user")).getId();
            if (userService.updatePassword(this.newPassword, this.oldPassword, userId)) {
                this.jsonInfo = JsonInfoUtil.generate("密码修改成功", true);
            } else {
                this.jsonInfo = JsonInfoUtil.generate("密码修改失败,旧密码错误", false);
            }
            return "json";
        }

        if ("settingsTab".equals(type)) {
            options.add(new Option("pagenumber", pagenumber));
            optionService.update(options);
            this.jsonInfo = JsonInfoUtil.generate("更新成功", true);
            return "json";
        }
        return "json";
    }

    public String avatar_update() throws Exception {
        if (!FileNameToProcess.checkFileNameIsImage(this.uploadFileFileName)) {
            // 后缀名异常,不为图片
            this.jsonInfo = JsonInfoUtil.generate("只能上传图片", false);
            return "json";
        }
        // 存放文件夹
        String folder = "/images/avatar";
        // 获取完整路径
        String realpath = ServletActionContext.getServletContext().getRealPath(folder);
        this.uploadFileFileName = FileNameToProcess.generateImageFileName(this.uploadFileFileName);
        FileUtils.copyFile(this.uploadFile, new File(new File(realpath), this.uploadFileFileName));
        // 更新数据库头像路径
        optionService.update(new Option("avatar", folder + "/" + this.uploadFileFileName));
        this.jsonInfo = JsonInfoUtil.generate("status", true, "link", folder + "/" + this.uploadFileFileName);
        return "json";
    }
    // ---


    public String getUploadFileFileName() {
        return uploadFileFileName;
    }

    public void setUploadFileFileName(String uploadFileFileName) {
        this.uploadFileFileName = uploadFileFileName;
    }

    public String getUploadFileContentType() {
        return uploadFileContentType;
    }

    public void setUploadFileContentType(String uploadFileContentType) {
        this.uploadFileContentType = uploadFileContentType;
    }

    public File getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(File uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getAuthoremail() {
        return authoremail;
    }

    public void setAuthoremail(String authoremail) {
        this.authoremail = authoremail;
    }

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPagenumber() {
        return pagenumber;
    }

    public void setPagenumber(String pagenumber) {
        this.pagenumber = pagenumber;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getReqNewPassword() {
        return reqNewPassword;
    }

    public void setReqNewPassword(String reqNewPassword) {
        this.reqNewPassword = reqNewPassword;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHtmlkeyword() {
        return htmlkeyword;
    }

    public void setHtmlkeyword(String htmlkeyword) {
        this.htmlkeyword = htmlkeyword;
    }

    public String getHtmldescription() {
        return htmldescription;
    }

    public void setHtmldescription(String htmldescription) {
        this.htmldescription = htmldescription;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getGoogleplus() {
        return googleplus;
    }

    public void setGoogleplus(String googleplus) {
        this.googleplus = googleplus;
    }

    public String getWeibo() {
        return weibo;
    }

    public void setWeibo(String weibo) {
        this.weibo = weibo;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }

    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }

    public OptionService getOptionService() {
        return optionService;
    }

    public void setOptionService(OptionService optionService) {
        this.optionService = optionService;
    }

}

package cn.kgc.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Entry {
    private Integer id;

    private Integer categoryid;

    private String title;

    private String summary;

    private String uploaduser;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdate;
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public String getUploaduser() {
        return uploaduser;
    }

    public void setUploaduser(String uploaduser) {
        this.uploaduser = uploaduser == null ? null : uploaduser.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Entry{" +
                "id=" + id +
                ", categoryid=" + categoryid +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", uploaduser='" + uploaduser + '\'' +
                ", createdate=" + createdate +
                ", category=" + category +
                '}';
    }
}
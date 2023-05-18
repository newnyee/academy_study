package kr.co.mymelon.mediagroup;

public class MediaGroupDTO {
    private int mediagroupno;
    private String title;

    private int rnum;

    public MediaGroupDTO() {}

    @Override
    public String toString() {
        return "MediaGroupDTO{" +
                "mediagroupno=" + mediagroupno +
                ", title='" + title + '\'' +
                ", rnum=" + rnum +
                '}';
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    public int getMediagroupno() {
        return mediagroupno;
    }

    public void setMediagroupno(int mediagroupno) {
        this.mediagroupno = mediagroupno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}

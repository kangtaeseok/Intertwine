package org.edu.intertwine.admin.model.vo;

import java.io.Serializable;

public class VisitCount implements Serializable {
	private static final long serialVersionUID = -5435842524012734672L;
	private String regDate;
    private int visitCount;
    public String getRegDate() {
        return regDate;
    }

    public int getVisitCount() {
        return visitCount;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public void setVisitCount(int visitCount) {
        this.visitCount = visitCount;
    }

    @Override
    public String toString() {
        return "VisitCountVO{" +
                "regDate='" + regDate + '\'' +
                ", visitCount=" + visitCount +
                '}';
    }
}

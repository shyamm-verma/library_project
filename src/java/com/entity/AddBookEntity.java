package com.entity;

/**
 *
 * @author iamsh
 */
public class AddBookEntity {
    
    private String bname;
    private String bdetails;
    private String bauthor;
    private String branch;
    private String bprice;
    private String bqty;
    private String bimg;
    private int bavailabel;
    private int brent;
    private String bpub;

    public String getBpub() {
        return bpub;
    }

    public void setBpub(String bpub) {
        this.bpub = bpub;
    }

    public String getBprice() {
        return bprice;
    }

    public void setBprice(String bprice) {
        this.bprice = bprice;
    }

    public String getBqty() {
        return bqty;
    }

    public void setBqty(String bqty) {
        this.bqty = bqty;
    }

    public int getBavailabel() {
        return bavailabel;
    }

    public void setBavailabel(int bavailabel) {
        this.bavailabel = bavailabel;
    }

    public int getBrent() {
        return brent;
    }

    public void setBrent(int brent) {
        this.brent = brent;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBdetails() {
        return bdetails;
    }

    public void setBdetails(String bdetails) {
        this.bdetails = bdetails;
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }


    public String getBimg() {
        return bimg;
    }

    public void setBimg(String bimg) {
        this.bimg = bimg;
    }

    @Override
    public String toString() {
        return "AddBookEntity{" + "bname=" + bname + ", bdetails=" + bdetails + ", bauthor=" + bauthor + ", branch=" + branch + ", bprice=" + bprice + ", bqty=" + bqty + ", bimg=" + bimg + ", bavailabel=" + bavailabel + ", brent=" + brent + ", bpub=" + bpub + '}';
    }



    
    
}

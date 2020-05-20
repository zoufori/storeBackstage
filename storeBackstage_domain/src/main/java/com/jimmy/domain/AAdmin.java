package com.jimmy.domain;

import com.jimmy.utils.DateUtils;

import java.util.Arrays;
import java.util.Date;

public class AAdmin {

    private Integer id;
    private String username;
    private String password;
    private String roleid;
    private String roleStr;
    private Date date;  //加入日期
    private Integer is_ban; //是否禁用
    private String dateStr;
    private String isBanStr;

    public String getRoleStr() {
        String[] split = roleid.split(",");
        roleStr = "";
        Arrays.asList(split).stream()
                .forEach(s -> {
                    if (s.equals("1"))
                        roleStr += "管理员,";
                    if (s.equals("2"))
                        roleStr += "经理,";
                    if (s.equals("1"))
                        roleStr += "商家,";
                });
        return roleStr;
    }

    public void setRoleStr(String roleStr) {
        this.roleStr = roleStr;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getIs_ban() {
        return is_ban;
    }

    public void setIs_ban(Integer is_ban) {
        this.is_ban = is_ban;
    }

    public String getDateStr() {
        dateStr = DateUtils.date2String(date, "yyyy-MM-dd HH:mm:ss");
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getIsBanStr() {
        isBanStr = is_ban == 1 ? "禁用" : "启用";
        return isBanStr;
    }

    public void setIsBanStr(String isBanStr) {
        this.isBanStr = isBanStr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }
}

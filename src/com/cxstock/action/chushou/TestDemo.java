package com.cxstock.action.chushou;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class TestDemo
{
    public static void main(String[] args)
    {
        List<User> list = new ArrayList<User>();
        for (int i=0;i<5;i++){
            User u = new User();
            u.setAge(i+"");
            u.setName("zhaopei"+i);
            u.setPhone("phone"+i);
            list.add(u);
        }
        JSONArray json = new JSONArray();
        json = JSONArray.fromObject(list);
        System.out.println(json.toString());
    }
}



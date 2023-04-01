package com.test;

import java.util.ArrayList;
public class Example {
    
    public static void main(String[] args) {
        var list = new ArrayList<String>();
        list.add("Hola");
        list.add("Mundo");
        for (var item : list) {
            System.out.println(item.stripIndent());
        }
    }
}

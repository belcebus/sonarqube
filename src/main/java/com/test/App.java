package com.test;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main(String[] args) {
        String dayOfWeek = "Monday";
        switch (dayOfWeek) {
            case "Monday" -> System.out.println("Today is Monday!");
            case "Tuesday" -> System.out.println("Today is Tuesday!");
            case "Wednesday" -> System.out.println("Today is Wednesday!");
            case "Thursday" -> System.out.println("Today is Thursday!");
            case "Friday" -> System.out.println("Today is Friday!");
            case "Saturday", "Sunday" -> System.out.println("It's the weekend!");
            default -> System.out.println("Invalid day of the week.");
        }
    }
}

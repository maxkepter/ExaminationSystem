/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author Admin
 */
public class Validate {
    public static final String PHONE_REGEX = "[0-9]{10}";

    public static boolean validateInteger(String string) {
        try {
            Integer.parseInt(string);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean validateDouble(String string) {
        try {
            Double.parseDouble(string);
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean validateFloat(String string) {
        try {
            Float.parseFloat(string);
            return true;
        } catch (NullPointerException e) {
            e.printStackTrace();
            return false;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean validatePhoneNumber(String string) {
        return string.matches(PHONE_REGEX);
    }

    public static boolean validateString(String string) {
        return !(string == null || string.isEmpty());
    }
}

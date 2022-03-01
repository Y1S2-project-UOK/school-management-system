package com.group11.config;

import java.util.regex.Pattern;

public class EmailValidate {
    public static boolean patternMatches(String emailAddress) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                            "[a-zA-Z0-9_+&*-]+)*@" +
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                            "A-Z]{2,7}$";
        return Pattern.compile(emailRegex)
          .matcher(emailAddress)
          .matches();
    }
}

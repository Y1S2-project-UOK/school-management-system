package com.group11;

import com.group11.auth.SignInAndSignUp;
import com.group11.config.MysqlConnect;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        MysqlConnect.ConnectDB();
        new SignInAndSignUp().setVisible(true);
    }
}

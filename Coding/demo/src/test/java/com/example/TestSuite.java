package com.example;

import org.junit.platform.suite.api.SelectClasses;
import org.junit.platform.suite.api.Suite;

import com.example.packageTestDemo.TestDemo_Fixed;
import com.example.packageTestPassword.TestPasswordValidator;

@Suite
@SelectClasses({ TestDemo_Fixed.class,
                TestPasswordValidator.class })
public class TestSuite {

}
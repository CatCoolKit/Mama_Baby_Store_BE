package com.example;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;

import com.example.Calculator;
import static org.junit.Assert.assertEquals;

public class TestCalculatorCsv {
    @ParameterizedTest
    @CsvFileSource(resources = "/add.csv", numLinesToSkip = 1)
    public void testAdd(int a, int b, int expected) {
        Calculator calculator = new Calculator();
        assertEquals(expected, calculator.add(a, b));
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/subtract.csv", numLinesToSkip = 1)
    public void testSubtract(int a, int b, int expected) {
        Calculator calculator = new Calculator();
        assertEquals(expected, calculator.subtract(a, b));
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/multiply.csv", numLinesToSkip = 1)
    public void testMultiply(int a, int b, int expected) {
        Calculator calculator = new Calculator();
        assertEquals(expected, calculator.multiply(a, b));
    }

    @ParameterizedTest
    @CsvFileSource(resources = "/divide.csv", numLinesToSkip = 1)
    public void testDivide(int a, int b, int expected) {
        Calculator calculator = new Calculator();
        assertEquals(expected, calculator.divide(a, b));
    }

}
package com.example.packageTestPassword;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.runners.MethodSorters;

import com.example.PasswordValidator;

import static org.junit.Assert.*;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.lang.reflect.Executable;

public class TestPasswordValidator {
    @Test
    public void testIsPasswordStrong() throws Exception {
        PasswordValidator pv = new PasswordValidator();
        boolean isStrong = pv.isPasswordStrong("12345678");
        assertTrue(isStrong);
    }

    @Test
    public void testIsPasswordNotStrong() throws Exception {
        final PasswordValidator pv = new PasswordValidator();
        boolean isStrong = pv.isPasswordStrong("1234");
        assertFalse(isStrong);
    }

    @Test
    public void testIsPasswordTooLong() throws Exception {
        final PasswordValidator pv = new PasswordValidator();
        assertThrows(Exception.class, () -> {
            pv.isPasswordStrong("123456vhvjhjhfhj");
        });
    }

}

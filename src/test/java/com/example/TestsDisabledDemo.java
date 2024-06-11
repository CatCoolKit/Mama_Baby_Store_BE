package com.example;

import org.junit.Ignore;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

public class TestsDisabledDemo {
    @Disabled("Disabled until bug #42 has been resolved")
    @Test
    public void testWillBeSkipped() {
    }

    @Test
    public void testWillBeExecuted() {
    }
}

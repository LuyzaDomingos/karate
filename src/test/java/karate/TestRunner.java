package karate;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	@Karate.Test
	Karate testSample() {
		return Karate.run("auth.feature").relativeTo(getClass());
	}
}

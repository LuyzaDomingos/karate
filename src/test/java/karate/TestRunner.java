package karate;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	@Karate.Test
	Karate testAuth() {
		return Karate.run("auth.feature").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate testCreatePlanet() {
		return Karate.run("CreatePlanet.feature").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate testUpdatePlanet() {
		return Karate.run("UpdatePlanet.feature").relativeTo(getClass());
	}
}
